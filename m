Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXd0v-00062Y-4K
 for linux-mtd@lists.infradead.org; Fri, 14 Dec 2018 02:15:42 +0000
From: Purna Chandra Mandal <purna.chandra.mandal@intel.com>
To: Fred Bloggs <f.blogs@napier.co.nz>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Purna Chandra Mandal <purna.chandra.mandal@intel.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: spi-nor: cadence-quadspi: write upto 8-bytes data in
 STIG mode
Date: Thu, 13 Dec 2018 18:15:16 -0800
Message-Id: <20181214021516.43609-1-purna.chandra.mandal@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

cadence-quadspi controller allows upto eight bytes of data to be transferred
in software Triggered Instruction generator (STIG) mode of operation. Lower
4 bytes are written through writedatalower and upper 4 bytes by
writedataupper register.

This patch allows all the 8 bytes to be written.

Signed-off-by: Purna Chandra Mandal <purna.chandra.mandal@intel.com>
---

 drivers/mtd/spi-nor/cadence-quadspi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 04cedd3a2bf6..990934387fea 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -420,7 +420,7 @@ static int cqspi_command_write(struct spi_nor *nor, const u8 opcode,
 	unsigned int data;
 	int ret;
 
-	if (n_tx > 4 || (n_tx && !txbuf)) {
+	if (n_tx > CQSPI_STIG_DATA_LEN_MAX || (n_tx && !txbuf)) {
 		dev_err(nor->dev,
 			"Invalid input argument, cmdlen %d txbuf 0x%p\n",
 			n_tx, txbuf);
@@ -435,8 +435,13 @@ static int cqspi_command_write(struct spi_nor *nor, const u8 opcode,
 		data = 0;
 		memcpy(&data, txbuf, n_tx);
 		writel(data, reg_base + CQSPI_REG_CMDWRITEDATALOWER);
-	}
 
+		if (n_tx > 4) {
+			data = 0;
+			memcpy(&data, txbuf + 4, n_tx - 4);
+			writel(data, reg_base + CQSPI_REG_CMDWRITEDATAUPPER);
+		}
+	}
 	ret = cqspi_exec_flash_cmd(cqspi, reg);
 	return ret;
 }
-- 
2.13.0
