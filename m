Received: from kukac.halom.u-szeged.hu ([160.114.44.1])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Da7Rc-0004W9-Tu
	for linux-mtd@lists.infradead.org; Mon, 23 May 2005 03:33:50 -0400
Received: from pajko (helo=localhost)
	by kukac.halom.u-szeged.hu with local-esmtp (Exim 4.34)
	id 1Da7RG-0007au-9m
	for linux-mtd@lists.infradead.org; Mon, 23 May 2005 09:33:27 +0200
Date: Mon, 23 May 2005 09:33:26 +0200 (CEST)
From: Kluba Patrik <pajko@kukac.halom.u-szeged.hu>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.61.0505230926540.25999@kukac.halom.u-szeged.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Sender: Kluba Patrik <pajko@halom.u-szeged.hu>
Subject: [PATCH][01/03] nandsim bugfix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi!

There are two bugs in nandsim. The first is in Kconfig. MTD_NAND_NANDSIM is 
defined as a bool value, so it can have a value of 'y' or be undefined. This way 
nandsim cannot be compiled as a module, it will directly go into the kernel.

The second bug is in nandsim.c. Large page chips <=128M use 4 bytes for 
addressing, not 5.

Here is a patch.

Bye,
   Patrik Kluba

--
diff -Naur mtd/drivers/mtd/nand/Kconfig mtd-work/drivers/mtd/nand/Kconfig
--- mtd/drivers/mtd/nand/Kconfig	2005-01-05 13:42:24.000000000 +0100
+++ mtd-work/drivers/mtd/nand/Kconfig	2005-05-23 07:43:43.000000000 +0200
@@ -197,11 +197,11 @@
   	depends on MTD_NAND	&& ARCH_PXA

   config MTD_NAND_NANDSIM
- 	bool "Support for NAND Flash Simulator"
- 	depends on MTD_NAND && MTD_PARTITIONS
+ 	tristate "Support for NAND Flash Simulator"
+ 	depends on m && MTD_NAND && MTD_PARTITIONS

  	help
  	  The simulator may simulate verious NAND flash chips for the
  	  MTD nand layer.
- 
+
  endmenu
diff -Naur mtd/drivers/mtd/nand/nandsim.c mtd-work/drivers/mtd/nand/nandsim.c
--- mtd/drivers/mtd/nand/nandsim.c	2005-03-19 16:33:56.000000000 +0100
+++ mtd-work/drivers/mtd/nand/nandsim.c	2005-05-23 07:48:34.000000000 +0200
@@ -406,7 +406,7 @@
  		}
  	} else {
  		if (ns->geom.totsz <= (128 << 20)) {
-			ns->geom.pgaddrbytes  = 5;
+			ns->geom.pgaddrbytes  = 4;
  			ns->geom.secaddrbytes = 2;
  		} else {
  			ns->geom.pgaddrbytes  = 5;
