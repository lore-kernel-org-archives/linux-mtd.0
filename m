Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11CpdG-000141-00
	for mtd@infradead.org; Fri, 6 Aug 1999 20:26:22 +0100
To: mtd@infradead.org
Cc: linux-kernel@vger.rutgers.edu
Subject: Readonly driver for DiskOnChip.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 06 Aug 1999 20:26:21 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11CpdF-0003e4-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

There's a very preliminary driver module available in
	ftp://ftp.linux-mtd.infradead.org/pub/mtd/DiskOnChip/

I've just got it working, and I have a lot of tidying up to do - including 
fixing the module use counts. But it's enough to use the DiskOnChip 2000 in 
read-only mode for now.

More next week.

----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
