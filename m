Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQXev-0005tR-R3
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2017 10:58:39 +0000
Date: Mon, 9 Jan 2017 11:58:14 +0100
From: Jean Delvare <jdelvare@suse.de>
To: linux-mtd@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH] mtd: nand: Add OX820 NAND hardware dependency
Message-ID: <20170109115814.022fd08f@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The oxnas NAND driver is only needed for a specific platform, do
not propose it on other platforms unless build-testing.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Fixes: 668592492409 ("mtd: nand: Add OX820 NAND Support")
Cc: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/nand/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-4.10-rc2.orig/drivers/mtd/nand/Kconfig	2017-01-09 11:44:05.151733169 +0100
+++ linux-4.10-rc2/drivers/mtd/nand/Kconfig	2017-01-09 11:44:32.431065848 +0100
@@ -426,6 +426,7 @@ config MTD_NAND_ORION
 
 config MTD_NAND_OXNAS
 	tristate "NAND Flash support for Oxford Semiconductor SoC"
+	depends on ARCH_OXNAS || COMPILE_TEST
 	help
 	  This enables the NAND flash controller on Oxford Semiconductor SoCs.
 


-- 
Jean Delvare
SUSE L3 Support
