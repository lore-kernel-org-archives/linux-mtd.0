Received: from mail-ew0-f173.google.com ([209.85.219.173])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8cLh-0007Hv-5q
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 15:44:32 +0000
Received: by ewy21 with SMTP id 21so2834429ewy.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 May 2009 08:44:22 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 25 May 2009 17:44:22 +0200
Message-ID: <72795ccb0905250844w13ed9798me95d70614050f676@mail.gmail.com>
Subject: [PATCH] mtd: Nand Atmel: add On Flash BBT support
From: simon polette <spolette@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-arm-kernel@lists.arm.linux.org.uk
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: spolette@adetelgroup.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here is a patch which add support for On Flash Bad Block Table on AT91 and
AVR32 devices.

Signed-off-by: Simon Polette <spolette@adetelgroup.com>
---
 drivers/mtd/nand/Kconfig      |    9 +++++++++
 drivers/mtd/nand/atmel_nand.c |    3 +++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 890936d..c860688 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -333,6 +333,15 @@ config MTD_NAND_ATMEL_ECC_NONE

 endchoice

+config	MTD_NAND_ATMEL_FLASH_BBT
+	bool "Use On-Flash Bad Block Table"
+	depends on MTD_NAND_ATMEL
+	help
+	  This enables the On-Flash BBT, which mean that the bad blocks
+	  will be scanned one time then the BBT will be stored
+	  in flash, so scanning Nand flash for bad blocks will be no more
+	  necessary for the next boots.
+
 config MTD_NAND_PXA3xx
 	tristate "Support for NAND flash devices on PXA3xx"
 	depends on MTD_NAND && PXA3xx
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 47a33ce..dca19dd 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -464,6 +464,9 @@ static int __init atmel_nand_probe(struct
platform_device *pdev)
 			goto err_no_card;
 		}
 	}
+#ifdef CONFIG_MTD_NAND_ATMEL_FLASH_BBT
+	nand_chip->options |= NAND_USE_FLASH_BBT;
+#endif

 	/* first scan to find the device and get the page size */
 	if (nand_scan_ident(mtd, 1)) {
-- 
1.6.0.4

--
Best regards,
Simon Polette
Adeneo - Adetelgroup
