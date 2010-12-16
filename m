Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTMWe-0006dn-V8
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2010 22:42:18 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/6] mtd: cfi: add writebufsize initialization
Date: Thu, 16 Dec 2010 23:42:15 +0100
Message-Id: <1292539339-25111-3-git-send-email-agust@denx.de>
In-Reply-To: <292342500.2538.65.camel@localhost>
References: <292342500.2538.65.camel@localhost>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Initialize mtd->writebufsize to the value obtained
by CFI query command at probe time.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    1 +
 drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++++
 drivers/mtd/chips/cfi_cmdset_0020.c |    1 +
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 44cbfc0..a8c3e1c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -455,6 +455,7 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
 	mtd->writesize = 1;
+	mtd->writebufsize = 1 << cfi->cfiq->MaxBufWriteSize;
 
 	mtd->reboot_notifier.notifier_call = cfi_intelext_reboot;
 
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 9d68ab9..54dbd28 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -428,6 +428,10 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
 	mtd->writesize = 1;
+	mtd->writebufsize = 1 << cfi->cfiq->MaxBufWriteSize;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "MTD %s(): write buffer size %d\n",
+		__func__, mtd->writebufsize);
 
 	mtd->reboot_notifier.notifier_call = cfi_amdstd_reboot;
 
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 314af1f..c04b765 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -238,6 +238,7 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 	mtd->resume = cfi_staa_resume;
 	mtd->flags = MTD_CAP_NORFLASH & ~MTD_BIT_WRITEABLE;
 	mtd->writesize = 8; /* FIXME: Should be 0 for STMicro flashes w/out ECC */
+	mtd->writebufsize = 1 << cfi->cfiq->MaxBufWriteSize;
 	map->fldrv = &cfi_staa_chipdrv;
 	__module_get(THIS_MODULE);
 	mtd->name = map->name;
-- 
1.7.1
