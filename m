Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11Hr6T-0000wa-00
	for mtd@infradead.org; Fri, 20 Aug 1999 17:01:17 +0100
To: mtd@infradead.org
Cc: linux-kernel@vger.rutgers.edu
Subject: First release of write support for DiskOnChip 2000
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Aug 1999 17:01:15 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11Hr6R-0006rr-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I've just released the 19990820 version of the Linux-MTD code, which contains 
a preliminary attempt at write support for the NFTL flash filing system used 
on the DiskOnChip devices. 

It appears to work if you're nice to it, although it gets confused if the NFTL 
doesn't _exactly_ meet the specs (or my understanding of them).

Anyway, there's also an nftl_format program included with it, so if you use 
that to create your NFTL filesystem on the flash, you shouldn't have any 
problems. My contact in M-Systems is on vacation at the moment, so I'll work 
on interoperability with their code when he gets back in a couple of weeks' 
time.

In the meantime, it needs error correction to be implemented, it needs some 
proper arbitration of access to the flash other than sti(), and some other 
cleanups. My request for clever people who know about Reed-Solomon ECC codes 
to package up their brain and send it to me still remains.

I'd like to offer my thanks to M-Systems for seeing the light and helping me 
out with specifications for the beast, even though it took me two years to get 
them to do so :)

Get it at	http://www.linux-mtd.infradead.org/


----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
