#! /usr/bin/awk -f
BEGIN{
  lowercase="1,2,3,4,5,6,7,8,9,0,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
  uppercase="one,two,three,four,five,six,seven,eight,nine,zero,P,O,I,U,Y,T,R,E,W,Q,L,K,J,H,G,F,D,S,A,M,N,B,V,C,X,Z"

  split(lowercase,lowers,",")
  split(uppercase,uppers,",")
}
{
  all_lower=tolower($0)
  gsub(/[^A-z0-9]/,"",all_lower)

  for(i=1;i<=length(lowers);i++){
    gsub(lowers[i],uppers[i],all_lower)
  }
  print all_lower
}
