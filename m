Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11LjkV-0007ve-00
	for mtd@infradead.org; Tue, 31 Aug 1999 09:58:39 +0100
To: Mike Kilburn <mkilburn@ftel.net>
Cc: mtd@infradead.org
Subject: Re: DiskonChip2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 31 Aug 1999 09:58:37 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11LjkT-0003Vg-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


mkilburn@ftel.net said:
> I've got a DiskOnChip2000 and Linux drivers from M-systems web page. I
> would like to use your drivers instead. Do I need to program the flash
> with the alternate firmware for Linux or do your drivers work with the
> normal firmware?

My drivers don't quite work with the normal firmware yet - although my NFTL 
driver was written from the specification which M-Systems gave me, there are 
subtle differences between my understanding (and hence my implementation) of 
NFTL and their implementation, which means that their driver doesn't always 
recognise the NFTL after I've been writing to it.

I hope to get that fixed soon.

----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
