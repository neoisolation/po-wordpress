import dns.resolver
import re
import socket
import smtplib
import sys
import os



class email():
    def __init__(self,emaile):
        self.email=emaile
        self.domain=self.getDomain
    
    
    def emailsyntax(self):
        addressToVerify =self.email
        match = re.match('^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$', addressToVerify)
        if match == None:
            return False
        else:
            return True


    @property
    def getDomain(self):
        splitAddress = self.email.split('@')
        domain = str(splitAddress[1])
        return domain
    
    @property
    def getmxrecord(self):
        records = dns.resolver.query(self.domain, 'MX')
        mxRecord = records[0].exchange
        mxRecord = str(mxRecord)
        return mxRecord
    
    def valideEmail(self):
        host = socket.gethostname()
        # SMTP lib setup (use debug level for full output)
        server = smtplib.SMTP()
        server.set_debuglevel(0)
        # SMTP Conversation
        server.connect(host=self.getmxrecord,port=25)
        server.helo(host)
        server.mail('marocserver@hotmail.com')
        code, message = server.rcpt(str(self.email))
        server.quit()
        # Assume 250 as Success
        if code == 250:
            return True
        else:
            return False





def emailsyntax(email):
    addressToVerify =email
    match = re.match('^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$', addressToVerify)
    if match == None:
        return False
    else:
        return True

def main():
    
    print(len(sys.argv))
    if len(sys.argv)==2:
        if emailsyntax(sys.argv[1]):
            eml=email(sys.argv[1])
            if eml.valideEmail():
                print("Success")
            else:
                print("Bounce")
        else:
            print('Pleas Add email!')
    elif len(sys.argv)==3:
        print('in 3')
        if sys.argv[2]=="Success":
            print('in success')
            rd=open(sys.argv[1],'r')
            filename=os.path.basename(rd.name)
            with open(sys.argv[1], buffering=200000000) as f:
                for row in f:
                    if emailsyntax(row.strip()) :
                        try:
                           eml=email(row.strip())
                           if eml.valideEmail()==True:
                               f=open('[success]'+filename,'a+')
                               f.write(row.strip()+'\n')
                               f.close()
                        except :
                          pass
        elif sys.argv[2]=="Bounce":
            print('in bounce')
            rd=open(sys.argv[1],'r')
            filename=os.path.basename(rd.name)
            with open(sys.argv[1], buffering=200000000) as f:
                for row in rd:
                    if emailsyntax(row.strip()) :
                        try:
                           eml=email(row.strip())
                           if eml.valideEmail()==False:
                               f=open('[Bounce]'+filename,'a+')
                               f.write(row.strip()+'\n')
                               f.close()
                        except :
                              pass

# a=email(sys.argv[1])
# a.valideEmail()

if __name__ == '__main__':
    main()

