Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0org-0001K3-SG
 for linux-mtd@lists.infradead.org; Thu, 12 May 2016 11:33:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] nand: nandsim: Implement approximation mode
Date: Thu, 12 May 2016 13:32:45 +0200
Message-Id: <1463052765-5116-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sometimes all you need is a NAND with a given page, erase and chip size
to load and inspect a certain image.
OOB, ECC sizes and other metrics don't matter much then.
In such a situation I find myself often fiddling around with NAND IDs
to get what I need, especially when the given NAND ID from the datasheet
decode to something else than the NAND advertises via ONFI.
Using the new nandsim.approx module parameter it is possible to specify
the page size, number of pages per block and the total number of blocks.
Nandsim will then emulate a SLC NAND with 128 bytes OOB and the given
sizes. Nandsim achieves this by providing ONFI parameters to NAND core.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nand_base.c | 12 +++++----
 drivers/mtd/nand/nandsim.c   | 62 +++++++++++++++++++++++++++++++++++++++-----
 include/linux/mtd/nand.h     |  3 +++
 3 files changed, 66 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 557b846..25432c2 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3208,7 +3208,7 @@ static void sanitize_string(uint8_t *s, size_t len)
 	strim(s);
 }
 
-static u16 onfi_crc16(u16 crc, u8 const *p, size_t len)
+u16 nand_onfi_crc16(u16 crc, u8 const *p, size_t len)
 {
 	int i;
 	while (len--) {
@@ -3246,7 +3246,7 @@ static int nand_flash_detect_ext_param_page(struct mtd_info *mtd,
 
 	/* Read out the Extended Parameter Page. */
 	chip->read_buf(mtd, (uint8_t *)ep, len);
-	if ((onfi_crc16(ONFI_CRC_BASE, ((uint8_t *)ep) + 2, len - 2)
+	if ((nand_onfi_crc16(ONFI_CRC_BASE, ((uint8_t *)ep) + 2, len - 2)
 		!= le16_to_cpu(ep->crc))) {
 		pr_debug("fail in the CRC.\n");
 		goto ext_out;
@@ -3328,14 +3328,16 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	/* Try ONFI for unknown chip or LP */
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
 	if (chip->read_byte(mtd) != 'O' || chip->read_byte(mtd) != 'N' ||
-		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
+		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I') {
+
 		return 0;
+	}
 
 	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
 	for (i = 0; i < 3; i++) {
 		for (j = 0; j < sizeof(*p); j++)
 			((uint8_t *)p)[j] = chip->read_byte(mtd);
-		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
+		if (nand_onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
 				le16_to_cpu(p->crc)) {
 			break;
 		}
@@ -3442,7 +3444,7 @@ static int nand_flash_detect_jedec(struct mtd_info *mtd, struct nand_chip *chip,
 		for (j = 0; j < sizeof(*p); j++)
 			((uint8_t *)p)[j] = chip->read_byte(mtd);
 
-		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) ==
+		if (nand_onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) ==
 				le16_to_cpu(p->crc))
 			break;
 	}
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index a58169a2..b5be38a 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -114,6 +114,15 @@ static u_char id_bytes[8] = {
 	[3] = CONFIG_NANDSIM_FOURTH_ID_BYTE,
 	[4 ... 7] = 0xFF,
 };
+static unsigned int approx[3];
+
+static struct nand_onfi_params id_onfi = {
+	.sig = {'O', 'N', 'F', 'I'},
+	.manufacturer = "nandsim     ",
+	.model = "nandsim            ",
+};
+
+static unsigned char *id_p;
 
 module_param_array(id_bytes, byte, NULL, 0400);
 module_param_named(first_id_byte, id_bytes[0], byte, 0400);
@@ -139,6 +148,7 @@ module_param(overridesize,   uint, 0400);
 module_param(cache_file,     charp, 0400);
 module_param(bbt,	     uint, 0400);
 module_param(bch,	     uint, 0400);
+module_param_array(approx, uint, NULL, 0400);
 
 MODULE_PARM_DESC(id_bytes,       "The ID bytes returned by NAND Flash 'read ID' command");
 MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID' command (manufacturer ID) (obsolete)");
@@ -174,6 +184,10 @@ MODULE_PARM_DESC(cache_file,     "File to use to cache nand pages instead of mem
 MODULE_PARM_DESC(bbt,		 "0 OOB, 1 BBT with marker in OOB, 2 BBT with marker in data area");
 MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 				 "be correctable in 512-byte blocks");
+MODULE_PARM_DESC(approx,	 "Approximation mode, simulate a good enough NAND that satisfies"
+				 " page size, block size and number of blocks."
+				 " e.g. 4096,128,8192 will give you a NAND with 4KiB page size, 128 pages per"
+				 " block and 8192 blocks in total.");
 
 /* The largest possible page size */
 #define NS_LARGEST_PAGE_SIZE	4096
@@ -229,6 +243,7 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 #define STATE_CMD_RESET        0x0000000C /* reset */
 #define STATE_CMD_RNDOUT       0x0000000D /* random output command */
 #define STATE_CMD_RNDOUTSTART  0x0000000E /* random output start command */
+#define STATE_CMD_PARAM        0x0000000F /* param output start command */
 #define STATE_CMD_MASK         0x0000000F /* command states mask */
 
 /* After an address is input, the simulator goes to one of these states */
@@ -245,7 +260,8 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 #define STATE_DATAOUT          0x00001000 /* waiting for page data output */
 #define STATE_DATAOUT_ID       0x00002000 /* waiting for ID bytes output */
 #define STATE_DATAOUT_STATUS   0x00003000 /* waiting for status output */
-#define STATE_DATAOUT_MASK     0x00007000 /* data output states mask */
+#define STATE_DATAOUT_ONFI    0x00007000 /* waiting for ONFI output */
+#define STATE_DATAOUT_MASK     0x0000F000 /* data output states mask */
 
 /* Previous operation is done, ready to accept new requests */
 #define STATE_READY            0x00000000
@@ -307,7 +323,6 @@ struct nandsim {
 	unsigned int nbparts;
 
 	uint busw;              /* flash chip bus width (8 or 16) */
-	u_char ids[8];          /* chip's ID bytes */
 	uint32_t options;       /* chip's characteristic bits */
 	uint32_t state;         /* current chip state */
 	uint32_t nxstate;       /* next expected state */
@@ -408,6 +423,8 @@ static struct nandsim_operations {
 	{OPT_ANY, {STATE_CMD_STATUS, STATE_DATAOUT_STATUS, STATE_READY}},
 	/* Read ID */
 	{OPT_ANY, {STATE_CMD_READID, STATE_ADDR_ZERO, STATE_DATAOUT_ID, STATE_READY}},
+	/* Read param */
+	{OPT_ANY, {STATE_CMD_PARAM, STATE_ADDR_ZERO, STATE_DATAOUT_ONFI, STATE_READY}},
 	/* Large page devices read page */
 	{OPT_LARGEPAGE, {STATE_CMD_READ0, STATE_ADDR_PAGE, STATE_CMD_READSTART | ACTION_CPY,
 			       STATE_DATAOUT, STATE_READY}},
@@ -1077,6 +1094,8 @@ static char *get_state_name(uint32_t state)
 			return "STATE_CMD_RNDOUT";
 		case STATE_CMD_RNDOUTSTART:
 			return "STATE_CMD_RNDOUTSTART";
+		case STATE_CMD_PARAM:
+			return "STATE_CMD_PARAM";
 		case STATE_ADDR_PAGE:
 			return "STATE_ADDR_PAGE";
 		case STATE_ADDR_SEC:
@@ -1125,6 +1144,7 @@ static int check_command(int cmd)
 	case NAND_CMD_RESET:
 	case NAND_CMD_RNDOUT:
 	case NAND_CMD_RNDOUTSTART:
+	case NAND_CMD_PARAM:
 		return 0;
 
 	default:
@@ -1164,6 +1184,8 @@ static uint32_t get_state_by_command(unsigned command)
 			return STATE_CMD_RNDOUT;
 		case NAND_CMD_RNDOUTSTART:
 			return STATE_CMD_RNDOUTSTART;
+		case NAND_CMD_PARAM:
+			return STATE_CMD_PARAM;
 	}
 
 	NS_ERR("get_state_by_command: unknown command, BUG\n");
@@ -1856,9 +1878,17 @@ static void switch_state(struct nandsim *ns)
 				break;
 
 			case STATE_DATAOUT_ID:
-				ns->regs.num = ns->geom.idbytes;
+				if (ns->regs.row == 0x20) {
+					ns->regs.num = sizeof(id_onfi.sig);
+					id_p = (unsigned char *)id_onfi.sig;
+				} else {
+					ns->regs.num = ns->geom.idbytes;
+					id_p = (unsigned char *)id_bytes;
+				}
+				break;
+			case STATE_DATAOUT_ONFI:
+				ns->regs.num = sizeof(id_onfi);
 				break;
-
 			case STATE_DATAOUT_STATUS:
 				ns->regs.count = ns->regs.num = 0;
 				break;
@@ -1951,7 +1981,11 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
 			break;
 		case STATE_DATAOUT_ID:
 			NS_DBG("read_byte: read ID byte %d, total = %d\n", ns->regs.count, ns->regs.num);
-			outb = ns->ids[ns->regs.count];
+			outb = id_p[ns->regs.count];
+			ns->regs.count += 1;
+			break;
+		case STATE_DATAOUT_ONFI:
+			outb = ((unsigned char *)&id_onfi)[ns->regs.count];
 			ns->regs.count += 1;
 			break;
 		default:
@@ -2289,10 +2323,26 @@ static int __init ns_init_module(void)
 		nand->geom.idbytes = 4;
 	else
 		nand->geom.idbytes = 2;
+
+	if (approx[0] && approx[1] && approx[2]) {
+		id_onfi.byte_per_page = cpu_to_le32(approx[0]);
+		id_onfi.pages_per_block = cpu_to_le32(approx[1]);
+		id_onfi.blocks_per_lun = cpu_to_le32(approx[2]);
+
+		id_onfi.spare_bytes_per_page = cpu_to_le32(128);
+		id_onfi.lun_count = cpu_to_le32(1);
+		id_onfi.bits_per_cell = cpu_to_le32(1);
+		id_onfi.revision = cpu_to_le32(1 << 5);
+		id_onfi.crc = cpu_to_le16(nand_onfi_crc16(ONFI_CRC_BASE, (uint8_t *)&id_onfi,
+					  sizeof(id_onfi) - sizeof(id_onfi.crc)));
+
+		nand->geom.idbytes = 2;
+		id_bytes[0] = id_bytes[1] = 0xFF;
+	}
+
 	nand->regs.status = NS_STATUS_OK(nand);
 	nand->nxstate = STATE_UNKNOWN;
 	nand->options |= OPT_PAGE512; /* temporary value */
-	memcpy(nand->ids, id_bytes, sizeof(nand->ids));
 	if (bus_width == 16) {
 		nand->busw = 16;
 		chip->options |= NAND_BUSWIDTH_16;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 56574ba..82f6db2 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -50,6 +50,9 @@ extern int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 /* unlocks specified locked blocks */
 extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
+/* calculate ONFI CRC */
+extern u16 nand_onfi_crc16(u16 crc, u8 const *p, size_t len);
+
 /* The maximum number of NAND chips in an array */
 #define NAND_MAX_CHIPS		8
 
-- 
2.7.3
