Received: from yw-out-1718.google.com ([74.125.46.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JwCO4-000123-BN
	for linux-mtd@lists.infradead.org; Wed, 14 May 2008 08:31:01 +0000
Received: by yw-out-1718.google.com with SMTP id 5so3428068ywm.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 May 2008 01:30:58 -0700 (PDT)
Message-ID: <80b317760805140130j41565cb9gf605c0b510fab584@mail.gmail.com>
Date: Wed, 14 May 2008 10:30:58 +0200
From: "Richard Genoud" <richard.genoud@gmail.com>
To: "Andrew Victor" <avictor.za@gmail.com>
Subject: Re: AT91 NAND ECC default
In-Reply-To: <cd73a99e0805111348g667d1e63j38379d66f55c062c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <cd73a99e0805111348g667d1e63j38379d66f55c062c@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/5/11 Andrew Victor <avictor.za@gmail.com>:
> hi,
>
>  Can this be merged upstream ASAP.
>  There will most likely be data-corruption without it.
>
Andrew, your mail client introduced some line wrapping.
Here it is with no error.
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
Acked-by: Richard Genoud <richard.genoud@gmail.com>


--- linux-2.6.26-rc2/drivers/mtd/nand/Kconfig.orig	2008-05-14
09:03:24.000000000 +0200
+++ linux-2.6.26-rc2/drivers/mtd/nand/Kconfig	2008-05-14
10:15:10.000000000 +0200
@@ -273,7 +273,7 @@ config MTD_NAND_CS553X
 	  If you say "m", the module will be called "cs553x_nand.ko".

 config MTD_NAND_AT91
-	bool "Support for NAND Flash / SmartMedia on AT91"
+	tristate "Support for NAND Flash / SmartMedia on AT91"
 	depends on ARCH_AT91
 	help
 	  Enables support for NAND Flash / Smart Media Card interface
@@ -282,11 +282,21 @@ choice
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
+	depends on ARCH_AT91SAM9263 || ARCH_AT91SAM9260 \
+		|| ARCH_AT91SAM9RL || ARCH_AT91CAP9
 	help
-	  Uses hardware ECC provided by the at91sam9260/at91sam9263 chip
+	  Uses hardware ECC provided by some AT91 processors
 	  instead of software ECC.
 	  The hardware ECC controller is capable of single bit error
 	  correction and 2-bit random detection per page.
@@ -297,15 +307,6 @@ config MTD_NAND_AT91_ECC_HW

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
@@ -316,8 +317,6 @@ config MTD_NAND_AT91_ECC_NONE

 	  If unsure, say N

-	  endchoice
-
 endchoice

 config MTD_NAND_PXA3xx
