Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ZxFb-0000sf-00
	for mtd-list@infradead.org; Mon, 05 Mar 2001 15:50:19 +0000
Message-ID: <007401c0a590$61027ac0$0d3318b5@jolt>
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
References: <005901c0a546$367c8d80$0d3318b5@jolt>  <Pine.LNX.4.30.0103031754080.7202-100000@imladris.demon.co.uk>  <19173.983781726@redhat.com>
Subject: MTD Patches
Date: Mon, 5 Mar 2001 17:21:41 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi!

I've two little patches pending. Can someone please commit them to cvs?

Patch1:

Adds partition support to physmap.c. Support can be enabled via kernel
config, so if you dont need it you wont get bigger modules/kernels.

Patch2: Fixes a small bug (?) in mtdblock_ro.c Please verify this. Seems
someone disabled a function but did not disable the corresponding function
call :-)

Thanks for your help and happing hacking
   Florian Schirmer

[......]

diff -Naur mtd-old/kernel/Config.in mtd/kernel/Config.in
--- mtd-old/kernel/Config.in Sat Feb 17 22:17:48 2001
+++ mtd/kernel/Config.in Mon Mar  5 10:51:27 2001
@@ -79,6 +79,7 @@
       hex '    Physical start address of flash mapping'
CONFIG_MTD_PHYSMAP_START 0x8000000
       hex '    Physical length of flash mapping' CONFIG_MTD_PHYSMAP_LEN
0x4000000
       int '    Bus width in octets' CONFIG_MTD_PHYSMAP_BUSWIDTH 2
+      bool '    Partition suport' CONFIG_MTD_PHYSMAP_PARTITION
    fi
    dep_tristate '  CFI Flash device mapped on Nora' CONFIG_MTD_NORA
$CONFIG_MTD_CFI
    dep_tristate '  CFI Flash device mapped on Photron PNC-2000'
CONFIG_MTD_PNC2000 $CONFIG_MTD_CFI
diff -Naur mtd-old/kernel/mtdblock_ro.c mtd/kernel/mtdblock_ro.c
--- mtd-old/kernel/mtdblock_ro.c Fri Nov 17 09:51:35 2000
+++ mtd/kernel/mtdblock_ro.c Mon Mar  5 11:20:51 2001
@@ -222,7 +222,9 @@
       // Grab the lock and re-thread the item onto the linked list
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
  spin_lock_irq(&io_request_lock);
+#if 0
  mtdblock_end_request(current_request, res);
+#endif
 #endif
  end_request(res);
    }
diff -Naur mtd-old/kernel/physmap.c mtd/kernel/physmap.c
--- mtd-old/kernel/physmap.c Sat Mar  3 19:17:09 2001
+++ mtd/kernel/physmap.c Mon Mar  5 11:17:25 2001
@@ -12,6 +12,21 @@
 #include <linux/mtd/map.h>
 #include <linux/config.h>

+#ifdef CONFIG_MTD_PHYSMAP_PARTITION
+#include <linux/mtd/partitions.h>
+
+/* partition_info gives details on the logical partitions that the split
the
+ * single flash device into. If the size if zero we use up to the end of
the
+ * device. */
+const static struct mtd_partition partition_info[] = {/*{name:
"Bootloader",
+             offset: MTDPART_OFS_APPEND,
+             size: 128 * 1024},*/
+            {name: "Physically mapped flash",
+             offset: MTDPART_OFS_APPEND,
+             size: MTDPART_SIZ_FULL}};
+
+#define NUM_PARTITIONS (sizeof(partition_info) / sizeof(partition_info[0]))
+#endif // CONFIG_MTD_PHYSMAP_PARTITION

 #define WINDOW_ADDR CONFIG_MTD_PHYSMAP_START
 #define WINDOW_SIZE CONFIG_MTD_PHYSMAP_LEN
@@ -95,7 +110,13 @@
 #ifdef MODULE
   mymtd->module = &__this_module;
 #endif
+
+#ifdef CONFIG_MTD_PHYSMAP_PARTITION
+                /* Create MTD devices for each partition. */
+         add_mtd_partitions(mymtd, partition_info, NUM_PARTITIONS);
+#else
   add_mtd_device(mymtd);
+#endif // CONFIG_MTD_PHYSMAP_PARTITION
   return 0;
  }

@@ -106,7 +127,11 @@
 mod_exit_t cleanup_physmap(void)
 {
  if (mymtd) {
+#ifdef CONFIG_MTD_PHYSMAP_PARTITION
+  del_mtd_partitions(mymtd);
+#else
   del_mtd_device(mymtd);
+#endif // CONFIG_MTD_PHYSMAP_PARTITION
   map_destroy(mymtd);
  }
  if (physmap_map.map_priv_1) {




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
