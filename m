Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C43CDB465
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 00:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=dNr3hqw/MIPVk62PQrEjMAK3xnXPSy3i/qIIi+ainIc=; b=K5S
	yyWnl8MGEvJO3tJq7UXoX1AJYC/cX4C3uh9xNAv9pJ+BLzRTWAZRovRpG4LZHQRgsdeAci8IOUlwQ
	FbvHMr7sK33qnmVj3knLRJAOgw37JkooU389zi7OtQEcvCIGRa89CpFlcDIePq6bbtOZ1KPCOFmlK
	jiV1iBXrNKORGMvOEk/z3Qq30VB/ohD38JLx3a5QH793E78j0V5eYw8cM+ypa7An71bBsVnNoDmk7
	x29+pPz4MTLRPak0XRUqJa3lINpfBB/oT1KfEvuSw5+NXNRBsOzOT3993iMNNdhB4FhE1hdq3G42I
	T01VbW5TvZXsEOsLL66ohPr77XcqOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqjmt-00H4ag-1Y;
	Thu, 12 Oct 2023 00:42:51 +0000
Received: from mout.gmx.com ([74.208.4.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqjmp-00H4aD-2p
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 00:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com; s=s1089575;
 t=1697071357; x=1697676157; i=dregan@mail.com;
 bh=JDh1183K1wDEvqwlNJe/y7gc65AaLnMVRRBjOhs/JZY=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=KPya2TSRH6H9/MfSUleSia1qhDlJQi5k++lLXF1XJrAMTssb9ptdjaSfICrsE/0DZ1Z/xlNLSL8
 AJMi+OvvPsNbZRB6pML30QNVdHpxGK3f0b0/hPiZ/OclFnPKajSlDM9F89aWwzX2iUlUrajo7vI9+
 3Cqv+o6Ue90uRZJbe7uOvWKDvvI7JMh5ggWEPjjCV1rRnCJSVZxusI9gGhNMP/mXa33HiGczZvGKM
 6tOpkWBjkdOYfXSncHUiGlJoksm2qnfY0/YCKAVADiWQvCLlve07cnSZ1/ajVam1bDXWuzo3NjrHP
 Qkx/LsmI7Ixy9e8gvOUitgNODew06lzFhuQQ==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [184.189.122.102] ([184.189.122.102]) by web-mail.mail.com
 (3c-app-mailcom-lxa05.server.lan [10.76.45.6]) (via HTTP); Thu, 12 Oct 2023
 02:42:37 +0200
MIME-Version: 1.0
Message-ID: <trinity-826f99ef-9889-499b-b68a-fbfd72e913a0-1697071357070@3c-app-mailcom-lxa05>
From: dregan@mail.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, dregan@mail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Adam
 Borowski <kilobyte@angband.pl>
Subject: [PATCH v2 4/4] mtd: rawnand: brcmnand: exec_op implementation
Date: Thu, 12 Oct 2023 02:42:37 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:Wb2WadShq+beo+fmpz/8d3r6OYuy4UxdOMKoKs7J6xscMmI+smLr4J5H0xIPSbwxLlAxO
 MANx92lplnQfCvs5oQJBxDY53DMqS33kG0FLu3yIcQeT3j9j5cxxzTG63yv7rtYVSS7Z8ebzzdK2
 yQ0E516mggZ+PIhBbQjU3n43FHMjSfjX4J9kcpKl0vvHBbOhf6kGBUGGnZlx3cRvGdHR2+tBl64J
 X5gPcnDYsJlt0obHAw9FNTsMDuTAZew/KWk5taGZdnJTVOutE9tCLiAcubGiViOCUSWk64yUprvB
 Pc=
UI-OutboundReport: notjunk:1;M01:P0:u9l6Fj2Eaw8=;JrRYwciAZ9Qwqz5tb0wNygUK4gI
 YMRyI67FU6YAI5j5mSYiF/7toP28T1bj9fpZUzYS7SvHD+kHmUrdv93qpFC81i+nsIs8XHuTT
 KQCQyf25HIt8O2Ve67VRstCFo+XU7Jx85sa+SwfRSb4YOCDYCtC4cLsBnHAF42+scC/g1aota
 oxjXorubCh5fMteFhJJ0eyf6EOZj6tnM0jPSBASeUqjx3RoPj1YD1SCkzo4Y/IFwcerksWb+E
 5ORXTPEOBO47qEnn/gNl2ZZhVaswtQINA4JEae6jLCjPiHVHaUhyRLwP4MwKmNuVG/52h0E47
 kcDgz+95hhUKqhfCq53ok52DlESPMV145IQhKNjplvTjNdwi0fDpz17qhFqne7d6yRhUjrgQP
 uY3h6NZsPbV1RiCWdI0x9BuQgr0UF5b+PgPv/QqmsI3OBsmmbFtbQfnjO3D8gn4Ow7tJXW77s
 tcYU4DHUF6CR5lD7oA4/fsb2JKYDBbuU0ay8/fUhdnG4hQyQ2xF1Q6qtZnGC/85cWI2x5x+Is
 L7LgDGNTepI+GxpjqsLvD8mtrq+LSCGxftGbSTNshpcRDjm1Wa5EfBcKPzPJ91W3jvMowdKAh
 cGsekPqOBVoSuZBIcJ6n481GQc++jh6NvqTrCizVoYQTKTrZ5cQJooKFvLuV3miUREEKAKNo9
 kNzIYAHNuyZI7mxQVO0ZgCveRUnNOSqiNfi8yzu1HHjb3o2PjU2YZw+FQ31nOUcGLI0pk8t/0
 VsfJqgBvVNVMt0wW5fXnqHtNlnpqgS+OyOnUWPPHRxyLEorQOEUL8szW4cNQy/p8JaVqq7x9d
 8RwNT9s53UNyfhpPYVbwDSVERN4c3H+QjFCCGC2oG8FN0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_174248_013274_8A203B7E 
X-CRM114-Status: GOOD (  17.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

exec_op implementation for Broadcom STB, Broadband and iProc SoC
This adds exec_op and removes the legacy interface. Based on changes
proposed by Boris Brezillon.

https://github.com/bbrezillon/linux/commit/4ec6f8d8d83f5aaca5d1877f02d48da96d41fcba
https://github.com/bbrezillon/linux/commit/11b4acffd761c4928652d7028d19fcd6f45e4696

Signed-off-by: David Regan <dregan@mail.com>

---

Changes in v2: moved status and reset command detect out of loop
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 374 +++++++++--------------
 1 file changed, 151 insertions(+), 223 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 8d429eb3b72a..f1b0ca3ebc9c 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -625,6 +625,8 @@ enum {
 /* Only for v7.2 */
 #define	ACC_CONTROL_ECC_EXT_SHIFT		13

+static u8 brcmnand_status(struct brcmnand_host *host);
+
 static inline bool brcmnand_non_mmio_ops(struct brcmnand_controller *ctrl)
 {
 #if IS_ENABLED(CONFIG_MTD_NAND_BRCMNAND_BCMA)
@@ -1022,19 +1024,6 @@ static inline int brcmnand_sector_1k_shift(struct brcmnand_controller *ctrl)
 		return -1;
 }

-static int brcmnand_get_sector_size_1k(struct brcmnand_host *host)
-{
-	struct brcmnand_controller *ctrl = host->ctrl;
-	int shift = brcmnand_sector_1k_shift(ctrl);
-	u16 acc_control_offs = brcmnand_cs_offset(ctrl, host->cs,
-						  BRCMNAND_CS_ACC_CONTROL);
-
-	if (shift < 0)
-		return 0;
-
-	return (nand_readreg(ctrl, acc_control_offs) >> shift) & 0x1;
-}
-
 static void brcmnand_set_sector_size_1k(struct brcmnand_host *host, int val)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
@@ -1074,6 +1063,9 @@ static int bcmnand_ctrl_poll_status(struct brcmnand_host *host,

 	limit = jiffies + msecs_to_jiffies(timeout_ms);
 	do {
+		if (mask & INTFC_FLASH_STATUS)
+			brcmnand_status(host);
+
 		val = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
 		if ((val & mask) == expected_val)
 			return 0;
@@ -1388,7 +1380,8 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
 			return;

 		brcmnand_set_wp(ctrl, wp);
-		nand_status_op(chip, NULL);
+		/* force controller operation to update internal copy of NAND chip status */
+		brcmnand_status(host);
 		/* NAND_STATUS_WP 0x00 = protected, 0x80 = not protected */
 		ret = bcmnand_ctrl_poll_status(host,
 					       NAND_CTRL_RDY |
@@ -1644,16 +1637,6 @@ static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
 			   cmd << brcmnand_cmd_shift(ctrl));
 }

-/***********************************************************************
- * NAND MTD API: read/program/erase
- ***********************************************************************/
-
-static void brcmnand_cmd_ctrl(struct nand_chip *chip, int dat,
-			      unsigned int ctrl)
-{
-	/* intentionally left blank */
-}
-
 static bool brcmstb_nand_wait_for_completion(struct nand_chip *chip)
 {
 	struct brcmnand_host *host = nand_get_controller_data(chip);
@@ -1704,6 +1687,17 @@ static int brcmnand_waitfunc(struct nand_chip *chip)
 				 INTFC_FLASH_STATUS;
 }

+static u8 brcmnand_status(struct brcmnand_host *host)
+{
+	struct nand_chip *chip = &host->chip;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	brcmnand_set_cmd_addr(mtd, 0);
+	brcmnand_send_cmd(host, CMD_STATUS_READ);
+
+	return brcmnand_waitfunc(chip);
+}
+
 enum {
 	LLOP_RE				= BIT(16),
 	LLOP_WE				= BIT(17),
@@ -1753,190 +1747,6 @@ static int brcmnand_low_level_op(struct brcmnand_host *host,
 	return brcmnand_waitfunc(chip);
 }

-static void brcmnand_cmdfunc(struct nand_chip *chip, unsigned command,
-			     int column, int page_addr)
-{
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct brcmnand_host *host = nand_get_controller_data(chip);
-	struct brcmnand_controller *ctrl = host->ctrl;
-	u64 addr = (u64)page_addr << chip->page_shift;
-	int native_cmd = 0;
-
-	if (command == NAND_CMD_READID || command == NAND_CMD_PARAM ||
-			command == NAND_CMD_RNDOUT)
-		addr = (u64)column;
-	/* Avoid propagating a negative, don't-care address */
-	else if (page_addr < 0)
-		addr = 0;
-
-	dev_dbg(ctrl->dev, "cmd 0x%x addr 0x%llx\n", command,
-		(unsigned long long)addr);
-
-	host->last_cmd = command;
-	host->last_byte = 0;
-	host->last_addr = addr;
-
-	switch (command) {
-	case NAND_CMD_RESET:
-		native_cmd = CMD_FLASH_RESET;
-		break;
-	case NAND_CMD_STATUS:
-		native_cmd = CMD_STATUS_READ;
-		break;
-	case NAND_CMD_READID:
-		native_cmd = CMD_DEVICE_ID_READ;
-		break;
-	case NAND_CMD_READOOB:
-		native_cmd = CMD_SPARE_AREA_READ;
-		break;
-	case NAND_CMD_ERASE1:
-		native_cmd = CMD_BLOCK_ERASE;
-		brcmnand_wp(mtd, 0);
-		break;
-	case NAND_CMD_PARAM:
-		native_cmd = CMD_PARAMETER_READ;
-		break;
-	case NAND_CMD_SET_FEATURES:
-	case NAND_CMD_GET_FEATURES:
-		brcmnand_low_level_op(host, LL_OP_CMD, command, false);
-		brcmnand_low_level_op(host, LL_OP_ADDR, column, false);
-		break;
-	case NAND_CMD_RNDOUT:
-		native_cmd = CMD_PARAMETER_CHANGE_COL;
-		addr &= ~((u64)(FC_BYTES - 1));
-		/*
-		 * HW quirk: PARAMETER_CHANGE_COL requires SECTOR_SIZE_1K=0
-		 * NB: hwcfg.sector_size_1k may not be initialized yet
-		 */
-		if (brcmnand_get_sector_size_1k(host)) {
-			host->hwcfg.sector_size_1k =
-				brcmnand_get_sector_size_1k(host);
-			brcmnand_set_sector_size_1k(host, 0);
-		}
-		break;
-	}
-
-	if (!native_cmd)
-		return;
-
-	brcmnand_set_cmd_addr(mtd, addr);
-	brcmnand_send_cmd(host, native_cmd);
-	brcmnand_waitfunc(chip);
-
-	if (native_cmd == CMD_PARAMETER_READ ||
-			native_cmd == CMD_PARAMETER_CHANGE_COL) {
-		/* Copy flash cache word-wise */
-		u32 *flash_cache = (u32 *)ctrl->flash_cache;
-		int i;
-
-		brcmnand_soc_data_bus_prepare(ctrl->soc, true);
-
-		/*
-		 * Must cache the FLASH_CACHE now, since changes in
-		 * SECTOR_SIZE_1K may invalidate it
-		 */
-		for (i = 0; i < FC_WORDS; i++)
-			/*
-			 * Flash cache is big endian for parameter pages, at
-			 * least on STB SoCs
-			 */
-			flash_cache[i] = be32_to_cpu(brcmnand_read_fc(ctrl, i));
-
-		brcmnand_soc_data_bus_unprepare(ctrl->soc, true);
-
-		/* Cleanup from HW quirk: restore SECTOR_SIZE_1K */
-		if (host->hwcfg.sector_size_1k)
-			brcmnand_set_sector_size_1k(host,
-						    host->hwcfg.sector_size_1k);
-	}
-
-	/* Re-enable protection is necessary only after erase */
-	if (command == NAND_CMD_ERASE1)
-		brcmnand_wp(mtd, 1);
-}
-
-static uint8_t brcmnand_read_byte(struct nand_chip *chip)
-{
-	struct brcmnand_host *host = nand_get_controller_data(chip);
-	struct brcmnand_controller *ctrl = host->ctrl;
-	uint8_t ret = 0;
-	int addr, offs;
-
-	switch (host->last_cmd) {
-	case NAND_CMD_READID:
-		if (host->last_byte < 4)
-			ret = brcmnand_read_reg(ctrl, BRCMNAND_ID) >>
-				(24 - (host->last_byte << 3));
-		else if (host->last_byte < 8)
-			ret = brcmnand_read_reg(ctrl, BRCMNAND_ID_EXT) >>
-				(56 - (host->last_byte << 3));
-		break;
-
-	case NAND_CMD_READOOB:
-		ret = oob_reg_read(ctrl, host->last_byte);
-		break;
-
-	case NAND_CMD_STATUS:
-		ret = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS) &
-					INTFC_FLASH_STATUS;
-		if (wp_on) /* hide WP status */
-			ret |= NAND_STATUS_WP;
-		break;
-
-	case NAND_CMD_PARAM:
-	case NAND_CMD_RNDOUT:
-		addr = host->last_addr + host->last_byte;
-		offs = addr & (FC_BYTES - 1);
-
-		/* At FC_BYTES boundary, switch to next column */
-		if (host->last_byte > 0 && offs == 0)
-			nand_change_read_column_op(chip, addr, NULL, 0, false);
-
-		ret = ctrl->flash_cache[offs];
-		break;
-	case NAND_CMD_GET_FEATURES:
-		if (host->last_byte >= ONFI_SUBFEATURE_PARAM_LEN) {
-			ret = 0;
-		} else {
-			bool last = host->last_byte ==
-				ONFI_SUBFEATURE_PARAM_LEN - 1;
-			brcmnand_low_level_op(host, LL_OP_RD, 0, last);
-			ret = brcmnand_read_reg(ctrl, BRCMNAND_LL_RDATA) & 0xff;
-		}
-	}
-
-	dev_dbg(ctrl->dev, "read byte = 0x%02x\n", ret);
-	host->last_byte++;
-
-	return ret;
-}
-
-static void brcmnand_read_buf(struct nand_chip *chip, uint8_t *buf, int len)
-{
-	int i;
-
-	for (i = 0; i < len; i++, buf++)
-		*buf = brcmnand_read_byte(chip);
-}
-
-static void brcmnand_write_buf(struct nand_chip *chip, const uint8_t *buf,
-			       int len)
-{
-	int i;
-	struct brcmnand_host *host = nand_get_controller_data(chip);
-
-	switch (host->last_cmd) {
-	case NAND_CMD_SET_FEATURES:
-		for (i = 0; i < len; i++)
-			brcmnand_low_level_op(host, LL_OP_WR, buf[i],
-						  (i + 1) == len);
-		break;
-	default:
-		BUG();
-		break;
-	}
-}
-
 /*
  *  Kick EDU engine
  */
@@ -2346,8 +2156,9 @@ static int brcmnand_read_page(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	u8 *oob = oob_required ? (u8 *)chip->oob_poi : NULL;
+	u64 addr = (u64)page << chip->page_shift;

-	nand_read_page_op(chip, page, 0, NULL, 0);
+	host->last_addr = addr;

 	return brcmnand_read(mtd, chip, host->last_addr,
 			mtd->writesize >> FC_SHIFT, (u32 *)buf, oob);
@@ -2360,8 +2171,9 @@ static int brcmnand_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	u8 *oob = oob_required ? (u8 *)chip->oob_poi : NULL;
 	int ret;
+	u64 addr = (u64)page << chip->page_shift;

-	nand_read_page_op(chip, page, 0, NULL, 0);
+	host->last_addr = addr;

 	brcmnand_set_ecc_enabled(host, 0);
 	ret = brcmnand_read(mtd, chip, host->last_addr,
@@ -2469,11 +2281,11 @@ static int brcmnand_write_page(struct nand_chip *chip, const uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	void *oob = oob_required ? chip->oob_poi : NULL;
+	u64 addr = (u64)page << chip->page_shift;

-	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
-	brcmnand_write(mtd, chip, host->last_addr, (const u32 *)buf, oob);
+	host->last_addr = addr;

-	return nand_prog_page_end_op(chip);
+	return brcmnand_write(mtd, chip, host->last_addr, (const u32 *)buf, oob);
 }

 static int brcmnand_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
@@ -2482,13 +2294,15 @@ static int brcmnand_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	void *oob = oob_required ? chip->oob_poi : NULL;
+	u64 addr = (u64)page << chip->page_shift;
+	int ret = 0;

-	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
+	host->last_addr = addr;
 	brcmnand_set_ecc_enabled(host, 0);
-	brcmnand_write(mtd, chip, host->last_addr, (const u32 *)buf, oob);
+	ret = brcmnand_write(mtd, chip, host->last_addr, (const u32 *)buf, oob);
 	brcmnand_set_ecc_enabled(host, 1);

-	return nand_prog_page_end_op(chip);
+	return ret;
 }

 static int brcmnand_write_oob(struct nand_chip *chip, int page)
@@ -2512,6 +2326,125 @@ static int brcmnand_write_oob_raw(struct nand_chip *chip, int page)
 	return ret;
 }

+static int brcmnand_exec_instr(struct brcmnand_host *host,
+				const struct nand_op_instr *instr,
+				bool last_op)
+{
+	struct brcmnand_controller *ctrl = host->ctrl;
+	unsigned int i;
+	const u8 *out;
+	u8 *in;
+	int ret = 0;
+
+	bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY, NAND_CTRL_RDY, 0);
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		brcmnand_low_level_op(host, LL_OP_CMD,
+				      instr->ctx.cmd.opcode, last_op);
+		break;
+
+	case NAND_OP_ADDR_INSTR:
+		for (i = 0; i < instr->ctx.addr.naddrs; i++)
+			brcmnand_low_level_op(host, LL_OP_ADDR,
+					      instr->ctx.addr.addrs[i],
+					      last_op);
+		break;
+
+	case NAND_OP_DATA_IN_INSTR:
+		in = instr->ctx.data.buf.in;
+		for (i = 0; i < instr->ctx.data.len; i++) {
+			brcmnand_low_level_op(host, LL_OP_RD, 0, last_op);
+			in[i] = brcmnand_read_reg(host->ctrl,
+						  BRCMNAND_LL_RDATA);
+		}
+		break;
+
+	case NAND_OP_DATA_OUT_INSTR:
+		out = instr->ctx.data.buf.out;
+		for (i = 0; i < instr->ctx.data.len; i++)
+			brcmnand_low_level_op(host, LL_OP_WR, out[i], last_op);
+		break;
+
+	default:
+		dev_err(ctrl->dev, "unsupported instruction type: %d\n",
+			instr->type);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+int brcmnand_exec_op_is_status(const struct nand_operation *op)
+{
+	if ((op->instrs[0].type == NAND_OP_CMD_INSTR) &&
+		(op->instrs[0].ctx.cmd.opcode == NAND_CMD_STATUS) &&
+		(op->ninstrs > 1) &&
+		(op->instrs[1].type == NAND_OP_DATA_IN_INSTR))
+		return 1;
+
+	return 0;
+}
+
+int brcmnand_exec_op_is_reset(const struct nand_operation *op)
+{
+	if ((op->instrs[0].type == NAND_OP_CMD_INSTR) &&
+		(op->instrs[0].ctx.cmd.opcode == NAND_CMD_RESET))
+		return 1;
+
+	return 0;
+}
+
+static int brcmnand_exec_op(struct nand_chip *chip,
+			    const struct nand_operation *op,
+			    bool check_only)
+{
+	struct brcmnand_host *host = nand_get_controller_data(chip);
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	const struct nand_op_instr *instr = &op->instrs[0];
+	u8 *status;
+	unsigned int i;
+	int ret = 0;
+
+	if (check_only)
+		return 0;
+
+	if (brcmnand_exec_op_is_status(op)) {
+		status = op->instrs[1].ctx.data.buf.in;
+		*status = brcmnand_status(host);
+
+		return 0;
+	}
+
+	if (op->deassert_wp)
+		brcmnand_wp(mtd, 0);
+
+	for (i = 0; i < op->ninstrs; i++) {
+		instr = &op->instrs[i];
+
+		if (instr->type == NAND_OP_WAITRDY_INSTR) {
+			ret = bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY, NAND_CTRL_RDY, 0);
+			if (ret)
+				break;
+		} else { /* otherwise pass to low level implementation */
+			ret = brcmnand_exec_instr(host, instr, i == (op->ninstrs - 1));
+			if (ret)
+				break;
+		}
+	}
+
+	if (op->deassert_wp)
+		brcmnand_wp(mtd, 1);
+
+	if (brcmnand_exec_op_is_reset(op)) {
+		brcmnand_status(host);
+		brcmnand_wp(mtd, 1);
+	}
+
+	return ret;
+}
+
 /***********************************************************************
  * Per-CS setup (1 NAND device)
  ***********************************************************************/
@@ -2822,6 +2755,7 @@ static int brcmnand_attach_chip(struct nand_chip *chip)

 static const struct nand_controller_ops brcmnand_controller_ops = {
 	.attach_chip = brcmnand_attach_chip,
+	.exec_op = brcmnand_exec_op,
 };

 static int brcmnand_init_cs(struct brcmnand_host *host,
@@ -2846,13 +2780,6 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = dev;

-	chip->legacy.cmd_ctrl = brcmnand_cmd_ctrl;
-	chip->legacy.cmdfunc = brcmnand_cmdfunc;
-	chip->legacy.waitfunc = brcmnand_waitfunc;
-	chip->legacy.read_byte = brcmnand_read_byte;
-	chip->legacy.read_buf = brcmnand_read_buf;
-	chip->legacy.write_buf = brcmnand_write_buf;
-
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
 	chip->ecc.read_page = brcmnand_read_page;
 	chip->ecc.write_page = brcmnand_write_page;
@@ -2864,6 +2791,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 	chip->ecc.write_oob = brcmnand_write_oob;

 	chip->controller = &ctrl->controller;
+	ctrl->controller.controller_wp = 1;

 	/*
 	 * The bootloader might have configured 16bit mode but
--
2.37.3



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
