Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14492CD5BD2
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 10:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HinFyh5TscGDByM3NbwdBKZHruY4UDdqB6NpbMMnjfc=; b=0YYLE5b0bUVVcz
	hj+0ZgOvyXeOtgflieRuatUhNxWRqoiQdQijfCtMiMYNRph1g13WT8UTdg1SqjtAmsBQbMt0S2WoP
	0FdoVz+u9jZ0P3XuaU8twPd0dbgTqpIXdcDQmLHGClVb+AGpUuskplAXtAnF+1G41rWDIYZH6TUgV
	aWtO7uhKLfVE6otnz5wxaK/UqbgWfFB/Q8/3W6QuCYvCqtuW7xPe8FwcFUL7GzaMRCrgW9leWuvXB
	kMbfbpeYzeKqwyhuTwd9GaxS95Dv8EKTAm32oVqtZjgmwxGKbAohMpvMrSjsgFWcK9Q5UDgMW2GG0
	6C8l/dwkb2YQeyGb1ufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRp5e-00000001eve-3JwM;
	Tue, 26 May 2026 10:32:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRp5b-00000001euJ-2flG
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 10:32:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46347436F4;
	Tue, 26 May 2026 10:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6CD1F00A3D;
	Tue, 26 May 2026 10:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791567;
	bh=eznux7v/HjwTuTMps1YXZMO14/qd1CbbpXXKAG3rXAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AKUM0eXAE+3iK2U4JXEbHVXqce0sdpTcKSk/2uJfVm2qyR8Uy/hIuocah9AezJkBl
	 +GKghonxwGIW9mxoteltK4VfSgedbCgAvgQbr2dNwO/AqKmXf+N9z1Khz+8jOdcimg
	 ITYbSnn4C47o8i9J346/o90yOFcSLENg8pHn7ClXECZvP1hBIyNLAo0djTGm75nNKc
	 KUiXxz89O9w93NZlQzKgzI0HQ8Z04T7CBdOTbvxiiuCQV1CmBgq15tlffU7RZ3Auev
	 ebz6ivvgdM6xviKO4T86VquZbp0Qd6/N/iGVPAKu2CxTRG3ljpbMLEvT3kOrizt0h8
	 ZkucOwM/de7Aw==
From: Arnd Bergmann <arnd@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: maps: remove uclinux map driver
Date: Tue, 26 May 2026 12:32:05 +0200
Message-Id: <20260526103227.3152003-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260526103227.3152003-1-arnd@kernel.org>
References: <20260526103227.3152003-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_033247_720189_0B97840B 
X-CRM114-Status: GOOD (  18.95  )
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

From: Arnd Bergmann <arnd@arndb.de>

Rather than using platform data or DT properties, the configuration
for this mtd map driver used to be passed through the global
uclinux_ram_map structure, but the last instance was removed in
commit 4ba66a976072 ("arch: remove blackfin port") in 2018.

After commit 251f26c9e828 ("mtd: maps: Make uclinux_ram_map static"),
it became impossible to configure it at all, even with out-of-tree
platform code.

Clearly nobody is using it, so remove it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/maps/Kconfig   |   6 --
 drivers/mtd/maps/Makefile  |   1 -
 drivers/mtd/maps/uclinux.c | 118 -------------------------------------
 3 files changed, 125 deletions(-)
 delete mode 100644 drivers/mtd/maps/uclinux.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 784dba14e908..1e8f2b518ddd 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -284,12 +284,6 @@ config MTD_PCMCIA_ANONYMOUS
 
 	  If unsure, say N.
 
-config MTD_UCLINUX
-	bool "Generic uClinux RAM/ROM filesystem support"
-	depends on (MTD_RAM=y || MTD_ROM=y) && (!MMU || COLDFIRE)
-	help
-	  Map driver to support image based filesystems for uClinux.
-
 config MTD_PLATRAM
 	tristate "Map driver for platform device RAM (mtd-ram)"
 	select MTD_RAM
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 157f911f86d8..eff28fc0b60e 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -31,7 +31,6 @@ obj-$(CONFIG_MTD_SCx200_DOCFLASH)+= scx200_docflash.o
 obj-$(CONFIG_MTD_SOLUTIONENGINE)+= solutionengine.o
 obj-$(CONFIG_MTD_PCI)		+= pci.o
 obj-$(CONFIG_MTD_IMPA7)		+= impa7.o
-obj-$(CONFIG_MTD_UCLINUX)	+= uclinux.o
 obj-$(CONFIG_MTD_SCB2_FLASH)	+= scb2_flash.o
 obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
 obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
deleted file mode 100644
index de4c46318abb..000000000000
--- a/drivers/mtd/maps/uclinux.c
+++ /dev/null
@@ -1,118 +0,0 @@
-/****************************************************************************/
-
-/*
- *	uclinux.c -- generic memory mapped MTD driver for uclinux
- *
- *	(C) Copyright 2002, Greg Ungerer (gerg@snapgear.com)
- *
- *      License: GPL
- */
-
-/****************************************************************************/
-
-#include <linux/moduleparam.h>
-#include <linux/types.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/fs.h>
-#include <linux/mm.h>
-#include <linux/major.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
-#include <linux/mtd/partitions.h>
-#include <asm/io.h>
-#include <asm/sections.h>
-
-/****************************************************************************/
-
-#ifdef CONFIG_MTD_ROM
-#define MAP_NAME "rom"
-#else
-#define MAP_NAME "ram"
-#endif
-
-static struct map_info uclinux_ram_map = {
-	.name = MAP_NAME,
-	.size = 0,
-};
-
-static unsigned long physaddr = -1;
-module_param(physaddr, ulong, S_IRUGO);
-
-static struct mtd_info *uclinux_ram_mtdinfo;
-
-/****************************************************************************/
-
-static const struct mtd_partition uclinux_romfs[] = {
-	{ .name = "ROMfs" }
-};
-
-#define	NUM_PARTITIONS	ARRAY_SIZE(uclinux_romfs)
-
-/****************************************************************************/
-
-static int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
-	size_t *retlen, void **virt, resource_size_t *phys)
-{
-	struct map_info *map = mtd->priv;
-	*virt = map->virt + from;
-	if (phys)
-		*phys = map->phys + from;
-	*retlen = len;
-	return(0);
-}
-
-/****************************************************************************/
-
-static int __init uclinux_mtd_init(void)
-{
-	struct mtd_info *mtd;
-	struct map_info *mapp;
-
-	mapp = &uclinux_ram_map;
-
-	if (physaddr == -1)
-		mapp->phys = (resource_size_t)__bss_stop;
-	else
-		mapp->phys = physaddr;
-
-	if (!mapp->size)
-		mapp->size = PAGE_ALIGN(ntohl(*((unsigned long *)(mapp->phys + 8))));
-	mapp->bankwidth = 4;
-
-	printk("uclinux[mtd]: probe address=0x%x size=0x%x\n",
-	       	(int) mapp->phys, (int) mapp->size);
-
-	/*
-	 * The filesystem is guaranteed to be in direct mapped memory. It is
-	 * directly following the kernels own bss region. Following the same
-	 * mechanism used by architectures setting up traditional initrds we
-	 * use phys_to_virt to get the virtual address of its start.
-	 */
-	mapp->virt = phys_to_virt(mapp->phys);
-
-	if (mapp->virt == 0) {
-		printk("uclinux[mtd]: no virtual mapping?\n");
-		return(-EIO);
-	}
-
-	simple_map_init(mapp);
-
-	mtd = do_map_probe("map_" MAP_NAME, mapp);
-	if (!mtd) {
-		printk("uclinux[mtd]: failed to find a mapping?\n");
-		return(-ENXIO);
-	}
-
-	mtd->owner = THIS_MODULE;
-	mtd->_point = uclinux_point;
-	mtd->priv = mapp;
-
-	uclinux_ram_mtdinfo = mtd;
-	mtd_device_register(mtd, uclinux_romfs, NUM_PARTITIONS);
-
-	return(0);
-}
-device_initcall(uclinux_mtd_init);
-
-/****************************************************************************/
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
