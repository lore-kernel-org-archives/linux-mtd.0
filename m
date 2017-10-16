Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e424I-0005j5-I0
 for linux-mtd@lists.infradead.org; Mon, 16 Oct 2017 09:52:20 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/2] mtd: nand: mxc: lower ECC failed message priority to
 debug level
Date: Mon, 16 Oct 2017 11:51:54 +0200
Message-Id: <20171016095155.29174-2-s.hauer@pengutronix.de>
In-Reply-To: <20171016095155.29174-1-s.hauer@pengutronix.de>
References: <20171016095155.29174-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Having bad ECC is a normal case for NAND, do not spam log with the
message. Users like UBI will print a message anyway which is more
useful since it contains the PEB number that has bad ECC.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 53e5e0337c3e..bec9ec5bbb8c 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -634,7 +634,7 @@ static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
 	do {
 		err = ecc_stat & ecc_bit_mask;
 		if (err > err_limit) {
-			printk(KERN_WARNING "UnCorrectable RS-ECC Error\n");
+			dev_dbg(host->dev, "UnCorrectable RS-ECC Error\n");
 			return -EBADMSG;
 		} else {
 			ret += err;
-- 
2.11.0
