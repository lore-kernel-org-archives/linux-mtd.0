Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkGa-0000SL-EX
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:41:33 -0500
Date: Tue, 21 Dec 2004 14:41:20 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221134120.GH22636@wohnheim.fh-wedel.de>
References: <1103232128.15927.70.camel@squizzey.bult.co.uk>
	<41C1FDFF.3020308@us.ibm.com>
	<1103233669.15929.81.camel@squizzey.bult.co.uk>
	<20041218161923.GD1083@wohnheim.fh-wedel.de>
	<1103391155.10788.13.camel@squizzey.bult.co.uk>
	<20041218175222.GB4147@wohnheim.fh-wedel.de>
	<20041218181100.GD4147@wohnheim.fh-wedel.de>
	<1103402930.10792.20.camel@squizzey.bult.co.uk>
	<20041221133035.GE22636@wohnheim.fh-wedel.de>
	<20041221133935.GG22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221133935.GG22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/22] Add copyrights
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add both our copyrights.  Didn't have my mail archive at hands when
doing the patches.  Shouldn't be hard to fix.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_copyright	2004-12-20 18:33:22.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 18:34:22.000000000 +0100
@@ -1,11 +1,13 @@
 /*
  * $Id: blkmtd.c,v 1.23 2004/08/09 14:03:19 dwmw2 Exp $
  *
- * blkmtd.c - use a block device as a fake MTD
+ * blockmtd.c - use a block device as a fake MTD
  *
  * Author: Simon Evans <spse@secret.org.uk>
  *
- * Copyright (C) 2001,2002 Simon Evans
+ * Copyright (C) 2001,2002	Simon Evans
+ * Copyright (C) 2004		
+ * Copyright (C) 2004		Jörn Engel <joern@wh.fh-wedel.de>
  *
  * Licence: GPL
  *
