Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7ACCD3442
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2026 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gy+3xomEBh+1GdhNjHOitRdqCPA/dsT3/Zbn4w+H6MM=; b=KHpKuIp21Zqj2l
	IJlp2APW81r+SzQHplILQ4Q7BIcMGdNA8dg6fAzwXnGIc3slYrQxR0XsxashVy6nadufYyaDsm99X
	ElceanCmABnUZjyMDybBWNmtG78pIIQVMsIrIFb+IkeEmtsKth9UlXrCUIdTI4O5ByzhtNw0VL3+1
	OTM7ZSqy0DTC5DRgeXMkTlyZqNtUf6zbydLbpGXeSNMfh7wyyqz1qoQre8TpWjUKbYJpn1XV3KB53
	Dc4RA2De3oDA7F6TTANy70oDEX8b/nt+e5KQRqhKcc706YJesfqZN2kBbGfzDWANgntwqKPU1PLfn
	qc4b8aF+qtGaBF2TNieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdbW-00000001B0N-1uIl;
	Wed, 06 May 2026 14:52:02 +0000
Received: from extorris.mess.org ([2001:4b98:dc0:43:f816:3eff:fee1:13b9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdbS-00000001Az2-0M4R
	for linux-mtd@lists.infradead.org;
	Wed, 06 May 2026 14:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1778078597; bh=lCAD2uuvS1OzCKFoVS6wMeTz7zJp401WPc88JwnQcB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C9yciB0MYYktOsum8ofA36xZeFainwYVZNodaz47zVOmyLNdsCaIiqfGY2leuctaK
	 F9inQMssFAMsZ0v5VnIQi8TDferylU84+tN+Ns7iHWQ7/u9yf/dsTCdYhW0oVAFDxY
	 LYPsDHW1jh7CmZ28xFyrNMnactDZDENnVdmwT94HT7Q8UTNjS2C0MH5jGBhVFnWk9/
	 v64a0K065qtSvmjsgGjfwOgCPqIGhk8t7xOe+sXsp5+6nrmdQOHL+4he2ikxVrRZQh
	 SHSGasNZGYiEX4i/oWoxu9FYK1TCzA8Cu1+cxebmtI3OBd5TteVcupKIhq4y+XjFyk
	 y5pxvMFJ/TjnQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 4AE7341CEF; Wed, 06 May 2026 15:43:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1778078588; bh=lCAD2uuvS1OzCKFoVS6wMeTz7zJp401WPc88JwnQcB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r6nYjWGn4a07c+LaSNidXhLzuxeFZ9izYlzllOGekGq7nI6JrBRJEfXBbgkW2fgh2
	 gDh/21IxLK6z4pMdm3cATSKCIvIUwQwujqndhNdp7POPzGV1fVfG7Qy3UJALqWZ2Cs
	 bvEdSKfH53WKbKRNkifoVsgYUAn22K6mrHQ4Nfpy9U1ZC5LyBmOixKWIxTu9ey9L45
	 ZFXTRECOiQR2uN81tmR5uwOTEhls4AiOip0x2zDcT5y+FzLfe0asimEAGB5E9LQAIM
	 msFazDBDQ7dJKbdpa85rDJp2puo8y/yMpNSb6YTSWqEjNPPK/htIj1wWRAPihY2ehe
	 T1h5xTENhqEdg==
Received: from maru.local (unknown [140.228.74.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 27B8A41CDD;
	Wed, 06 May 2026 15:43:08 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 2/8] mtd: ts5500_flash: Remove mapping since board is no longer supported
Date: Wed,  6 May 2026 15:42:47 +0100
Message-ID: <307a7d3cdb6e650a2c8585b5ba1e81915b00f8e0.1778071745.git.sean@mess.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778071745.git.sean@mess.org>
References: <cover.1778071745.git.sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_075158_254957_A885B45F 
X-CRM114-Status: GOOD (  20.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Since commit 8b793a92d862 ("x86/cpu: Remove M486/M486SX/ELAN support"),
this board is no longer supported. Remove the mtd map too.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/mtd/maps/Kconfig        |  18 ------
 drivers/mtd/maps/Makefile       |   1 -
 drivers/mtd/maps/ts5500_flash.c | 108 --------------------------------
 3 files changed, 127 deletions(-)
 delete mode 100644 drivers/mtd/maps/ts5500_flash.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 99d5ff9a1fbe..e48221e97f8d 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -141,24 +141,6 @@ config MTD_NETSC520
 	  demonstration board. If you have one of these boards and would like
 	  to use the flash chips on it, say 'Y'.
 
-config MTD_TS5500
-	tristate "JEDEC Flash device mapped on Technologic Systems TS-5500"
-	depends on TS5500 || COMPILE_TEST
-	select MTD_JEDECPROBE
-	select MTD_CFI_AMDSTD
-	help
-	  This provides a driver for the on-board flash of the Technologic
-	  System's TS-5500 board. The 2MB flash is split into 3 partitions
-	  which are accessed as separate MTD devices.
-
-	  mtd0 and mtd2 are the two BIOS drives, which use the resident
-	  flash disk (RFD) flash translation layer.
-
-	  mtd1 allows you to reprogram your BIOS. BE VERY CAREFUL.
-
-	  Note that jumper 3 ("Write Enable Drive A") must be set
-	  otherwise detection won't succeed.
-
 config MTD_SBC_GXX
 	tristate "CFI Flash device mapped on Arcom SBC-GXx boards"
 	depends on X86 && MTD_CFI_INTELEXT && MTD_COMPLEX_MAPPINGS
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 51af1d2ebd52..46ff278006a7 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -28,7 +28,6 @@ obj-$(CONFIG_MTD_SA1100)	+= sa1100-flash.o
 obj-$(CONFIG_MTD_SBC_GXX)	+= sbc_gxx.o
 obj-$(CONFIG_MTD_SC520CDP)	+= sc520cdp.o
 obj-$(CONFIG_MTD_NETSC520)	+= netsc520.o
-obj-$(CONFIG_MTD_TS5500)	+= ts5500_flash.o
 obj-$(CONFIG_MTD_SUN_UFLASH)	+= sun_uflash.o
 obj-$(CONFIG_MTD_SCx200_DOCFLASH)+= scx200_docflash.o
 obj-$(CONFIG_MTD_SOLUTIONENGINE)+= solutionengine.o
diff --git a/drivers/mtd/maps/ts5500_flash.c b/drivers/mtd/maps/ts5500_flash.c
deleted file mode 100644
index 70d6e865f555..000000000000
--- a/drivers/mtd/maps/ts5500_flash.c
+++ /dev/null
@@ -1,108 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * ts5500_flash.c -- MTD map driver for Technology Systems TS-5500 board
- *
- * Copyright (C) 2004 Sean Young <sean@mess.org>
- *
- * Note:
- * - In order for detection to work, jumper 3 must be set.
- * - Drive A and B use the resident flash disk (RFD) flash translation layer.
- * - If you have created your own jffs file system and the bios overwrites
- *   it during boot, try disabling Drive A: and B: in the boot order.
- */
-
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/partitions.h>
-#include <linux/types.h>
-
-
-#define WINDOW_ADDR	0x09400000
-#define WINDOW_SIZE	0x00200000
-
-static struct map_info ts5500_map = {
-	.name = "TS-5500 Flash",
-	.size = WINDOW_SIZE,
-	.bankwidth = 1,
-	.phys = WINDOW_ADDR
-};
-
-static const struct mtd_partition ts5500_partitions[] = {
-	{
-		.name = "Drive A",
-		.offset = 0,
-		.size = 0x0e0000
-	},
-	{
-		.name = "BIOS",
-		.offset = 0x0e0000,
-		.size = 0x020000,
-	},
-	{
-		.name = "Drive B",
-		.offset = 0x100000,
-		.size = 0x100000
-	}
-};
-
-#define NUM_PARTITIONS ARRAY_SIZE(ts5500_partitions)
-
-static struct mtd_info *mymtd;
-
-static int __init init_ts5500_map(void)
-{
-	int rc = 0;
-
-	ts5500_map.virt = ioremap(ts5500_map.phys, ts5500_map.size);
-
-	if (!ts5500_map.virt) {
-		printk(KERN_ERR "Failed to ioremap\n");
-		rc = -EIO;
-		goto err2;
-	}
-
-	simple_map_init(&ts5500_map);
-
-	mymtd = do_map_probe("jedec_probe", &ts5500_map);
-	if (!mymtd)
-		mymtd = do_map_probe("map_rom", &ts5500_map);
-
-	if (!mymtd) {
-		rc = -ENXIO;
-		goto err1;
-	}
-
-	mymtd->owner = THIS_MODULE;
-	mtd_device_register(mymtd, ts5500_partitions, NUM_PARTITIONS);
-
-	return 0;
-
-err1:
-	iounmap(ts5500_map.virt);
-err2:
-	return rc;
-}
-
-static void __exit cleanup_ts5500_map(void)
-{
-	if (mymtd) {
-		mtd_device_unregister(mymtd);
-		map_destroy(mymtd);
-	}
-
-	if (ts5500_map.virt) {
-		iounmap(ts5500_map.virt);
-		ts5500_map.virt = NULL;
-	}
-}
-
-module_init(init_ts5500_map);
-module_exit(cleanup_ts5500_map);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Sean Young <sean@mess.org>");
-MODULE_DESCRIPTION("MTD map driver for Technology Systems TS-5500 board");
-
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
