Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ar9qM-0004wz-1J
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 19:55:54 +0000
Received: by mail-wm0-x234.google.com with SMTP id n3so46873090wmn.0
 for <linux-mtd@lists.infradead.org>; Fri, 15 Apr 2016 12:55:33 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eva Rachel Retuya <eraretuya@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Manuel=20P=C3=A9gouri=C3=A9-Gonnard?= <mpg@elzevir.fr>,
 Janani Ravichandran <janani.rvchndrn@gmail.com>,
 devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 06/12] staging: mt29f_spinand: set ECC algorithm explicitly
Date: Fri, 15 Apr 2016 21:54:06 +0200
Message-Id: <1460750052-16285-7-git-send-email-zajec5@gmail.com>
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
