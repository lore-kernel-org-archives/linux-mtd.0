Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11TVyO-00031h-00
	for mtd@infradead.org; Tue, 21 Sep 1999 20:53:08 +0100
To: zager@post.comstar.ru
cc: mtd@infradead.org
Subject: Re: DOC status 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 21 Sep 1999 20:53:07 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11TVyN-0006BY-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


 (copied to the MTD list to avoid duplication)

zager@post.comstar.ru said:
> Hello, David ? Do you have any progress with DOC2000 since 19990820
> snapshot ? Thanks in advance. 

Some. People have sent me bug fixes, and I've made it compile and run with the
2.3 kernel. 

If you don't actually need to boot off it, it appears to be working reliably 
for read-write operation. But because their driver doesn't understand the 
NFTL after I write to it, you can't boot off the DoC.

My contact in M-Systems has been away for a while, so I've not been able to 
work on the problems with interoperation.

Unfortunately, now he's back from his holiday, I have to get on with some real
work - we have an exhibition in Italy all of next week, and we're running
around like blue-wossname'd flies here at the moment preparing for it. 
I have no time for random Linux hacking - my linux-kernel mail folder hasn't 
even been read.

I'll be back on top of it within two weeks' time, and hope to submit a working
version to Linus as soon as I can, to make sure it gets into 2.4. 

If in the meantime someone wants to convert the PCMCIA bulkmem driver in 2.3.17
to work with the current MTD system, I'll love them for ever.


----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
