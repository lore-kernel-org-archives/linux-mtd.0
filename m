Received: from kukac.halom.u-szeged.hu ([160.114.44.1])
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Da7fl-0002bF-QV
	for linux-mtd@lists.infradead.org; Mon, 23 May 2005 08:48:28 +0100
Received: from pajko (helo=localhost)
	by kukac.halom.u-szeged.hu with local-esmtp (Exim 4.34)
	id 1Da7fc-0007c4-8K
	for linux-mtd@lists.infradead.org; Mon, 23 May 2005 09:48:16 +0200
Date: Mon, 23 May 2005 09:48:16 +0200 (CEST)
From: Kluba Patrik <pajko@kukac.halom.u-szeged.hu>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.61.0505230940590.25999@kukac.halom.u-szeged.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Sender: Kluba Patrik <pajko@halom.u-szeged.hu>
Subject: [PATCH][03/03] nandsim own geometry
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi!

With this patch you can easily construct a NAND geometry for nandsim from within 
Kconfig. The main purpose is to make testing on large page chips possible on 
low-memory systems like mine (eg. test on a 256Mbit chip with large pages) or 
test on a chip you do not have and don't know the ID values for it (eg. a 8Gbit 
chip if you have a plenty of memory :)

Bye,
   Patrik Kluba

--
diff -Naur mtd-work2/drivers/mtd/nand/Kconfig mtd-work3/drivers/mtd/nand/Kconfig
--- mtd-work2/drivers/mtd/nand/Kconfig	2005-05-23 07:56:24.000000000 +0200
+++ mtd-work3/drivers/mtd/nand/Kconfig	2005-05-23 09:20:30.000000000 +0200
@@ -242,28 +242,208 @@
          default 50
          depends on MTD_NAND_NANDSIM_DELAY

+ choice
+
+        prompt "Emulate a chip with given"
+	default MTD_NAND_NANDSIM_CHIP
+	depends on MTD_NAND_NANDSIM
+
+        config MTD_NAND_NANDSIM_CHIP
+	       bool "ID bytes (eg. an existing chip)"
+
+        config MTD_NAND_NANDSIM_GEOM
+	       bool "geometry"
+
+ endchoice
+
   config MTD_NAND_NANDSIM_FIRST_ID
          hex "First ID byte"
  	range 0x00 0xff
  	default 0x98
-	depends on MTD_NAND_NANDSIM
+	depends on MTD_NAND_NANDSIM_CHIP

   config MTD_NAND_NANDSIM_SECOND_ID
          hex "Second ID byte"
          range 0x00 0xff
  	default 0x39
-	depends on MTD_NAND_NANDSIM
+	depends on MTD_NAND_NANDSIM_CHIP

   config MTD_NAND_NANDSIM_THIRD_ID
          hex "Third ID byte"
  	range 0x00 0xff
  	default 0xff
-	depends on MTD_NAND_NANDSIM
+	depends on MTD_NAND_NANDSIM_CHIP

   config MTD_NAND_NANDSIM_FOURTH_ID
          hex "Fourth ID byte"
  	range 0x00 0xff
  	default 0xff
-	depends on MTD_NAND_NANDSIM
+	depends on MTD_NAND_NANDSIM_CHIP
+
+ config MTD_NAND_NANDSIM_ID
+        hex "Device ID of emulated NAND chip (must be unique, default=0x88)"
+        depends on MTD_NAND_NANDSIM_GEOM
+        range 0x00 0xff
+        default 0x88
+        help
+          Device ID of emulated NAND chip (must be unique, default=0x88)
+
+ choice
+
+        prompt "Bus width of emulated NAND chip"
+        default MTD_NAND_NANDSIM_8BIT_BUS
+        depends on MTD_NAND_NANDSIM_GEOM
+
+        config MTD_NAND_NANDSIM_8BIT_BUS
+               bool "8 bit"
+
+        config MTD_NAND_NANDSIM_16BIT_BUS
+               bool "16 bit"
+
+ endchoice
+
+ config MTD_NAND_NANDSIM_CHIPSIZE
+        int "Emulated NAND chip size in MBytes (default=64)"
+        depends on MTD_NAND_NANDSIM_GEOM
+        default 64
+        help
+          Emulated NAND chip size in MBytes (default=64)
+
+ choice
+
+        prompt "Emulated chip style"
+        default MTD_NAND_NANDSIM_NEW
+        depends on MTD_NAND_NANDSIM_GEOM
+
+        config MTD_NAND_NANDSIM_OLD
+               bool "Emulate old style chip (2 ID bytes)"
+               help
+                 Emulate an old style NAND chip. 2 ID bytes are sent on device
+                 identify query. All parameters are stored in a table in
+                 nand_ids.c
+
+        config MTD_NAND_NANDSIM_NEW
+               bool "Emulate new style chip (4 ID bytes)"
+               help
+                 Emulate a new style NAND chip. 4 ID bytes are sent on device
+                 identify query. All parameters are encoded in the 4th ID byte,
+                 autodetection values are used in nand_ids.c
+
+ endchoice
+
+ choice
+
+        prompt "    Page size of chip"
+        default MTD_NAND_NANDSIM_512B_PAGE
+        depends on MTD_NAND_NANDSIM_OLD
+
+        config MTD_NAND_NANDSIM_256B_PAGE
+               bool "256 bytes"
+               help
+                 Emulate a NAND chip with a page size of 256 bytes
+
+         config MTD_NAND_NAND_NANDSIM_512B_PAGE
+                bool "512 bytes"
+                help
+                  Emulate a NAND chip with a page size of 512 bytes
+
+ endchoice
+
+ choice
+
+        prompt "    Erase block size of chip"
+        default MTD_NAND_NANDSIM_16KB_ERASE
+        depends on MTD_NAND_NANDSIM_OLD
+
+        config MTD_NAND_NANDSIM_4KB_ERASE
+               bool "4 KBytes"
+               help
+                 Emulate a NAND chip with an erase block size of 4 KBytes
+
+        config MTD_NAND_NANDSIM_8KB_ERASE
+               bool "8 KBytes"
+               help
+                 Emulate a NAND chip with an erase block size of 8 KBytes
+
+        config MTD_NAND_NANDSIM_16KB_ERASE
+               bool "16 KBytes"
+               help
+                 Emulate a NAND chip with an erase block size of 16 KBytes
+
+ endchoice
+
+ choice
+
+        prompt "    Erase block size of chip"
+        default MTD_NAND_NANDSIM_128KB_ERASE
+        depends on MTD_NAND_NANDSIM_NEW
+
+        config MTD_NAND_NANDSIM_64KB_ERASE
+               bool "64 KBytes"
+               help
+                 Emulate a NAND chip with an erase block size of 64 KBytes
+
+        config MTD_NAND_NANDSIM_128KB_ERASE
+               bool "128 KBytes"
+               help
+                 Emulate a NAND chip with an erase block size of 128 KBytes
+
+        config MTD_NAND_NANDSIM_256KB_ERASE
+               bool "256 KBytes"
+               help
+                 Emulate a NAND chip with an erase block size of 256 KBytes
+
+        config MTD_NAND_NANDSIM_512KB_ERASE
+               bool "512 KBytes"
+               help
+                 Emulate a NAND chip with an erase block size of 512 KBytes
+
+ endchoice
+
+ choice
+
+        prompt "    Page size of chip"
+        default MTD_NAND_NANDSIM_2048B_PAGE
+        depends on MTD_NAND_NANDSIM_NEW
+
+        config MTD_NAND_NANDSIM_1024B_PAGE
+               bool "1024 bytes"
+               help
+                 Emulate a NAND chip with a page size of 1024 bytes
+
+        config MTD_NAND_NANDSIM_2048B_PAGE
+               bool "2048 bytes"
+               help
+                 Emulate a NAND chip with a page size of 2048 bytes
+
+ endchoice
+
+ choice
+
+        prompt "    OOB size of chip"
+        default MTD_NAND_NANDSIM_D32_OOB
+        depends on MTD_NAND_NANDSIM_NEW
+
+        config MTD_NAND_NANDSIM_D64_OOB
+               bool "pagesize/64 bytes"
+               help
+                 Emulate a NAND chip with an OOB size of pagesize/64 bytes
+
+        config MTD_NAND_NANDSIM_D32_OOB
+               bool "pagesize/32 bytes (use this with 2K page size)"
+               help
+                 Emulate a NAND chip with an OOB size of pagesize/32 bytes
+
+        config MTD_NAND_NANDSIM_D16_OOB
+               bool "pagesize/16 bytes"
+               help
+                 Emulate a NAND chip with an OOB size of pagesize/16 bytes
+
+        config MTD_NAND_NANDSIM_D8_OOB
+               bool "pagesize/8 bytes"
+               help
+                 Emulate a NAND chip with an OOB size of pagesize/8 bytes
+
+ endchoice

  endmenu
diff -Naur mtd-work2/drivers/mtd/nand/nand_ids.c mtd-work3/drivers/mtd/nand/nand_ids.c
--- mtd-work2/drivers/mtd/nand/nand_ids.c	2005-02-16 10:33:27.000000000 +0100
+++ mtd-work3/drivers/mtd/nand/nand_ids.c	2005-05-23 08:36:57.000000000 +0200
@@ -103,6 +103,35 @@
  	 */
  	{"AND 128MiB 3,3V 8-bit",	0x01, 2048, 128, 0x4000, NAND_IS_AND | NAND_NO_AUTOINCR | NAND_4PAGE_ARRAY | BBT_AUTO_REFRESH},

+#ifdef CONFIG_MTD_NAND_GEOM
+#  ifdef CONFIG_MTD_NAND_NANDSIM_8BIT_BUS
+#    define CONFIG_MTD_NAND_NANDSIM_BUSWIDTH 0
+#  elif defined(CONFIG_MTD_NAND_NANDSIM_16BIT_BUS)
+#    define CONFIG_MTD_NAND_NANDSIM_BUSWIDTH NAND_BUSWIDTH_16
+#  endif
+#  ifdef CONFIG_MTD_NAND_NANDSIM_OLD
+#    ifdef CONFIG_MTD_NAND_NANDSIM_256B_PAGE
+#      define CONFIG_MTD_NAND_NANDSIM_PAGESIZE 256
+#    elif defined(CONFIG_MTD_NAND_NANDSIM_512B_PAGE)
+#      define CONFIG_MTD_NAND_NANDSIM_PAGESIZE 512
+#    endif
+#    ifdef CONFIG_MTD_NAND_NANDSIM_4KB_ERASE
+#      define CONFIG_MTD_NAND_NANDSIM_EBSIZE 4096
+#    elif defined(CONFIG_MTD_NAND_NANDSIM_8KB_ERASE)
+#      define CONFIG_MTD_NAND_NANDSIM_EBSIZE 8192
+#    elif defined(CONFIG_MTD_NAND_NANDSIM_16KB_ERASE)
+#      define CONFIG_MTD_NAND_NANDSIM_EBSIZE 16384
+#    endif
+
+   {"NANDSIM (old)",               CONFIG_MTD_NAND_NANDSIM_ID, CONFIG_MTD_NAND_NANDSIM_PAGESIZE, CONFIG_MTD_NAND_NANDSIM_CHIPSIZE, CONFIG_MTD_NAND_NANDSIM_EBSIZE, CONFIG_MTD_NAND_NANDSIM_BUSWIDTH},
+
+#  elif defined(CONFIG_MTD_NAND_NANDSIM_NEW)
+
+   {"NANDSIM (new)",               CONFIG_MTD_NAND_NANDSIM_ID, 0, CONFIG_MTD_NAND_NANDSIM_CHIPSIZE, 0, CONFIG_MTD_NAND_NANDSIM_BUSWIDTH},
+
+#  endif
+#endif
+
  	{NULL,}
  };

diff -Naur mtd-work2/drivers/mtd/nand/nandsim.c mtd-work3/drivers/mtd/nand/nandsim.c
--- mtd-work2/drivers/mtd/nand/nandsim.c	2005-05-23 08:10:34.000000000 +0200
+++ mtd-work3/drivers/mtd/nand/nandsim.c	2005-05-23 08:32:04.000000000 +0200
@@ -42,10 +42,53 @@
  #include <asm/io.h>
  #endif

+#ifdef CONFIG_MTD_NAND_NANDSIM_CHIP
  #  define CONFIG_NANDSIM_FISRT_ID_BYTE		CONFIG_MTD_NAND_NANDSIM_FIRST_ID
  #  define CONFIG_NANDSIM_SECOND_ID_BYTE		CONFIG_MTD_NAND_NANDSIM_SECOND_ID
  #  define CONFIG_NANDSIM_THIRD_ID_BYTE		CONFIG_MTD_NAND_NANDSIM_THIRD_ID
  #  define CONFIG_NANDSIM_FOURTH_ID_BYTE		CONFIG_MTD_NAND_NANDSIM_FOURTH_ID
+#elif defined(CONFIG_MTD_NAND_NANDSIM_GEOM)
+#  define CONFIG_NANDSIM_FIRST_ID_BYTE		0x98
+#  define CONFIG_NANDSIM_THIRD_ID_BYTE		0xff
+#  ifdef CONFIG_MTD_NAND_NANDSIM_OLD
+#    define CONFIG_NANDSIM_FOURTH_ID_BYTE	0xff
+#  else
+#    ifdef CONFIG_MTD_NAND_NANDSIM_64KB_ERASE
+#      define CONFIG_NANDSIM_ERASE		0
+#    elif defined(CONFIG_MTD_NAND_NANDSIM_128KB_ERASE)
+#      define CONFIG_NANDSIM_ERASE		16
+#    elif defined(CONFIG_MTD_NAND_NANDSIM_256KB_ERASE)
+#      define CONFIG_NANDSIM_ERASE		32
+#    elif defined(CONFIG_MTD_NAND_NANDSIM_512KB_ERASE)
+#      define CONFIG_NANDSIM_ERASE		48
+#    endif
+#    ifdef CONFIG_MTD_NAND_NANDSIM_1024B_PAGE
+#      define CONFIG_NANDSIM_PAGE		0
+#    elif defined(CONFIG_MTD_NAND_NANDSIM_2048B_PAGE)
+#      define CONFIG_NANDSIM_PAGE		1
+#    elif defined(CONFIG_MTD_NAND_NANDSIM_4096B_PAGE)
+#      define CONFIG_NANDSIM_PAGE		2
+#    elif defined(CONFIG_MTD_NAND_NANDSIM_8192B_PAGE)
+#      define CONFIG_NANDSIM_PAGE		3
+#    endif
+#    ifdef CONFIG_MTD_NAND_NANDSIM_D64_OOB
+#      define CONFIG_NANDSIM_OOB		0
+#    elif defined(CONFIG_MTD_NAND_NANDSIM_D32_OOB)
+#      define CONFIG_NANDSIM_OOB		4
+#    elif defined(CONFIG_MTD_NAND_NANDSIM_D16_OOB)
+#      define CONFIG_NANDSIM_OOB		8
+#    elif defined(CONFIG_MTD_NAND_NANDSIM_D8_OOB)
+#      define CONFIG_NANDSIM_OOB		12
+#    endif
+#    ifdef CONFIG_MTD_NAND_NANDSIM_16BIT_BUS
+#      define CONFIG_NANDSIM_BUSWIDTH		64
+#    else
+#      define CONFIG_NANDSIM_BUSWIDTH		0
+#    endif
+#    define CONFIG_NANDSIM_FOURTH_ID_BYTE          (CONFIG_NANDSIM_PAGE + CONFIG_NANDSIM_ERASE + \
+                                                   CONFIG_NANDSIM_OOB + CONFIG_NANDSIM_BUSWIDTH)
+#  endif
+#endif

  #ifndef CONFIG_MTD_NAND_NANDSIM_ACCESS_DELAY
  #  define CONFIG_MTD_NAND_NANDSIM_ACCESS_DELAY		25
