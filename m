Received: from miranda.axis.se ([193.13.178.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 174eB6-0002nM-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 May 2002 09:49:04 +0100
Message-ID: <137401c1f4da$debb0190$0b070d0a@axis.se>
From: "Johan Adolfsson" <johan.adolfsson@axis.com>
To: "David Woodhouse" <dwmw2@infradead.org>, <johan.adolfsson@axis.com>
Cc: <linux-mtd@lists.infradead.org>
References: <01ff01c1f049$b2a19fa0$bdb270d5@homeip.net>  <012701c1f031$bc52eee0$bdb270d5@homeip.net> <00d201c1f02d$f672d580$bdb270d5@homeip.net> <30704.1020161437@redhat.com> <18096.1020169313@redhat.com>  <4685.1020183684@redhat.com>
Subject: Re: [PATCH/RFC] Create mtdram device at runtime. 
Date: Mon, 6 May 2002 10:49:01 +0200
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

This time I think I got it right...
The caller of mtdram_init_device() is responsible for allocating the
mtd_info struct and to provide the memoryarea.
The caller is also repsonsible for freeing and deleting the stuff
if needed.
cleanup_mtdram() handles that for the non dynamic case, but otherwise
it's up to the caller, no helper function is provided (nor needed really).

/Johan

---

diff -u -p -r1.1.1.3 mtdram.c
--- linux/drivers/mtd/devices/mtdram.c 23 Apr 2002 13:18:59 -0000 1.1.1.3
+++ linux/drivers/mtd/devices/mtdram.c 6 May 2002 08:31:52 -0000
@@ -108,65 +108,119 @@ static void __exit cleanup_mtdram(void)
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

+int mtdram_init_device(struct mtd_info *mtd, void *mapped_address,
+                       unsigned long size, char *name)
+{
+   memset(mtd, 0, sizeof(*mtd));
+
+   /* Setup the MTD structure */
+   mtd->name = name;
+   mtd->type = MTD_RAM;
+   mtd->flags = MTD_CAP_RAM;
+   mtd->size = size;
+   mtd->erasesize = MTDRAM_ERASE_SIZE;
+   mtd->priv = mapped_address;
+
+   mtd->module = THIS_MODULE;
+   mtd->erase = ram_erase;
+   mtd->point = ram_point;
+   mtd->unpoint = ram_unpoint;
+   mtd->read = ram_read;
+   mtd->write = ram_write;
+
+   if (add_mtd_device(mtd)) {
+     return -EIO;
+   }
+
+   return 0;
+}
+
+#if CONFIG_MTDRAM_TOTAL_SIZE > 0
+#if CONFIG_MTDRAM_ABS_POS > 0
 int __init init_mtdram(void)
 {
-   // Allocate some memory
-   mtd_info = (struct mtd_info *)kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
+  void *addr;
+  int err;
+  /* Allocate some memory */
+   mtd_info = (struct mtd_info *)kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
    if (!mtd_info)
-      return -ENOMEM;
+     return -ENOMEM;

-   memset(mtd_info, 0, sizeof(*mtd_info));
+  addr = ioremap(CONFIG_MTDRAM_ABS_POS, MTDRAM_TOTAL_SIZE);
+  if (!addr) {
+    DEBUG(MTD_DEBUG_LEVEL1,
+          "Failed to ioremap) memory region of size %ld at ABS_POS:%ld\n",
+          (long)MTDRAM_TOTAL_SIZE, (long)CONFIG_MTDRAM_ABS_POS);
+    kfree(mtd_info);
+    mtd_info = NULL;
+    return -ENOMEM;
+  }
+  err = mtdram_init_device(mtd_info, addr,
+                           MTDRAM_TOTAL_SIZE, "mtdram test device");
+  if (err)
+  {
+    iounmap(addr);
+    kfree(mtd_info);
+    mtd_info = NULL;
+    return err;
+  }
+  memset(mtd_info->priv, 0xff, MTDRAM_TOTAL_SIZE);
+  return err;
+}

-   // Setup the MTD structure
-   mtd_info->name = "mtdram test device";
-   mtd_info->type = MTD_RAM;
-   mtd_info->flags = MTD_CAP_RAM;
-   mtd_info->size = MTDRAM_TOTAL_SIZE;
-   mtd_info->erasesize = MTDRAM_ERASE_SIZE;
-#if CONFIG_MTDRAM_ABS_POS > 0
-   mtd_info->priv = ioremap(CONFIG_MTDRAM_ABS_POS, MTDRAM_TOTAL_SIZE);
-#else
-   mtd_info->priv = vmalloc(MTDRAM_TOTAL_SIZE);
-#endif
+#else /* CONFIG_MTDRAM_ABS_POS > 0 */

-   if (!mtd_info->priv) {
-     DEBUG(MTD_DEBUG_LEVEL1, "Failed to vmalloc(/ioremap) memory region of size %ld (ABS_POS:%ld)\n",
(long)MTDRAM_TOTAL_SIZE, (long)CONFIG_MTDRAM_ABS_POS);
-     kfree(mtd_info);
-     mtd_info = NULL;
+int __init init_mtdram(void)
+{
+  void *addr;
+  int err;
+  /* Allocate some memory */
+   mtd_info = (struct mtd_info *)kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
+   if (!mtd_info)
      return -ENOMEM;
-   }
-   memset(mtd_info->priv, 0xff, MTDRAM_TOTAL_SIZE);

-   mtd_info->module = THIS_MODULE;
-   mtd_info->erase = ram_erase;
-   mtd_info->point = ram_point;
-   mtd_info->unpoint = ram_unpoint;
-   mtd_info->read = ram_read;
-   mtd_info->write = ram_write;
+  addr = vmalloc(MTDRAM_TOTAL_SIZE);
+  if (!addr) {
+    DEBUG(MTD_DEBUG_LEVEL1,
+          "Failed to vmalloc memory region of size %ld\n",
+          (long)MTDRAM_TOTAL_SIZE);
+    kfree(mtd_info);
+    mtd_info = NULL;
+    return -ENOMEM;
+  }
+  err = mtdram_init_device(mtd_info, addr,
+                           MTDRAM_TOTAL_SIZE, "mtdram test device");
+  if (err)
+  {
+    vfree(addr);
+    kfree(mtd_info);
+    mtd_info = NULL;
+    return err;
+  }
+  memset(mtd_info->priv, 0xff, MTDRAM_TOTAL_SIZE);
+  return err;
+}
+#endif /* !(CONFIG_MTDRAM_ABS_POS > 0) */
+
+#else /* CONFIG_MTDRAM_TOTAL_SIZE > 0 */

-   if (add_mtd_device(mtd_info)) {
-#if CONFIG_MTDRAM_ABS_POS > 0
-     iounmap(mtd_info->priv);
-#else
-     vfree(mtd_info->priv);
-#endif
-     kfree(mtd_info);
-     mtd_info = NULL;
-     return -EIO;
-   }
-
-   return 0;
+int __init init_mtdram(void)
+{
+  return 0;
 }
+#endif /* !(CONFIG_MTDRAM_TOTAL_SIZE > 0) */

 module_init(init_mtdram);
 module_exit(cleanup_mtdram);
--- /dev/null Sat Mar 24 05:37:44 2001
+++ linux/include/linux/mtd/mtdram.h Mon May  6 10:02:26 2002
@@ -0,0 +1,10 @@
+#ifndef __MTD_MTDRAM_H__
+#define __MTD_MTDRAM_H__
+
+#ifdef __KERNEL__
+#include <linux/mtd/mtd.h>
+int mtdram_init_device(struct mtd_info *mtd, void *mapped_address,
+                       unsigned long size, char *name);
+
+#endif /* __KERNEL__ */
+#endif /* __MTD_MTDRAM_H__ */

--- linux/Documentation/Configure.help  23 Apr 2002 15:46:44 -0000      1.46
+++ linux/Documentation/Configure.help  6 May 2002 08:40:34 -0000
@@ -12639,9 +12639,9 @@ CONFIG_MTD_SLRAM

 Debugging RAM test driver
 CONFIG_MTD_MTDRAM
-  This enables a test MTD device driver which uses vmalloc() to
-  provide storage.  You probably want to say 'N' unless you're
-  testing stuff.
+  This enables a test MTD device driver which uses vmalloc()
+  or an absolute address to provide storage.
+  You probably want to say 'N' unless you're testing stuff.

 MTDRAM erase block size in KB
 CONFIG_MTDRAM_ERASE_SIZE
@@ -12656,6 +12656,8 @@ CONFIG_MTDRAM_TOTAL_SIZE
   emulated by the MTDRAM driver.  If the MTDRAM driver is built
   as a module, it is also possible to specify this as a parameter when
   loading the module.
+  If you want to set the size and position at runtime, set to 0,
+  in that case set the ABS_POS parameter to 0 as well.

 SRAM Hexadecimal Absolute position or 0
 CONFIG_MTDRAM_ABS_POS
