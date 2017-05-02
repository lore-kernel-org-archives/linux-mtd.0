Received: from mail.base45.de ([2001:67c:2050:310::a:2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5Swc-0005Ki-5O
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 08:14:04 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Alexander Couzens <lynxis@fe80.eu>
Subject: [PATCH 2/3][v2] nand_base: use nand_ooblayout_lp_hamming_ops for 1bit
 hamming as default
Date: Tue,  2 May 2017 10:13:22 +0200
Message-Id: <20170502081323.3138-3-lynxis@fe80.eu>
In-Reply-To: <20170502081323.3138-1-lynxis@fe80.eu>
References: <20170313074641.28b383e7@bbrezillon>
 <20170502081323.3138-1-lynxis@fe80.eu>
In-Reply-To: <20170313074641.28b383e7@bbrezillon>
References: <20170313074641.28b383e7@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

commit 41b207a70d3a ("mtd: nand: implement the default mtd_ooblayout_ops")
uses a different ooblayout for platforms which doesn't set the
layout by itself. Use for 1bit hamming the old layout.

Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
---
 drivers/mtd/nand/nand_base.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index daf3df157885..6a9e99377181 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4724,7 +4724,11 @@ int nand_scan_tail(struct mtd_info *mtd)
 			break;
 		case 64:
 		case 128:
-			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+			if (ecc->algo == NAND_ECC_HAMMING && ecc->strength == 1)
+				mtd_set_ooblayout(mtd,
+						&nand_ooblayout_lp_hamming_ops);
+			else
+				mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
 			break;
 		default:
 			WARN(1, "No oob scheme defined for oobsize %d\n",
-- 
2.12.2
