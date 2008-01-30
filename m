Received: from wa-out-1112.google.com ([209.85.146.176])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JK2SP-0003O4-1O
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 02:13:51 +0000
Received: by wa-out-1112.google.com with SMTP id v33so86546wah.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Jan 2008 18:13:43 -0800 (PST)
Message-ID: <6934efce0801291813n68b796f5j5f3db1e90eb174a9@mail.gmail.com>
Date: Tue, 29 Jan 2008 18:13:43 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Haavard Skinnemoen" <hskinnemoen@atmel.com>,
	"Nicolas Pitre" <nico@cam.org>, "Justin Treon" <justin_treon@yahoo.com>
Subject: Re: [PATCH] MTD: Intel StrataFlash P33 is locked on bootup
In-Reply-To: <1201631809-32193-1-git-send-email-hskinnemoen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1201631809-32193-1-git-send-email-hskinnemoen@atmel.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>, Paolo.Santos@devoteam.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Add appropriate fixups for all the devices listed in the Intel P33
> data sheet.

Please don't merge this patch.

We worked on a patch that will unlock _all_ intel parts that have this
behavior in a more acceptable way.  It was discussed back in November.

I thought Justin had finished running this through review but I don't
see it now.  So I thought you had Acked this patch Nicolas, I can't
find where.  Was I mistaken?


Anyway I added it to my freshly updated git tree
"git://git.infradead.org/users/jehulber/mtd.git" (with a possibly
unearned Acked-by: Nicolas Pitre)


For visual review only....
__________________________________________________________

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
---
drivers/mtd/chips/cfi_cmdset_0001.c |   20 +++++++++++++-------
drivers/mtd/cmdlinepart.c           |    9 ++++++++-
drivers/mtd/mtdcore.c               |    2 +-
include/mtd/mtd-abi.h               |    2 +-
4 files changed, 23 insertions(+), 10 deletions(-)

diff -r c105f44cf785 drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	Thu Nov 08 15:36:57 2007 -0800
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	Tue Nov 13 22:47:40 2007 -0800
@@ -226,10 +226,16 @@ static void fixup_use_write_buffers(stru
 /*
  * Some chips power-up with all sectors locked by default.
  */
-static void fixup_use_powerup_lock(struct mtd_info *mtd, void *param)
-{
-	printk(KERN_INFO "Using auto-unlock on power-up/resume\n" );
-	mtd->flags |= MTD_STUPID_LOCK;
+static void fixup_unlock_powerup_lock(struct mtd_info *mtd, void *param)
+{
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
@@ -244,7 +250,7 @@ static struct cfi_fixup cfi_fixup_table[
 #endif
 	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct, NULL },
 	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb, NULL },
-	{ MANUFACTURER_INTEL, 0x891c,	      fixup_use_powerup_lock, NULL, },
+	{ MANUFACTURER_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock, NULL, },
 	{ 0, 0, NULL, NULL }
 };

@@ -2273,7 +2279,7 @@ static int cfi_intelext_suspend(struct m
 	struct flchip *chip;
 	int ret = 0;

-	if ((mtd->flags & MTD_STUPID_LOCK)
+	if ((mtd->flags & MTD_POWERUP_LOCK)
 	    && extp && (extp->FeatureSupport & (1 << 5)))
 		cfi_intelext_save_locks(mtd);

@@ -2384,7 +2390,7 @@ static void cfi_intelext_resume(struct m
 		spin_unlock(chip->mutex);
 	}

-	if ((mtd->flags & MTD_STUPID_LOCK)
+	if ((mtd->flags & MTD_POWERUP_LOCK)
 	    && extp && (extp->FeatureSupport & (1 << 5)))
 		cfi_intelext_restore_locks(mtd);
 }
diff -r c105f44cf785 drivers/mtd/cmdlinepart.c
--- a/drivers/mtd/cmdlinepart.c	Thu Nov 08 15:36:57 2007 -0800
+++ b/drivers/mtd/cmdlinepart.c	Thu Nov 15 17:18:11 2007 -0800
@@ -9,7 +9,7 @@
  *
  * mtdparts=<mtddef>[;<mtddef]
  * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
- * <partdef> := <size>[@offset][<name>][ro]
+ * <partdef> := <size>[@offset][<name>][ro][lk]
  * <mtd-id>  := unique name used in mapping driver/device (mtd->name)
  * <size>    := standard linux memsize OR "-" to denote all remaining space
  * <name>    := '(' NAME ')'
@@ -140,6 +140,13 @@ static struct mtd_partition * newpart(ch
         if (strncmp(s, "ro", 2) == 0)
 	{
 		mask_flags |= MTD_WRITEABLE;
+		s += 2;
+        }
+
+        /* if lk is found do NOT unlock the MTD partition*/
+        if (strncmp(s, "lk", 2) == 0)
+	{
+		mask_flags |= MTD_POWERUP_LOCK;
 		s += 2;
         }

diff -r c105f44cf785 drivers/mtd/mtdcore.c
--- a/drivers/mtd/mtdcore.c	Thu Nov 08 15:36:57 2007 -0800
+++ b/drivers/mtd/mtdcore.c	Tue Nov 13 15:41:00 2007 -0800
@@ -59,7 +59,7 @@ int add_mtd_device(struct mtd_info *mtd)

 			/* Some chips always power up locked. Unlock them now */
 			if ((mtd->flags & MTD_WRITEABLE)
-			    && (mtd->flags & MTD_STUPID_LOCK) && mtd->unlock) {
+			    && (mtd->flags & MTD_POWERUP_LOCK) && mtd->unlock) {
 				if (mtd->unlock(mtd, 0, mtd->size))
 					printk(KERN_WARNING
 					       "%s: unlock failed, "
diff -r c105f44cf785 include/mtd/mtd-abi.h
--- a/include/mtd/mtd-abi.h	Thu Nov 08 15:36:57 2007 -0800
+++ b/include/mtd/mtd-abi.h	Fri Nov 09 10:43:28 2007 -0800
@@ -29,7 +29,7 @@ struct mtd_oob_buf {
 #define MTD_WRITEABLE		0x400	/* Device is writeable */
 #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
 #define MTD_NO_ERASE		0x1000	/* No erase necessary */
-#define MTD_STUPID_LOCK		0x2000	/* Always locked after reset */
+#define MTD_POWERUP_LOCK	0x2000	/* Always locked after reset */

 // Some common devices / combinations of capabilities
 #define MTD_CAP_ROM		0
