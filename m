Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11H1y3-0007rR-00
	for mtd@infradead.org; Wed, 18 Aug 1999 10:25:11 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11H1y3-0001sq-00; Wed, 18 Aug 1999 10:25:11 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11H1y3-0003X7-00; Wed, 18 Aug 1999 10:25:11 +0100
To: mtd@infradead.org
Subject: Re: DiskOnChip progress. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 18 Aug 1999 10:25:11 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11H1y3-0003X7-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


David.Woodhouse@mvhi.com said:
>  Now I can get the ECC codes right, I can start to implement writing
> back to  the flash. 

All done. Complete read/write/erase/ECC support on the DiskOnChip 2000 is now
working. The Millennium won't take long now, but I'm going to finish the NFTL
support first, so that people can actually use it.



----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
