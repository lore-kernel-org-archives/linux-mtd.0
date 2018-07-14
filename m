Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1feNTl-0002SG-Md
 for linux-mtd@lists.infradead.org; Sat, 14 Jul 2018 16:33:08 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: tegra: fix error handling of subop helpers
Date: Sat, 14 Jul 2018 18:32:51 +0200
Message-Id: <20180714163251.7773-1-miquel.raynal@bootlin.com>
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

A report from Colin Ian King pointed a CoverityScan issue where error
values on these helpers where not checked in the drivers. These
helpers could error out only in case of a software bug in driver code,
not because of a runtime/hardware error but in any cases it is safer
to handle these errors properly.

Fix the Tegra NAND controller driver implementation by checking
potential negative error values coming from these helpers.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

This patch should have been part of the following series:
http://lists.infradead.org/pipermail/linux-mtd/2018-July/082654.html
It will be squashed with original commit introducing this driver.

Thanks,
Miquèl

drivers/mtd/nand/raw/tegra_nand.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 22d6a7f9ff80..59ead8f41718 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -379,6 +379,9 @@ static int tegra_nand_cmd(struct nand_chip *chip,
 		case NAND_OP_ADDR_INSTR:
 			offset = nand_subop_get_addr_start_off(subop, op_id);
 			naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
+			if (offset < 0 || naddrs < 0)
+				return -EINVAL;
+
 			addrs = &instr->ctx.addr.addrs[offset];
 
 			cmd |= COMMAND_ALE | COMMAND_ALE_SIZE(naddrs);
@@ -395,6 +398,8 @@ static int tegra_nand_cmd(struct nand_chip *chip,
 		case NAND_OP_DATA_IN_INSTR:
 			size = nand_subop_get_data_len(subop, op_id);
 			offset = nand_subop_get_data_start_off(subop, op_id);
+			if (size < 0 || offset < 0)
+				return -EINVAL;
 
 			cmd |= COMMAND_TRANS_SIZE(size) | COMMAND_PIO |
 				COMMAND_RX | COMMAND_A_VALID;
@@ -405,6 +410,8 @@ static int tegra_nand_cmd(struct nand_chip *chip,
 		case NAND_OP_DATA_OUT_INSTR:
 			size = nand_subop_get_data_len(subop, op_id);
 			offset = nand_subop_get_data_start_off(subop, op_id);
+			if (size < 0 || offset < 0)
+				return -EINVAL;
 
 			cmd |= COMMAND_TRANS_SIZE(size) | COMMAND_PIO |
 				COMMAND_TX | COMMAND_A_VALID;
-- 
2.14.1
