Received: from smtp5-g21.free.fr ([212.27.42.5])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0CjR-0006Dk-MI
 for linux-mtd@lists.infradead.org; Mon, 06 Jan 2014 16:08:51 +0000
From: Denis Carikli <denis@eukrea.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCHv3][ 2/2] mtd: nand: mxc_nand: Add onfi & 4k flashs support.
Date: Mon,  6 Jan 2014 17:02:37 +0100
Message-Id: <1389024157-19279-2-git-send-email-denis@eukrea.com>
In-Reply-To: <1389024157-19279-1-git-send-email-denis@eukrea.com>
References: <1389024157-19279-1-git-send-email-denis@eukrea.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Denis Carikli <denis@eukrea.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 * CMD_PARAM and read_param were added to get the ONFI structure.
 * Fixed OOB size for flash with 224 OOB on i.MX51/3

Tested on an i.MX53 with:
NAND device: Manufacturer ID: 0x2c, Chip ID: 0x38 (Micron MT29F8G08ABABAWP)
NAND device: 1024MiB, SLC, page size: 4096, OOB size: 224

This patch was ported from that barebox commit:
  632c457 nand_imx: update to support onfi & 4k flashs

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Denis Carikli <denis@eukrea.com>
Signed-off-by: Eric Bénard <eric@eukrea.com>
---
ChangeLog v2->v3:
 * Removed unused code
 * Removed the "handle the read param special case"
   "bad hack" which is now handled with the following patch from this v3:
   mtd: nand: mxc_nand: Enforce a minimum mtd_info writesize default value.
 * some code style fixes such as function renaming,
   and a comparison made more clear.

ChangeLog v1->v2:
- Better commit message title.
---
 drivers/mtd/nand/mxc_nand.c |   35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index d4d8d66..9e73d46 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -145,6 +145,7 @@ struct mxc_nand_devtype_data {
 	void (*send_addr)(struct mxc_nand_host *, uint16_t, int);
 	void (*send_page)(struct mtd_info *, unsigned int);
 	void (*send_read_id)(struct mxc_nand_host *);
+	void (*send_read_param)(struct mxc_nand_host *);
 	uint16_t (*get_dev_status)(struct mxc_nand_host *);
 	int (*check_int)(struct mxc_nand_host *);
 	void (*irq_control)(struct mxc_nand_host *, int);
@@ -529,6 +530,16 @@ static void send_page_v1(struct mtd_info *mtd, unsigned int ops)
 	}
 }
 
+static void send_read_param_v2_v3(struct mxc_nand_host *host)
+{
+	/* Read ID into main buffer */
+	writel(NFC_OUTPUT, NFC_V3_LAUNCH);
+
+	wait_op_done(host, true);
+
+	memcpy32_fromio(host->data_buf, host->main_area0, 1024);
+}
+
 static void send_read_id_v3(struct mxc_nand_host *host)
 {
 	struct nand_chip *this = &host->nand;
@@ -840,9 +851,12 @@ static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
 		 * MXC NANDFC can only perform full page+spare or
 		 * spare-only read/write.  When the upper layers
 		 * perform a read/write buf operation, the saved column
-		  * address is used to index into the full page.
+		 * address is used to index into the full page.
+		 *
+		 * The colum address must be sent to the flash in
+		 * order to get the ONFI header (0x20)
 		 */
-		host->devtype_data->send_addr(host, 0, page_addr == -1);
+		host->devtype_data->send_addr(host, column, page_addr == -1);
 		if (mtd->writesize > 512)
 			/* another col addr cycle for 2k page */
 			host->devtype_data->send_addr(host, 0, false);
@@ -996,9 +1010,10 @@ static void preset_v3(struct mtd_info *mtd)
 
 	writel(0, NFC_V3_IPC);
 
+	/* if the flash has a 224 oob, the NFC must be configured to 218 */
 	config2 = NFC_V3_CONFIG2_ONE_CYCLE |
 		NFC_V3_CONFIG2_2CMD_PHASES |
-		NFC_V3_CONFIG2_SPAS(mtd->oobsize >> 1) |
+		NFC_V3_CONFIG2_SPAS(min_t(uint32_t, mtd->oobsize, 218) >> 1) |
 		NFC_V3_CONFIG2_ST_CMD(0x70) |
 		NFC_V3_CONFIG2_INT_MSK |
 		NFC_V3_CONFIG2_NUM_ADDR_PHASE0;
@@ -1119,6 +1134,13 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 		host->devtype_data->send_cmd(host, command, true);
 		mxc_do_addr_cycle(mtd, column, page_addr);
 		host->devtype_data->send_read_id(host);
+		host->buf_start = 0;
+		break;
+
+	case NAND_CMD_PARAM:
+		host->devtype_data->send_cmd(host, command, true);
+		mxc_do_addr_cycle(mtd, column, page_addr);
+		host->devtype_data->send_read_param(host);
 		host->buf_start = column;
 		break;
 
@@ -1216,6 +1238,7 @@ static const struct mxc_nand_devtype_data imx25_nand_devtype_data = {
 	.send_addr = send_addr_v1_v2,
 	.send_page = send_page_v2,
 	.send_read_id = send_read_id_v1_v2,
+	.send_read_param = send_read_param_v2_v3,
 	.get_dev_status = get_dev_status_v1_v2,
 	.check_int = check_int_v1_v2,
 	.irq_control = irq_control_v1_v2,
@@ -1242,13 +1265,14 @@ static const struct mxc_nand_devtype_data imx51_nand_devtype_data = {
 	.send_addr = send_addr_v3,
 	.send_page = send_page_v3,
 	.send_read_id = send_read_id_v3,
+	.send_read_param = send_read_param_v2_v3,
 	.get_dev_status = get_dev_status_v3,
 	.check_int = check_int_v3,
 	.irq_control = irq_control_v3,
 	.get_ecc_status = get_ecc_status_v3,
 	.ecclayout_512 = &nandv2_hw_eccoob_smallpage,
 	.ecclayout_2k = &nandv2_hw_eccoob_largepage,
-	.ecclayout_4k = &nandv2_hw_eccoob_smallpage, /* XXX: needs fix */
+	.ecclayout_4k = &nandv2_hw_eccoob_4k,
 	.select_chip = mxc_nand_select_chip_v1_v3,
 	.correct_data = mxc_nand_correct_data_v2_v3,
 	.irqpending_quirk = 0,
@@ -1269,13 +1293,14 @@ static const struct mxc_nand_devtype_data imx53_nand_devtype_data = {
 	.send_addr = send_addr_v3,
 	.send_page = send_page_v3,
 	.send_read_id = send_read_id_v3,
+	.send_read_param = send_read_param_v2_v3,
 	.get_dev_status = get_dev_status_v3,
 	.check_int = check_int_v3,
 	.irq_control = irq_control_v3,
 	.get_ecc_status = get_ecc_status_v3,
 	.ecclayout_512 = &nandv2_hw_eccoob_smallpage,
 	.ecclayout_2k = &nandv2_hw_eccoob_largepage,
-	.ecclayout_4k = &nandv2_hw_eccoob_smallpage, /* XXX: needs fix */
+	.ecclayout_4k = &nandv2_hw_eccoob_4k,
 	.select_chip = mxc_nand_select_chip_v1_v3,
 	.correct_data = mxc_nand_correct_data_v2_v3,
 	.irqpending_quirk = 0,
-- 
1.7.9.5
