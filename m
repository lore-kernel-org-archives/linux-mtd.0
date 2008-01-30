Received: from wa-out-1112.google.com ([209.85.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JKHdF-0005CD-LE
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 18:26:04 +0000
Received: by wa-out-1112.google.com with SMTP id v33so495054wah.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Jan 2008 10:25:55 -0800 (PST)
Message-ID: <6934efce0801301025s4341bd95k79d1743090098e86@mail.gmail.com>
Date: Wed, 30 Jan 2008 10:25:49 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Haavard Skinnemoen" <hskinnemoen@atmel.com>
Subject: Re: [PATCH] MTD: Intel StrataFlash P33 is locked on bootup
In-Reply-To: <20080130182210.2076ea38@siona>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1201631809-32193-1-git-send-email-hskinnemoen@atmel.com>
	<6934efce0801291813n68b796f5j5f3db1e90eb174a9@mail.gmail.com>
	<20080130135350.67e95e20@dhcp-252-066.norway.atmel.com>
	<6934efce0801300919v6fdc21f8v68e857301b77ff2e@mail.gmail.com>
	<20080130182210.2076ea38@siona>
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo.Santos@devoteam.com,
	Nicolas Pitre <nico@cam.org>, Justin Treon <justin_treon@yahoo.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > So if I add this hunk, it should work right?
>
> Yeah, that should do it.

The new patch is in "git://git.infradead.org/users/jehulber/mtd.git"

mailer mangled patch follows for reference.
________________________________________

From: Justin Treon <justin_treon@yahoo.com>
[MTD] Unlocking all Intel flash that is locked on power up.

Patch for unlocking all Intel flash that has instant locking on power up.
The patch has been tested on Intel M18, P30 and J3D Strata Flash.
  1.    The automatic unlocking can be disabled for a particular partition
         in the map or the command line.
     a. For the bit mask in the map it should look like:
         .mask_flags   = MTD_POWERUP_LOCK,
     b. For the command line parsing it should look like:
         mtdparts=0x80000(bootloader)lk
  2.    This will only unlock parts with instant individual block locking.
         Intel parts with legacy unlocking will not be unlocked.

Signed-off-by: Justin Treon <justin_treon@yahoo.com>
Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
Acked-by: Nicolas Pitre <nico@cam.org>
---

drivers/mtd/chips/cfi_cmdset_0001.c |   18 ++++++++++++------
drivers/mtd/chips/cfi_cmdset_0002.c |    2 +-
drivers/mtd/cmdlinepart.c           |    9 ++++++++-
drivers/mtd/mtdcore.c               |    2 +-
include/mtd/mtd-abi.h               |    2 +-
5 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c
b/drivers/mtd/chips/cfi_cmdset_0001.c
index 7b44a57..47794d2 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -269,10 +269,16 @@ static void fixup_use_write_buffers(struct
mtd_info *mtd, void *param)
 /*
  * Some chips power-up with all sectors locked by default.
  */
-static void fixup_use_powerup_lock(struct mtd_info *mtd, void *param)
+static void fixup_unlock_powerup_lock(struct mtd_info *mtd, void *param)
 {
-	printk(KERN_INFO "Using auto-unlock on power-up/resume\n" );
-	mtd->flags |= MTD_STUPID_LOCK;
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
+
+	if (cfip->FeatureSupport&32) {
+		printk(KERN_INFO "Using auto-unlock on power-up/resume\n" );
+		mtd->flags |= MTD_POWERUP_LOCK;
+	}
 }

 static struct cfi_fixup cfi_fixup_table[] = {
@@ -288,7 +294,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 #endif
 	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct, NULL },
 	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb, NULL },
-	{ MANUFACTURER_INTEL, 0x891c,	      fixup_use_powerup_lock, NULL, },
+	{ MANUFACTURER_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock, NULL, },
 	{ 0, 0, NULL, NULL }
 };

@@ -2352,7 +2358,7 @@ static int cfi_intelext_suspend(struct mtd_info *mtd)
 	struct flchip *chip;
 	int ret = 0;

-	if ((mtd->flags & MTD_STUPID_LOCK)
+	if ((mtd->flags & MTD_POWERUP_LOCK)
 	    && extp && (extp->FeatureSupport & (1 << 5)))
 		cfi_intelext_save_locks(mtd);

@@ -2463,7 +2469,7 @@ static void cfi_intelext_resume(struct mtd_info *mtd)
 		spin_unlock(chip->mutex);
 	}

-	if ((mtd->flags & MTD_STUPID_LOCK)
+	if ((mtd->flags & MTD_POWERUP_LOCK)
 	    && extp && (extp->FeatureSupport & (1 << 5)))
 		cfi_intelext_restore_locks(mtd);
 }
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
b/drivers/mtd/chips/cfi_cmdset_0002.c
index 796bfea..d072e87 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -217,7 +217,7 @@ static void fixup_use_atmel_lock(struct mtd_info
*mtd, void *param)
 {
 	mtd->lock = cfi_atmel_lock;
 	mtd->unlock = cfi_atmel_unlock;
-	mtd->flags |= MTD_STUPID_LOCK;
+	mtd->flags |= MTD_POWERUP_LOCK;
 }

 static struct cfi_fixup cfi_fixup_table[] = {
diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 23fab14..b44292a 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -9,7 +9,7 @@
  *
  * mtdparts=<mtddef>[;<mtddef]
  * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
- * <partdef> := <size>[@offset][<name>][ro]
+ * <partdef> := <size>[@offset][<name>][ro][lk]
  * <mtd-id>  := unique name used in mapping driver/device (mtd->name)
  * <size>    := standard linux memsize OR "-" to denote all remaining space
  * <name>    := '(' NAME ')'
@@ -143,6 +143,13 @@ static struct mtd_partition * newpart(char *s,
 		s += 2;
         }

+        /* if lk is found do NOT unlock the MTD partition*/
+        if (strncmp(s, "lk", 2) == 0)
+	{
+		mask_flags |= MTD_POWERUP_LOCK;
+		s += 2;
+        }
+
 	/* test if more partitions are following */
 	if (*s == ',')
 	{
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 6c2645e..f7e7890 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -61,7 +61,7 @@ int add_mtd_device(struct mtd_info *mtd)

 			/* Some chips always power up locked. Unlock them now */
 			if ((mtd->flags & MTD_WRITEABLE)
-			    && (mtd->flags & MTD_STUPID_LOCK) && mtd->unlock) {
+			    && (mtd->flags & MTD_POWERUP_LOCK) && mtd->unlock) {
 				if (mtd->unlock(mtd, 0, mtd->size))
 					printk(KERN_WARNING
 					       "%s: unlock failed, "
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index f71dac4..615072c 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -29,7 +29,7 @@ struct mtd_oob_buf {
 #define MTD_WRITEABLE		0x400	/* Device is writeable */
 #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
 #define MTD_NO_ERASE		0x1000	/* No erase necessary */
-#define MTD_STUPID_LOCK		0x2000	/* Always locked after reset */
+#define MTD_POWERUP_LOCK	0x2000	/* Always locked after reset */

 // Some common devices / combinations of capabilities
 #define MTD_CAP_ROM		0
