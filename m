Received: from mail-lf0-x22a.google.com ([2a00:1450:4010:c07::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqJbH-0002eQ-CD
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 12:08:53 +0000
Received: by mail-lf0-x22a.google.com with SMTP id e190so66618495lfe.0
 for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2016 05:08:31 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 9/9] mtd: nand: fsl_elbc: set ECC algorithm explicitly
Date: Wed, 13 Apr 2016 14:07:02 +0200
Message-Id: <1460549222-24198-10-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460549222-24198-1-git-send-email-zajec5@gmail.com>
References: <1460549222-24198-1-git-send-email-zajec5@gmail.com>
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
 drivers/mtd/nand/fsl_elbc_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 059d5f7..9d2d191 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -789,6 +789,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	} else {
 		/* otherwise fall back to default software ECC */
 		chip->ecc.mode = NAND_ECC_SOFT;
+		chip->ecc.algo = NAND_ECC_HAMMING;
 	}
 
 	return 0;
-- 
1.8.4.5
