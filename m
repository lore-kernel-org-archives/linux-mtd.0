Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15n6aC-0002IW-00
	for <linux-mtd@lists.infradead.org>; Fri, 28 Sep 2001 23:58:12 +0100
Message-ID: <20010928160711.A9289@recycle.lbl.gov>
Date: Fri, 28 Sep 2001 16:07:11 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: problems with 28F320B: resolved?
References: <20010925142549.A22356@recycle.lbl.gov> <25195.1001453328@redhat.com> <20010925143742.A22632@recycle.lbl.gov> <25445.1001454134@redhat.com> <20010925150341.A22897@recycle.lbl.gov> <26239.1001455701@redhat.com> <20010925153929.A24347@recycle.lbl.gov> <20010927163205.A4845@recycle.lbl.gov> <24249.1001660788@redhat.com> <20010928123452.A6016@recycle.lbl.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010928123452.A6016@recycle.lbl.gov>; from Larry Doolittle on Fri, Sep 28, 2001 at 12:34:52PM -0700
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David -

Hah!  I can prove that I can read, write, and erase a sector in my
28F320B3 Flash chip!

This patch is pretty much similar to what I sent you last night.
In particular, I haven't heard back from Nico on the sa1100-flash
change, and I kept the quick Intel hack instead of adding another
field.  I don't think the override I put in to keep non-CFI chipos
from using block write is necessary, it looks like that happens
anyway in cfi_intelext_setup() because cfi->cfiq->BufWriteTimeoutTyp
is not set.

Unless you want to muck around with adding another field yourself
(probably reclaiming space from the unused InterfaceDesc field),
this looks good enough to put in CVS.  Read through this patch,
I found a couple of other trivial improvements that should go in.

     - Larry

diff -urN --exclude=Repository --exclude=Root --exclude=Entries --exclude=Rules.make --exclude=GNUmakefile /home/ldoolitt/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0001.c linux-2.4.9-ac9-rmk1-np1-lrd1/drivers/mtd/chips/cfi_cmdset_0001.c
--- /home/ldoolitt/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0001.c	Sun Sep  2 11:53:17 2001
+++ linux-2.4.9-ac9-rmk1-np1-lrd1/drivers/mtd/chips/cfi_cmdset_0001.c	Fri Sep 28 13:28:55 2001
@@ -889,7 +889,9 @@
 	}
 
 	/* Write buffer is worth it only if more than one word to write... */
-	while(len > CFIDEV_BUSWIDTH) {
+	/* Assume only CFI chips have this feature, until otherwise specified.
+	 * The non-CFI chips this intends to support are the Intel 28FxxxB3 series. */
+	while(cfi->cfi_mode && len > CFIDEV_BUSWIDTH) {
 		/* We must not cross write block boundaries */
 		int size = wbufsize - (ofs & (wbufsize-1));
 
diff -urN --exclude=Repository --exclude=Root --exclude=Entries --exclude=Rules.make --exclude=GNUmakefile /home/ldoolitt/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0002.c linux-2.4.9-ac9-rmk1-np1-lrd1/drivers/mtd/chips/cfi_cmdset_0002.c
--- /home/ldoolitt/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0002.c	Sun Sep  2 11:53:17 2001
+++ linux-2.4.9-ac9-rmk1-np1-lrd1/drivers/mtd/chips/cfi_cmdset_0002.c	Fri Sep 28 13:17:53 2001
@@ -148,7 +148,7 @@
 	unsigned long devsize = (1<<cfi->cfiq->DevSize) * cfi->interleave;
 
 	mtd = kmalloc(sizeof(*mtd), GFP_KERNEL);
-	printk("number of %s chips: %d\n", (cfi->cfi_mode)?"JEDEC":"CFI",cfi->numchips);
+	printk("number of %s chips: %d\n", (cfi->cfi_mode)?"CFI":"JEDEC",cfi->numchips);
 
 	if (!mtd) {
 	  printk("Failed to allocate memory for MTD device\n");
diff -urN --exclude=Repository --exclude=Root --exclude=Entries --exclude=Rules.make --exclude=GNUmakefile /home/ldoolitt/cvs/mtd/drivers/mtd/chips/jedec_probe.c linux-2.4.9-ac9-rmk1-np1-lrd1/drivers/mtd/chips/jedec_probe.c
--- /home/ldoolitt/cvs/mtd/drivers/mtd/chips/jedec_probe.c	Wed Sep 19 14:27:38 2001
+++ linux-2.4.9-ac9-rmk1-np1-lrd1/drivers/mtd/chips/jedec_probe.c	Fri Sep 28 13:21:47 2001
@@ -25,6 +25,7 @@
 #define MANUFACTURER_ATMEL	0x001f
 #define MANUFACTURER_ST		0x0020
 #define MANUFACTURER_SST	0x00BF
+#define MANUFACTURER_INTEL	0x0089
 #define MANUFACTURER_TOSHIBA	0x0098
 
 /* AMD */
@@ -52,6 +53,14 @@
 #define SST39LF800	0x2781
 #define SST39LF160	0x2782
 
+/* Intel */
+#define TE28F160B3T	0x8890
+#define TE28F160B3B	0x8891
+#define TE28F320B3T	0x8896
+#define TE28F320B3B	0x8897
+#define TE28F640B3T	0x8898
+#define TE28F640B3B	0x8899
+
 /* Toshiba */
 #define TC58FVT160	0x00C2
 #define TC58FVB160	0x0043
@@ -248,6 +257,24 @@
                           ERASEINFO(0x08000,2),
 			  ERASEINFO(0x02000,8)
                 }
+	}, {
+		mfr_id: MANUFACTURER_INTEL,
+		dev_id: TE28F320B3T,
+		name: "Intel TE28F320B3-T",
+		DevSize: SIZE_4MiB,
+		NumEraseRegions: 2,
+		regions: {ERASEINFO(0x10000,63),
+			  ERASEINFO(0x02000,8)
+		}
+	}, {
+		mfr_id: MANUFACTURER_INTEL,
+		dev_id: TE28F320B3B,
+		name: "Intel TE28F320B3-B",
+		DevSize: SIZE_4MiB,
+		NumEraseRegions: 2,
+		regions: {ERASEINFO(0x02000,8),
+			  ERASEINFO(0x10000,63)
+		}
 	} 
 };
 
@@ -269,15 +296,16 @@
 
 	num_erase_regions = jedec_table[index].NumEraseRegions;
 	
-	p_cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
+	p_cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * sizeof(ulong), GFP_KERNEL);
 	if (!p_cfi->cfiq) {
 		//xx printk(KERN_WARNING "%s: kmalloc failed for CFI ident structure\n", map->name);
 		return 0;
 	}
 
+	/* all fields default to zero, _especially_ cfi_mode, where zero represents "fake CFI" */
 	memset(p_cfi->cfiq,0,sizeof(struct cfi_ident));	
 	
-	p_cfi->cfiq->P_ID = P_ID_AMD_STD;
+	p_cfi->cfiq->P_ID = (p_cfi->mfr == MANUFACTURER_INTEL) ? P_ID_INTEL_STD : P_ID_AMD_STD;
 	p_cfi->cfiq->NumEraseRegions = jedec_table[index].NumEraseRegions;
 	p_cfi->cfiq->DevSize = jedec_table[index].DevSize;
 
diff -urN --exclude=Repository --exclude=Root --exclude=Entries --exclude=Rules.make --exclude=GNUmakefile /home/ldoolitt/cvs/mtd/drivers/mtd/maps/sa1100-flash.c linux-2.4.9-ac9-rmk1-np1-lrd1/drivers/mtd/maps/sa1100-flash.c
--- /home/ldoolitt/cvs/mtd/drivers/mtd/maps/sa1100-flash.c	Fri Sep 21 09:10:59 2001
+++ linux-2.4.9-ac9-rmk1-np1-lrd1/drivers/mtd/maps/sa1100-flash.c	Thu Sep 27 15:56:32 2001
@@ -528,6 +528,27 @@
 
 #endif
 
+#ifdef CONFIG_SA1100_NANOENGINE
+/* nanoEngine has one 28F320B3B Flash part in bank 0: */
+static unsigned long nanoengine_max_flash_size = 0x00400000;
+static struct mtd_partition nanoengine_partitions[] = {
+	{
+		name: "nanoEngine boot firmware and parameter table",
+		size: 0x00010000,  /* 32K */
+		offset: 0,
+		mask_flags: MTD_WRITEABLE  /* force read-only */
+	},{
+		name: "kernel/initrd reserved",
+		size: 0x002f0000,
+		offset: 0x10000
+	},{
+		name: "experimental filesystem allocation",
+		size: 0x00100000,
+		offset: 0x300000
+	}
+};
+#endif
+
 #define NB_OF(x)  (sizeof(x)/sizeof(x[0]))
 
 
@@ -641,6 +662,13 @@
 		sa1100_map.size = flexanet_max_flash_size;
 	}
 #endif
+#ifdef CONFIG_SA1100_NANOENGINE
+	if (machine_is_nanoengine()) {
+		parts = nanoengine_partitions;
+		nb_parts = NB_OF(nanoengine_partitions);
+		sa1100_map.size = nanoengine_max_flash_size;
+	}
+#endif
 #ifdef CONFIG_SA1100_STORK
 	if (machine_is_stork()) {
 		parts = stork_partitions;
@@ -654,7 +682,9 @@
 	 * specific machine settings might have been set above.
 	 */
 	printk(KERN_NOTICE "SA1100 flash: probing %d-bit flash bus\n", sa1100_map.buswidth*8);
-	mymtd = do_map_probe("cfi_probe", &sa1100_map);
+	mymtd = do_map_probe("jedec_probe", &sa1100_map);
+	if (!mymtd)
+		mymtd = do_map_probe("cfi_probe", &sa1100_map);
 	if (!mymtd)
 		return -ENXIO;
 	mymtd->module = THIS_MODULE;
diff -urN --exclude=Repository --exclude=Root --exclude=Entries --exclude=Rules.make --exclude=GNUmakefile /home/ldoolitt/cvs/mtd/drivers/mtd/mtdblock.c linux-2.4.9-ac9-rmk1-np1-lrd1/drivers/mtd/mtdblock.c
--- /home/ldoolitt/cvs/mtd/drivers/mtd/mtdblock.c	Sun Sep 23 14:16:32 2001
+++ linux-2.4.9-ac9-rmk1-np1-lrd1/drivers/mtd/mtdblock.c	Thu Sep 27 16:05:22 2001
@@ -540,8 +540,11 @@
 	switch (cmd) {
 	case BLKGETSIZE:   /* Return device size */
 		return put_user((mtdblk->mtd->size >> 9), (long *) arg);
+
+#ifndef CONFIG_ARM
 	case BLKGETSIZE64:
 		return put_user((u64)mtdblk->mtd->size, (u64 *)arg);
+#endif
 		
 	case BLKFLSBUF:
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
