#!/usr/bin/env ruby

V1 = [0,3,4,5,6,7,1,2,3,4]


def get_password(hash)
  hash = hash_to_uncide_code_point_array(hash)
  n = hash[0]
  pass = sub_vectors(V1, hash)
  pass = pass[1..n]
  pass = uncide_code_point_array_to_string(pass)
  pass+"0" if n==10
  pass
end

def hash_to_uncide_code_point_array(hash)
 hash = hash.scan(/../)[1..-1]
 hash = hash.map{|x| x.to_i(16)}
end

def sub_vectors(v1, v2)
  v2.zip(v1).map{|x,y| (x - y) % 256}
end

def uncide_code_point_array_to_string(pass)
  pass.map{|x| [x].pack("U")}.join
end


def get_hash(pass)
 n = pass.length
 pass = fill_password(pass)
 pass = pass_to_uncide_code_point_array(pass)
 pass = pass.unshift(n)
 hash = add_vectors(V1, pass)
 hash_to_hex(hash)
end

def pass_to_uncide_code_point_array(pass)
  pass.split("").map{|x| x.ord}
end


def fill_password(pass)
  (pass + "a"*8)[0..8]
end


def add_vectors(v1, v2)
  v1.zip(v2).map{|x,y| (x + y) % 256}
end


def hash_to_hex(hash)
  "0x0" + hash.map{|x| x.to_s(16)}.join.upcase 
end








