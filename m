Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 112jXr-0007Sg-00
	for mtd@infradead.org; Fri, 9 Jul 1999 23:55:03 +0100
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org
Subject: Re: Response from M-Systems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 09 Jul 1999 23:55:01 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E112jXq-0002oo-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


jgg@deltatee.com said:
>  I'm not sure you can actually patent and enforce the software side of
> a hardware interface. Ie if we write a driver that does the proper
> sequence to page, write and erase their chip they cannot take action
> agaist us, unless perhaps that sequence involved lots more software
> control that the AMD flash chips do.

That I suppose I'd agree with - although I would like to get NFTL working too, 
which is a different matter.

> Can you dig up the patents they actually hold on their FTL and on
> their hardware interface? 

http://www.patents.ibm.com/ and search for "M-Systems". I can't see NFTL, just 
FTL, which is a moot point because it's already done. There's some stuff on 
hardware, too.

----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
