Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZVZ0-0006Ge-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 10:11:58 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZVYz-0006GY-00
	for mtd@infradead.org; Mon, 27 Mar 2000 10:11:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Cc: trevw@zentropix.com
Subject: New release of MTD code pending.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 27 Mar 2000 10:12:49 +0100
Message-ID: <6013.954148369@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


I'm intending to make a new release some time this week.

I'd like to ship a tarball which holds drivers/mtd, along with two patches 
which add that directory to the kernel infrastructure.

I can't run 2.2 easily on my current testbed, so I would appreciate it if 
someone could give me a patch which adds _only_ the Makefile, arch/*/config.in 
and init code to the 2.2 kernel.

I'm going to update the FTL code so it compiles with 2.3 kernels - probably by 
taking David Hinds' latest version from the PCMCIA code and porting it to MTD 
again, so I get the last 3 years' worth of bug fixes while I'm at it.

The mtdblock driver needs fixing too - volunteers?

We're now in the interesting position of having two flash filesystems present 
in the tree - one of which (FFS2) compiles only on 2.2 kernels, and the other 
of which (JFFS) only compiles on 2.3. It'd be nice to fix that at some point.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
