Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784E8CD342C
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2026 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cv3spr850rqPuhkLDVee2cWtaUlDS36q9+P5aLBzBl0=; b=e9rfcnzA5InEJf
	3wMg0ARbyjO1D+Ggpl3Myw4mw/kLQ7dJScCIJHv/PlOLJbeIhNK0MYXrVFGpoUVdoPdwqcvWdApg7
	ijSKPQw42s+UDltTQxg8ZGhQXNzsUF2Wk7dgRyqWaEOD7q8KA3kz+UBncIQX82glpCCvtpxFRU7rR
	2AJLJ5aPAFJl1gYFgKQHb0iYm/pYPAcY9pRXfuzxBm4hXROl39FoomPtn8eMtxNg42HXCJCOaEWNy
	kJPtNiTzhbmTXnv5OybKc/HMk2JT8hNmbtH+Iawz97C2MBxUZ16uwVrI8uvbILpLyI9dtlvWYRy5Q
	yLV9MfFKMQu/7uEmihMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdbW-00000001B12-2enP;
	Wed, 06 May 2026 14:52:02 +0000
Received: from extorris.mess.org ([2001:4b98:dc0:43:f816:3eff:fee1:13b9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdbS-00000001Az0-0MSX
	for linux-mtd@lists.infradead.org;
	Wed, 06 May 2026 14:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1778078601; bh=IpaJU7Ptdixw7tkDNDKcQUsgWqg5xyH5+gvrwGBrZpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fU/aRzpz6AQMoBYKhFGEL2EC8Nm/F71FunDEv20E9BgMq54gociJOzOxLCfYiXX2Y
	 vw08qn6vmbDk2UfK+BdF1Dp55VRRvqMaHYRCQnP5fUoP+9uRFBulI9pxyFnpvsJ5ul
	 tqLyYpLPs947HTJRNWRY/+I7hQxEEjUWbZ3ZO5BvkUoerhEZzewl3EAeO5kDygDDd0
	 q1Abhz2xTOc+Bc8/9ym6p2vZMFXcjMQt6P/lvfhANa+S05M88zUM33Y0QzwWj/SWM3
	 etL9v3SO0qzGTRpck3mUcr+xE3BY0QSgQfLORE9VLKFw9OjXCOSAYuP/aeV6wXJCJW
	 h5Jd8tlA+cInQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 6F45241CE8; Wed, 06 May 2026 15:43:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1778078589; bh=IpaJU7Ptdixw7tkDNDKcQUsgWqg5xyH5+gvrwGBrZpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EoCDAjif85TtrTsFPF1ho2ir0arDnyvmDaLRDyOCAbSMqaQByJ4e7+vNOq1eG2LFQ
	 ZwVqBNsERNW8qC+ysSzUTgWkZivm5vUGy7gK8ZufDmzDPmx4LGroZl9iO9Pu/8Giux
	 ftiRUQ6hIpwtEc5ghRsrQnjUbRxygwY1ZA5QznCgza3As6mjBeYVAIIlCsSR/rKLM4
	 UtiJkV2HVswODGs8OloceTdiBdCGgYNRmp080X28LCdrDAyNdA5i7Jkb0F1X5l7fP0
	 jacMV0Ev1ocbk7TQ+xqECnMGEx/ZgRY18rTXWQgzqMIW1DIOlxzGP2j7uwtNgkH3Ga
	 ocAQf9oJHyCKw==
Received: from maru.local (unknown [140.228.74.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id BBC8341CDF;
	Wed, 06 May 2026 15:43:09 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 4/8] mtd: sc520cdp: Remove mapping since board is no longer supported
Date: Wed,  6 May 2026 15:42:49 +0100
Message-ID: <b938ad58517e02f142597e8c0749dd717e12aaef.1778071745.git.sean@mess.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778071745.git.sean@mess.org>
References: <cover.1778071745.git.sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_075158_256543_6E07CA9E 
X-CRM114-Status: GOOD (  29.62  )
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
 drivers/mtd/maps/Kconfig    |   8 -
 drivers/mtd/maps/Makefile   |   1 -
 drivers/mtd/maps/sc520cdp.c | 294 ------------------------------------
 3 files changed, 303 deletions(-)
 delete mode 100644 drivers/mtd/maps/sc520cdp.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index b34f3c34c626..db63b5af4b39 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -125,14 +125,6 @@ config MTD_SUN_UFLASH
 	  Sun Microsystems boardsets.  This driver will require CFI support
 	  in the kernel, so if you did not enable CFI previously, do that now.
 
-config MTD_SC520CDP
-	tristate "CFI Flash device mapped on AMD SC520 CDP"
-	depends on (MELAN || COMPILE_TEST) && MTD_CFI
-	help
-	  The SC520 CDP board has two banks of CFI-compliant chips and one
-	  Dual-in-line JEDEC chip. This 'mapping' driver supports that
-	  arrangement, implementing three MTD devices.
-
 config MTD_SBC_GXX
 	tristate "CFI Flash device mapped on Arcom SBC-GXx boards"
 	depends on X86 && MTD_CFI_INTELEXT && MTD_COMPLEX_MAPPINGS
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index e8b5caa17ccc..c545d1e68e91 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -26,7 +26,6 @@ obj-$(CONFIG_MTD_PISMO)		+= pismo.o
 obj-$(CONFIG_MTD_PCMCIA)	+= pcmciamtd.o
 obj-$(CONFIG_MTD_SA1100)	+= sa1100-flash.o
 obj-$(CONFIG_MTD_SBC_GXX)	+= sbc_gxx.o
-obj-$(CONFIG_MTD_SC520CDP)	+= sc520cdp.o
 obj-$(CONFIG_MTD_SUN_UFLASH)	+= sun_uflash.o
 obj-$(CONFIG_MTD_SCx200_DOCFLASH)+= scx200_docflash.o
 obj-$(CONFIG_MTD_SOLUTIONENGINE)+= solutionengine.o
diff --git a/drivers/mtd/maps/sc520cdp.c b/drivers/mtd/maps/sc520cdp.c
deleted file mode 100644
index 8ef7aec634c7..000000000000
--- a/drivers/mtd/maps/sc520cdp.c
+++ /dev/null
@@ -1,294 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* sc520cdp.c -- MTD map driver for AMD SC520 Customer Development Platform
- *
- * Copyright (C) 2001 Sysgo Real-Time Solutions GmbH
- *
- * The SC520CDP is an evaluation board for the Elan SC520 processor available
- * from AMD. It has two banks of 32-bit Flash ROM, each 8 Megabytes in size,
- * and up to 512 KiB of 8-bit DIL Flash ROM.
- * For details see https://www.amd.com/products/epd/desiging/evalboards/18.elansc520/520_cdp_brief/index.html
- */
-
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <asm/io.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/concat.h>
-
-/*
-** The Embedded Systems BIOS decodes the first FLASH starting at
-** 0x8400000. This is a *terrible* place for it because accessing
-** the flash at this location causes the A22 address line to be high
-** (that's what 0x8400000 binary's ought to be). But this is the highest
-** order address line on the raw flash devices themselves!!
-** This causes the top HALF of the flash to be accessed first. Beyond
-** the physical limits of the flash, the flash chip aliases over (to
-** 0x880000 which causes the bottom half to be accessed. This splits the
-** flash into two and inverts it! If you then try to access this from another
-** program that does NOT do this insanity, then you *will* access the
-** first half of the flash, but not find what you expect there. That
-** stuff is in the *second* half! Similarly, the address used by the
-** BIOS for the second FLASH bank is also quite a bad choice.
-** If REPROGRAM_PAR is defined below (the default), then this driver will
-** choose more useful addresses for the FLASH banks by reprogramming the
-** responsible PARxx registers in the SC520's MMCR region. This will
-** cause the settings to be incompatible with the BIOS's settings, which
-** shouldn't be a problem since you are running Linux, (i.e. the BIOS is
-** not much use anyway). However, if you need to be compatible with
-** the BIOS for some reason, just undefine REPROGRAM_PAR.
-*/
-#define REPROGRAM_PAR
-
-
-
-#ifdef REPROGRAM_PAR
-
-/* These are the addresses we want.. */
-#define WINDOW_ADDR_0	0x08800000
-#define WINDOW_ADDR_1	0x09000000
-#define WINDOW_ADDR_2	0x09800000
-
-/* .. and these are the addresses the BIOS gives us */
-#define WINDOW_ADDR_0_BIOS	0x08400000
-#define WINDOW_ADDR_1_BIOS	0x08c00000
-#define WINDOW_ADDR_2_BIOS	0x09400000
-
-#else
-
-#define WINDOW_ADDR_0	0x08400000
-#define WINDOW_ADDR_1	0x08C00000
-#define WINDOW_ADDR_2	0x09400000
-
-#endif
-
-#define WINDOW_SIZE_0	0x00800000
-#define WINDOW_SIZE_1	0x00800000
-#define WINDOW_SIZE_2	0x00080000
-
-
-static struct map_info sc520cdp_map[] = {
-	{
-		.name = "SC520CDP Flash Bank #0",
-		.size = WINDOW_SIZE_0,
-		.bankwidth = 4,
-		.phys = WINDOW_ADDR_0
-	},
-	{
-		.name = "SC520CDP Flash Bank #1",
-		.size = WINDOW_SIZE_1,
-		.bankwidth = 4,
-		.phys = WINDOW_ADDR_1
-	},
-	{
-		.name = "SC520CDP DIL Flash",
-		.size = WINDOW_SIZE_2,
-		.bankwidth = 1,
-		.phys = WINDOW_ADDR_2
-	},
-};
-
-#define NUM_FLASH_BANKS	ARRAY_SIZE(sc520cdp_map)
-
-static struct mtd_info *mymtd[NUM_FLASH_BANKS];
-static struct mtd_info *merged_mtd;
-
-#ifdef REPROGRAM_PAR
-
-/*
-** The SC520 MMCR (memory mapped control register) region resides
-** at 0xFFFEF000. The 16 Programmable Address Region (PAR) registers
-** are at offset 0x88 in the MMCR:
-*/
-#define SC520_MMCR_BASE		0xFFFEF000
-#define SC520_MMCR_EXTENT	0x1000
-#define SC520_PAR(x)		((0x88/sizeof(unsigned long)) + (x))
-#define NUM_SC520_PAR		16	/* total number of PAR registers */
-
-/*
-** The highest three bits in a PAR register determine what target
-** device is controlled by this PAR. Here, only ROMCS? and BOOTCS
-** devices are of interest.
-*/
-#define SC520_PAR_BOOTCS	(0x4<<29)
-#define SC520_PAR_ROMCS0	(0x5<<29)
-#define SC520_PAR_ROMCS1	(0x6<<29)
-#define SC520_PAR_TRGDEV	(0x7<<29)
-
-/*
-** Bits 28 thru 26 determine some attributes for the
-** region controlled by the PAR. (We only use non-cacheable)
-*/
-#define SC520_PAR_WRPROT	(1<<26)	/* write protected       */
-#define SC520_PAR_NOCACHE	(1<<27)	/* non-cacheable         */
-#define SC520_PAR_NOEXEC	(1<<28)	/* code execution denied */
-
-
-/*
-** Bit 25 determines the granularity: 4K or 64K
-*/
-#define SC520_PAR_PG_SIZ4	(0<<25)
-#define SC520_PAR_PG_SIZ64	(1<<25)
-
-/*
-** Build a value to be written into a PAR register.
-** We only need ROM entries, 64K page size:
-*/
-#define SC520_PAR_ENTRY(trgdev, address, size) \
-	((trgdev) | SC520_PAR_NOCACHE | SC520_PAR_PG_SIZ64 | \
-	(address) >> 16 | (((size) >> 16) - 1) << 14)
-
-struct sc520_par_table
-{
-	unsigned long trgdev;
-	unsigned long new_par;
-	unsigned long default_address;
-};
-
-static const struct sc520_par_table par_table[NUM_FLASH_BANKS] =
-{
-	{	/* Flash Bank #0: selected by ROMCS0 */
-		SC520_PAR_ROMCS0,
-		SC520_PAR_ENTRY(SC520_PAR_ROMCS0, WINDOW_ADDR_0, WINDOW_SIZE_0),
-		WINDOW_ADDR_0_BIOS
-	},
-	{	/* Flash Bank #1: selected by ROMCS1 */
-		SC520_PAR_ROMCS1,
-		SC520_PAR_ENTRY(SC520_PAR_ROMCS1, WINDOW_ADDR_1, WINDOW_SIZE_1),
-		WINDOW_ADDR_1_BIOS
-	},
-	{	/* DIL (BIOS) Flash: selected by BOOTCS */
-		SC520_PAR_BOOTCS,
-		SC520_PAR_ENTRY(SC520_PAR_BOOTCS, WINDOW_ADDR_2, WINDOW_SIZE_2),
-		WINDOW_ADDR_2_BIOS
-	}
-};
-
-
-static void sc520cdp_setup_par(void)
-{
-	unsigned long __iomem *mmcr;
-	unsigned long mmcr_val;
-	int i, j;
-
-	/* map in SC520's MMCR area */
-	mmcr = ioremap(SC520_MMCR_BASE, SC520_MMCR_EXTENT);
-	if(!mmcr) { /* ioremap failed: skip the PAR reprogramming */
-		/* force physical address fields to BIOS defaults: */
-		for(i = 0; i < NUM_FLASH_BANKS; i++)
-			sc520cdp_map[i].phys = par_table[i].default_address;
-		return;
-	}
-
-	/*
-	** Find the PARxx registers that are responsible for activating
-	** ROMCS0, ROMCS1 and BOOTCS. Reprogram each of these with a
-	** new value from the table.
-	*/
-	for(i = 0; i < NUM_FLASH_BANKS; i++) {		/* for each par_table entry  */
-		for(j = 0; j < NUM_SC520_PAR; j++) {	/* for each PAR register     */
-			mmcr_val = readl(&mmcr[SC520_PAR(j)]);
-			/* if target device field matches, reprogram the PAR */
-			if((mmcr_val & SC520_PAR_TRGDEV) == par_table[i].trgdev)
-			{
-				writel(par_table[i].new_par, &mmcr[SC520_PAR(j)]);
-				break;
-			}
-		}
-		if(j == NUM_SC520_PAR)
-		{	/* no matching PAR found: try default BIOS address */
-			printk(KERN_NOTICE "Could not find PAR responsible for %s\n",
-				sc520cdp_map[i].name);
-			printk(KERN_NOTICE "Trying default address 0x%lx\n",
-				par_table[i].default_address);
-			sc520cdp_map[i].phys = par_table[i].default_address;
-		}
-	}
-	iounmap(mmcr);
-}
-#endif
-
-
-static int __init init_sc520cdp(void)
-{
-	int i, j, devices_found = 0;
-
-#ifdef REPROGRAM_PAR
-	/* reprogram PAR registers so flash appears at the desired addresses */
-	sc520cdp_setup_par();
-#endif
-
-	for (i = 0; i < NUM_FLASH_BANKS; i++) {
-		printk(KERN_NOTICE "SC520 CDP flash device: 0x%Lx at 0x%Lx\n",
-			(unsigned long long)sc520cdp_map[i].size,
-			(unsigned long long)sc520cdp_map[i].phys);
-
-		sc520cdp_map[i].virt = ioremap(sc520cdp_map[i].phys, sc520cdp_map[i].size);
-
-		if (!sc520cdp_map[i].virt) {
-			printk("Failed to ioremap\n");
-			for (j = 0; j < i; j++) {
-				if (mymtd[j]) {
-					map_destroy(mymtd[j]);
-					iounmap(sc520cdp_map[j].virt);
-				}
-			}
-			return -EIO;
-		}
-
-		simple_map_init(&sc520cdp_map[i]);
-
-		mymtd[i] = do_map_probe("cfi_probe", &sc520cdp_map[i]);
-		if(!mymtd[i])
-			mymtd[i] = do_map_probe("jedec_probe", &sc520cdp_map[i]);
-		if(!mymtd[i])
-			mymtd[i] = do_map_probe("map_rom", &sc520cdp_map[i]);
-
-		if (mymtd[i]) {
-			mymtd[i]->owner = THIS_MODULE;
-			++devices_found;
-		}
-		else {
-			iounmap(sc520cdp_map[i].virt);
-		}
-	}
-	if(devices_found >= 2) {
-		/* Combine the two flash banks into a single MTD device & register it: */
-		merged_mtd = mtd_concat_create(mymtd, 2, "SC520CDP Flash Banks #0 and #1");
-		if(merged_mtd)
-			mtd_device_register(merged_mtd, NULL, 0);
-	}
-	if(devices_found == 3) /* register the third (DIL-Flash) device */
-		mtd_device_register(mymtd[2], NULL, 0);
-	return(devices_found ? 0 : -ENXIO);
-}
-
-static void __exit cleanup_sc520cdp(void)
-{
-	int i;
-
-	if (merged_mtd) {
-		mtd_device_unregister(merged_mtd);
-		mtd_concat_destroy(merged_mtd);
-	}
-	if (mymtd[2])
-		mtd_device_unregister(mymtd[2]);
-
-	for (i = 0; i < NUM_FLASH_BANKS; i++) {
-		if (mymtd[i])
-			map_destroy(mymtd[i]);
-		if (sc520cdp_map[i].virt) {
-			iounmap(sc520cdp_map[i].virt);
-			sc520cdp_map[i].virt = NULL;
-		}
-	}
-}
-
-module_init(init_sc520cdp);
-module_exit(cleanup_sc520cdp);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Sysgo Real-Time Solutions GmbH");
-MODULE_DESCRIPTION("MTD map driver for AMD SC520 Customer Development Platform");
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
