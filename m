Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11GhBW-0007DP-00
	for mtd@infradead.org; Tue, 17 Aug 1999 12:13:42 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11GhBV-000629-00; Tue, 17 Aug 1999 12:13:41 +0100
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 11GhBV-0001Rv-00; Tue, 17 Aug 1999 12:13:41 +0100
To: mtd@infradead.org
Subject: DiskOnChip progress.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Aug 1999 12:13:41 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11GhBV-0001Rv-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I now have the DiskOnChip's built-in ECC working for reading. It's taken me
longer than expected because there are subtle differences between the
DiskOnChip 2000 (with which I'm testing) and the DiskOnChip Millennium (for
which I have the specifications). Thankfully, M-Systems have been very helpful
in pointing out the differences, and giving me pseudo-code and flowcharts when
I can't get it to work.

Now I can get the ECC codes right, I can start to implement writing back to 
the flash.


----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
