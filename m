Received: from mail-lf0-x22a.google.com ([2a00:1450:4010:c07::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arqFV-0002WE-NH
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2016 17:12:42 +0000
Received: by mail-lf0-x22a.google.com with SMTP id g184so193603621lfb.3
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2016 10:12:21 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V2 06/11] mtd: nand: set ECC algorithm to Hamming on fallback
Date: Sun, 17 Apr 2016 19:11:39 +0200
Message-Id: <1460913104-27388-7-git-send-email-zajec5@gmail.com>
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
 drivers/mtd/nand/nand_base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index dd02c09..e1f3cf8 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4245,6 +4245,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		pr_warn("%d byte HW ECC not possible on %d byte page size, fallback to SW ECC\n",
 			ecc->size, mtd->writesize);
 		ecc->mode = NAND_ECC_SOFT;
+		ecc->algo = NAND_ECC_HAMMING;
 
 	case NAND_ECC_SOFT:
 		ecc->calculate = nand_calculate_ecc;
-- 
1.8.4.5
