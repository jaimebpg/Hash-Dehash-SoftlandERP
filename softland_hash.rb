
V1 = [0,3,4,5,6,7,1,2,3,4]


def get_hash(pass)
 n = pass.length
 pass = (pass + "a"*8)[0..8]
 v2 = pass.split("").map{|x| x.ord}.unshift(n)
 hash = V1.zip(v2).map{|x,y| (x + y) % 256}
 "0x0" + hash.map{|x| x.to_s(16)}.join.upcase 
end

def get_password(hash)
 hash = hash.scan(/../)[1..-1]
 hash = hash.map{|x| x.to_i(16)}
 n = hash[0]
 pass = hash.zip(V1).map{|x,y| (x - y) % 256}[1..n]
 pass = pass.map{|x| [x].pack("U")}.join
 pass+"0" if n==10
 pass
end








