Received: from miranda.axis.se ([193.13.178.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 172UPw-0008UM-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2002 10:59:28 +0100
From: johan.adolfsson@axis.com
Message-ID: <00d201c1f02d$f672d580$bdb270d5@homeip.net>
Reply-To: <johan.adolfsson@axis.com>
To: <linux-mtd@lists.infradead.org>
Cc: "Johan Adolfsson" <johan.adolfsson@axis.com>
Subject: [PATCH/RFC] Create mtdram device at runtime.
Date: Tue, 30 Apr 2002 12:01:13 +0200
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

The following patch moves most of the stuff out from the init_mtdram() 
function into a non static mtdram_init_device() function that can be 
called from other places in the kernel, 
e.g. from a mapping routine to map in a cramfs image in RAM using 
the mtd layer:-)
To prevent the device from being created by init_mtdram using the
configured values, CONFIG_MTDRAM_TOTAL_SIZE should be set to 0
(The help should be updated as well)

A new file: include/linux/mtd/mtdram.h is created as well.

Still some things missing regarding cleanup on exit for modules.

This is a first shot at it and it seems to work for us, but the
API should perhaps be tweaked a little bit more, i.e. providing the
flags and erase size as well.

Does it make enough sense to go into the official version 
(after some tweaking)?

/Johan


diff -u -p -r1.1.1.3 mtdram.c
--- linux/drivers/mtd/devices/mtdram.c 23 Apr 2002 13:18:59 -0000 1.1.1.3
+++ linux/drivers/mtd/devices/mtdram.c 30 Apr 2002 09:28:23 -0000
@@ -118,7 +118,7 @@ static void __exit cleanup_mtdram(void)
   }
 }

-int __init init_mtdram(void)
+int mtdram_init_device(void *mapped_address, unsigned long size, char
*name)
 {
    // Allocate some memory
    mtd_info = (struct mtd_info *)kmalloc(sizeof(struct mtd_info),
GFP_KERNEL);
@@ -128,26 +128,14 @@ int __init init_mtdram(void)
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
@@ -155,11 +143,6 @@ int __init init_mtdram(void)
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
@@ -168,10 +151,42 @@ int __init init_mtdram(void)
    return 0;
 }

+int __init init_mtdram(void)
+{
+  void *addr;
+  int err = 0;
+#if CONFIG_MTDRAM_TOTAL_SIZE > 0
+#if CONFIG_MTDRAM_ABS_POS > 0
+   addr = ioremap(CONFIG_MTDRAM_ABS_POS, MTDRAM_TOTAL_SIZE);
+#else
+   addr = vmalloc(MTDRAM_TOTAL_SIZE);
+#endif
+   if (!addr) {
+     DEBUG(MTD_DEBUG_LEVEL1, "Failed to vmalloc(/ioremap) memory region of
size %ld (ABS_POS:%ld)\n", (long)MTDRAM_TOTAL_SIZE,
(long)CONFIG_MTDRAM_ABS_POS);
+     kfree(mtd_info);
+     mtd_info = NULL;
+     return -ENOMEM;
+   }
+   err = mtdram_init_device(addr, MTDRAM_TOTAL_SIZE, "mtdram test device";
+   if (err)
+   {
+#if CONFIG_MTDRAM_ABS_POS > 0
+     iounmap(mtd_info->priv);
+#else
+     vfree(mtd_info->priv);
+#endif
+   }
+   memset(mtd_info->priv, 0xff, MTDRAM_TOTAL_SIZE);
+#endif /* CONFIG_MTDRAM_TOTAL_SIZE > 0 */
+   return err;
+}
+
+
 module_init(init_mtdram);
 module_exit(cleanup_mtdram);

 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Alexander Larsson <alexl@redhat.com>");
 MODULE_DESCRIPTION("Simulated MTD driver for testing");
+

--- /dev/null Sat Mar 24 05:37:44 2001
+++ linux/include/linux/mtd/mtdram.h Mon Apr 29 18:12:14 2002
@@ -0,0 +1,8 @@
+#ifndef __MTD_MTDRAM_H__
+#define __MTD_MTDRAM_H__
+
+#ifdef __KERNEL__
+int mtdram_init_device(void *mapped_address, unsigned long size, char
*name);
+
+#endif /* __KERNEL__ */
+#endif /* __MTD_MTDRAM_H__ */
