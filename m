Received: from arroyo.ext.ti.com ([192.94.94.40])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LB75W-0004BI-Ss
	for linux-mtd@lists.infradead.org; Fri, 12 Dec 2008 12:25:49 +0000
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id mBCCPPAY000397
	for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2008 06:25:30 -0600
Received: from webmail.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id mBCCPNk3014061
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Dec 2008 06:25:24 -0600 (CST)
Message-ID: <37466.192.168.10.89.1229084724.squirrel@dbdmail.itg.ti.com>
In-Reply-To: <35044.192.168.10.89.1229077681.squirrel@dbdmail.itg.ti.com>
References: <35044.192.168.10.89.1229077681.squirrel@dbdmail.itg.ti.com>
Date: Fri, 12 Dec 2008 17:55:24 +0530 (IST)
Subject: [PATCH] [MTD] [NAND] : Correcting file name in the header section.
From: "Manasa Gangaiah" <x0099189@ti.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch corrects the file name in the header section.

Signed-off-by: Manasa Gangaiah <manasa.gangaiah@ti.com>
---

 drivers/mtd/nand/autcpu12.c  |    2 +-
 drivers/mtd/nand/nand_base.c |    2 +-
 drivers/mtd/nand/nand_bbt.c  |    2 +-
 drivers/mtd/nand/nandids.c   |    2 +-
 drivers/mtd/nand/ndfc.c      |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
--- a/drivers/mtd/nand/nand_base.c	2008-12-12 16:59:41.000000000 +0530
+++ b/drivers/mtd/nand/nand_base.c	2008-12-12 17:11:27.000000000 +0530
@@ -1,5 +1,5 @@
 /*
- *  drivers/mtd/nand.c
+ *  drivers/mtd/nand/nand_base.c
  *
  *  Overview:
  *   This is the generic MTD driver for NAND flash devices. It should be
--- a/drivers/mtd/nand/nandids.c	2008-12-12 17:23:44.000000000 +0530
+++ b/drivers/mtd/nand/nandids.c	2008-12-12 17:23:58.000000000 +0530
@@ -1,5 +1,5 @@
 /*
- *  drivers/mtd/nandids.c
+ *  drivers/mtd/nand/nandids.c
  *
  *  Copyright (C) 2002 Thomas Gleixner (tglx@linutronix.de)
  *
--- a/drivers/mtd/nand/ndfc.c	2008-12-12 17:28:56.000000000 +0530
+++ b/drivers/mtd/nand/ndfc.c	2008-12-12 17:29:08.000000000 +0530
@@ -1,5 +1,5 @@
 /*
- *  drivers/mtd/ndfc.c
+ *  drivers/mtd/nand/ndfc.c
  *
  *  Overview:
  *   Platform independend driver for NDFC (NanD Flash Controller)
--- a/drivers/mtd/nand/autcpu12.c	2008-12-12 17:32:38.000000000 +0530
+++ b/drivers/mtd/nand/autcpu12.c	2008-12-12 17:32:56.000000000 +0530
@@ -1,5 +1,5 @@
 /*
- *  drivers/mtd/autcpu12.c
+ *  drivers/mtd/nand/autcpu12.c
  *
  *  Copyright (c) 2002 Thomas Gleixner <tgxl@linutronix.de>
  *
--- a/drivers/mtd/nand/nand_bbt.c	2008-12-12 17:42:50.000000000 +0530
+++ b/drivers/mtd/nand/nand_bbt.c	2008-12-12 17:43:17.000000000 +0530
@@ -1,5 +1,5 @@
 /*
- *  drivers/mtd/nand_bbt.c
+ *  drivers/mtd/nand/nand_bbt.c
  *
  *  Overview:
  *   Bad block table support for the NAND driver
