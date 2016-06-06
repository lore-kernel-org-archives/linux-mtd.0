From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] mtd: nand: sunxi: check ecc->size values
Date: Mon,  6 Jun 2016 13:59:13 +0200
Message-Id: <1465214354-31493-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1465214354-31493-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1465214354-31493-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Verify that the ecc->size value is either 512 or 1024 bytes.
This should always be the case if this field was assigned to the
nand->ecc_step_size_ds value, but can be wrong when the user overloaded
this value with the nand-ecc-step-size DT property.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/sunxi_nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index 4f5b4ad..252cbbf 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1784,6 +1784,9 @@ static int sunxi_nand_hw_common_ecc_ctrl_init(struct mtd_info *mtd,
 	if (!data)
 		return -ENOMEM;
 
+	if (ecc->size != 512 && ecc->size != 1024)
+		return -EINVAL;
+
 	/* Prefer 1k ECC chunk over 512 ones */
 	if (ecc->size == 512 && mtd->writesize > 512) {
 		ecc->size = 1024;
-- 
2.7.4
