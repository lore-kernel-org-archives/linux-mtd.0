Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBB4CD343B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2026 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhY59ruCmqleqV0y3xTeeKP2s54jzlQYpw6vkAGT8bE=; b=KMgHfKfz2J0f8Q
	YS/mqzs+rMziVxyx44AA59d5CS4Iad7KA+WHO1rWx37ZvLm4H/dlfC6W3yVNBtexCsBlLFRGieL5a
	fdvp+ajyuHUuz8wVV0wgMp469Z+SaNveB2OTz+HgeZdXwfjN1DpyrmEHH1ieZob1TQ54JYMFC2TG+
	N+tGfuAmxHf00kpo3IHRS3aX5wOzslMuLNR3jpJ8G+gRTYhbhJWBZ3sUb2oWXary5o62xRk9PVk6w
	o80MK2ctA1OHbk+W69gNTJyMjyr2o7WSJ45jW5wpsRQrOo3Caajrs00VwYE01Hj2pIwcb2W+9rWZR
	1ivtusJFG+drkLt/Nisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdbW-00000001B0t-2GN9;
	Wed, 06 May 2026 14:52:02 +0000
Received: from extorris.mess.org ([2001:4b98:dc0:43:f816:3eff:fee1:13b9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdbS-00000001Az1-0MSv
	for linux-mtd@lists.infradead.org;
	Wed, 06 May 2026 14:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1778078597; bh=G1bGyQ92mZxo9cX1G/JO7vqGJFj875AcyucMClNOOZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hqz/MCu7SA0VnHH3Y6rP/x8iEcDfG3adOtSzFgIccgqI5xuhWk1mhrvWxjdSm4zGC
	 yxCsLLvF9Fpd4csotf6kEqAf8Xrx21NomB+6DDWVNKwHfU8qeHlMdIMXlGM8NwNDQO
	 V4opMWro1mx7rzmMAgVRPhttEzt+oB+j1mNvIAilIH7jhz+IY3NAHKL0PLsEBSEZrC
	 CLlv9ViAnhF6uUn7cHw3OFHHbnxatcZ4fJKZJAAxxByhDBMUG3T3DTxkrx9uCIjHi7
	 hPo19MZKbjYnczUB4G7HQQA2Y4teStK6rrwgnx9Qz9GWIF/WoIMtVQQppPwhWV//MD
	 qC/CgDPfix4Rw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 33C1841CEE; Wed, 06 May 2026 15:43:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1778078588; bh=G1bGyQ92mZxo9cX1G/JO7vqGJFj875AcyucMClNOOZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DUV7J8vPc1t/BSdIPY3nIFLuSJMEChFbW5BU7QfIw5ku7qFqMTj4WlYD0Ta69FWIg
	 1XL3pPnFvt1ZGbVTwbczs6qrK7RDJSgC49lEgwXEliFsTo6kKrlJXQUJLsZBMGMSQS
	 UFCvQdUxL2igfytQSamxw4UMuK4GQIENXfRDAIjtxSI+MRIp+Q713ahnuXEdrWibfQ
	 /eH3vLaTYvdiZN55Xv9p/Q8Il06ZzfaTU3JdLinZTGbxdysCCH56EtWkMrUBSP1whJ
	 3RLVMg1YsOEzovbLY0ZMjvl9Rjib8RykI29JTQQj10lVm64wfqhv1L+d+k9/9wgEvj
	 2BJ0UiwYEXHbA==
Received: from maru.local (unknown [140.228.74.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id E231441CDE;
	Wed, 06 May 2026 15:43:08 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 3/8] mtd: netsc520: Remove mapping since board is no longer supported
Date: Wed,  6 May 2026 15:42:48 +0100
Message-ID: <7d42d63fe53968d0e917dd6913affc9c8ecc97b6.1778071745.git.sean@mess.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778071745.git.sean@mess.org>
References: <cover.1778071745.git.sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_075158_259048_CFA9F05C 
X-CRM114-Status: GOOD (  23.94  )
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
 drivers/mtd/maps/Kconfig    |   8 ---
 drivers/mtd/maps/Makefile   |   1 -
 drivers/mtd/maps/netsc520.c | 127 ------------------------------------
 3 files changed, 136 deletions(-)
 delete mode 100644 drivers/mtd/maps/netsc520.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index e48221e97f8d..b34f3c34c626 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -133,14 +133,6 @@ config MTD_SC520CDP
 	  Dual-in-line JEDEC chip. This 'mapping' driver supports that
 	  arrangement, implementing three MTD devices.
 
-config MTD_NETSC520
-	tristate "CFI Flash device mapped on AMD NetSc520"
-	depends on (MELAN || COMPILE_TEST) && MTD_CFI
-	help
-	  This enables access routines for the flash chips on the AMD NetSc520
-	  demonstration board. If you have one of these boards and would like
-	  to use the flash chips on it, say 'Y'.
-
 config MTD_SBC_GXX
 	tristate "CFI Flash device mapped on Arcom SBC-GXx boards"
 	depends on X86 && MTD_CFI_INTELEXT && MTD_COMPLEX_MAPPINGS
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 46ff278006a7..e8b5caa17ccc 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -27,7 +27,6 @@ obj-$(CONFIG_MTD_PCMCIA)	+= pcmciamtd.o
 obj-$(CONFIG_MTD_SA1100)	+= sa1100-flash.o
 obj-$(CONFIG_MTD_SBC_GXX)	+= sbc_gxx.o
 obj-$(CONFIG_MTD_SC520CDP)	+= sc520cdp.o
-obj-$(CONFIG_MTD_NETSC520)	+= netsc520.o
 obj-$(CONFIG_MTD_SUN_UFLASH)	+= sun_uflash.o
 obj-$(CONFIG_MTD_SCx200_DOCFLASH)+= scx200_docflash.o
 obj-$(CONFIG_MTD_SOLUTIONENGINE)+= solutionengine.o
diff --git a/drivers/mtd/maps/netsc520.c b/drivers/mtd/maps/netsc520.c
deleted file mode 100644
index 0bb651624f05..000000000000
--- a/drivers/mtd/maps/netsc520.c
+++ /dev/null
@@ -1,127 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* netsc520.c -- MTD map driver for AMD NetSc520 Demonstration Board
- *
- * Copyright (C) 2001 Mark Langsdorf (mark.langsdorf@amd.com)
- *	based on sc520cdp.c by Sysgo Real-Time Solutions GmbH
- *
- * The NetSc520 is a demonstration board for the Elan Sc520 processor available
- * from AMD.  It has a single back of 16 megs of 32-bit Flash ROM and another
- * 16 megs of SDRAM.
- */
-
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <asm/io.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/partitions.h>
-
-
-/*
-** The single, 16 megabyte flash bank is divided into four virtual
-** partitions.  The first partition is 768 KiB and is intended to
-** store the kernel image loaded by the bootstrap loader.  The second
-** partition is 256 KiB and holds the BIOS image.  The third
-** partition is 14.5 MiB and is intended for the flash file system
-** image.  The last partition is 512 KiB and contains another copy
-** of the BIOS image and the reset vector.
-**
-** Only the third partition should be mounted.  The first partition
-** should not be mounted, but it can erased and written to using the
-** MTD character routines.  The second and fourth partitions should
-** not be touched - it is possible to corrupt the BIOS image by
-** mounting these partitions, and potentially the board will not be
-** recoverable afterwards.
-*/
-
-/* partition_info gives details on the logical partitions that the split the
- * single flash device into. If the size if zero we use up to the end of the
- * device. */
-static const struct mtd_partition partition_info[] = {
-    {
-	    .name = "NetSc520 boot kernel",
-	    .offset = 0,
-	    .size = 0xc0000
-    },
-    {
-	    .name = "NetSc520 Low BIOS",
-	    .offset = 0xc0000,
-	    .size = 0x40000
-    },
-    {
-	    .name = "NetSc520 file system",
-	    .offset = 0x100000,
-	    .size = 0xe80000
-    },
-    {
-	    .name = "NetSc520 High BIOS",
-	    .offset = 0xf80000,
-	    .size = 0x80000
-    },
-};
-#define NUM_PARTITIONS ARRAY_SIZE(partition_info)
-
-#define WINDOW_SIZE	0x00100000
-#define WINDOW_ADDR	0x00200000
-
-static struct map_info netsc520_map = {
-	.name = "netsc520 Flash Bank",
-	.size = WINDOW_SIZE,
-	.bankwidth = 4,
-	.phys = WINDOW_ADDR,
-};
-
-#define NUM_FLASH_BANKS	ARRAY_SIZE(netsc520_map)
-
-static struct mtd_info *mymtd;
-
-static int __init init_netsc520(void)
-{
-	printk(KERN_NOTICE "NetSc520 flash device: 0x%Lx at 0x%Lx\n",
-			(unsigned long long)netsc520_map.size,
-			(unsigned long long)netsc520_map.phys);
-	netsc520_map.virt = ioremap(netsc520_map.phys, netsc520_map.size);
-
-	if (!netsc520_map.virt) {
-		printk("Failed to ioremap\n");
-		return -EIO;
-	}
-
-	simple_map_init(&netsc520_map);
-
-	mymtd = do_map_probe("cfi_probe", &netsc520_map);
-	if(!mymtd)
-		mymtd = do_map_probe("map_ram", &netsc520_map);
-	if(!mymtd)
-		mymtd = do_map_probe("map_rom", &netsc520_map);
-
-	if (!mymtd) {
-		iounmap(netsc520_map.virt);
-		return -ENXIO;
-	}
-
-	mymtd->owner = THIS_MODULE;
-	mtd_device_register(mymtd, partition_info, NUM_PARTITIONS);
-	return 0;
-}
-
-static void __exit cleanup_netsc520(void)
-{
-	if (mymtd) {
-		mtd_device_unregister(mymtd);
-		map_destroy(mymtd);
-	}
-	if (netsc520_map.virt) {
-		iounmap(netsc520_map.virt);
-		netsc520_map.virt = NULL;
-	}
-}
-
-module_init(init_netsc520);
-module_exit(cleanup_netsc520);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Mark Langsdorf <mark.langsdorf@amd.com>");
-MODULE_DESCRIPTION("MTD map driver for AMD NetSc520 Demonstration Board");
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
