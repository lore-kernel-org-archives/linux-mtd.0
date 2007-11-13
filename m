Received: from web43138.mail.sp1.yahoo.com ([216.252.121.68])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Is5I0-0004Nt-F6
	for linux-mtd@lists.infradead.org; Tue, 13 Nov 2007 18:35:36 -0500
Date: Tue, 13 Nov 2007 15:35:18 -0800 (PST)
From: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on
	power up
To: Nicolas Pitre <nico@cam.org>, Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <alpine.LFD.0.9999.0711131356420.21255@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <230770.87331.qm@web43138.mail.sp1.yahoo.com>
Cc: linux-mtd@lists.infradead.org, Justin Treon <justin_treon@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > 
> > Right, Justin is just extending that functionality which today only
> > kicks in for one size of one chip family.
> 
> It probably should be enabled for all flash models which always power up 
> locked.
> 
> > So to clarify the disagreement you feel the default behavior should be
> > to have your writeable partitions default to locked, we feel the
> > default behavior should be to have your writeable partitions default
> > to unlocked.  Does that sum it up the core philshopical disagreement
> > here?
> 
> Yes, although I don't feel so strongly about that remaining point.  I 
> initially thought there was no way to prevent the auto-unlock besides 
> marking the partition read-only as well.
> 
> > Actually there is a bit in struct cfi_pri_intelext.FeatureSupport&32
> > that I _think_ tells us this is one of the flex lock parts that does
> > the nonvolatile locking.  I'll have to confirm that.  That could be
> > used in the function fixup_use_powerup_lock() in cfi_cmdset_0001.c to
> > be more intelligent than just unlocking everything.  Would that be
> > better?
> 
> Probably.  At least limiting the fixup only to the affected flash models 
> (adding entries as necessary) is way better than the unconditional 
> unlock for everything.
> 

I think the following patch should satisfy everyones concerns.  It has not been
tested.  

1. I have added a kernel config option to enable/disable automatic unlocking.  
2. The automatic unlocking can be disabled for a particular partition in the map or
the command line.
For the bit mask in the map it should look like:
.mask_flags	= MTD_POWERUP_LOCK,
   b. mtd_parts=0x80000(bootloader)lk
3. This will only unlock parts with instant individual block locking.


diff -r c105f44cf785 drivers/mtd/chips/Kconfig
--- a/drivers/mtd/chips/Kconfig	Thu Nov 08 15:36:57 2007 -0800
+++ b/drivers/mtd/chips/Kconfig	Tue Nov 13 14:11:41 2007 -0800
@@ -186,6 +186,15 @@ config MTD_CFI_INTELEXT
 	  provides support for one of those command sets, used on Intel
 	  StrataFlash and other parts.
 
+config MTD_CFI_UNLOCK_POWERUP_LOCK
+	bool "Automatically unlock partitions that are locked on power-up"
+	depends on MTD_CFI_INTELEXT
+	default y if MTD_CFI_INTELEXT
+	help
+	  Automatically unlock blocks on Intel Strata Flash parts that are
+	  mapped in MTD as writable.  This will not unlock J3 Strata Flash
+	  parts.
+
 config MTD_CFI_AMDSTD
 	tristate "Support for AMD/Fujitsu flash chips"
 	depends on MTD_GEN_PROBE
diff -r c105f44cf785 drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	Thu Nov 08 15:36:57 2007 -0800
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	Tue Nov 13 14:06:09 2007 -0800
@@ -228,8 +228,14 @@ static void fixup_use_write_buffers(stru
  */
 static void fixup_use_powerup_lock(struct mtd_info *mtd, void *param)
 {
-	printk(KERN_INFO "Using auto-unlock on power-up/resume\n" );
-	mtd->flags |= MTD_STUPID_LOCK;
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
+
+	if (cfip->FeatureSupport&32) {
+ 		printk(KERN_INFO "Using auto-unlock on power-up/resume\n" );
+		mtd->flags |= MTD_POWERUP_LOCK;
+	}
 }
 
 static struct cfi_fixup cfi_fixup_table[] = {
@@ -244,7 +250,9 @@ static struct cfi_fixup cfi_fixup_table[
 #endif
 	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct, NULL },
 	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb, NULL },
-	{ MANUFACTURER_INTEL, 0x891c,	      fixup_use_powerup_lock, NULL, },
+#ifdef CONFIG_MTD_CFI_UNLOCK_POWERUP_LOCK
+	{ MANUFACTURER_INTEL, CFI_ID_ANY,     fixup_use_powerup_lock, NULL, },
+#endif /* CONFIG_MTD_CFI_UNLOCK_POWERUP_LOCK */
 	{ 0, 0, NULL, NULL }
 };
 
@@ -2273,7 +2281,7 @@ static int cfi_intelext_suspend(struct m
 	struct flchip *chip;
 	int ret = 0;
 
-	if ((mtd->flags & MTD_STUPID_LOCK)
+	if ((mtd->flags & MTD_POWERUP_LOCK)
 	    && extp && (extp->FeatureSupport & (1 << 5)))
 		cfi_intelext_save_locks(mtd);
 
@@ -2384,7 +2392,7 @@ static void cfi_intelext_resume(struct m
 		spin_unlock(chip->mutex);
 	}
 
-	if ((mtd->flags & MTD_STUPID_LOCK)
+	if ((mtd->flags & MTD_POWERUP_LOCK)
 	    && extp && (extp->FeatureSupport & (1 << 5)))
 		cfi_intelext_restore_locks(mtd);
 }
diff -r c105f44cf785 drivers/mtd/cmdlinepart.c
--- a/drivers/mtd/cmdlinepart.c	Thu Nov 08 15:36:57 2007 -0800
+++ b/drivers/mtd/cmdlinepart.c	Tue Nov 13 15:17:26 2007 -0800
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
+++ b/drivers/mtd/mtdcore.c	Tue Nov 13 13:47:31 2007 -0800
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





      ____________________________________________________________________________________
Get easy, one-click access to your favorites. 
Make Yahoo! your homepage.
http://www.yahoo.com/r/hs 
