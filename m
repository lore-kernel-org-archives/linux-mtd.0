Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F319DE7734E
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Sep 2023 01:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2eQLURk7WD7NW730PHDu+xl1TCvgc5mtGy3DW6ALiMw=; b=xpJdoRS2uqiSMw
	A/Yc+mIhpgK5m7ToCuidjK41uQIVl/DKDEL8gFm+rb7y1oqdMmQZaTQBluKLpJ+1z0nclB9mhFm3T
	XLXr5uCMgLAoXXJcLscXJyaNjcJLF2O0hKazB/v3z8X28pHu50k9iWGKCO1FBLApK+GgQRWfLA+cR
	kDHEcpE4CXAHHFhCVz2KXKSv+Zh4wYBoGzF92R5444Z8tm2iczHJOlRn88lyg+OLCrNye5pSwUZ2m
	G/u79yEePS9INgMw3gtEsOAiWjXfqfZmDWWV6spS9dgYcdCe5mt53BifCRNp92QzRJbNsBPBygW9L
	Bw0ampeBb0BI3KGGrhfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmPF6-008nXd-15;
	Sat, 30 Sep 2023 01:58:04 +0000
Received: from mout.gmx.com ([74.208.4.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmPF0-008nXA-2t
	for linux-mtd@lists.infradead.org;
	Sat, 30 Sep 2023 01:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com; s=s1089575;
 t=1696039056; x=1696643856; i=dregan@mail.com;
 bh=UM99n45bN6EQLJ7NUygQBqxcQMz9LLVVLierHT9zMTA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Rm4lusDh+1ks9ZDHExcQaLKZ1Krxn+VAlSA7Z3LSoSkM0+9NMbrdx72kBqIKQet9+GZbbcEav12
 GymUexPXhfjEgxgsOqNWQOddu/oa8S57VDvyBujQ5s/8apz18zyAN+yr5Zb1D1iFQ/wiJWtZHeR4v
 a8R0lwNyA16UkuM6LDtRyLn8vcfJIBvltk2S9/bZkODHqVUg/9LyaeoU0dZcFRklPalsZ/RxLui+A
 HGhXszlf0hKEvPeCXR8B9NN8K+YhqhJ1f7bPf5ryFZJdLwm9H4nX7h/jXSODs133HXQtZDQUSQFtO
 PoPvQDYkEtJ8rdkCXAM8xvbgJf/gBl+NSX5g==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [72.219.182.243] ([72.219.182.243]) by web-mail.mail.com
 (3c-app-mailcom-lxa04.server.lan [10.76.45.5]) (via HTTP); Sat, 30 Sep 2023
 03:57:35 +0200
MIME-Version: 1.0
Message-ID: <trinity-06dd34f4-ab26-4c60-bcf8-f986f1d08058-1696039055941@3c-app-mailcom-lxa04>
From: dregan@mail.com
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, dregan@mail.com
Subject: [PATCH v2] mtd: rawnand: brcmnand: Initial exec_op implementation
Date: Sat, 30 Sep 2023 03:57:35 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20230922162424.4a7b27ec@xps-13>
References: <trinity-bb7db9f1-d34d-4fe2-bed3-814d3a63476a-1694571881792@3c-app-mailcom-lxa03>
 <20230922162424.4a7b27ec@xps-13>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:TurbRofsOYdKR03qnaYu40t5KLILPIWkBqyA6igoE0cnmvHx/Wi55KFM3ieiplHu/1rds
 zgVwigc5CuqUe7W9brC72F+ivFMYJzWhNk5MJqVDIuo93HYvHm1XvjyPhtEqA9kDwV5PvCH2/DWy
 BeKC0Jcs/FMH9aq3c1qYM/aasGIShVEkowedhtH9NMatNP/9Cxc7VkPkeWsZX7Xxus0fsw/01i1R
 TBtHXf4nvG4VBGwFd5RjTmwN+WsUZW6p/83cxi66phPNaGxBk5BGaqqyhsv7TTdBB+sUCTxGKWn3
 jo=
UI-OutboundReport: notjunk:1;M01:P0:1R1aoo0v9BU=;lsPcKTmMEW0+rBfdNBdd2J1o8w+
 wxHq0XFVcHhu+ZI66UDuJJBo7/9iAbKK2tG2tlH6Uv9h8jMHRMbYJxJyZgaJcXFAUUbzMReqk
 6HyhTjEE4kblPgHnKv4G32fDwRCs0P7sRwIcQ0/cgCwtXkBS7GPB540C9XX3aKGt9SqtG0LA1
 x29MVD+Kb2rZjbjnI/t2MVefVi8n1zrsycK/OmU88KnHTqxljeo47MkyEduweR0yiG5cc1jzW
 iZEqWshQvm9MkA2LYp+DrPavnFVNtkUS0CH+n+cb48wn+lTr73WjSB38JvVBPGcUlRYttlTI1
 Bj3fj3GVHFZSuO4JWYPsx0sI47iEdIUc6IS/mmXUc6uOLW4VjYg3VKCEzbDTTOKoBopgLeKyd
 MIBjJkVTLdvG8ioZQlR6qxjNtpEeS/ZM4rVcceTtSJWSXJET+brr5dpWA+elHhEip5fwOXS5q
 bISZjbw1iQgSqVqmOuN1BF6RZztEniPyTUcCn6TfcTCbcoBR1k/AAVl0uycujWuajqQji4k+N
 8MYyasE2BLVYFzM5+o8jJo7lsVLIGZZujH0cp0TjITJkyIW8jTA3XETdJ/oUkouDP/Lo0rTKF
 +UamTQdtuoLuYWN4v8bzUb8UU+7RNypySDUGKcs3FDEmPE5LpZnR6ylLAysar5jesiufBAAVA
 rR+QIlTEAuFfUXJ49k23aC/rwxLbyfT59jA7TqPsbHJecgqsCrEcx7eK7X7csQzovKee8M9hW
 gmCZJVB1akkfHRxrmaXJ5wMtBn5uWhaoxc94KlgocVivrVj20vnMeLQWOuq6cRlGxR8YIqwkQ
 IxZALMNIn3cYpH/0IZVp1aRWA7BrFwfV89o18U/0nHJng=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_185759_035919_08171CD6 
X-CRM114-Status: GOOD (  18.63  )
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
Reviewed-by: William Zhang <william.zhang@broadcom.com>

---

Changes in v2: added error return value to bcmnand_ctrl_poll_status,
	move static flags to local struct
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 408 ++++++++++-------------
 1 file changed, 179 insertions(+), 229 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 440bef477930..5fc83fa11ad3 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -282,6 +282,8 @@ struct brcmnand_controller {
 	u32			flash_dma_mode;
 	u32                     flash_edu_mode;
 	bool			pio_poll_mode;
+	bool			status_cmd;
+	bool			wp_cmd;
 };

 struct brcmnand_cfg {
@@ -625,6 +627,8 @@ enum {
 /* Only for v7.2 */
 #define	ACC_CONTROL_ECC_EXT_SHIFT		13

+static u8 brcmnand_status(struct brcmnand_host *host);
+
 static inline bool brcmnand_non_mmio_ops(struct brcmnand_controller *ctrl)
 {
 #if IS_ENABLED(CONFIG_MTD_NAND_BRCMNAND_BCMA)
@@ -1022,19 +1026,6 @@ static inline int brcmnand_sector_1k_shift(struct brcmnand_controller *ctrl)
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
@@ -1061,10 +1052,11 @@ enum {
 	CS_SELECT_AUTO_DEVICE_ID_CFG		= BIT(30),
 };

-static int bcmnand_ctrl_poll_status(struct brcmnand_controller *ctrl,
+static int bcmnand_ctrl_poll_status(struct brcmnand_host *host,
 				    u32 mask, u32 expected_val,
 				    unsigned long timeout_ms)
 {
+	struct brcmnand_controller *ctrl = host->ctrl;
 	unsigned long limit;
 	u32 val;

@@ -1073,6 +1065,9 @@ static int bcmnand_ctrl_poll_status(struct brcmnand_controller *ctrl,

 	limit = jiffies + msecs_to_jiffies(timeout_ms);
 	do {
+		if (mask & INTFC_FLASH_STATUS)
+			brcmnand_status(host);
+
 		val = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
 		if ((val & mask) == expected_val)
 			return 0;
@@ -1379,7 +1374,7 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
 		 * make sure ctrl/flash ready before and after
 		 * changing state of #WP pin
 		 */
-		ret = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY |
+		ret = bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY |
 					       NAND_STATUS_READY,
 					       NAND_CTRL_RDY |
 					       NAND_STATUS_READY, 0);
@@ -1387,9 +1382,10 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
 			return;

 		brcmnand_set_wp(ctrl, wp);
-		nand_status_op(chip, NULL);
+		/* force controller operation to update internal copy of NAND chip status */
+		brcmnand_status(host);
 		/* NAND_STATUS_WP 0x00 = protected, 0x80 = not protected */
-		ret = bcmnand_ctrl_poll_status(ctrl,
+		ret = bcmnand_ctrl_poll_status(host,
 					       NAND_CTRL_RDY |
 					       NAND_STATUS_READY |
 					       NAND_STATUS_WP,
@@ -1629,13 +1625,13 @@ static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
 	 */
 	if (oops_in_progress) {
 		if (ctrl->cmd_pending &&
-			bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY, NAND_CTRL_RDY, 0))
+			bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY, NAND_CTRL_RDY, 0))
 			return;
 	} else
 		BUG_ON(ctrl->cmd_pending != 0);
 	ctrl->cmd_pending = cmd;

-	ret = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY, NAND_CTRL_RDY, 0);
+	ret = bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY, NAND_CTRL_RDY, 0);
 	WARN_ON(ret);

 	mb(); /* flush previous writes */
@@ -1643,16 +1639,6 @@ static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
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
@@ -1664,7 +1650,7 @@ static bool brcmstb_nand_wait_for_completion(struct nand_chip *chip)
 	if (mtd->oops_panic_write || ctrl->irq < 0) {
 		/* switch to interrupt polling and PIO mode */
 		disable_ctrl_irqs(ctrl);
-		sts = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY,
+		sts = bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY,
 					       NAND_CTRL_RDY, 0);
 		err = sts < 0;
 	} else {
@@ -1703,6 +1689,17 @@ static int brcmnand_waitfunc(struct nand_chip *chip)
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
@@ -1752,190 +1749,6 @@ static int brcmnand_low_level_op(struct brcmnand_host *host,
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
@@ -2345,8 +2158,9 @@ static int brcmnand_read_page(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	u8 *oob = oob_required ? (u8 *)chip->oob_poi : NULL;
+	u64 addr = (u64)page << chip->page_shift;

-	nand_read_page_op(chip, page, 0, NULL, 0);
+	host->last_addr = addr;

 	return brcmnand_read(mtd, chip, host->last_addr,
 			mtd->writesize >> FC_SHIFT, (u32 *)buf, oob);
@@ -2359,8 +2173,9 @@ static int brcmnand_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	u8 *oob = oob_required ? (u8 *)chip->oob_poi : NULL;
 	int ret;
+	u64 addr = (u64)page << chip->page_shift;

-	nand_read_page_op(chip, page, 0, NULL, 0);
+	host->last_addr = addr;

 	brcmnand_set_ecc_enabled(host, 0);
 	ret = brcmnand_read(mtd, chip, host->last_addr,
@@ -2468,11 +2283,11 @@ static int brcmnand_write_page(struct nand_chip *chip, const uint8_t *buf,
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
@@ -2481,13 +2296,15 @@ static int brcmnand_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
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
@@ -2511,6 +2328,142 @@ static int brcmnand_write_oob_raw(struct nand_chip *chip, int page)
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
+static int brcmnand_parser_exec_matched_op(struct nand_chip *chip,
+					 const struct nand_subop *subop)
+{
+	struct brcmnand_host *host = nand_get_controller_data(chip);
+	struct brcmnand_controller *ctrl = host->ctrl;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	const struct nand_op_instr *instr = &subop->instrs[0];
+	unsigned int i;
+	int ret = 0;
+
+	for (i = 0; i < subop->ninstrs; i++) {
+		instr = &subop->instrs[i];
+
+		if ((instr->type == NAND_OP_CMD_INSTR) &&
+			(instr->ctx.cmd.opcode == NAND_CMD_STATUS))
+			ctrl->status_cmd = 1;
+		else if (ctrl->status_cmd && (instr->type == NAND_OP_DATA_IN_INSTR)) {
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
+			ctrl->status_cmd = 0;
+
+			instr = &subop->instrs[i];
+			in = instr->ctx.data.buf.in;
+			in[0] = brcmnand_status(host) | NAND_STATUS_WP; /* hide WP status */
+		} else if (instr->type == NAND_OP_WAITRDY_INSTR) {
+			ret = bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY, NAND_CTRL_RDY, 0);
+			if (ctrl->wp_cmd) {
+				ctrl->wp_cmd = 0;
+				brcmnand_wp(mtd, 1);
+			}
+		} else { /* otherwise pass to low level implementation */
+			if ((instr->type == NAND_OP_CMD_INSTR) &&
+				(instr->ctx.cmd.opcode == NAND_CMD_RESET)) {
+				brcmnand_status(host);
+				ctrl->status_cmd = 0;
+				ctrl->wp_cmd = 0;
+				brcmnand_wp(mtd, 1);
+			}
+
+			if ((instr->type == NAND_OP_CMD_INSTR) &&
+				((instr->ctx.cmd.opcode == NAND_CMD_ERASE1) ||
+				(instr->ctx.cmd.opcode == NAND_CMD_SEQIN))) {
+				brcmnand_wp(mtd, 0);
+				ctrl->wp_cmd = 1;
+			}
+
+			ret = brcmnand_exec_instr(host, instr, i == (subop->ninstrs - 1));
+		}
+	}
+
+	return ret;
+}
+
+static const struct nand_op_parser brcmnand_op_parser = NAND_OP_PARSER(
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
@@ -2821,6 +2774,7 @@ static int brcmnand_attach_chip(struct nand_chip *chip)

 static const struct nand_controller_ops brcmnand_controller_ops = {
 	.attach_chip = brcmnand_attach_chip,
+	.exec_op = brcmnand_exec_op,
 };

 static int brcmnand_init_cs(struct brcmnand_host *host,
@@ -2845,13 +2799,6 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
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
@@ -3071,6 +3018,9 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	if (brcmnand_soc_has_ops(ctrl->soc))
 		static_branch_enable(&brcmnand_soc_has_ops_key);

+	ctrl->status_cmd = 0;
+	ctrl->wp_cmd = 0;
+
 	init_completion(&ctrl->done);
 	init_completion(&ctrl->dma_done);
 	init_completion(&ctrl->edu_done);
--
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
