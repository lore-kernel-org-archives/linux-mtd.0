Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28FFC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:24:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE58D20849
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:24:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rI9y2bSC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE58D20849
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ib3MJZm0d5ke/TgWoMyNPkFxYA25WW2Cl2RkQhaUUSE=; b=rI9y2bSC/AWiKC
	Ru/y46RP4hpbqsajAngn4YQU+H1MTYzdXP2CMqEqlfZdqpN/3GzTXJATS2hj7NfId9EARX/wB3rIM
	xs50NlRCDs3v8AU2U22YqcE/jHJ2LoGHQtrIs1XN7FuLBVC17JbC9Q+yYfw7ojis5DE4kW4RlUpwK
	IjEuK//rPTaEk9ItjAa7x7uozNDfkdWWiR1//BsNuUOId6iqvzYLox3RvnjRpF34kaVyj4jahuYQQ
	vP+jyfqvR1B8QmtF4ci9zSE0xbaPjIBGiYeXAfFNOH2SDg/0foiG1pk+YgRIOK5pGPPzHrqv59CBo
	mJ0XXhxtAqPhA7Gpc/0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdfAw-0000p0-Ni; Tue, 26 May 2020 19:23:46 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdf5N-0001ef-JH
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 19:18:06 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 36980240005;
 Tue, 26 May 2020 19:17:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v5 20/28] mtd: rawnand: Hide the chip->data_interface
 indirection
Date: Tue, 26 May 2020 21:17:17 +0200
Message-Id: <20200526191725.7591-21-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526191725.7591-1-miquel.raynal@bootlin.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_121802_064621_EBEB2DFF 
X-CRM114-Status: GOOD (  13.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Rickard Andersson <rickaran@axis.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

As a preparation for allocating the data interface structure
dynamically (and rename it), let's avoid calling it directly.

Instead, we operate a rename on an existing helper to reuse that name
for another helper:
* s/nand_get_sdr_timings/nand_extract_sdr_timings/
  -> this helper just extracts timings from a given data interface
* nand_get_sdr_timings()
  -> this helper retrieves the in use timings from a nand_chip structure

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/ams-delta.c              |  2 +-
 .../mtd/nand/raw/cadence-nand-controller.c    |  2 +-
 drivers/mtd/nand/raw/denali.c                 |  2 +-
 drivers/mtd/nand/raw/fsmc_nand.c              |  2 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c    |  2 +-
 drivers/mtd/nand/raw/marvell_nand.c           |  6 +--
 drivers/mtd/nand/raw/meson_nand.c             |  8 ++--
 drivers/mtd/nand/raw/mtk_nand.c               |  2 +-
 drivers/mtd/nand/raw/mxc_nand.c               |  2 +-
 drivers/mtd/nand/raw/mxic_nand.c              |  2 +-
 drivers/mtd/nand/raw/nand_base.c              | 43 +++++++------------
 drivers/mtd/nand/raw/nand_legacy.c            |  2 +-
 drivers/mtd/nand/raw/nand_toshiba.c           |  3 +-
 drivers/mtd/nand/raw/s3c2410.c                |  2 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        |  4 +-
 drivers/mtd/nand/raw/sunxi_nand.c             |  2 +-
 drivers/mtd/nand/raw/tango_nand.c             |  2 +-
 drivers/mtd/nand/raw/tegra_nand.c             |  2 +-
 include/linux/mtd/rawnand.h                   | 14 +++++-
 19 files changed, 49 insertions(+), 55 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 3711e7a0436c..c541f78f9e1d 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -195,7 +195,7 @@ static int gpio_nand_setup_data_interface(struct nand_chip *this, int csline,
 					  const struct nand_data_interface *cf)
 {
 	struct gpio_nand *priv = nand_get_controller_data(this);
-	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(cf);
+	const struct nand_sdr_timings *sdr = nand_extract_sdr_timings(cf);
 	struct device *dev = &nand_to_mtd(this)->dev;
 
 	if (IS_ERR(sdr))
diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index c405722adfe1..847aaa3d7508 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -2327,7 +2327,7 @@ cadence_nand_setup_data_interface(struct nand_chip *chip, int chipnr,
 	u32 dll_phy_dqs_timing = 0, phony_dqs_timing = 0, rd_del_sel = 0;
 	u32 sampling_point;
 
-	sdr = nand_get_sdr_timings(conf);
+	sdr = nand_extract_sdr_timings(conf);
 	if (IS_ERR(sdr))
 		return PTR_ERR(sdr);
 
diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 4e6e1578aa2d..b45998e6ecc5 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -774,7 +774,7 @@ static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 	int addr_2_data_mask;
 	u32 tmp;
 
-	timings = nand_get_sdr_timings(conf);
+	timings = nand_extract_sdr_timings(conf);
 	if (IS_ERR(timings))
 		return PTR_ERR(timings);
 
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 3909752b14c5..c7cacc77b7c8 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -335,7 +335,7 @@ static int fsmc_setup_data_interface(struct nand_chip *nand, int csline,
 	const struct nand_sdr_timings *sdrt;
 	int ret;
 
-	sdrt = nand_get_sdr_timings(conf);
+	sdrt = nand_extract_sdr_timings(conf);
 	if (IS_ERR(sdrt))
 		return PTR_ERR(sdrt);
 
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 061a8ddda275..341248e69d18 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -743,7 +743,7 @@ static int gpmi_setup_data_interface(struct nand_chip *chip, int chipnr,
 	const struct nand_sdr_timings *sdr;
 
 	/* Retrieve required NAND timings */
-	sdr = nand_get_sdr_timings(conf);
+	sdr = nand_extract_sdr_timings(conf);
 	if (IS_ERR(sdr))
 		return PTR_ERR(sdr);
 
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index ebf45a2754f1..acd45bbe1782 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -1096,7 +1096,7 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
 						const u8 *oob_buf, bool raw,
 						int page)
 {
-	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(&chip->data_interface);
+	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 	struct marvell_nand_chip *marvell_nand = to_marvell_nand(chip);
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
 	const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
@@ -1562,7 +1562,7 @@ static int marvell_nfc_hw_ecc_bch_write_page(struct nand_chip *chip,
 					     const u8 *buf,
 					     int oob_required, int page)
 {
-	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(&chip->data_interface);
+	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
 	const u8 *data = buf;
@@ -2316,7 +2316,7 @@ static int marvell_nfc_setup_data_interface(struct nand_chip *chip, int chipnr,
 	struct marvell_nfc_timings nfc_tmg;
 	int read_delay;
 
-	sdr = nand_get_sdr_timings(conf);
+	sdr = nand_extract_sdr_timings(conf);
 	if (IS_ERR(sdr))
 		return PTR_ERR(sdr);
 
diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 3f376471f3f7..95b5f3d7c714 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -575,8 +575,7 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct meson_nfc *nfc = nand_get_controller_data(nand);
-	const struct nand_sdr_timings *sdr =
-		nand_get_sdr_timings(&nand->data_interface);
+	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(nand);
 	u32 *addrs = nfc->cmdfifo.rw.addrs;
 	u32 cs = nfc->param.chip_select;
 	u32 cmd0, cmd_num, row_start;
@@ -627,8 +626,7 @@ static int meson_nfc_write_page_sub(struct nand_chip *nand,
 				    int page, int raw)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
-	const struct nand_sdr_timings *sdr =
-		nand_get_sdr_timings(&nand->data_interface);
+	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(nand);
 	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
 	struct meson_nfc *nfc = nand_get_controller_data(nand);
 	int data_len, info_len;
@@ -1104,7 +1102,7 @@ int meson_nfc_setup_data_interface(struct nand_chip *nand, int csline,
 	const struct nand_sdr_timings *timings;
 	u32 div, bt_min, bt_max, tbers_clocks;
 
-	timings = nand_get_sdr_timings(conf);
+	timings = nand_extract_sdr_timings(conf);
 	if (IS_ERR(timings))
 		return -ENOTSUPP;
 
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index c1a6e31aabb8..e64abb77ed12 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -509,7 +509,7 @@ static int mtk_nfc_setup_data_interface(struct nand_chip *chip, int csline,
 	u32 rate, tpoecs, tprecs, tc2r, tw2r, twh, twst = 0, trlt = 0;
 	u32 temp, tsel = 0;
 
-	timings = nand_get_sdr_timings(conf);
+	timings = nand_extract_sdr_timings(conf);
 	if (IS_ERR(timings))
 		return -ENOTSUPP;
 
diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 09dacb83cb5a..0613e22f180c 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1148,7 +1148,7 @@ static int mxc_nand_v2_setup_data_interface(struct nand_chip *chip, int csline,
 	const struct nand_sdr_timings *timings;
 	u16 config1;
 
-	timings = nand_get_sdr_timings(conf);
+	timings = nand_extract_sdr_timings(conf);
 	if (IS_ERR(timings))
 		return -ENOTSUPP;
 
diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index 57f36721f4c6..277c168e0af7 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -459,7 +459,7 @@ static int mxic_nfc_setup_data_interface(struct nand_chip *chip, int chipnr,
 	unsigned long freq;
 	int ret;
 
-	sdr = nand_get_sdr_timings(conf);
+	sdr = nand_extract_sdr_timings(conf);
 	if (IS_ERR(sdr))
 		return PTR_ERR(sdr);
 
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 1005035c233a..6a7edd2e1357 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -773,7 +773,7 @@ int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
 		return -ENOTSUPP;
 
 	/* Wait tWB before polling the STATUS reg. */
-	timings = nand_get_sdr_timings(&chip->data_interface);
+	timings = nand_get_sdr_timings(chip);
 	ndelay(PSEC_TO_NSEC(timings->tWB_max));
 
 	ret = nand_status_op(chip, NULL);
@@ -1119,8 +1119,7 @@ static int nand_sp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 				     unsigned int len)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	const struct nand_sdr_timings *sdr =
-		nand_get_sdr_timings(&chip->data_interface);
+	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 	u8 addrs[4];
 	struct nand_op_instr instrs[] = {
 		NAND_OP_CMD(NAND_CMD_READ0, 0),
@@ -1161,8 +1160,7 @@ static int nand_lp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 				     unsigned int offset_in_page, void *buf,
 				     unsigned int len)
 {
-	const struct nand_sdr_timings *sdr =
-		nand_get_sdr_timings(&chip->data_interface);
+	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 	u8 addrs[5];
 	struct nand_op_instr instrs[] = {
 		NAND_OP_CMD(NAND_CMD_READ0, 0),
@@ -1258,8 +1256,7 @@ int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
 		return -EINVAL;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_PARAM, 0),
 			NAND_OP_ADDR(1, &page, PSEC_TO_NSEC(sdr->tWB_max)),
@@ -1313,8 +1310,7 @@ int nand_change_read_column_op(struct nand_chip *chip,
 		return -ENOTSUPP;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 		u8 addrs[2] = {};
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_RNDOUT, 0),
@@ -1389,8 +1385,7 @@ static int nand_exec_prog_page_op(struct nand_chip *chip, unsigned int page,
 				  unsigned int len, bool prog)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	const struct nand_sdr_timings *sdr =
-		nand_get_sdr_timings(&chip->data_interface);
+	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 	u8 addrs[5] = {};
 	struct nand_op_instr instrs[] = {
 		/*
@@ -1512,8 +1507,7 @@ int nand_prog_page_end_op(struct nand_chip *chip)
 	u8 status;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_PAGEPROG,
 				    PSEC_TO_NSEC(sdr->tWB_max)),
@@ -1619,8 +1613,7 @@ int nand_change_write_column_op(struct nand_chip *chip,
 		return -ENOTSUPP;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 		u8 addrs[2];
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_RNDIN, 0),
@@ -1674,8 +1667,7 @@ int nand_readid_op(struct nand_chip *chip, u8 addr, void *buf,
 		return -EINVAL;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_READID, 0),
 			NAND_OP_ADDR(1, &addr, PSEC_TO_NSEC(sdr->tADL_min)),
@@ -1713,8 +1705,7 @@ EXPORT_SYMBOL_GPL(nand_readid_op);
 int nand_status_op(struct nand_chip *chip, u8 *status)
 {
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_STATUS,
 				    PSEC_TO_NSEC(sdr->tADL_min)),
@@ -1782,8 +1773,7 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
 	u8 status;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 		u8 addrs[3] = {	page, page >> 8, page >> 16 };
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_ERASE1, 0),
@@ -1841,8 +1831,7 @@ static int nand_set_features_op(struct nand_chip *chip, u8 feature,
 	int i, ret;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_SET_FEATURES, 0),
 			NAND_OP_ADDR(1, &feature, PSEC_TO_NSEC(sdr->tADL_min)),
@@ -1888,8 +1877,7 @@ static int nand_get_features_op(struct nand_chip *chip, u8 feature,
 	int i;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_GET_FEATURES, 0),
 			NAND_OP_ADDR(1, &feature, PSEC_TO_NSEC(sdr->tWB_max)),
@@ -1945,8 +1933,7 @@ static int nand_wait_rdy_op(struct nand_chip *chip, unsigned int timeout_ms,
 int nand_reset_op(struct nand_chip *chip)
 {
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_RESET, PSEC_TO_NSEC(sdr->tWB_max)),
 			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tRST_max), 0),
@@ -3293,7 +3280,7 @@ static void nand_wait_readrdy(struct nand_chip *chip)
 	if (!(chip->options & NAND_NEED_READRDY))
 		return;
 
-	sdr = nand_get_sdr_timings(&chip->data_interface);
+	sdr = nand_get_sdr_timings(chip);
 	WARN_ON(nand_wait_rdy_op(chip, PSEC_TO_MSEC(sdr->tR_max), 0));
 }
 
diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
index 34b4c944f6a6..fc0443bb45cf 100644
--- a/drivers/mtd/nand/raw/nand_legacy.c
+++ b/drivers/mtd/nand/raw/nand_legacy.c
@@ -354,7 +354,7 @@ static void nand_command(struct nand_chip *chip, unsigned int command,
 
 static void nand_ccs_delay(struct nand_chip *chip)
 {
-	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(&chip->data_interface);
+	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 
 	/*
 	 * The controller already takes care of waiting for tCCS when the RNDIN
diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index ae069905d7e4..302d4a6e175b 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -32,8 +32,7 @@ static int toshiba_nand_benand_read_eccstatus_op(struct nand_chip *chip,
 	u8 *ecc_status = buf;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(&chip->data_interface);
+		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(TOSHIBA_NAND_CMD_ECC_STATUS_READ,
 				    PSEC_TO_NSEC(sdr->tADL_min)),
diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index f86dff311464..be95d9fbd33a 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -817,7 +817,7 @@ static int s3c2410_nand_setup_data_interface(struct nand_chip *chip, int csline,
 	const struct nand_sdr_timings *timings;
 	int tacls;
 
-	timings = nand_get_sdr_timings(conf);
+	timings = nand_extract_sdr_timings(conf);
 	if (IS_ERR(timings))
 		return -ENOTSUPP;
 
diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 65c9d17b25a3..e0969ecc910d 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1308,7 +1308,7 @@ static int stm32_fmc2_nfc_waitrdy(struct nand_chip *chip,
 		dev_warn(nfc->dev, "Waitrdy timeout\n");
 
 	/* Wait tWB before R/B# signal is low */
-	timings = nand_get_sdr_timings(&chip->data_interface);
+	timings = nand_get_sdr_timings(chip);
 	ndelay(PSEC_TO_NSEC(timings->tWB_max));
 
 	/* R/B# signal is low, clear high level flag */
@@ -1550,7 +1550,7 @@ static int stm32_fmc2_nfc_setup_interface(struct nand_chip *chip, int chipnr,
 {
 	const struct nand_sdr_timings *sdrt;
 
-	sdrt = nand_get_sdr_timings(conf);
+	sdrt = nand_extract_sdr_timings(conf);
 	if (IS_ERR(sdrt))
 		return PTR_ERR(sdrt);
 
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ffbc1651fadc..eb99b23629b8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1386,7 +1386,7 @@ static int sunxi_nfc_setup_data_interface(struct nand_chip *nand, int csline,
 	s32 tWB, tADL, tWHR, tRHW, tCAD;
 	long real_clk_rate;
 
-	timings = nand_get_sdr_timings(conf);
+	timings = nand_extract_sdr_timings(conf);
 	if (IS_ERR(timings))
 		return -ENOTSUPP;
 
diff --git a/drivers/mtd/nand/raw/tango_nand.c b/drivers/mtd/nand/raw/tango_nand.c
index 246871e01027..0c98b95704fe 100644
--- a/drivers/mtd/nand/raw/tango_nand.c
+++ b/drivers/mtd/nand/raw/tango_nand.c
@@ -479,7 +479,7 @@ static u32 to_ticks(int kHz, int ps)
 static int tango_set_timings(struct nand_chip *chip, int csline,
 			     const struct nand_data_interface *conf)
 {
-	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(conf);
+	const struct nand_sdr_timings *sdr = nand_extract_sdr_timings(conf);
 	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
 	struct tango_chip *tchip = to_tango_chip(chip);
 	u32 Trdy, Textw, Twc, Twpw, Tacc, Thold, Trpw, Textr;
diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index f9d046b2cd3b..2aaba9e15614 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -819,7 +819,7 @@ static int tegra_nand_setup_data_interface(struct nand_chip *chip, int csline,
 	struct tegra_nand_controller *ctrl = to_tegra_ctrl(chip->controller);
 	const struct nand_sdr_timings *timings;
 
-	timings = nand_get_sdr_timings(conf);
+	timings = nand_extract_sdr_timings(conf);
 	if (IS_ERR(timings))
 		return PTR_ERR(timings);
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 6c334cca3977..2995d29587c3 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -517,11 +517,11 @@ struct nand_data_interface {
 };
 
 /**
- * nand_get_sdr_timings - get SDR timing from data interface
+ * nand_extract_sdr_timings - Retrieve SDR timing from a data interface
  * @conf:	The data interface
  */
 static inline const struct nand_sdr_timings *
-nand_get_sdr_timings(const struct nand_data_interface *conf)
+nand_extract_sdr_timings(const struct nand_data_interface *conf)
 {
 	if (conf->type != NAND_SDR_IFACE)
 		return ERR_PTR(-EINVAL);
@@ -1206,6 +1206,16 @@ static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
 /* Default/reset data interface */
 extern const struct nand_data_interface *nand_reset_data_iface;
 
+/**
+ * nand_get_sdr_timings - Retrieve the current SDR timings of a NAND chip
+ * @chip: The NAND chip
+ */
+static inline const struct nand_sdr_timings *
+nand_get_sdr_timings(struct nand_chip *chip)
+{
+	return nand_extract_sdr_timings(&chip->data_interface);
+}
+
 /*
  * A helper for defining older NAND chips where the second ID byte fully
  * defined the chip, including the geometry (chip size, eraseblock size, page
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
