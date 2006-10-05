Received: from 208.101.48.4-static.reverse.softlayer.com ([208.101.48.4]
	helo=chtn01.999servers.com)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GVWNi-0001pg-Jo
	for linux-mtd@lists.infradead.org; Thu, 05 Oct 2006 17:47:37 +0100
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <17701.15655.736379.98045@vaishnavi.localdomain>
Date: Thu, 5 Oct 2006 22:43:11 +0530
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] NAND: nandsim sector-wise allocation
In-Reply-To: <17701.14724.377713.929566@vaishnavi.localdomain>
References: <17701.14724.377713.929566@vaishnavi.localdomain>
From: Vijay Kumar <vijaykumar@bravegnu.org>
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For page wise allocation, an array of flash page pointers is allocated
during initialization. The flash pages are themselves allocated when a
write occurs to the page. The flash pages are deallocated when they
are erased.

The init, read, prog and erase operations are moved to separate functions,
and for each allocation/mapping type a set of init/read/prog/erase
functions are defined.

Signed-off-by: Vijay Kumar <vijaykumar@bravegnu.org>

Index: linux-2.6-mtd-quilt/drivers/mtd/nand/Kconfig
===================================================================
--- linux-2.6-mtd-quilt.orig/drivers/mtd/nand/Kconfig	2006-10-01 20:35:47.000000000 +0530
+++ linux-2.6-mtd-quilt/drivers/mtd/nand/Kconfig	2006-10-02 18:20:42.000000000 +0530
@@ -250,10 +250,21 @@
 	  The flash data is stored in an image mapped to memory.
 
 config  MTD_NAND_NANDSIM_CHIP_ALLOC
-	bool "Use allocated memory"
+	bool "Allocate entire chip"
 	help
-	  The flash data is stored in allocated memory.
+	  The flash data is stored in allocated memory. The entire
+	  memory to hold the flash data is allocated during 
+	  initialization.
 
+config MTD_NAND_NANDSIM_PAGE_ALLOC
+	bool "Allocate flash pages as required"
+	help
+	  The flash data is stored in allocated memory. The
+	  allocation is done on a per page basis, when data is 
+	  written to the page. Enables simulation of 
+	  higher capacity NAND devices in systems that do
+	  not have as much RAM.
+	  
 endchoice
 
 config MTD_NAND_NANDSIM_ABS_POS
Index: linux-2.6-mtd-quilt/drivers/mtd/nand/nandsim.c
===================================================================
--- linux-2.6-mtd-quilt.orig/drivers/mtd/nand/nandsim.c	2006-10-01 20:39:39.000000000 +0530
+++ linux-2.6-mtd-quilt/drivers/mtd/nand/nandsim.c	2006-10-02 21:40:54.000000000 +0530
@@ -37,7 +37,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/delay.h>
-#ifdef CONFIG_MTD_NAND_NANDSIM_CHIP_MAP
+#if defined(CONFIG_MTD_NAND_NANDSIM_CHIP_MAP)
 #include <asm/io.h>
 #endif
 
@@ -45,8 +45,10 @@
 #define CONFIG_NANDSIM_CHIP_MAP      1
 #elif defined(CONFIG_MTD_NAND_NANDSIM_CHIP_ALLOC)
 #define CONFIG_NANDSIM_CHIP_ALLOC    1
+#elif defined(CONFIG_MTD_NAND_NANDSIM_PAGE_ALLOC)
+#define CONFIG_NANDSIM_PAGE_ALLOC  1
 #else
-#error "One of chip map or chip alloc has to be selected."
+#error "One of chip map, chip alloc or page alloc has to be selected."
 #endif
 
 /* Default simulator parameters values */
@@ -239,6 +241,11 @@
  */
 #define NS_MAX_PREVSTATES 1
 
+union ns_mem_t {
+	u_char *byte;
+	uint16_t *word;
+};
+
 /*
  * The structure which describes all the internal simulator data.
  */
@@ -257,16 +264,15 @@
 	uint16_t stateidx;      /* current state index */
 
 	/* The simulated NAND flash image */
-	union flash_media {
-		u_char *byte;
-		uint16_t    *word;
-	} mem;
+
+#if defined(CONFIG_NANDSIM_CHIP_MAP) || defined(CONFIG_NANDSIM_CHIP_ALLOC)
+	union ns_mem_t mem;
+#elif defined(CONFIG_NANDSIM_PAGE_ALLOC)
+	union ns_mem_t *pages;
+#endif
 
 	/* Internal buffer of page + OOB size bytes */
-	union internal_buffer {
-		u_char *byte;    /* for byte access */
-		uint16_t *word;  /* for 16-bit word access */
-	} buf;
+	union ns_mem_t buf;
 
 	/* NAND flash "geometry" */
 	struct nandsin_geometry {
@@ -354,6 +360,85 @@
 
 static u_char ns_verify_buf[NS_LARGEST_PAGE_SIZE];
 
+#if defined(CONFIG_NANDSIM_CHIP_MAP)
+
+static int
+alloc_map_device(struct nandsim *ns)
+{
+	/* Map / allocate and initialize the flash image */
+	ns->mem.byte = ioremap(CONFIG_NANDSIM_ABS_POS, ns->geom.totszoob);
+	if (!ns->mem.byte) {
+		NS_ERR("alloc_map: failed to map the NAND flash image at address %p\n",
+			(void *)CONFIG_NANDSIM_ABS_POS);
+		return -ENOMEM;
+	}
+	
+	return 0;
+}
+
+static void
+free_unmap_device(struct nandsim *ns)
+{
+	iounmap(ns->mem.byte);
+}
+
+#elif defined(CONFIG_NANDSIM_CHIP_ALLOC)
+
+static int
+alloc_map_device(struct nandsim *ns)
+{
+	ns->mem.byte = vmalloc(ns->geom.totszoob);
+	if (!ns->mem.byte) {
+		NS_ERR("alloc_map: unable to allocate %u bytes for flash image\n",
+			ns->geom.totszoob);
+		return -ENOMEM;
+	}
+	memset(ns->mem.byte, 0xFF, ns->geom.totszoob);
+
+	return 0;
+}
+
+static void
+free_unmap_device(struct nandsim *ns)
+{
+	vfree(ns->mem.byte);
+}
+
+#elif defined(CONFIG_NANDSIM_PAGE_ALLOC)
+
+static int
+alloc_map_device(struct nandsim *ns)
+{
+	int i;
+
+	ns->pages = vmalloc(ns->geom.pgnum * sizeof(union ns_mem_t));
+	if (!ns->pages) {
+		NS_ERR("alloc_map: unable to allocate page array\n");
+		return -ENOMEM;
+	}
+	for (i = 0; i < ns->geom.pgnum; i++) {
+		ns->pages[i].byte = NULL;
+	}
+
+	return 0;
+}
+
+static void
+free_unmap_device(struct nandsim *ns)
+{
+	int i;
+
+	if (ns->pages) {
+		for (i = 0; i < ns->geom.pgnum; i++) {
+			if (ns->pages[i].byte)
+				kfree(ns->pages[i].byte);
+		}
+		vfree(ns->pages);
+	}
+}
+
+#endif
+
 /*
  * Initialize the nandsim structure.
  *
@@ -448,23 +533,8 @@
 	printk("sector address bytes: %u\n",    ns->geom.secaddrbytes);
 	printk("options: %#x\n",                ns->options);
 
-	/* Map / allocate and initialize the flash image */
-#ifdef CONFIG_NANDSIM_CHIP_MAP
-	ns->mem.byte = ioremap(CONFIG_NANDSIM_ABS_POS, ns->geom.totszoob);
-	if (!ns->mem.byte) {
-		NS_ERR("init_nandsim: failed to map the NAND flash image at address %p\n",
-			(void *)CONFIG_NS_ABS_POS);
-		return -ENOMEM;
-	}
-#else
-	ns->mem.byte = vmalloc(ns->geom.totszoob);
-	if (!ns->mem.byte) {
-		NS_ERR("init_nandsim: unable to allocate %u bytes for flash image\n",
-			ns->geom.totszoob);
-		return -ENOMEM;
-	}
-	memset(ns->mem.byte, 0xFF, ns->geom.totszoob);
-#endif
+	if (alloc_map_device(ns) != 0)
+		goto error;
 
 	/* Allocate / initialize the internal buffer */
 	ns->buf.byte = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
@@ -483,11 +553,7 @@
 	return 0;
 
 error:
-#ifdef CONFIG_NANDSIM_CHIP_MAP
-	iounmap(ns->mem.byte);
-#else
-	vfree(ns->mem.byte);
-#endif
+	free_unmap_device(ns);
 
 	return -ENOMEM;
 }
@@ -500,11 +566,7 @@
 {
 	kfree(ns->buf.byte);
 
-#ifdef CONFIG_NANDSIM_CHIP_MAP
-	iounmap(ns->mem.byte);
-#else
-	vfree(ns->mem.byte);
-#endif
+	free_unmap_device(ns);
 
 	return;
 }
@@ -799,6 +861,116 @@
 	return -1;
 }
 
+#if defined(CONFIG_NANDSIM_CHIP_MAP) || defined(CONFIG_NANDSIM_CHIP_ALLOC)
+
+/*
+ * Copy NUM bytes from the specified page/offset to the buffer.
+ */
+static void read_page(struct nandsim *ns, int num)
+{
+	memcpy(ns->buf.byte, ns->mem.byte + NS_RAW_OFFSET(ns) 
+	       + ns->regs.off, num);
+}
+
+/*
+ * Erase the selected sector.
+ */
+static void erase_sector(struct nandsim *ns)
+{
+	memset(ns->mem.byte + NS_RAW_OFFSET(ns), 0xFF, ns->geom.secszoob);
+}
+
+
+/*
+ * Program NUM bytes into the specified page/offset in the flash from
+ * the buffer.
+ *
+ * Returns 0 on success, -1 on failure.
+ */
+static int prog_page(struct nandsim *ns, int num)
+{
+	int i;
+
+	for (i = 0; i < num; i++) {
+		ns->mem.byte[NS_RAW_OFFSET(ns) + ns->regs.off + i] &= ns->buf.byte[i];
+	}
+
+	return 0;
+}
+
+#elif defined(CONFIG_NANDSIM_PAGE_ALLOC)
+
+/*
+ * Returns a pointer to the current page.
+ */
+static inline union ns_mem_t *NS_GET_PAGE(struct nandsim *ns) 
+{
+	return &(ns->pages[ns->regs.row]);
+}
+
+/*
+ * Retuns a pointer to the current byte, within the current page.
+ */
+static inline u_char *NS_PAGE_BYTE_OFF(struct nandsim *ns)
+{
+	return NS_GET_PAGE(ns)->byte + ns->regs.column + ns->regs.off;
+}
+
+static void read_page(struct nandsim *ns, int num)
+{
+	union ns_mem_t *mypage;
+
+	mypage = NS_GET_PAGE(ns);
+	if (mypage->byte == NULL) {
+		NS_DBG("read_page: page %d not allocated\n", ns->regs.row);
+		memset(ns->buf.byte, 0xFF, num);
+	} else {
+		NS_DBG("read_page: page %d allocated, reading from %d\n",
+			ns->regs.row, ns->regs.column + ns->regs.off);
+		memcpy(ns->buf.byte, NS_PAGE_BYTE_OFF(ns), num);
+	}
+}
+
+static void erase_sector(struct nandsim *ns)
+{
+	union ns_mem_t *mypage;
+	int i;
+
+	mypage = NS_GET_PAGE(ns);
+	for (i = 0; i < ns->geom.pgsec; i++) {
+		if (mypage->byte != NULL) {
+			NS_DBG("erase_sector: freeing page %d\n", ns->regs.row+i);
+			kfree(mypage->byte);
+			mypage->byte = NULL;
+		}
+		mypage++;
+	}
+}
+
+static int prog_page(struct nandsim *ns, int num)
+{
+	union ns_mem_t *mypage;
+	u_char *pg_off;
+
+	mypage = NS_GET_PAGE(ns);
+	if (mypage->byte == NULL) {
+		NS_DBG("prog_page: allocating page %d\n", ns->regs.row);
+		mypage->byte = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
+		if (mypage->byte == NULL) {
+			NS_ERR("prog_page: error allocating memory for page %d\n", ns->regs.row);
+			return -1;
+		}
+		memset(mypage->byte, 0xFF, ns->geom.pgszoob);
+	}
+	
+	pg_off = NS_PAGE_BYTE_OFF(ns);
+	memcpy(pg_off, ns->buf.byte, num);
+
+	return 0;
+}
+
+#endif
+
 /*
  * If state has any action bit, perform this action.
  *
@@ -807,7 +979,7 @@
 static int
 do_state_action(struct nandsim *ns, uint32_t action)
 {
-	int i, num;
+	int num;
 	int busdiv = ns->busw == 8 ? 1 : 2;
 
 	action &= ACTION_MASK;
@@ -831,7 +1003,7 @@
 			break;
 		}
 		num = ns->geom.pgszoob - ns->regs.off - ns->regs.column;
-		memcpy(ns->buf.byte, ns->mem.byte + NS_RAW_OFFSET(ns) + ns->regs.off, num);
+		read_page(ns, num);
 
 		NS_DBG("do_state_action: (ACTION_CPY:) copy %d bytes to int buf, raw offset %d\n",
 			num, NS_RAW_OFFSET(ns) + ns->regs.off);
@@ -872,7 +1044,7 @@
 				ns->regs.row, NS_RAW_OFFSET(ns));
 		NS_LOG("erase sector %d\n", ns->regs.row >> (ns->geom.secshift - ns->geom.pgshift));
 
-		memset(ns->mem.byte + NS_RAW_OFFSET(ns), 0xFF, ns->geom.secszoob);
+		erase_sector(ns);
 
 		NS_MDELAY(erase_delay);
 
@@ -895,8 +1067,9 @@
 			return -1;
 		}
 
-		for (i = 0; i < num; i++)
-			ns->mem.byte[NS_RAW_OFFSET(ns) + ns->regs.off + i] &= ns->buf.byte[i];
+		if (prog_page(ns, num) == -1) {
+			return -1;
+		}
 
 		NS_DBG("do_state_action: copy %d bytes from int buf to (%#x, %#x), raw off = %d\n",
 			num, ns->regs.row, ns->regs.column, NS_RAW_OFFSET(ns) + ns->regs.off);
