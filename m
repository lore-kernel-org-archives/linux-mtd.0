Return-Path: <SRS0=cSwW=6C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A32C352BE
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Apr 2020 19:42:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 152CE21D93
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Apr 2020 19:42:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OaOXMGEo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 152CE21D93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OrEz8kmTd3OZtc1Xnra/gdyaow0EzJm6cbeO0/4pHwI=; b=OaOXMGEom309rj
	nkyG5W7LCX4VEgtXuFtKlZUU3iNpMXPl5y1thzXa1CT/f35PhOd2Ue/yA3bL4n6XvvznZ4D/pL3yQ
	j1SezKstw9+wjMvld29I4L9lJPIFLfWIEhfujc1/jUu2F687VQghc0Lz32KDjI0xxsy9g/HEF0rqC
	emg5vlGqOZ9fdfHl0qUHZzDk7PbcKJNkpFg33tIVVTV5V5yDsQXE/Xk+blx9hmJCI0pLbYz2mqVJP
	2Lxyx1+SSpu8VAMeB+O2N9yqIeIrSbsdm8wORQmhbiR9HJwvCqyXiwoeoD8RXnWhSux/W6SJao6rH
	v9pflJV7tZ0ETyhbg84g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPtMJ-00050R-R6; Sat, 18 Apr 2020 19:42:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPtMG-0004zG-EI
 for linux-mtd@lists.infradead.org; Sat, 18 Apr 2020 19:42:34 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 15FF126051A;
 Sat, 18 Apr 2020 20:42:29 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: Take check_only into account
Date: Sat, 18 Apr 2020 21:42:17 +0200
Message-Id: <20200418194217.1016060-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_124232_744476_C415715A 
X-CRM114-Status: GOOD (  15.46  )
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
Cc: Lucas Stach <dev@lynxeye.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Stefan Agner <stefan@agner.ch>, Marek Vasut <marek.vasut@gmail.com>,
 Liang Yang <liang.yang@amlogic.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Han Xu <han.xu@nxp.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

->exec_op() is passed a check_only argument that encodes when the
controller should just check whether the operation is supported or not
without executing it. Some controllers simply ignore this arguments,
others don't but keep modifying some of the registers before returning.
Let's fix all those drivers.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 8 +++++---
 drivers/mtd/nand/raw/fsmc_nand.c               | 3 +++
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c     | 3 +++
 drivers/mtd/nand/raw/marvell_nand.c            | 3 ++-
 drivers/mtd/nand/raw/meson_nand.c              | 3 +++
 drivers/mtd/nand/raw/mxic_nand.c               | 3 +++
 drivers/mtd/nand/raw/nandsim.c                 | 3 +++
 drivers/mtd/nand/raw/stm32_fmc2_nand.c         | 6 +++---
 drivers/mtd/nand/raw/sunxi_nand.c              | 3 ++-
 drivers/mtd/nand/raw/tegra_nand.c              | 4 +++-
 drivers/mtd/nand/raw/vf610_nfc.c               | 4 +++-
 11 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index efddc5c68afb..61aff01b18e2 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -2223,10 +2223,12 @@ static int cadence_nand_exec_op(struct nand_chip *chip,
 				const struct nand_operation *op,
 				bool check_only)
 {
-	int status = cadence_nand_select_target(chip);
+	if (!check_only) {
+		int status = cadence_nand_select_target(chip);
 
-	if (status)
-		return status;
+		if (status)
+			return status;
+	}
 
 	return nand_op_parser_exec_op(chip, &cadence_nand_op_parser, op,
 				      check_only);
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index a6964feeec77..59ef2b6a21b5 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -608,6 +608,9 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 	unsigned int op_id;
 	int i;
 
+	if (check_only)
+		return 0;
+
 	pr_debug("Executing operation [%d instructions]:\n", op->ninstrs);
 
 	for (op_id = 0; op_id < op->ninstrs; op_id++) {
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 53b00c841aec..cc4cb190968e 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2408,6 +2408,9 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	struct completion *completion;
 	unsigned long to;
 
+	if (check_only)
+		return 0;
+
 	this->ntransfers = 0;
 	for (i = 0; i < GPMI_MAX_TRANSFERS; i++)
 		this->transfers[i].direction = DMA_NONE;
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 179f0ca585f8..343001250ccc 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2107,7 +2107,8 @@ static int marvell_nfc_exec_op(struct nand_chip *chip,
 {
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
 
-	marvell_nfc_select_target(chip, op->cs);
+	if (!check_only)
+		marvell_nfc_select_target(chip, op->cs);
 
 	if (nfc->caps->is_nfcv2)
 		return nand_op_parser_exec_op(chip, &marvell_nfcv2_op_parser,
diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index f6fb5c0e6255..e961f7bebf0a 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -899,6 +899,9 @@ static int meson_nfc_exec_op(struct nand_chip *nand,
 	u32 op_id, delay_idle, cmd;
 	int i;
 
+	if (check_only)
+		return 0;
+
 	meson_nfc_select_chip(nand, op->cs);
 	for (op_id = 0; op_id < op->ninstrs; op_id++) {
 		instr = &op->instrs[op_id];
diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index ed7a4e021bf5..5a5a5b3b546d 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -393,6 +393,9 @@ static int mxic_nfc_exec_op(struct nand_chip *chip,
 	int ret = 0;
 	unsigned int op_id;
 
+	if (check_only)
+		return 0;
+
 	mxic_nfc_cs_enable(nfc);
 	init_completion(&nfc->complete);
 	for (op_id = 0; op_id < op->ninstrs; op_id++) {
diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 1de03bb34e84..23cda67a3f53 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2144,6 +2144,9 @@ static int ns_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 	const struct nand_op_instr *instr = NULL;
 	struct nandsim *ns = nand_get_controller_data(chip);
 
+	if (check_only)
+		return 0;
+
 	ns->lines.ce = 1;
 
 	for (op_id = 0; op_id < op->ninstrs; op_id++) {
diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index b6d45cd911ae..46b7d04e2c87 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1365,13 +1365,13 @@ static int stm32_fmc2_exec_op(struct nand_chip *chip,
 	unsigned int op_id, i;
 	int ret;
 
+	if (check_only)
+		return 0;
+
 	ret = stm32_fmc2_select_chip(chip, op->cs);
 	if (ret)
 		return ret;
 
-	if (check_only)
-		return ret;
-
 	for (op_id = 0; op_id < op->ninstrs; op_id++) {
 		instr = &op->instrs[op_id];
 
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5f3e40b79fb1..18ac0b36abfa 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1907,7 +1907,8 @@ static int sunxi_nfc_exec_op(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	const struct nand_op_parser *parser;
 
-	sunxi_nfc_select_chip(nand, op->cs);
+	if (!check_only)
+		sunxi_nfc_select_chip(nand, op->cs);
 
 	if (sunxi_nand->sels[op->cs].rb >= 0)
 		parser = &sunxi_nfc_op_parser;
diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 3cc9a4c41443..6a255ba0f288 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -467,7 +467,9 @@ static int tegra_nand_exec_op(struct nand_chip *chip,
 			      const struct nand_operation *op,
 			      bool check_only)
 {
-	tegra_nand_select_target(chip, op->cs);
+	if (!check_only)
+		tegra_nand_select_target(chip, op->cs);
+
 	return nand_op_parser_exec_op(chip, &tegra_nand_op_parser, op,
 				      check_only);
 }
diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 6b399a75f9ae..bd9e16de78a2 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -502,7 +502,9 @@ static int vf610_nfc_exec_op(struct nand_chip *chip,
 			     const struct nand_operation *op,
 			     bool check_only)
 {
-	vf610_nfc_select_target(chip, op->cs);
+	if (!check_only)
+		vf610_nfc_select_target(chip, op->cs);
+
 	return nand_op_parser_exec_op(chip, &vf610_nfc_op_parser, op,
 				      check_only);
 }
-- 
2.25.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
