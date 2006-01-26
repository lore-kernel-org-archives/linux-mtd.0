Received: from petasus.ims.intel.com ([62.118.80.130])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F2Arb-0000VG-EG
	for linux-mtd@lists.infradead.org; Thu, 26 Jan 2006 17:24:53 +0000
Received: from MSSMSXVS01.ccr.corp.intel.com (MSSMSXVS01.ccr.corp.intel.com
	[10.125.2.23])
	by petasus.ims.intel.com (8.12.9-20030918-01/8.12.10/d: small-solo.mc,
	v 1.2 2004/09/17 18:05:04 root Exp $) with SMTP id k0QHcQ4s031493
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jan 2006 17:38:27 GMT
Received: from mssmsx331.ccr.corp.intel.com ([10.125.2.16])
	by MSSMSXVS01.ccr.corp.intel.com (SAVSMTP 3.1.7.47) with SMTP id
	M2006012620243426994
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jan 2006 20:24:34 +0300
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Jan 2006 20:24:29 +0300
Message-ID: <F92C2EFE7C3BA745855BF7036E1F3F9A018B833E@NNSMSX401>
From: "Korolev, Alexey" <alexey.korolev@intel.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC/PATCH] map drivers. DCACHE option for physmap and mphysmap
	drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
=20
Some mapping drivers of linux-mtd has feature of cached mapping. This
can improve read performance on FLASH significantly .=20
I think adding the option of data cache mapping would also be helpful
for physmap and mphysmap drivers.
=20
Here is a perf. data I measured on Mainstone with enabled and disabled
DCACHE mapping option:
=20
DCAHCE is off:
time dd if=3D/dev/mtd2 of=3D/dev/null bs=3D4k count=3D4k
4096+0 records in
4096+0 records out
real    0m 7.21s
user    0m 0.00s
sys     0m 7.21s
=20
DCACHE is on:
time dd if=3D/dev/mtd2 of=3D/dev/null bs=3D4k count=3D4k
4096+0 records in
4096+0 records out
real    0m 0.69s
user    0m 0.01s
sys     0m 0.69s
=20
=20
Please find diff file below.=20
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D
diff -uNr a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
--- a/drivers/mtd/maps/Kconfig 2005-12-22 15:06:38.000000000 +0300
+++ b/drivers/mtd/maps/Kconfig 2005-12-22 15:05:24.000000000 +0300
@@ -60,6 +60,12 @@
    Ignore this option if you use run-time physmap configuration
    (i.e., run-time calling physmap_configure()).
=20
+config MTD_PHYSMAP_DCACHE
+ bool "Enable dcache for flash mapping"
+ depends on MTD_PHYSMAP
+ help
+   This option enables CPU data cache for flash mapping
+   This improves flash read speed significantly.=20
 config MTD_MULTI_PHYSMAP
  tristate "multiple CFI Flash devices in physical memory map"
  depends on MTD_CFI
@@ -86,6 +92,12 @@
  depends on MTD_MULTI_PHYSMAP
  default "2"
=20
+config MTD_MULTI_PHYSMAP_1_DCACHE
+ bool "Enable dcache for 1st flash mapping"
+ depends on MTD_MULTI_PHYSMAP
+ help
+   This option enables CPU data cache for 1st flash mapping
+   This improves flash read speed significantly.
 config MTD_MULTI_PHYSMAP_2_NAME
  string "2nd mapping name"
  depends on MTD_MULTI_PHYSMAP
@@ -106,6 +118,12 @@
  depends on MTD_MULTI_PHYSMAP
  default "2"
=20
+config MTD_MULTI_PHYSMAP_2_DCACHE
+ bool "Enable dcache for 2nd flash mapping"
+ depends on MTD_MULTI_PHYSMAP
+ help
+   This option enables CPU data cache for 2nd flash mapping
+   This improves flash read speed significantly.
 config MTD_MULTI_PHYSMAP_3_NAME
  string "3rd mapping name"
  depends on MTD_MULTI_PHYSMAP
@@ -126,6 +144,12 @@
  depends on MTD_MULTI_PHYSMAP
  default "2"
=20
+config MTD_MULTI_PHYSMAP_3_DCACHE
+ bool "Enable dcache for 3rd flash mapping"
+ depends on MTD_MULTI_PHYSMAP
+ help
+   This option enables CPU data cache for 3rd flash mapping
+   This improves flash read speed significantly.
 config MTD_MULTI_PHYSMAP_4_NAME
  string "4th mapping name"
  depends on MTD_MULTI_PHYSMAP
@@ -146,6 +170,12 @@
  depends on MTD_MULTI_PHYSMAP
  default "2"
=20
+config MTD_MULTI_PHYSMAP_4_DCACHE
+ bool "Enable dcache for 4th flash mapping"
+ depends on MTD_MULTI_PHYSMAP
+ help
+   This option enables CPU data cache for 4th flash mapping
+   This improves flash read speed significantly.
 config MTD_SUN_UFLASH
  tristate "Sun Microsystems userflash support"
  depends on (SPARC32 || SPARC64) && MTD_CFI
diff -uNr a/drivers/mtd/maps/mphysmap.c b/drivers/mtd/maps/mphysmap.c
--- a/drivers/mtd/maps/mphysmap.c 2005-12-22 15:06:38.000000000 +0300
+++ b/drivers/mtd/maps/mphysmap.c 2005-12-22 15:05:24.000000000 +0300
@@ -9,9 +9,40 @@
 #include <linux/module.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
+#if defined(CONFIG_MTD_MULTI_PHYSMAP_1_DCACHE) || \
+    defined(CONFIG_MTD_MULTI_PHYSMAP_2_DCACHE) || \
+    defined(CONFIG_MTD_MULTI_PHYSMAP_3_DCACHE) || \
+    defined(CONFIG_MTD_MULTI_PHYSMAP_4_DCACHE)
+#define CONFIG_MTD_MULTI_PHYSMAP_DCACHE
+#endif   =20
 #ifdef CONFIG_MTD_PARTITIONS
 #include <linux/mtd/partitions.h>
 #endif
+#ifdef CONFIG_MTD_MULTI_PHYSMAP_DCACHE
+#include <asm/cacheflush.h>
+#include <linux/dma-mapping.h>
+#endif
+
+
+#ifdef CONFIG_MTD_MULTI_PHYSMAP_DCACHE
+static void mphysmap_inval_cache(struct map_info *map, unsigned long
from, ssize_t len)
+{unsigned long end;
+   /* flush_cache_all() works, but seriously degrades performance */
+   /* flush_cache_all(); */
+   /**/
+   /* round to full pages */
+   end=3D(from+len);
+   end=3D(end / PAGE_SIZE + 1) * PAGE_SIZE;
+   from=3D(from / PAGE_SIZE) * PAGE_SIZE;
+   len=3Dend-from;
+#ifdef CONFIG_ARM       =20
+   consistent_sync((char *)map->cached + from, len, DMA_FROM_DEVICE);
+#else
+   /* Non ARM architectures has not been tested */
+   dma_cache_sync((char *)map->cached + from, len, DMA_FROM_DEVICE);
+#endif
+}
+#endif
=20
 static struct map_info mphysmap_static_maps[] =3D {
 #if CONFIG_MTD_MULTI_PHYSMAP_1_WIDTH
@@ -20,6 +57,9 @@
   .phys  =3D CONFIG_MTD_MULTI_PHYSMAP_1_START,
   .size  =3D CONFIG_MTD_MULTI_PHYSMAP_1_LEN,
   .bankwidth =3D CONFIG_MTD_MULTI_PHYSMAP_1_WIDTH,
+#ifdef CONFIG_MTD_MULTI_PHYSMAP_1_DCACHE
+  .inval_cache =3D mphysmap_inval_cache,
+#endif
  },
 #endif
 #if CONFIG_MTD_MULTI_PHYSMAP_2_WIDTH
@@ -28,6 +68,9 @@
   .phys  =3D CONFIG_MTD_MULTI_PHYSMAP_2_START,
   .size  =3D CONFIG_MTD_MULTI_PHYSMAP_2_LEN,
   .bankwidth =3D CONFIG_MTD_MULTI_PHYSMAP_2_WIDTH,
+#ifdef CONFIG_MTD_MULTI_PHYSMAP_2_DCACHE
+  .inval_cache =3D mphysmap_inval_cache,
+#endif
  },
 #endif
 #if CONFIG_MTD_MULTI_PHYSMAP_3_WIDTH
@@ -36,6 +79,9 @@
   .phys  =3D CONFIG_MTD_MULTI_PHYSMAP_3_START,
   .size  =3D CONFIG_MTD_MULTI_PHYSMAP_3_LEN,
   .bankwidth =3D CONFIG_MTD_MULTI_PHYSMAP_3_WIDTH,
+#ifdef CONFIG_MTD_MULTI_PHYSMAP_3_DCACHE
+  .inval_cache =3D mphysmap_inval_cache,
+#endif
  },
 #endif
 #if CONFIG_MTD_MULTI_PHYSMAP_4_WIDTH
@@ -44,6 +90,9 @@
   .phys  =3D CONFIG_MTD_MULTI_PHYSMAP_4_START,
   .size  =3D CONFIG_MTD_MULTI_PHYSMAP_4_LEN,
   .bankwidth =3D CONFIG_MTD_MULTI_PHYSMAP_4_WIDTH,
+#ifdef CONFIG_MTD_MULTI_PHYSMAP_4_DCACHE
+  .inval_cache =3D mphysmap_inval_cache,
+#endif
  },
 #endif
 };
@@ -68,10 +117,20 @@
 #endif
        NULL};
 #endif
- map->virt =3D ioremap(map->phys, map->size);
+ map->virt =3D ioremap_nocache(map->phys, map->size);
  if (!map->virt)
   return -EIO;
-
+        map->cached=3DNULL;       =20
+#ifdef CONFIG_MTD_MULTI_PHYSMAP_DCACHE
+        if (map->inval_cache)
+        {
+#ifdef CONFIG_ARM       =20
+           map->cached =3D ioremap_cached(map->phys, map->size);
+#else
+           map->cached =3D __ioremap(map->phys, map->size,
L_PTE_CACHEABLE);
+#endif
+        };  =20
+#endif
  simple_map_init(map);
  mtd =3D NULL;
  type =3D rom_probe_types;
@@ -81,6 +140,10 @@
=20
  if (!mtd) {
   iounmap(map->virt);
+#ifdef CONFIG_MTD_MULTI_PHYSMAP_DCACHE
+  if (map->cached)
+      iounmap(map->cached);
+#endif
   return -ENXIO;
  }
=20
@@ -134,6 +197,12 @@
  map->map_priv_1 =3D 0;
  map->map_priv_2 =3D 0;
  map->virt =3D NULL;
+#ifdef CONFIG_MTD_MULTI_PHYSMAP_DCACHE
+ if (map->cached) {
+     iounmap(map->cached);
+     map->cached =3D NULL;
+ }
+#endif
 }
=20
=20
diff -uNr a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
--- a/drivers/mtd/maps/physmap.c 2005-12-22 15:06:38.000000000 +0300
+++ b/drivers/mtd/maps/physmap.c 2005-12-22 15:05:24.000000000 +0300
@@ -19,15 +19,41 @@
 #include <linux/mtd/map.h>
 #include <linux/config.h>
 #include <linux/mtd/partitions.h>
-#include <linux/mtd/physmap.h>
+#ifdef CONFIG_MTD_PHYSMAP_DCACHE
+#include <asm/cacheflush.h>
+#include <linux/dma-mapping.h>
+#endif
=20
 static struct mtd_info *mymtd;
=20
+#ifdef CONFIG_MTD_PHYSMAP_DCACHE
+static void physmap_inval_cache(struct map_info *map, unsigned long
from, ssize_t len)
+{unsigned long end;
+   /* flush_cache_all() works, but seriously degrades performance */
+   /* flush_cache_all(); */
+   /**/
+   /* round to full pages */
+   end=3D(from+len);
+   end=3D(end / PAGE_SIZE + 1) * PAGE_SIZE;
+   from=3D(from / PAGE_SIZE) * PAGE_SIZE;
+   len=3Dend-from;
+#ifdef CONFIG_ARM       =20
+   consistent_sync((char *)map->cached + from, len, DMA_FROM_DEVICE);
+#else
+   /* Non ARM architectures are not tested */
+   dma_cache_sync((char *)map->cached + from, len, DMA_FROM_DEVICE);
+#endif
+}
+#endif
+
 struct map_info physmap_map =3D {
  .name =3D "phys_mapped_flash",
  .phys =3D CONFIG_MTD_PHYSMAP_START,
  .size =3D CONFIG_MTD_PHYSMAP_LEN,
  .bankwidth =3D CONFIG_MTD_PHYSMAP_BANKWIDTH,
+#ifdef CONFIG_MTD_PHYSMAP_DCACHE
+ .inval_cache =3D physmap_inval_cache,
+#endif
 };
=20
 #ifdef CONFIG_MTD_PARTITIONS
@@ -52,13 +78,22 @@
  const char **type;
=20
         printk(KERN_NOTICE "physmap flash device: %lx at %lx\n",
physmap_map.size, physmap_map.phys);
- physmap_map.virt =3D ioremap(physmap_map.phys, physmap_map.size);
+ physmap_map.virt =3D ioremap_nocache(physmap_map.phys,
physmap_map.size);
=20
  if (!physmap_map.virt) {
   printk("Failed to ioremap\n");
   return -EIO;
  }
-
+#ifdef CONFIG_MTD_PHYSMAP_DCACHE
+#ifdef CONFIG_ARM
+ physmap_map.cached =3D ioremap_cached(physmap_map.phys,
physmap_map.size);
+#else       =20
+ physmap_map.cached =3D __ioremap(physmap_map.phys, physmap_map.size,
L_PTE_CACHEABLE);
+#endif       =20
+ if (!physmap_map.cached) {
+  printk("Failed to ioremap cached\n");
+ }
+#endif
  simple_map_init(&physmap_map);
=20
  mymtd =3D NULL;
@@ -94,6 +129,10 @@
  }
=20
  iounmap(physmap_map.virt);
+#ifdef CONFIG_MTD_PHYSMAP_DCACHE
+ if (physmap_map.cached)
+  iounmap(physmap_map.cached);
+#endif
  return -ENXIO;
 }
=20
@@ -115,6 +154,12 @@
=20
  iounmap(physmap_map.virt);
  physmap_map.virt =3D NULL;
+#ifdef CONFIG_MTD_PHYSMAP_DCACHE
+ if (physmap_map.cached) {
+  iounmap(physmap_map.cached);
+  physmap_map.cached =3D NULL;
+ }
+#endif
 }
=20
 module_init(init_physmap);
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
=20
Thanks,
Alexey
