Received: from ext-nj2gw-5.online-age.net ([64.14.56.41])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BE2jP-0007TD-6M
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 10:00:23 +0100
Received: from int-nj2gw-1.online-age.net (int-nj2gw-1 [3.159.236.65])
	id i3F908ER014167	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Apr 2004 05:00:09 -0400 (EDT)
Received: from cinmlef01.e2k.ad.ge.com (localhost [127.0.0.1])
	id i3F907bu019331	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Apr 2004 05:00:08 -0400 (EDT)
From: Martin Donnelly <martin.donnelly@ge.com>
To: Tobias Arp <tobiasarp@web.de>
In-Reply-To: <1082019533.16750.35.camel@scapa.ramix-uk.cho.ge.com>
References: <1193074139@web.de>
	 <1082019533.16750.35.camel@scapa.ramix-uk.cho.ge.com>
Content-Type: multipart/mixed; boundary="=-g/wRRhHnmzcYBKNe0q2k"
Message-Id: <1082019603.16753.37.camel@scapa.ramix-uk.cho.ge.com>
Mime-Version: 1.0
Date: Thu, 15 Apr 2004 10:00:03 +0100
cc: linux-mtd@lists.infradead.org
Subject: Re: patch kernel 2.4.21 (including the arm-linux patch rmk2) with
	the latest CVS snapshot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-g/wRRhHnmzcYBKNe0q2k
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2004-04-15 at 09:58, Martin Donnelly wrote:
> Apply the two attached patches chips-config.patch to
> 'drivers/mtd/chips/Config.in' and nand-config.patch to
> 'drivers/mtd/nand/Config.in' which should sort out a couple of syntax
> errors. e.g `cd linux-2.4.21; patch -p1 -i chips-config.patch`

And it helps if the patches are attached :-)

Cheers
-- 
Martin Donnelly


--=-g/wRRhHnmzcYBKNe0q2k
Content-Disposition: attachment; filename=chips-config.patch
Content-Type: text/plain; name=chips-config.patch; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

--- linux-2.4.22/drivers/mtd/chips/Config.in.orig	2004-04-13 16:40:33.000000000 +0100
+++ linux-2.4.22/drivers/mtd/chips/Config.in	2004-04-13 16:41:20.000000000 +0100
@@ -11,10 +11,12 @@
 
 if [ "$CONFIG_MTD_CFI" = "y" -o "$CONFIG_MTD_JEDECPROBE" = "y" ]; then
    define_bool CONFIG_MTD_GEN_PROBE y
-elif [ "$CONFIG_MTD_CFI" = "m" -o "$CONFIG_MTD_JEDECPROBE" = "m" ]; then
-   define_bool CONFIG_MTD_GEN_PROBE m
 else
-   define_bool CONFIG_MTD_GEN_PROBE n
+   if [ "$CONFIG_MTD_CFI" = "m" -o "$CONFIG_MTD_JEDECPROBE" = "m" ]; then
+      define_bool CONFIG_MTD_GEN_PROBE m
+   else
+      define_bool CONFIG_MTD_GEN_PROBE n
+   fi
 fi
 
 if [ "$CONFIG_MTD_GEN_PROBE" = "y" -o "$CONFIG_MTD_GEN_PROBE" = "m" ]; then
@@ -49,12 +51,14 @@
 	-o "$CONFIG_MTD_CFI_AMDSTD" = "y" \
 	-o "$CONFIG_MTD_CFI_STAA" = "y" ]; then
    define_bool CONFIG_MTD_CFI_UTIL y
-elif [ "$CONFIG_MTD_CFI_INTELEXT" = "m" \
-	-o "$CONFIG_MTD_CFI_AMDSTD" = "m" \
-	-o "$CONFIG_MTD_CFI_STAA" = "m" ]; then
-   define_bool CONFIG_MTD_CFI_UTIL m
 else
-   define_bool CONFIG_MTD_CFI_UTIL n
+   if [ "$CONFIG_MTD_CFI_INTELEXT" = "m" \
+	 -o "$CONFIG_MTD_CFI_AMDSTD" = "m" \
+	 -o "$CONFIG_MTD_CFI_STAA" = "m" ]; then
+      define_bool CONFIG_MTD_CFI_UTIL m
+   else
+      define_bool CONFIG_MTD_CFI_UTIL n
+   fi
 fi
 
 dep_tristate '  Support for RAM chips in bus mapping' CONFIG_MTD_RAM $CONFIG_MTD

--=-g/wRRhHnmzcYBKNe0q2k
Content-Disposition: attachment; filename=nand-config.patch
Content-Type: text/plain; name=nand-config.patch; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

--- linux-2.4.22/drivers/mtd/nand/Config.in.orig	2004-04-13 16:47:02.000000000 +0100
+++ linux-2.4.22/drivers/mtd/nand/Config.in	2004-04-13 16:47:23.000000000 +0100
@@ -35,7 +35,6 @@
 fi
 
 if [ "$CONFIG_PPCHAMELEONEVB" = "y" ]; then
-    dep_tristate '  NAND Flash device on PPChameleonEVB board' 
-    CONFIG_MTD_NAND_PPCHAMELEONEVB $CONFIG_MTD_NAND
+    dep_tristate '  NAND Flash device on PPChameleonEVB board' CONFIG_MTD_NAND_PPCHAMELEONEVB $CONFIG_MTD_NAND
 fi
 endmenu

--=-g/wRRhHnmzcYBKNe0q2k--
