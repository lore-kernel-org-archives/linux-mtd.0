Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqJbE-0002ZC-Rq
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 12:08:51 +0000
Received: by mail-lf0-x231.google.com with SMTP id j11so66343514lfb.1
 for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2016 05:08:28 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 7/9] mtd: nand: fsl_upm: set ECC algorithm explicitly
Date: Wed, 13 Apr 2016 14:07:00 +0200
Message-Id: <1460549222-24198-8-git-send-email-zajec5@gmail.com>
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
 drivers/mtd/nand/fsl_upm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index cafd12d..d85fa25 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -170,6 +170,7 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	fun->chip.read_buf = fun_read_buf;
 	fun->chip.write_buf = fun_write_buf;
 	fun->chip.ecc.mode = NAND_ECC_SOFT;
+	fun->chip.ecc.algo = NAND_ECC_HAMMING;
 	if (fun->mchip_count > 1)
 		fun->chip.select_chip = fun_select_chip;
 
-- 
1.8.4.5
