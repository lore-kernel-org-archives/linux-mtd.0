Received: from miranda.axis.se ([193.13.178.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 172Uqa-00006V-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2002 11:27:00 +0100
From: johan.adolfsson@axis.com
Message-ID: <012701c1f031$bc52eee0$bdb270d5@homeip.net>
Reply-To: <johan.adolfsson@axis.com>
To: "David Woodhouse" <dwmw2@infradead.org>, <johan.adolfsson@axis.com>
Cc: <linux-mtd@lists.infradead.org>
References: <00d201c1f02d$f672d580$bdb270d5@homeip.net>  <30704.1020161437@redhat.com>
Subject: Re: [PATCH/RFC] Create mtdram device at runtime. 
Date: Tue, 30 Apr 2002 12:28:14 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

> Looks OK. Can you split the new init_mtdram() into two entirely separate
> functions; one for the CONFIG_MTDRAM_ABS_POS case, one for the vmalloc()
> case?
Here it comes, not tested though...
Beleive I took care of the cleanup as well.

/Johan


diff -u -p -r1.1.1.3 mtdram.c
--- linux/drivers/mtd/devices/mtdram.c 23 Apr 2002 13:18:59 -0000 1.1.1.3
+++ linux/drivers/mtd/devices/mtdram.c 30 Apr 2002 10:24:15 -0000
@@ -108,17 +108,19 @@ static void __exit cleanup_mtdram(void)
 {
   if (mtd_info) {
     del_mtd_device(mtd_info);
+#if CONFIG_MTDRAM_TOTAL_SIZE > 0
     if (mtd_info->priv)
 #if CONFIG_MTDRAM_ABS_POS > 0
       iounmap(mtd_info->priv);
 #else
       vfree(mtd_info->priv);
 #endif
+#endif
     kfree(mtd_info);
   }
 }

-int __init init_mtdram(void)
+int mtdram_init_device(void *mapped_address, unsigned long size, char
*name)
 {
    // Allocate some memory
    mtd_info = (struct mtd_info *)kmalloc(sizeof(struct mtd_info),
GFP_KERNEL);
@@ -128,26 +130,14 @@ int __init init_mtdram(void)
    memset(mtd_info, 0, sizeof(*mtd_info));

    // Setup the MTD structure
-   mtd_info->name = "mtdram test device";
+   mtd_info->name = name;
    mtd_info->type = MTD_RAM;
    mtd_info->flags = MTD_CAP_RAM;
-   mtd_info->size = MTDRAM_TOTAL_SIZE;
+   mtd_info->size = size;
    mtd_info->erasesize = MTDRAM_ERASE_SIZE;
-#if CONFIG_MTDRAM_ABS_POS > 0
-   mtd_info->priv = ioremap(CONFIG_MTDRAM_ABS_POS, MTDRAM_TOTAL_SIZE);
-#else
-   mtd_info->priv = vmalloc(MTDRAM_TOTAL_SIZE);
-#endif
-
-   if (!mtd_info->priv) {
-     DEBUG(MTD_DEBUG_LEVEL1, "Failed to vmalloc(/ioremap) memory region of
size %ld (ABS_POS:%ld)\n", (long)MTDRAM_TOTAL_SIZE,
(long)CONFIG_MTDRAM_ABS_POS);
-     kfree(mtd_info);
-     mtd_info = NULL;
-     return -ENOMEM;
-   }
-   memset(mtd_info->priv, 0xff, MTDRAM_TOTAL_SIZE);
+   mtd_info->priv = mapped_address;

-   mtd_info->module = THIS_MODULE;
+   mtd_info->module = THIS_MODULE;
    mtd_info->erase = ram_erase;
    mtd_info->point = ram_point;
    mtd_info->unpoint = ram_unpoint;
@@ -155,11 +145,6 @@ int __init init_mtdram(void)
    mtd_info->write = ram_write;

    if (add_mtd_device(mtd_info)) {
-#if CONFIG_MTDRAM_ABS_POS > 0
-     iounmap(mtd_info->priv);
-#else
-     vfree(mtd_info->priv);
-#endif
      kfree(mtd_info);
      mtd_info = NULL;
      return -EIO;
@@ -167,6 +152,64 @@ int __init init_mtdram(void)

    return 0;
 }
+
+#if CONFIG_MTDRAM_TOTAL_SIZE > 0
+#if CONFIG_MTDRAM_ABS_POS > 0
+int __init init_mtdram(void)
+{
+  void *addr;
+  int err = 0;
+  addr = ioremap(CONFIG_MTDRAM_ABS_POS, MTDRAM_TOTAL_SIZE);
+  if (!addr) {
+    DEBUG(MTD_DEBUG_LEVEL1,
+          "Failed to ioremap) memory region of size %ld at ABS_POS:%ld\n",
+          (long)MTDRAM_TOTAL_SIZE, (long)CONFIG_MTDRAM_ABS_POS);
+    kfree(mtd_info);
+    mtd_info = NULL;
+    return -ENOMEM;
+  }
+  err = mtdram_init_device(addr, MTDRAM_TOTAL_SIZE, "mtdram test device");
+  if (err)
+  {
+    iounmap(mtd_info->priv);
+  }
+  memset(mtd_info->priv, 0xff, MTDRAM_TOTAL_SIZE);
+  return err;
+}
+
+#else /* CONFIG_MTDRAM_ABS_POS > 0 */
+
+int __init init_mtdram(void)
+{
+  void *addr;
+  int err = 0;
+  addr = vmalloc(MTDRAM_TOTAL_SIZE);
+  if (!addr) {
+    DEBUG(MTD_DEBUG_LEVEL1,
+          "Failed to vmalloc memory region of size %ld\n",
+          (long)MTDRAM_TOTAL_SIZE);
+    kfree(mtd_info);
+    mtd_info = NULL;
+    return -ENOMEM;
+  }
+  err = mtdram_init_device(addr, MTDRAM_TOTAL_SIZE, "mtdram test device");
+  if (err)
+  {
+    vfree(mtd_info->priv);
+  }
+  memset(mtd_info->priv, 0xff, MTDRAM_TOTAL_SIZE);
+
+  return err;
+}
+#endif /* !(CONFIG_MTDRAM_ABS_POS > 0) */
+
+#else /* CONFIG_MTDRAM_TOTAL_SIZE > 0 */
+
+int __init init_mtdram(void)
+{
+  return 0;
+}
+#endif /* !(CONFIG_MTDRAM_TOTAL_SIZE > 0) */

 module_init(init_mtdram);
 module_exit(cleanup_mtdram);
