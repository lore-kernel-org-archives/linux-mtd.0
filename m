Received: from rv-out-0708.google.com ([209.85.198.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JvITN-00035L-Sl
	for linux-mtd@lists.infradead.org; Sun, 11 May 2008 20:48:46 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2333139rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 May 2008 13:48:44 -0700 (PDT)
Message-ID: <cd73a99e0805111348g667d1e63j38379d66f55c062c@mail.gmail.com>
Date: Sun, 11 May 2008 22:48:44 +0200
From: "Andrew Victor" <avictor.za@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: AT91 NAND ECC default
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

Can this be merged upstream ASAP.
There will most likely be data-corruption without it.

---

All existing systems where the AT91 NAND driver is used operate with
Software ECC.
With the recently merged (2.6.26-rc1) Hardware ECC support for this
driver, the default is now set to Hardware ECC which causes existing
filesystems to be incompatible.

This patch swaps the KConfig option so Software ECC is once again the default.

Also indicates that Hardware ECC is available on the AT91SAM9RL and
AT91CAP9 processors.
(And there also seems to be a duplicate 'endchoice')


Signed-off-by: Andrew Victor <linux@maxim.org.za>




diff -urN -x CVS linux-2.6.26-rc1/drivers/mtd/nand/Kconfig
linux-2.6/drivers/mtd/nand/Kconfig
--- linux-2.6.26-rc1/drivers/mtd/nand/Kconfig	2008-05-10
16:26:49.000000000 +0200
+++ linux-2.6/drivers/mtd/nand/Kconfig	2008-05-11 22:24:19.000000000 +0200
@@ -273,7 +273,7 @@
 	  If you say "m", the module will be called "cs553x_nand.ko".

 config MTD_NAND_AT91
-	bool "Support for NAND Flash / SmartMedia on AT91"
+	tristate "Support for NAND Flash / SmartMedia on AT91"
 	depends on ARCH_AT91
 	help
 	  Enables support for NAND Flash / Smart Media Card interface
@@ -282,11 +282,20 @@
 	prompt "ECC management for NAND Flash / SmartMedia on AT91"
 	depends on MTD_NAND_AT91

+config MTD_NAND_AT91_ECC_SOFT
+	bool "Software ECC"
+	help
+	  Uses software ECC.
+
+	  NB : hardware and software ECC schemes are incompatible.
+	  If you switch from one to another, you'll have to erase your
+	  mtd partition.
+
 config MTD_NAND_AT91_ECC_HW
 	bool "Hardware ECC"
-	depends on ARCH_AT91SAM9263 || ARCH_AT91SAM9260
+	depends on ARCH_AT91SAM9263 || ARCH_AT91SAM9260 || ARCH_AT91SAM9RL
|| ARCH_AT91CAP9
 	help
-	  Uses hardware ECC provided by the at91sam9260/at91sam9263 chip
+	  Uses hardware ECC provided by some AT91 processors
 	  instead of software ECC.
 	  The hardware ECC controller is capable of single bit error
 	  correction and 2-bit random detection per page.
@@ -297,15 +306,6 @@

 	  If unsure, say Y

-config MTD_NAND_AT91_ECC_SOFT
-	bool "Software ECC"
-	help
-	  Uses software ECC.
-
-	  NB : hardware and software ECC schemes are incompatible.
-	  If you switch from one to another, you'll have to erase your
-	  mtd partition.
-
 config MTD_NAND_AT91_ECC_NONE
 	bool "No ECC (testing only, DANGEROUS)"
 	depends on DEBUG_KERNEL
@@ -316,8 +316,6 @@

 	  If unsure, say N

-	  endchoice
-
 endchoice

 config MTD_NAND_PXA3xx
