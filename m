Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11Cgzt-0000pu-00
	for mtd@infradead.org; Fri, 6 Aug 1999 11:13:09 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11Cgzs-0007IN-00; Fri, 6 Aug 1999 11:13:08 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11Cgzs-0002YS-00; Fri, 6 Aug 1999 11:13:08 +0100
To: mtd@infradead.org
Subject: DiskOnChip and NFTL progress.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 06 Aug 1999 11:13:08 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11Cgzs-0002YS-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I've now received a 40Mb DiskOnChip 2000 and a DiskOnChip Millennium from 
M-Systems, so I can work on getting the multi-chip devices and the Millennium 
to play nicely.

I have now got to the stage where my user-space NFTL interpreter can read the
entire DOS filesystem from the 4Mb DiskOnChip I have. I'll tidy it all up, add
support for the larger DiskOnChip 2000 parts, incorporate it all into a single
kernel driver (for now) and hopefully release it sometime in the next day 
or so, possibly Monday (I can't remember how much She Who Must Be Obeyed is 
going to be working this weekend).

I should get write support working next week sometime. Any clever people who 
know about Reed-Solomon codes, please package your brain up in a cardboard box 
and send it to me at the address below.



----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
