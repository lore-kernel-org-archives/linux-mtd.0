Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PnY0t-0005KK-44
	for linux-mtd@lists.infradead.org; Thu, 10 Feb 2011 15:00:56 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 2/2] mtd: cfi: fix writebufsize initialization
Date: Thu, 10 Feb 2011 16:01:46 +0100
Message-Id: <1297350106-16383-3-git-send-email-agust@denx.de>
In-Reply-To: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
Cc: Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When initializing mtd->writebufsize, we must take into account
possible flash chip interleaving. Wrong writebufsize initialization
caused UBIFS recovery issues resulting in unmountable UBIFS file
system on NOR flash partitions.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c |    2 +-
 drivers/mtd/chips/cfi_cmdset_0020.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 6ad29b7..d72718a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -453,7 +453,7 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
 	mtd->writesize = 1;
-	mtd->writebufsize = 1 << cfi->cfiq->MaxBufWriteSize;
+	mtd->writebufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
 
 	mtd->reboot_notifier.notifier_call = cfi_intelext_reboot;
 
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 30a098e..637e728 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -354,7 +354,7 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
 	mtd->writesize = 1;
-	mtd->writebufsize = 1 << cfi->cfiq->MaxBufWriteSize;
+	mtd->writebufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
 
 	DEBUG(MTD_DEBUG_LEVEL3, "MTD %s(): write buffer size %d\n",
 		__func__, mtd->writebufsize);
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 30e37f6..cfb3351 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -239,7 +239,7 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 	mtd->resume = cfi_staa_resume;
 	mtd->flags = MTD_CAP_NORFLASH & ~MTD_BIT_WRITEABLE;
 	mtd->writesize = 8; /* FIXME: Should be 0 for STMicro flashes w/out ECC */
-	mtd->writebufsize = 1 << cfi->cfiq->MaxBufWriteSize;
+	mtd->writebufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
 	map->fldrv = &cfi_staa_chipdrv;
 	__module_get(THIS_MODULE);
 	mtd->name = map->name;
-- 
1.7.4
