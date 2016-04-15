Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ar9pz-0004no-Ge
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 19:55:32 +0000
Received: by mail-wm0-x236.google.com with SMTP id u206so46579627wme.1
 for <linux-mtd@lists.infradead.org>; Fri, 15 Apr 2016 12:55:14 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Haavard Skinnemoen <hskinnemoen@gmail.com>,
 Hans-Christian Egtvedt <egtvedt@samfundet.no>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alan Stern <stern@rowland.harvard.edu>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 03/12] avr32: set Atmel NAND ECC algorithm explicitly
Date: Fri, 15 Apr 2016 21:54:03 +0200
Message-Id: <1460750052-16285-4-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is part of process deprecating NAND_ECC_SOFT_BCH (and switching to
enum nand_ecc_algo).

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 arch/avr32/boards/atngw100/setup.c      | 1 +
 arch/avr32/boards/atstk1000/atstk1002.c | 1 +
 include/linux/platform_data/atmel.h     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/avr32/boards/atngw100/setup.c b/arch/avr32/boards/atngw100/setup.c
index afeae89..b059b97 100644
--- a/arch/avr32/boards/atngw100/setup.c
+++ b/arch/avr32/boards/atngw100/setup.c
@@ -98,6 +98,7 @@ static struct atmel_nand_data atngw100mkii_nand_data __initdata = {
 	.enable_pin	= GPIO_PIN_PE(23),
 	.bus_width_16	= true,
 	.ecc_mode	= NAND_ECC_SOFT,
+	.ecc_algo	= NAND_ECC_HAMMING,
 	.parts		= nand_partitions,
 	.num_parts	= ARRAY_SIZE(nand_partitions),
 };
diff --git a/arch/avr32/boards/atstk1000/atstk1002.c b/arch/avr32/boards/atstk1000/atstk1002.c
index 6c80aba..6b45faf 100644
--- a/arch/avr32/boards/atstk1000/atstk1002.c
+++ b/arch/avr32/boards/atstk1000/atstk1002.c
@@ -96,6 +96,7 @@ static struct atmel_nand_data atstk1006_nand_data __initdata = {
 	.rdy_pin	= GPIO_PIN_PB(30),
 	.enable_pin	= GPIO_PIN_PB(29),
 	.ecc_mode	= NAND_ECC_SOFT,
+	.ecc_algo	= NAND_ECC_HAMMING,
 	.parts		= nand_partitions,
 	.num_parts	= ARRAY_SIZE(nand_partitions),
 };
diff --git a/include/linux/platform_data/atmel.h b/include/linux/platform_data/atmel.h
index 3c8825b..a283b3d 100644
--- a/include/linux/platform_data/atmel.h
+++ b/include/linux/platform_data/atmel.h
@@ -33,6 +33,7 @@ struct atmel_nand_data {
 	u8		cle;			/* address line number connected to CLE */
 	u8		bus_width_16;		/* buswidth is 16 bit */
 	u8		ecc_mode;		/* ecc mode */
+	enum nand_ecc_algo ecc_algo;		/* ecc algorithm */
 	u8		on_flash_bbt;		/* bbt on flash */
 	struct mtd_partition *parts;
 	unsigned int	num_parts;
-- 
1.8.4.5
