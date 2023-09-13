Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7123CEE57CC
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 02:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oDELiAg+FzDyVyV1bKEgyx+gWHbc2F2c9XY6EVJl7qA=; b=MMhVBIOuda8OtO
	RU2ZdJ+3sdDgn28e/WfGcc3UFLq5VWN/1FMhLNmGUo/giGIey1EDXpn6mGqTrcbxsojyDSpPXPty+
	GOmakhr+0TfE4twqjULDcE02DAJ/99uQlP03OksJRzI/AMULa+smkAr9YssrmQIqYNUkuTLIYVpZR
	ZSsYF0m7rW/+FdFVcTw394AeMRZQLpIE/gQTrf6JhiOg3L2rsqBU8yERdT2L48DLUJbRT/s0Rh/wg
	GIhrZfAfFB0+xYmFoAkc6z7lpk+9ejwUTH8fIK7dsiRkdUdbik78w2km/+jB4qJ366DuDPfyh3CpE
	oWKRpKgFHMG55/9QwnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgFZ6-004RY3-0D;
	Wed, 13 Sep 2023 02:25:16 +0000
Received: from mout.gmx.com ([74.208.4.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgFZ2-004RXd-0U
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 02:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
 s=s1089575; t=1694571881; x=1695176681; i=dregan@mail.com;
 bh=Aytf9e2LKobQ7OdePTosGuxcwWpFZpT0H6/+Hfb1mHs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=eQcGBP1rZK+YUTcnE+Mb2KAV2rW7qktWOubIaXMfc5BmRu6WiWw22b27AMHaeZCM6064T0g
 mf0RWyTcW/MumIqqskv78ivAmpkX+KldUdEwIecVvRHU4HR5GVN/w4HRuB1m/d/OguckNXz4Y
 f17WFqqeaC6BMoXRD4FnBH7sRKLiT1kwao0QBQx73oUkp93LwIb80SdKhMhYMIvVwQ6bEiUZE
 lS4Db3savm5RfPNOua0mCcfrkwxPkjlZnjBlk03TcTKkDhepe00wOKD3inExnVPomkLtaCiwR
 7qB6koI0XKnWbIVkTq4jkIdJlWjjp3vDz0zUwq5J36whtSUqVO8w==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [72.219.182.243] ([72.219.182.243]) by web-mail.mail.com
 (3c-app-mailcom-lxa03.server.lan [10.76.45.4]) (via HTTP); Wed, 13 Sep 2023
 04:24:41 +0200
MIME-Version: 1.0
Message-ID: <trinity-bb7db9f1-d34d-4fe2-bed3-814d3a63476a-1694571881792@3c-app-mailcom-lxa03>
From: dregan@mail.com
To: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org
Cc: f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dregan@mail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com
Subject: [PATCH] mtd: rawnand: brcmnand: Initial exec_op implementation
Date: Wed, 13 Sep 2023 04:24:41 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:J/hv+req03UYm6gBZKV7yo0SU9Vfkm8eKHBdpIcezgT0B75kls4iLVtiXWrz1y5xw6oeD
 Lt0qwG0uTsFigRKAkQfghjU1ys2pzfrpyufwkPbhiiAmX4q6o3aT0Tw/Y8H2qV9QjyU8tSJnWt8j
 LvKuh0Hrnf6RC901PDeRlAFGT9nD9Egm2x9CONU043I6M04rm8BCYGxot4hO+OMEEBDsp0HO43xB
 zbhLOaWy6fOTxm/uwqCwTKTtOLpUGESg2zrRFXPpVUNHYnODHFMRjUxiV58DrqfG/0+hFyRi87pl
 hw=
UI-OutboundReport: notjunk:1;M01:P0:L89fJVaeTQE=;l9eU7rwUx0bNSIw8N5QlWskw0I9
 EY7gLvrABkVBuOeZrwgbT7Ln9v/jH4sLyCwCogtFKL+zCI1wGSzXyLNFHmMmNOuaO+DmWbXq3
 k6RDSrXqt7aFDZhED49B0SfHCeUj5VbI6U+TR9xoWCsH7+esTRb3c2LmrdpyuI/mamPBeL55X
 VRy8YeDy8dd63p6raZdLch+KPz6XSt0DKQw/Hm99NRys2f+0ivjGVVjqw1jFZgmfURyozLNW7
 rWEme7zrroYm0Av8MXwJmFv2rptt1Nk14Ib9r+J/+J/BgjqypGQ4XtGs/OKECH1Rx8+CplOM2
 IrivnJhUkTN8vrCQX8q58av0nyxkmpD0QToMi6A4iEI3bj2PJjdZbGWn9Md/jnsHboaIfy0TT
 1V9kmtDPywDBxun7B47YYsCADMoiQT97UeNc7VJtWIWsQkH48IqwZ0YaytbDCDOpetJ57fjv6
 /wrh2k7ZZ4cXqAX8xjum5swpk3eGDqUuhLErUq8a9pu4mIPeV/MadNizLUlDh79VaS19IAuxA
 OJurq7ttcSzudcnejRJLGBQ+/6PM20UG4KTaMVvXPlFmPPUrAa2uTmUV+yUH2uiIuDOMZvpFJ
 DPbCgO1yo3UEEWoHVxB5CmiUUf+4S3P7OXgXiBWqen4TNlflmdXbbO84XZNx+y413V+ALgyIO
 zrYwpX8xFekBSo/U5puka6GzuW8MN/W8lprn1bafC9wvL3l830fZO/q+sAckw6UZ/ct66A/SI
 zX5KU2R5u3rM7+Lu0bLHTaw2QAHJXzugVE+El5DEDetgbXKXzzvGeGYmvSu3VBGkLV+FAGgQT
 hskgOxVD/4fD9fMXT3ND19+A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_192512_466702_E9E1C88B 
X-CRM114-Status: GOOD (  21.13  )
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

Initial exec_op implementation for Broadcom STB, Broadband and iProc SoC
This adds exec_op and removes the legacy interface.

Signed-off-by: David Regan <dregan@mail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 384 ++++++++++-------------
 1 file changed, 161 insertions(+), 223 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 440bef477930..b075dade4129 100644
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
@@ -1387,7 +1376,8 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
 			return;

 		brcmnand_set_wp(ctrl, wp);
-		nand_status_op(chip, NULL);
+		/* force controller operation to update internal copy of NAND chip status */
+		brcmnand_status(host);
 		/* NAND_STATUS_WP 0x00 = protected, 0x80 = not protected */
 		ret = bcmnand_ctrl_poll_status(ctrl,
 					       NAND_CTRL_RDY |
@@ -1643,16 +1633,6 @@ static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
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
@@ -1703,6 +1683,17 @@ static int brcmnand_waitfunc(struct nand_chip *chip)
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
@@ -1752,190 +1743,6 @@ static int brcmnand_low_level_op(struct brcmnand_host *host,
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
@@ -2345,8 +2152,9 @@ static int brcmnand_read_page(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	u8 *oob = oob_required ? (u8 *)chip->oob_poi : NULL;
+	u64 addr = (u64)page << chip->page_shift;

-	nand_read_page_op(chip, page, 0, NULL, 0);
+	host->last_addr = addr;

 	return brcmnand_read(mtd, chip, host->last_addr,
 			mtd->writesize >> FC_SHIFT, (u32 *)buf, oob);
@@ -2359,8 +2167,9 @@ static int brcmnand_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	u8 *oob = oob_required ? (u8 *)chip->oob_poi : NULL;
 	int ret;
+	u64 addr = (u64)page << chip->page_shift;

-	nand_read_page_op(chip, page, 0, NULL, 0);
+	host->last_addr = addr;

 	brcmnand_set_ecc_enabled(host, 0);
 	ret = brcmnand_read(mtd, chip, host->last_addr,
@@ -2468,11 +2277,11 @@ static int brcmnand_write_page(struct nand_chip *chip, const uint8_t *buf,
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
@@ -2481,13 +2290,15 @@ static int brcmnand_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
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
@@ -2511,6 +2322,139 @@ static int brcmnand_write_oob_raw(struct nand_chip *chip, int page)
 	return ret;
 }

+static void brcmnand_exec_instr(struct brcmnand_host *host,
+				const struct nand_op_instr *instr,
+				bool last_op)
+{
+	struct brcmnand_controller *ctrl = host->ctrl;
+	unsigned int i;
+	const u8 *out;
+	u8 *in;
+
+	bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY, NAND_CTRL_RDY, 0);
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
+		break;
+	}
+}
+
+static int brcmnand_parser_exec_matched_op(struct nand_chip *chip,
+					 const struct nand_subop *subop)
+{
+	struct brcmnand_host *host = nand_get_controller_data(chip);
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	const struct nand_op_instr *instr = &subop->instrs[0];
+	unsigned int i;
+	int ret = 0;
+
+	static int erase; /* will initialize to zero */
+	static int status; /* will initialize to zero */
+
+	for (i = 0; i < subop->ninstrs; i++) {
+		instr = &subop->instrs[i];
+
+		if ((instr->type == NAND_OP_CMD_INSTR) &&
+			(instr->ctx.cmd.opcode == NAND_CMD_STATUS))
+			status = 1;
+		else if (status && (instr->type == NAND_OP_DATA_IN_INSTR)) {
+			/*
+			 * need to fake the nand device write protect because nand_base does a
+			 * nand_check_wp which calls nand_status_op NAND_CMD_STATUS which checks
+			 * that the nand is not write protected before an operation starts.
+			 * The problem with this is it's done outside exec_op so the nand is
+			 * write protected and this check will fail until the write or erase
+			 * or write back operation actually happens where we turn off wp.
+			 */
+			u8 *in;
+
+			status = 0;
+
+			instr = &subop->instrs[i];
+			in = instr->ctx.data.buf.in;
+			in[0] = brcmnand_status(host) | NAND_STATUS_WP; /* hide WP status */
+		} else { /* otherwise pass to low level implementation */
+			if ((instr->type == NAND_OP_CMD_INSTR) &&
+				(instr->ctx.cmd.opcode == NAND_CMD_RESET)) {
+				erase = 0;
+				status = 0;
+			}
+
+			if (erase) {
+				erase = 0;
+				brcmnand_wp(mtd, 1);
+			}
+
+			if ((instr->type == NAND_OP_CMD_INSTR) &&
+				(instr->ctx.cmd.opcode == NAND_CMD_ERASE1))
+				brcmnand_wp(mtd, 0);
+
+			if ((instr->type == NAND_OP_CMD_INSTR) &&
+				(instr->ctx.cmd.opcode == NAND_CMD_ERASE2))
+				erase = 1;
+
+			brcmnand_exec_instr(host, instr, i == (subop->ninstrs - 1));
+		}
+	}
+
+	return ret;
+}
+
+static const struct nand_op_parser brcmnand_op_parser = NAND_OP_PARSER(
+	/* false means the element MUST match,
+	 * true means it does not have to match, catch all patterns
+	 */
+	NAND_OP_PARSER_PATTERN(
+		brcmnand_parser_exec_matched_op,
+		NAND_OP_PARSER_PAT_CMD_ELEM(true)),
+	NAND_OP_PARSER_PATTERN(
+		brcmnand_parser_exec_matched_op,
+		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8)),
+	NAND_OP_PARSER_PATTERN(
+		brcmnand_parser_exec_matched_op,
+		NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 8192)),
+	NAND_OP_PARSER_PATTERN(
+		brcmnand_parser_exec_matched_op,
+		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 8192)),
+	NAND_OP_PARSER_PATTERN(
+		brcmnand_parser_exec_matched_op,
+		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
+);
+
+static int brcmnand_exec_op(struct nand_chip *chip,
+			    const struct nand_operation *op,
+			    bool check_only)
+{
+	return nand_op_parser_exec_op(chip, &brcmnand_op_parser, op, check_only);
+}
+
 /***********************************************************************
  * Per-CS setup (1 NAND device)
  ***********************************************************************/
@@ -2821,6 +2765,7 @@ static int brcmnand_attach_chip(struct nand_chip *chip)

 static const struct nand_controller_ops brcmnand_controller_ops = {
 	.attach_chip = brcmnand_attach_chip,
+	.exec_op = brcmnand_exec_op,
 };

 static int brcmnand_init_cs(struct brcmnand_host *host,
@@ -2845,13 +2790,6 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
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
--
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
