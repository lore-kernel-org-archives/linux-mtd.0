Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwilD-0005Rt-LP
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 02:36:48 +0000
Received: by mail-pa0-f54.google.com with SMTP id fb1so19320695pad.13
 for <linux-mtd@lists.infradead.org>; Thu, 04 Dec 2014 18:36:26 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/3] mtd: cfi_cmdset_{0001,
 0002}: use common MTD reboot boilerplate
Date: Thu,  4 Dec 2014 18:36:08 -0800
Message-Id: <1417746968-28747-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1417746968-28747-1-git-send-email-computersforpeace@gmail.com>
References: <1417746968-28747-1-git-send-email-computersforpeace@gmail.com>
Cc: cdoban@broadcom.com, rjui@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, sbranden@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We don't have to implement this glue code in the chip driver any more.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Not tested yet

 drivers/mtd/chips/cfi_cmdset_0001.c | 22 +++-------------------
 drivers/mtd/chips/cfi_cmdset_0002.c | 22 +++-------------------
 2 files changed, 6 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 286b97a304cf..3df9744496b2 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -28,7 +28,6 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/reboot.h>
 #include <linux/bitmap.h>
 #include <linux/mtd/xip.h>
 #include <linux/mtd/map.h>
@@ -80,7 +79,7 @@ static int cfi_intelext_get_user_prot_info(struct mtd_info *, size_t,
 #endif
 static int cfi_intelext_suspend (struct mtd_info *);
 static void cfi_intelext_resume (struct mtd_info *);
-static int cfi_intelext_reboot (struct notifier_block *, unsigned long, void *);
+static void cfi_intelext_reset(struct mtd_info *);
 
 static void cfi_intelext_destroy(struct mtd_info *);
 
@@ -486,13 +485,12 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
 	mtd->_is_locked = cfi_intelext_is_locked;
 	mtd->_suspend = cfi_intelext_suspend;
 	mtd->_resume  = cfi_intelext_resume;
+	mtd->_reboot  = cfi_intelext_reset;
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
 	mtd->writesize = 1;
 	mtd->writebufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
 
-	mtd->reboot_notifier.notifier_call = cfi_intelext_reboot;
-
 	if (cfi->cfi_mode == CFI_MODE_CFI) {
 		/*
 		 * It's a real CFI chip, not one for which the probe
@@ -646,7 +644,6 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 		goto setup_err;
 
 	__module_get(THIS_MODULE);
-	register_reboot_notifier(&mtd->reboot_notifier);
 	return mtd;
 
  setup_err:
@@ -2605,7 +2602,7 @@ static void cfi_intelext_resume(struct mtd_info *mtd)
 		cfi_intelext_restore_locks(mtd);
 }
 
-static int cfi_intelext_reset(struct mtd_info *mtd)
+static void cfi_intelext_reset(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -2626,18 +2623,6 @@ static int cfi_intelext_reset(struct mtd_info *mtd)
 		}
 		mutex_unlock(&chip->mutex);
 	}
-
-	return 0;
-}
-
-static int cfi_intelext_reboot(struct notifier_block *nb, unsigned long val,
-			       void *v)
-{
-	struct mtd_info *mtd;
-
-	mtd = container_of(nb, struct mtd_info, reboot_notifier);
-	cfi_intelext_reset(mtd);
-	return NOTIFY_DONE;
 }
 
 static void cfi_intelext_destroy(struct mtd_info *mtd)
@@ -2647,7 +2632,6 @@ static void cfi_intelext_destroy(struct mtd_info *mtd)
 	struct mtd_erase_region_info *region;
 	int i;
 	cfi_intelext_reset(mtd);
-	unregister_reboot_notifier(&mtd->reboot_notifier);
 	kfree(cfi->cmdset_priv);
 	kfree(cfi->cfiq);
 	kfree(cfi->chips[0].priv);
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index c50d8cf0f60d..c4f63482cf96 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -31,7 +31,6 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/reboot.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/mtd/map.h>
@@ -57,7 +56,7 @@ static int cfi_amdstd_erase_varsize(struct mtd_info *, struct erase_info *);
 static void cfi_amdstd_sync (struct mtd_info *);
 static int cfi_amdstd_suspend (struct mtd_info *);
 static void cfi_amdstd_resume (struct mtd_info *);
-static int cfi_amdstd_reboot(struct notifier_block *, unsigned long, void *);
+static void cfi_amdstd_reset(struct mtd_info *);
 static int cfi_amdstd_get_fact_prot_info(struct mtd_info *, size_t,
 					 size_t *, struct otp_info *);
 static int cfi_amdstd_get_user_prot_info(struct mtd_info *, size_t,
@@ -529,6 +528,7 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	mtd->_sync    = cfi_amdstd_sync;
 	mtd->_suspend = cfi_amdstd_suspend;
 	mtd->_resume  = cfi_amdstd_resume;
+	mtd->_reboot  = cfi_amdstd_reset;
 	mtd->_read_user_prot_reg = cfi_amdstd_read_user_prot_reg;
 	mtd->_read_fact_prot_reg = cfi_amdstd_read_fact_prot_reg;
 	mtd->_get_fact_prot_info = cfi_amdstd_get_fact_prot_info;
@@ -544,7 +544,6 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 			mtd->writebufsize);
 
 	mtd->_panic_write = cfi_amdstd_panic_write;
-	mtd->reboot_notifier.notifier_call = cfi_amdstd_reboot;
 
 	if (cfi->cfi_mode==CFI_MODE_CFI){
 		unsigned char bootloc;
@@ -717,7 +716,6 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 	}
 
 	__module_get(THIS_MODULE);
-	register_reboot_notifier(&mtd->reboot_notifier);
 	return mtd;
 
  setup_err:
@@ -2871,7 +2869,7 @@ static void cfi_amdstd_resume(struct mtd_info *mtd)
  * the flash is in query/program/erase mode will prevent the CPU from
  * fetching the bootloader code, requiring a hard reset or power cycle.
  */
-static int cfi_amdstd_reset(struct mtd_info *mtd)
+static void cfi_amdstd_reset(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -2893,19 +2891,6 @@ static int cfi_amdstd_reset(struct mtd_info *mtd)
 
 		mutex_unlock(&chip->mutex);
 	}
-
-	return 0;
-}
-
-
-static int cfi_amdstd_reboot(struct notifier_block *nb, unsigned long val,
-			       void *v)
-{
-	struct mtd_info *mtd;
-
-	mtd = container_of(nb, struct mtd_info, reboot_notifier);
-	cfi_amdstd_reset(mtd);
-	return NOTIFY_DONE;
 }
 
 
@@ -2915,7 +2900,6 @@ static void cfi_amdstd_destroy(struct mtd_info *mtd)
 	struct cfi_private *cfi = map->fldrv_priv;
 
 	cfi_amdstd_reset(mtd);
-	unregister_reboot_notifier(&mtd->reboot_notifier);
 	kfree(cfi->cmdset_priv);
 	kfree(cfi->cfiq);
 	kfree(cfi);
-- 
1.9.1
