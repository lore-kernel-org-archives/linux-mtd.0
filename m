Received: from 208.101.48.4-static.reverse.softlayer.com ([208.101.48.4]
	helo=chtn01.999servers.com)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GWbBO-0002Wj-33
	for linux-mtd@lists.infradead.org; Sun, 08 Oct 2006 17:07:19 +0100
Received: from [125.22.72.211] (helo=vaishnavi.localdomain.localdomain)
	by chtn01.999servers.com with esmtpa (Exim 4.52) id 1GWbAi-0000LA-TG
	for linux-mtd@lists.infradead.org; Sun, 08 Oct 2006 11:06:37 -0500
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <17705.10271.142759.155513@vaishnavi.localdomain>
Date: Sun, 8 Oct 2006 22:02:31 +0530
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] NAND: updated nandsim page-wise allocation
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

Signed-off-by: Vijay Kumar <vijaykumar@bravegnu.org>

Index: linux-2.6-mtd-quilt/drivers/mtd/nand/nandsim.c
===================================================================
--- linux-2.6-mtd-quilt.orig/drivers/mtd/nand/nandsim.c	2006-10-07 21:54:49.000000000 +0530
+++ linux-2.6-mtd-quilt/drivers/mtd/nand/nandsim.c	2006-10-08 21:27:55.000000000 +0530
@@ -227,6 +227,14 @@
 #define NS_MAX_PREVSTATES 1
 
 /*
+ * A union to represent flash memory contents and flash buffer.
+ */
+union ns_mem {
+	u_char *byte;    /* for byte access */
+	uint16_t *word;  /* for 16-bit word access */
+};
+
+/*
  * The structure which describes all the internal simulator data.
  */
 struct nandsim {
@@ -243,17 +251,11 @@
 	uint16_t npstates;      /* number of previous states saved */
 	uint16_t stateidx;      /* current state index */
 
-	/* The simulated NAND flash image */
-	union flash_media {
-		u_char *byte;
-		uint16_t    *word;
-	} mem;
+	/* The simulated NAND flash pages array */
+	union ns_mem *pages;
 
 	/* Internal buffer of page + OOB size bytes */
-	union internal_buffer {
-		u_char *byte;    /* for byte access */
-		uint16_t *word;  /* for 16-bit word access */
-	} buf;
+	union ns_mem buf;
 
 	/* NAND flash "geometry" */
 	struct nandsin_geometry {
@@ -341,6 +343,46 @@
 
 static u_char ns_verify_buf[NS_LARGEST_PAGE_SIZE];
 
+/* 
+ * Allocate array of page pointers and initialize the array to NULL
+ * pointers.
+ *
+ * RETURNS: 0 if success, -ENOMEM if memory alloc fails.
+ */
+static int
+alloc_device(struct nandsim *ns)
+{
+	int i;
+
+	ns->pages = vmalloc(ns->geom.pgnum * sizeof(union ns_mem));
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
+/*
+ * Free any allocated pages, and free the array of page pointers.
+ */
+static void
+free_device(struct nandsim *ns)
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
 /*
  * Initialize the nandsim structure.
  *
@@ -435,14 +477,8 @@
 	printk("sector address bytes: %u\n",    ns->geom.secaddrbytes);
 	printk("options: %#x\n",                ns->options);
 
-	/* Map / allocate and initialize the flash image */
-	ns->mem.byte = vmalloc(ns->geom.totszoob);
-	if (!ns->mem.byte) {
-		NS_ERR("init_nandsim: unable to allocate %u bytes for flash image\n",
-			ns->geom.totszoob);
-		return -ENOMEM;
-	}
-	memset(ns->mem.byte, 0xFF, ns->geom.totszoob);
+	if (alloc_device(ns) != 0)
+		goto error;
 
 	/* Allocate / initialize the internal buffer */
 	ns->buf.byte = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
@@ -461,7 +497,7 @@
 	return 0;
 
 error:
-	vfree(ns->mem.byte);
+	free_device(ns);
 
 	return -ENOMEM;
 }
@@ -473,7 +509,7 @@
 free_nandsim(struct nandsim *ns)
 {
 	kfree(ns->buf.byte);
-	vfree(ns->mem.byte);
+	free_device(ns);
 
 	return;
 }
@@ -769,6 +805,84 @@
 }
 
 /*
+ * Returns a pointer to the current page.
+ */
+static inline union ns_mem *NS_GET_PAGE(struct nandsim *ns) 
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
+/*
+ * Fill the NAND buffer with data read from the specified page.
+ */
+static void read_page(struct nandsim *ns, int num)
+{
+	union ns_mem *mypage;
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
+/*
+ * Erase all pages in the specified sector.
+ */
+static void erase_sector(struct nandsim *ns)
+{
+	union ns_mem *mypage;
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
+/*
+ * Program the specified page with the contents from the NAND buffer.
+ */
+static int prog_page(struct nandsim *ns, int num)
+{
+	union ns_mem *mypage;
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
+/*
  * If state has any action bit, perform this action.
  *
  * RETURNS: 0 if success, -1 if error.
@@ -776,7 +890,7 @@
 static int
 do_state_action(struct nandsim *ns, uint32_t action)
 {
-	int i, num;
+	int num;
 	int busdiv = ns->busw == 8 ? 1 : 2;
 
 	action &= ACTION_MASK;
@@ -800,7 +914,7 @@
 			break;
 		}
 		num = ns->geom.pgszoob - ns->regs.off - ns->regs.column;
-		memcpy(ns->buf.byte, ns->mem.byte + NS_RAW_OFFSET(ns) + ns->regs.off, num);
+		read_page(ns, num);
 
 		NS_DBG("do_state_action: (ACTION_CPY:) copy %d bytes to int buf, raw offset %d\n",
 			num, NS_RAW_OFFSET(ns) + ns->regs.off);
@@ -841,7 +955,7 @@
 				ns->regs.row, NS_RAW_OFFSET(ns));
 		NS_LOG("erase sector %d\n", ns->regs.row >> (ns->geom.secshift - ns->geom.pgshift));
 
-		memset(ns->mem.byte + NS_RAW_OFFSET(ns), 0xFF, ns->geom.secszoob);
+		erase_sector(ns);
 
 		NS_MDELAY(erase_delay);
 
@@ -864,8 +978,8 @@
 			return -1;
 		}
 
-		for (i = 0; i < num; i++)
-			ns->mem.byte[NS_RAW_OFFSET(ns) + ns->regs.off + i] &= ns->buf.byte[i];
+		if (prog_page(ns, num) == -1)
+			return -1;
 
 		NS_DBG("do_state_action: copy %d bytes from int buf to (%#x, %#x), raw off = %d\n",
 			num, ns->regs.row, ns->regs.column, NS_RAW_OFFSET(ns) + ns->regs.off);
