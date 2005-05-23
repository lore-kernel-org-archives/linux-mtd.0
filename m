Received: from kukac.halom.u-szeged.hu ([160.114.44.1])
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Da7Yf-0002ZV-Lc
	for linux-mtd@lists.infradead.org; Mon, 23 May 2005 08:41:09 +0100
Received: from pajko (helo=localhost)
	by kukac.halom.u-szeged.hu with local-esmtp (Exim 4.34)
	id 1Da7YV-0007bc-Oi
	for linux-mtd@lists.infradead.org; Mon, 23 May 2005 09:40:56 +0200
Date: Mon, 23 May 2005 09:40:55 +0200 (CEST)
From: Kluba Patrik <pajko@kukac.halom.u-szeged.hu>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.61.0505230933320.25999@kukac.halom.u-szeged.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Sender: Kluba Patrik <pajko@halom.u-szeged.hu>
Subject: [PATCH][02/03] nandsim default values in Kconfig
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi!

Nandsim uses several module parameters for specifying what chip to simulate. 
Some default values are in the source itself. It's much convenient to have them 
in Kconfig so you don't need to specify module parameters every time you load 
it.

Here is a patch.

Bye,
   Patrik Kluba

--
diff -Naur mtd-work/drivers/mtd/nand/Kconfig mtd-work2/drivers/mtd/nand/Kconfig
--- mtd-work/drivers/mtd/nand/Kconfig	2005-05-23 07:43:43.000000000 +0200
+++ mtd-work2/drivers/mtd/nand/Kconfig	2005-05-23 07:56:24.000000000 +0200
@@ -204,4 +204,66 @@
  	  The simulator may simulate verious NAND flash chips for the
  	  MTD nand layer.

+ config MTD_NAND_NANDSIM_DEBUG
+        bool "NAND Simulator debugging"
+	depends on MTD_NAND_NANDSIM
+
+ config MTD_NAND_NANDSIM_LOG
+        bool "NAND Simulator logging"
+	depends on MTD_NAND_NANDSIM
+
+ config MTD_NAND_NANDSIM_DELAY
+        bool "Emulate chip delays"
+        default y
+        depends on MTD_NAND_NANDSIM
+
+ config MTD_NAND_NANDSIM_ACCESS_DELAY
+        int "Access delay"
+        default 25
+        depends on MTD_NAND_NANDSIM_DELAY
+
+ config MTD_NAND_NANDSIM_PROGRAM_DELAY
+        int "Program delay"
+        default 200
+        depends on MTD_NAND_NANDSIM_DELAY
+
+ config MTD_NAND_NANDSIM_ERASE_DELAY
+        int "Erase delay"
+        default 2
+        depends on MTD_NAND_NANDSIM_DELAY
+
+ config MTD_NAND_NANDSIM_OUTPUT_CYCLE
+        int "Output cycle"
+        default 40
+        depends on MTD_NAND_NANDSIM_DELAY
+
+config MTD_NAND_NANDSIM_INPUT_CYCLE
+        int "Input cycle"
+        default 50
+        depends on MTD_NAND_NANDSIM_DELAY
+
+ config MTD_NAND_NANDSIM_FIRST_ID
+        hex "First ID byte"
+	range 0x00 0xff
+	default 0x98
+	depends on MTD_NAND_NANDSIM
+
+ config MTD_NAND_NANDSIM_SECOND_ID
+        hex "Second ID byte"
+        range 0x00 0xff
+	default 0x39
+	depends on MTD_NAND_NANDSIM
+
+ config MTD_NAND_NANDSIM_THIRD_ID
+        hex "Third ID byte"
+	range 0x00 0xff
+	default 0xff
+	depends on MTD_NAND_NANDSIM
+
+ config MTD_NAND_NANDSIM_FOURTH_ID
+        hex "Fourth ID byte"
+	range 0x00 0xff
+	default 0xff
+	depends on MTD_NAND_NANDSIM
+
  endmenu
diff -Naur mtd-work/drivers/mtd/nand/nandsim.c mtd-work2/drivers/mtd/nand/nandsim.c
--- mtd-work/drivers/mtd/nand/nandsim.c	2005-05-23 07:48:34.000000000 +0200
+++ mtd-work2/drivers/mtd/nand/nandsim.c	2005-05-23 08:10:34.000000000 +0200
@@ -42,59 +42,71 @@
  #include <asm/io.h>
  #endif

+#  define CONFIG_NANDSIM_FISRT_ID_BYTE		CONFIG_MTD_NAND_NANDSIM_FIRST_ID
+#  define CONFIG_NANDSIM_SECOND_ID_BYTE		CONFIG_MTD_NAND_NANDSIM_SECOND_ID
+#  define CONFIG_NANDSIM_THIRD_ID_BYTE		CONFIG_MTD_NAND_NANDSIM_THIRD_ID
+#  define CONFIG_NANDSIM_FOURTH_ID_BYTE		CONFIG_MTD_NAND_NANDSIM_FOURTH_ID

-/* Default simulator parameters values */
-#if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
-    !defined(CONFIG_NANDSIM_SECOND_ID_BYTE) || \
-    !defined(CONFIG_NANDSIM_THIRD_ID_BYTE)  || \
-    !defined(CONFIG_NANDSIM_FOURTH_ID_BYTE)
-#define CONFIG_NANDSIM_FIRST_ID_BYTE  0x98
-#define CONFIG_NANDSIM_SECOND_ID_BYTE 0x39
-#define CONFIG_NANDSIM_THIRD_ID_BYTE  0xFF /* No byte */
-#define CONFIG_NANDSIM_FOURTH_ID_BYTE 0xFF /* No byte */
+#ifndef CONFIG_MTD_NAND_NANDSIM_ACCESS_DELAY
+#  define CONFIG_MTD_NAND_NANDSIM_ACCESS_DELAY		25
  #endif

-#ifndef CONFIG_NANDSIM_ACCESS_DELAY
-#define CONFIG_NANDSIM_ACCESS_DELAY 25
+#ifndef CONFIG_MTD_NAND_NANDSIM_PROGRAM_DELAY
+#  define CONFIG_MTD_NAND_NANDSIM_PROGRAM_DELAY	200
  #endif
-#ifndef CONFIG_NANDSIM_PROGRAMM_DELAY
-#define CONFIG_NANDSIM_PROGRAMM_DELAY 200
-#endif
-#ifndef CONFIG_NANDSIM_ERASE_DELAY
-#define CONFIG_NANDSIM_ERASE_DELAY 2
+
+#ifndef CONFIG_MTD_NAND_NANDSIM_ERASE_DELAY
+#  define CONFIG_MTD_NAND_NANDSIM_ERASE_DELAY		2
  #endif
-#ifndef CONFIG_NANDSIM_OUTPUT_CYCLE
-#define CONFIG_NANDSIM_OUTPUT_CYCLE 40
+
+#ifndef CONFIG_MTD_NAND_NANDSIM_OUTPUT_CYCLE
+#  define CONFIG_MTD_NAND_NANDSIM_OUTPUT_CYCLE		40
  #endif
-#ifndef CONFIG_NANDSIM_INPUT_CYCLE
-#define CONFIG_NANDSIM_INPUT_CYCLE  50
+
+#ifndef CONFIG_MTD_NAND_NANDSIM_INPUT_CYCLE
+#  define CONFIG_MTD_NAND_NANDSIM_INPUT_CYCLE		50
  #endif
-#ifndef CONFIG_NANDSIM_BUS_WIDTH
-#define CONFIG_NANDSIM_BUS_WIDTH  8
+
+#ifdef CONFIG_MTD_NAND_NANDSIM_16BIT_BUS
+#  define CONFIG_NANDSIM_BUS_WIDTH		16
+#else
+#  define CONFIG_NANDSIM_BUS_WIDTH		8
  #endif
-#ifndef CONFIG_NANDSIM_DO_DELAYS
-#define CONFIG_NANDSIM_DO_DELAYS  0
+
+#ifndef CONFIG_MTD_NAND_NANDSIM_DELAY
+#  define CONFIG_MTD_NAND_NANDSIM_DELAY		0
+#else
+#  undef CONFIG_MTD_NAND_NANDSIM_DELAY
+#  define CONFIG_MTD_NAND_NANDSIM_DELAY		1
  #endif
-#ifndef CONFIG_NANDSIM_LOG
-#define CONFIG_NANDSIM_LOG        0
+
+#ifndef CONFIG_MTD_NAND_NANDSIM_LOG
+#  define CONFIG_MTD_NAND_NANDSIM_LOG		0
+#else
+#  undef CONFIG_MTD_NAND_NANDSIM_LOG
+#  define CONFIG_MTD_NAND_NANDSIM_LOG		1
  #endif
-#ifndef CONFIG_NANDSIM_DBG
-#define CONFIG_NANDSIM_DBG        0
+
+#ifndef CONFIG_MTD_NAND_NANDSIM_DEBUG
+#  define CONFIG_MTD_NAND_NANDSIM_DEBUG		0
+#else
+#  undef CONFIG_MTD_NAND_NANDSIM_DEBUG
+#  define CONFIG_MTD_NAND_NANDSIM_DEBUG		1
  #endif

  static uint first_id_byte  = CONFIG_NANDSIM_FIRST_ID_BYTE;
  static uint second_id_byte = CONFIG_NANDSIM_SECOND_ID_BYTE;
  static uint third_id_byte  = CONFIG_NANDSIM_THIRD_ID_BYTE;
  static uint fourth_id_byte = CONFIG_NANDSIM_FOURTH_ID_BYTE;
-static uint access_delay   = CONFIG_NANDSIM_ACCESS_DELAY;
-static uint programm_delay = CONFIG_NANDSIM_PROGRAMM_DELAY;
-static uint erase_delay    = CONFIG_NANDSIM_ERASE_DELAY;
-static uint output_cycle   = CONFIG_NANDSIM_OUTPUT_CYCLE;
-static uint input_cycle    = CONFIG_NANDSIM_INPUT_CYCLE;
+static uint access_delay   = CONFIG_MTD_NAND_NANDSIM_ACCESS_DELAY;
+static uint programm_delay = CONFIG_MTD_NAND_NANDSIM_PROGRAM_DELAY;
+static uint erase_delay    = CONFIG_MTD_NAND_NANDSIM_ERASE_DELAY;
+static uint output_cycle   = CONFIG_MTD_NAND_NANDSIM_OUTPUT_CYCLE;
+static uint input_cycle    = CONFIG_MTD_NAND_NANDSIM_INPUT_CYCLE;
  static uint bus_width      = CONFIG_NANDSIM_BUS_WIDTH;
-static uint do_delays      = CONFIG_NANDSIM_DO_DELAYS;
-static uint log            = CONFIG_NANDSIM_LOG;
-static uint dbg            = CONFIG_NANDSIM_DBG;
+static uint do_delays      = CONFIG_MTD_NAND_NANDSIM_DELAY;
+static uint log            = CONFIG_MTD_NAND_NANDSIM_LOG;
+static uint dbg            = CONFIG_MTD_NAND_NANDSIM_DEBUG;

  module_param(first_id_byte,  uint, 0400);
  module_param(second_id_byte, uint, 0400);
