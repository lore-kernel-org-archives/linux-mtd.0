Received: from mailout.stusta.mhn.de ([141.84.69.5] helo=mailhub.stusta.mhn.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I1WTJ-0007m9-WE
	for linux-mtd@lists.infradead.org; Thu, 21 Jun 2007 19:53:56 -0400
Date: Fri, 22 Jun 2007 01:52:08 +0200
From: Adrian Bunk <bunk@stusta.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [2.6 patch] cafe_nand.c: the OLPC laptop is not available for $100
Message-ID: <20070621235208.GG23017@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The price might drop to $100 in a few years.

But currently, a more reasonable name might be "$175 laptop".

Let's simply call it "OLPC laptop" without any price tag.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

---
--- linux-2.6.22-rc4-mm2/drivers/mtd/nand/Kconfig.old	2007-06-21 23:32:02.000000000 +0200
+++ linux-2.6.22-rc4-mm2/drivers/mtd/nand/Kconfig	2007-06-21 23:32:17.000000000 +0200
@@ -234,13 +234,13 @@
 config MTD_NAND_CAFE
 	tristate "NAND support for OLPC CAFÉ chip"
 	depends on PCI
 	select REED_SOLOMON
 	select REED_SOLOMON_DEC16
 	help
-	  Use NAND flash attached to the CAFÉ chip designed for the $100
+	  Use NAND flash attached to the CAFÉ chip designed for the OLPC
 	  laptop.
 
 config MTD_NAND_CS553X
 	tristate "NAND support for CS5535/CS5536 (AMD Geode companion chip)"
 	depends on X86_32 && (X86_PC || X86_GENERICARCH)
 	help
