Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187Jjz-0003bJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2002 18:08:24 +0000
Date: Thu, 31 Oct 2002 19:37:18 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Brian J. Murrell" <23025b7367b1a31e3ff7682b8a6ae18e@interlinx.bc.ca>,
   linux-mtd@lists.infradead.org, Jamey.Hicks@hp.com
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021031183718.GA31035@wohnheim.fh-wedel.de>
References: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <20021030204937.GG27880@pc.ilinx> <20021030224633.GI27880@pc.ilinx> <20021031165322.GA8263@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021031165322.GA8263@wohnheim.fh-wedel.de>
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

On Thu, 31 October 2002 17:53:22 +0100, Jörn Engel wrote:
> I'll try to create a sample patch soon. But it remains your duty to
> make it production-ready and convince David.

All right. This patch will only create the mtd devices from ram and
block devices, unless $CONFIG_MEMORY_BUS is defined.
Brian, can you define this option for all platforms other tham uml?

Also, this might still be a little too broad for nand flash. Nand
needs more than just a memory bus, but I don't know what exactly.
But this should be close enough for now.

Jörn

-- 
"Translations are and will always be problematic. They inflict violence 
upon two languages." (translation from German)


diff -Naur linux-2.4.19/drivers/mtd/chips/Config.in linux-2.4.19-murrel/drivers/mtd/chips/Config.in
--- linux-2.4.19/drivers/mtd/chips/Config.in	Fri Oct  5 00:13:18 2001
+++ linux-2.4.19-murrel/drivers/mtd/chips/Config.in	Thu Oct 31 19:11:53 2002
@@ -6,52 +6,53 @@
 
 comment 'RAM/ROM/Flash chip drivers'
 
-dep_tristate '  Detect flash chips by Common Flash Interface (CFI) probe' CONFIG_MTD_CFI $CONFIG_MTD
-#dep_tristate '  Detect non-CFI Intel-compatible flash chips' CONFIG_MTD_INTELPROBE $CONFIG_MTD
-dep_tristate '  Detect non-CFI AMD/JEDEC-compatible flash chips' CONFIG_MTD_JEDECPROBE $CONFIG_MTD
+if [ "$CONFIG_MEMORY_BUS" ]; then
+   dep_tristate '  Detect flash chips by Common Flash Interface (CFI) probe' CONFIG_MTD_CFI $CONFIG_MTD
+   #dep_tristate '  Detect non-CFI Intel-compatible flash chips' CONFIG_MTD_INTELPROBE $CONFIG_MTD
+   dep_tristate '  Detect non-CFI AMD/JEDEC-compatible flash chips' CONFIG_MTD_JEDECPROBE $CONFIG_MTD
 
-if [ "$CONFIG_MTD_CFI" = "y" -o "$CONFIG_MTD_INTELPROBE" = "y" -o "$CONFIG_MTD_JEDECPROBE" = "y" ]; then
-   define_bool CONFIG_MTD_GEN_PROBE y
-else
-   if [ "$CONFIG_MTD_CFI" = "m" -o "$CONFIG_MTD_INTELPROBE" = "m" -o "$CONFIG_MTD_JEDECPROBE" = "m" ]; then
-      define_bool CONFIG_MTD_GEN_PROBE m
+   if [ "$CONFIG_MTD_CFI" = "y" -o "$CONFIG_MTD_INTELPROBE" = "y" -o "$CONFIG_MTD_JEDECPROBE" = "y" ]; then
+      define_bool CONFIG_MTD_GEN_PROBE y
    else
-      define_bool CONFIG_MTD_GEN_PROBE n
+      if [ "$CONFIG_MTD_CFI" = "m" -o "$CONFIG_MTD_INTELPROBE" = "m" -o "$CONFIG_MTD_JEDECPROBE" = "m" ]; then
+         define_bool CONFIG_MTD_GEN_PROBE m
+      else
+         define_bool CONFIG_MTD_GEN_PROBE n
+      fi
    fi
-fi
-if [ "$CONFIG_MTD_GEN_PROBE" = "y" -o "$CONFIG_MTD_GEN_PROBE" = "m" ]; then
-   bool '  Flash chip driver advanced configuration options' CONFIG_MTD_CFI_ADV_OPTIONS
-   if [ "$CONFIG_MTD_CFI_ADV_OPTIONS" = "y" ]; then
-     choice 'Flash cmd/query data swapping'			\
-	"NO			CONFIG_MTD_CFI_NOSWAP		\
-	 BIG_ENDIAN_BYTE	CONFIG_MTD_CFI_BE_BYTE_SWAP	\
-	 LITTLE_ENDIAN_BYTE	CONFIG_MTD_CFI_LE_BYTE_SWAP"	NO
-     bool '  Specific CFI Flash geometry selection' CONFIG_MTD_CFI_GEOMETRY
-     if [ "$CONFIG_MTD_CFI_GEOMETRY" = "y" ]; then
-       bool '    Support  8-bit buswidth' CONFIG_MTD_CFI_B1
-       bool '    Support 16-bit buswidth' CONFIG_MTD_CFI_B2
-       bool '    Support 32-bit buswidth' CONFIG_MTD_CFI_B4
-	 if [ "$CONFIG_MTD_CFI_B1" = "y" ]; then
-	   define_bool CONFIG_MTD_CFI_I1 y
-         else
-           bool '    Support 1-chip flash interleave' CONFIG_MTD_CFI_I1
-	 fi
-       bool '    Support 2-chip flash interleave' CONFIG_MTD_CFI_I2
-       bool '    Support 4-chip flash interleave' CONFIG_MTD_CFI_I4
+   if [ "$CONFIG_MTD_GEN_PROBE" = "y" -o "$CONFIG_MTD_GEN_PROBE" = "m" ]; then
+      bool '  Flash chip driver advanced configuration options' CONFIG_MTD_CFI_ADV_OPTIONS
+      if [ "$CONFIG_MTD_CFI_ADV_OPTIONS" = "y" ]; then
+        choice 'Flash cmd/query data swapping'			\
+   	"NO			CONFIG_MTD_CFI_NOSWAP		\
+   	 BIG_ENDIAN_BYTE	CONFIG_MTD_CFI_BE_BYTE_SWAP	\
+   	 LITTLE_ENDIAN_BYTE	CONFIG_MTD_CFI_LE_BYTE_SWAP"	NO
+        bool '  Specific CFI Flash geometry selection' CONFIG_MTD_CFI_GEOMETRY
+        if [ "$CONFIG_MTD_CFI_GEOMETRY" = "y" ]; then
+          bool '    Support  8-bit buswidth' CONFIG_MTD_CFI_B1
+          bool '    Support 16-bit buswidth' CONFIG_MTD_CFI_B2
+          bool '    Support 32-bit buswidth' CONFIG_MTD_CFI_B4
+   	 if [ "$CONFIG_MTD_CFI_B1" = "y" ]; then
+   	   define_bool CONFIG_MTD_CFI_I1 y
+   	 else
+   	   bool '    Support 1-chip flash interleave' CONFIG_MTD_CFI_I1
+   	 fi
+          bool '    Support 2-chip flash interleave' CONFIG_MTD_CFI_I2
+          bool '    Support 4-chip flash interleave' CONFIG_MTD_CFI_I4
+        fi
      fi
-  fi
-fi
-dep_tristate '  Support for Intel/Sharp flash chips' CONFIG_MTD_CFI_INTELEXT $CONFIG_MTD_GEN_PROBE
-dep_tristate '  Support for AMD/Fujitsu flash chips' CONFIG_MTD_CFI_AMDSTD $CONFIG_MTD_GEN_PROBE
-
-dep_tristate '  Support for RAM chips in bus mapping' CONFIG_MTD_RAM $CONFIG_MTD
-dep_tristate '  Support for ROM chips in bus mapping' CONFIG_MTD_ROM $CONFIG_MTD
-dep_tristate '  Support for absent chips in bus mapping' CONFIG_MTD_ABSENT $CONFIG_MTD
+   fi
+   dep_tristate '  Support for Intel/Sharp flash chips' CONFIG_MTD_CFI_INTELEXT $CONFIG_MTD_GEN_PROBE
+   dep_tristate '  Support for AMD/Fujitsu flash chips' CONFIG_MTD_CFI_AMDSTD $CONFIG_MTD_GEN_PROBE
 
-bool '  Older (theoretically obsoleted now) drivers for non-CFI chips' CONFIG_MTD_OBSOLETE_CHIPS
-dep_tristate '  AMD compatible flash chip support (non-CFI)' CONFIG_MTD_AMDSTD $CONFIG_MTD $CONFIG_MTD_OBSOLETE_CHIPS
-dep_tristate '  pre-CFI Sharp chip support' CONFIG_MTD_SHARP $CONFIG_MTD $CONFIG_MTD_OBSOLETE_CHIPS
-dep_tristate '  JEDEC device support' CONFIG_MTD_JEDEC $CONFIG_MTD $CONFIG_MTD_OBSOLETE_CHIPS
+   dep_tristate '  Support for RAM chips in bus mapping' CONFIG_MTD_RAM $CONFIG_MTD
+   dep_tristate '  Support for ROM chips in bus mapping' CONFIG_MTD_ROM $CONFIG_MTD
+   dep_tristate '  Support for absent chips in bus mapping' CONFIG_MTD_ABSENT $CONFIG_MTD
 
+   bool '  Older (theoretically obsoleted now) drivers for non-CFI chips' CONFIG_MTD_OBSOLETE_CHIPS
+   dep_tristate '  AMD compatible flash chip support (non-CFI)' CONFIG_MTD_AMDSTD $CONFIG_MTD $CONFIG_MTD_OBSOLETE_CHIPS
+   dep_tristate '  pre-CFI Sharp chip support' CONFIG_MTD_SHARP $CONFIG_MTD $CONFIG_MTD_OBSOLETE_CHIPS
+   dep_tristate '  JEDEC device support' CONFIG_MTD_JEDEC $CONFIG_MTD $CONFIG_MTD_OBSOLETE_CHIPS
+fi
 
 endmenu
diff -Naur linux-2.4.19/drivers/mtd/devices/Config.in linux-2.4.19-murrel/drivers/mtd/devices/Config.in
--- linux-2.4.19/drivers/mtd/devices/Config.in	Fri Oct  5 00:13:18 2001
+++ linux-2.4.19-murrel/drivers/mtd/devices/Config.in	Thu Oct 31 19:17:22 2002
@@ -10,7 +10,7 @@
    bool '    PMC551 256M DRAM Bugfix' CONFIG_MTD_PMC551_BUGFIX
    bool '    PMC551 Debugging' CONFIG_MTD_PMC551_DEBUG
 fi
-dep_tristate '  Uncached system RAM' CONFIG_MTD_SLRAM $CONFIG_MTD
+dep_tristate '  Uncached system RAM' CONFIG_MTD_SLRAM $CONFIG_MTD "$CONFIG_MEMORY_BUS"
 if [ "$CONFIG_SA1100_LART" = "y" ]; then
   dep_tristate '  28F160xx flash driver for LART' CONFIG_MTD_LART $CONFIG_MTD
 fi
@@ -24,7 +24,8 @@
 fi
 dep_tristate '  MTD emulation using block device' CONFIG_MTD_BLKMTD $CONFIG_MTD
 
-comment 'Disk-On-Chip Device Drivers'
+if [ "$CONFIG_MEMORY_BUS" ]; then
+   comment 'Disk-On-Chip Device Drivers'
    dep_tristate '  M-Systems Disk-On-Chip 1000' CONFIG_MTD_DOC1000 $CONFIG_MTD
    dep_tristate '  M-Systems Disk-On-Chip 2000 and Millennium' CONFIG_MTD_DOC2000 $CONFIG_MTD
    dep_tristate '  M-Systems Disk-On-Chip Millennium-only alternative driver (see help)' CONFIG_MTD_DOC2001 $CONFIG_MTD
@@ -50,6 +51,7 @@
          bool '    Probe for 0x55 0xAA BIOS Extension Signature' CONFIG_MTD_DOCPROBE_55AA
       fi
    fi
+fi
 
 
 endmenu
diff -Naur linux-2.4.19/drivers/mtd/nand/Config.in linux-2.4.19-murrel/drivers/mtd/nand/Config.in
--- linux-2.4.19/drivers/mtd/nand/Config.in	Fri Oct  5 00:13:18 2001
+++ linux-2.4.19-murrel/drivers/mtd/nand/Config.in	Thu Oct 31 19:15:55 2002
@@ -6,7 +6,7 @@
 
 comment 'NAND Flash Device Drivers'
 
-dep_tristate '  NAND Device Support' CONFIG_MTD_NAND $CONFIG_MTD
+dep_tristate '  NAND Device Support' CONFIG_MTD_NAND $CONFIG_MTD "$CONFIG_MEMORY_BUS"
 if [ "$CONFIG_MTD_NAND" = "y" -o "$CONFIG_MTD_NAND" = "m" ]; then
    bool '    Enable ECC correction algorithm'  CONFIG_MTD_NAND_ECC
    bool '    Verify NAND page writes' CONFIG_MTD_NAND_VERIFY_WRITE
