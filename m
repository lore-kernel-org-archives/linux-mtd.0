Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arqFT-0002VE-Kn
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2016 17:12:40 +0000
Received: by mail-lf0-x22f.google.com with SMTP id c126so193699305lfb.2
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2016 10:12:19 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Eva Rachel Retuya <eraretuya@gmail.com>,
 =?UTF-8?q?Manuel=20P=C3=A9gouri=C3=A9-Gonnard?= <mpg@elzevir.fr>,
 Janani Ravichandran <janani.rvchndrn@gmail.com>,
 devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V2 05/11] staging: mt29f_spinand: set ECC algorithm explicitly
Date: Sun, 17 Apr 2016 19:11:38 +0200
Message-Id: <1460913104-27388-6-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460913104-27388-1-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460913104-27388-1-git-send-email-zajec5@gmail.com>
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
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index f503699..e389009 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -900,6 +900,7 @@ static int spinand_probe(struct spi_device *spi_nand)
 	chip->ecc.write_page = spinand_write_page_hwecc;
 #else
 	chip->ecc.mode	= NAND_ECC_SOFT;
+	chip->ecc.algo	= NAND_ECC_HAMMING;
 	if (spinand_disable_ecc(spi_nand) < 0)
 		dev_info(&spi_nand->dev, "%s: disable ecc failed!\n",
 			 __func__);
-- 
1.8.4.5
