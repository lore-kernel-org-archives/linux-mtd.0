Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11gUbF-0005o2-00
	for mtd@infradead.org; Wed, 27 Oct 1999 16:02:53 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 11gUbF-0005ic-00
	for mtd@infradead.org; Wed, 27 Oct 1999 16:02:53 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11gUbF-0002Dt-00; Wed, 27 Oct 1999 16:02:53 +0100
To: mtd@infradead.org
Subject: Request for Testing.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 27 Oct 1999 16:02:53 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11gUbF-0002Dt-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I have yet to receive much real feedback regarding the reliability and 
interoperability of my DiskOnChip and in particular NFTL drivers.

If you're using the code, or even if you've only tested it briefly, please let
me know the results.

I'm especially interested in what happens when you switch between my drivers 
and the ones provided by M-Systems. That includes the built-in BIOS extension 
as well as their native drivers for Linux and other operating systems.



----                                ----                                 ----
David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
 Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
