Received: from web43145.mail.sp1.yahoo.com ([216.252.121.75])
	by bombadil.infradead.org with smtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqalZ-0008C7-CB
	for linux-mtd@lists.infradead.org; Fri, 09 Nov 2007 15:47:56 -0500
Date: Fri, 9 Nov 2007 12:47:43 -0800 (PST)
From: Justin Treon <justin_treon@yahoo.com>
Subject: [RFC][PATCH 1/1] MTD: Unlocking all Intel flash that is locked on
	power up. Version 2
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <983132.63418.qm@web43145.mail.sp1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding the ability to unlocking all Intel flash that is locked on power up.
Currently only Intel P30 flash is unlocked.  

The option to enable/disable automatically unlock the flash has been added since
some have voiced concerns that this does not need to be done on J3 flash and reduces
security.

Signed-off-by: Justin Treon <justin_treon@yahoo.com>
----
diff -r c105f44cf785 drivers/mtd/chips/Kconfig
--- a/drivers/mtd/chips/Kconfig	Thu Nov 08 15:36:57 2007 -0800
+++ b/drivers/mtd/chips/Kconfig	Fri Nov 09 12:44:59 2007 -0800
@@ -186,6 +186,15 @@ config MTD_CFI_INTELEXT
 	  provides support for one of those command sets, used on Intel
 	  StrataFlash and other parts.
 
+config MTD_CFI_UNLOCK_POWERUP_LOCK
+	bool "Automatically unlock partitions that are locked on power-up"
+	depends on MTD_CFI_INTELEXT
+	default y if MTD_CFI_INTELEXT
+	help
+	  Automatically unlock blocks on Intel Strata Flash parts that are
+	  mapped in MTD as writable.  This is neither required nor recommended
+	  for Intel J3 Series Strata Flash.
+
 config MTD_CFI_AMDSTD
 	tristate "Support for AMD/Fujitsu flash chips"
 	depends on MTD_GEN_PROBE
diff -r c105f44cf785 drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	Thu Nov 08 15:36:57 2007 -0800
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	Fri Nov 09 12:26:03 2007 -0800
@@ -244,7 +244,7 @@ static struct cfi_fixup cfi_fixup_table[
 #endif
 	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct, NULL },
 	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb, NULL },
-	{ MANUFACTURER_INTEL, 0x891c,	      fixup_use_powerup_lock, NULL, },
+	{ MANUFACTURER_INTEL, CFI_ID_ANY,     fixup_use_powerup_lock, NULL, },
 	{ 0, 0, NULL, NULL }
 };
 
diff -r c105f44cf785 drivers/mtd/mtdcore.c
--- a/drivers/mtd/mtdcore.c	Thu Nov 08 15:36:57 2007 -0800
+++ b/drivers/mtd/mtdcore.c	Fri Nov 09 10:54:45 2007 -0800
@@ -57,15 +57,17 @@ int add_mtd_device(struct mtd_info *mtd)
 			mtd->index = i;
 			mtd->usecount = 0;
 
+#ifdef CONFIG_MTD_CFI_UNLOCK_POWERUP_LOCK
 			/* Some chips always power up locked. Unlock them now */
 			if ((mtd->flags & MTD_WRITEABLE)
-			    && (mtd->flags & MTD_STUPID_LOCK) && mtd->unlock) {
+			    && (mtd->flags & MTD_POWERUP_LOCK) && mtd->unlock) {
 				if (mtd->unlock(mtd, 0, mtd->size))
 					printk(KERN_WARNING
 					       "%s: unlock failed, "
 					       "writes may not work\n",
 					       mtd->name);
 			}
+#endif /* CONFIG_MTD_CFI_UNLOCK_POWERUP_LOCK */
 
 			DEBUG(0, "mtd: Giving out device %d to %s\n",i, mtd->name);
 			/* No need to get a refcount on the module containing
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

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
