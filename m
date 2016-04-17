Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arqFX-0002Wq-PU
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2016 17:12:44 +0000
Received: by mail-lf0-x22e.google.com with SMTP id c126so193700266lfb.2
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2016 10:12:23 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V2 07/11] mtd: nand: hisi504: set ECC algorithm based on DT
 info
Date: Sun, 17 Apr 2016 19:11:40 +0200
Message-Id: <1460913104-27388-8-git-send-email-zajec5@gmail.com>
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
This patch may be skipped if we apply
[PATCH 00/12] mtd: get rid of of_mtd.{c,h} and of_get_nand_xx()
patchset first.
---
 drivers/mtd/nand/hisi504_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
index 7bf844c..f917297 100644
--- a/drivers/mtd/nand/hisi504_nand.c
+++ b/drivers/mtd/nand/hisi504_nand.c
@@ -768,6 +768,7 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	chip->chip_delay	= HINFC504_CHIP_DELAY;
 
 	chip->ecc.mode = of_get_nand_ecc_mode(np);
+	chip->ecc.algo = of_get_nand_ecc_algo(np);
 
 	buswidth = of_get_nand_bus_width(np);
 	if (buswidth == 16)
-- 
1.8.4.5
