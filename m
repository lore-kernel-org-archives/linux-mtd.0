Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LC6Hb-00067A-4Q
	for linux-mtd@lists.infradead.org; Mon, 15 Dec 2008 05:46:19 +0000
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id mBF5kDNV019657
	for <linux-mtd@lists.infradead.org>; Sun, 14 Dec 2008 23:46:18 -0600
Received: from webmail.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id mBF5kAuU021054
	for <linux-mtd@lists.infradead.org>;
	Sun, 14 Dec 2008 23:46:11 -0600 (CST)
Message-ID: <64077.192.168.10.89.1229319972.squirrel@dbdmail.itg.ti.com>
Date: Mon, 15 Dec 2008 11:16:12 +0530 (IST)
Subject: [PATCH] [MTD] [NAND] : Removing file name from the header section.
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

This patch removes the file name in the header section.

Signed-off-by: Manasa Gangaiah <manasa.gangaiah@ti.com>
---

 drivers/mtd/nand/autcpu12.c  |    1 -
 drivers/mtd/nand/nand_base.c |    1 -
 drivers/mtd/nand/nand_bbt.c  |    1 -
 drivers/mtd/nand/nandids.c   |    1 -
 drivers/mtd/nand/ndfc.c      |    1 -
 5 files changed, 5 deletions(-)
--- a/drivers/mtd/nand/autcpu12.c	2008-12-12 17:32:38.000000000 +0530
+++ b/drivers/mtd/nand/autcpu12.c	2008-12-15 10:31:16.000000000 +0530
@@ -1,5 +1,4 @@
 /*
- *  drivers/mtd/autcpu12.c
  *
  *  Copyright (c) 2002 Thomas Gleixner <tgxl@linutronix.de>
  *
--- a/drivers/mtd/nand/nand_base.c	2008-12-12 16:59:41.000000000 +0530
+++ b/drivers/mtd/nand/nand_base.c	2008-12-15 10:31:28.000000000 +0530
@@ -1,5 +1,4 @@
 /*
- *  drivers/mtd/nand.c
  *
  *  Overview:
  *   This is the generic MTD driver for NAND flash devices. It should be
--- a/drivers/mtd/nand/nand_bbt.c	2008-12-12 17:42:50.000000000 +0530
+++ b/drivers/mtd/nand/nand_bbt.c	2008-12-15 10:31:38.000000000 +0530
@@ -1,5 +1,4 @@
 /*
- *  drivers/mtd/nand_bbt.c
  *
  *  Overview:
  *   Bad block table support for the NAND driver
--- a/drivers/mtd/nand/nandids.c	2008-12-12 17:24:52.000000000 +0530
+++ b/drivers/mtd/nand/nandids.c	2008-12-15 10:31:46.000000000 +0530
@@ -1,5 +1,4 @@
 /*
- *  drivers/mtd/nandids.c
  *
  *  Copyright (C) 2002 Thomas Gleixner (tglx@linutronix.de)
  *
--- a/drivers/mtd/nand/ndfc.c	2008-12-12 17:28:56.000000000 +0530
+++ b/drivers/mtd/nand/ndfc.c	2008-12-15 10:31:53.000000000 +0530
@@ -1,5 +1,4 @@
 /*
- *  drivers/mtd/ndfc.c
  *
  *  Overview:
  *   Platform independend driver for NDFC (NanD Flash Controller)
