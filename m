Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB0CC44501
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2026 09:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WsUd0iCvjIIPBRLIehby3Cbj0FTO9AFGri6M8U23NuQ=; b=vu1LYehd64F2/q
	zVk92aLxLfrLGtVq7GEGkn1p2YTdanMhO1q3ME/eKMPLzAJ2AAb7IdON2oEpBRUmkNu5CD+4h+q/l
	jAamg+rfv2sC1dIo1NJU04GSX5OrYmj2Gu3Xf0AH0IUjKqAIxFjNzTOzE+muftJJR3ehGnv78oY+e
	C+qMbwAAAVli/x3SS3Nl1TSAuoKDWpGO0QQgVmEZxWEqQ/U2Yif/2pCGEpzMicjmpNcBSAPShk9f6
	Ul8jd0WxPejnA68WF+TGdOqMC9G/gL5PrVK37zhqCtRf8y1Sq/XEscDbRH8guv6Cp4ViNYp62XwFW
	jI4p7cw81MU/k34VNWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCiB-00000008gKC-1CQn;
	Mon, 13 Jul 2026 09:12:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCi9-00000008gI3-3OUO
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jul 2026 09:12:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0725C601D9;
	Mon, 13 Jul 2026 09:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7531F00A3A;
	Mon, 13 Jul 2026 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783933944;
	bh=fiVHq9yvDctQZ37sWjhT0XWLe2eyB2DERBvEOXW44XE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JaopRC4nXeNMHs7ZYsAfO1CqVMRGzQOC1o9IEbapPlP7TV8bGauzswscQA+QCrjtz
	 D7s1IT7aKUQhHE/9Ij6q2WVA/dmj4kFcU7VBmRyzTDXUtNigYTsPsp/s1BwinfOcCU
	 dJhNeOvYGsInZlsljw02CfwZ0ArqmQgaQMNH++Ghhe9ISsiwqWu8GorqaA8D3Jtdoo
	 kG8rlFPb0D+sEwtX4jaFmTYnqKAAnz7RfgrdDhUTe+pJvEElVOLmS1fLo7Aq3dpuAQ
	 +DQwGB0gRE4hBOPYA4VwyuGt3IBuYLOEtP46yEDZ2zySy8uvoRSRaLSEcvTPqvMzrr
	 lVM3GfDWyhUtw==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 3/8] mtd: spi-nor: move cmd_ext_type into spi_nor_flash_parameter
Date: Mon, 13 Jul 2026 11:11:41 +0200
Message-ID: <20260713091206.2414400-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260713091206.2414400-1-mwalle@kernel.org>
References: <20260713091206.2414400-1-mwalle@kernel.org>
MIME-Version: 1.0
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

Right now the SFDP parsing code is modifying both members of
struct spi_nor_flash_parameter and struct spi_nor. This may lead to
inconsistencies if the parsing fails because only the flash parameters
are rolled back.

To fix this, move cmd_ext_type into the struct spi_nor_flash_parameter.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260601125438.3481722-1-mwalle%40kernel.org?part=3
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c      | 2 +-
 drivers/mtd/spi-nor/core.h      | 2 ++
 drivers/mtd/spi-nor/debugfs.c   | 2 +-
 drivers/mtd/spi-nor/micron-st.c | 2 +-
 drivers/mtd/spi-nor/sfdp.c      | 4 ++--
 include/linux/mtd/spi-nor.h     | 2 --
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index fbf8c2d9c6b5..8ccd7d520791 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -59,7 +59,7 @@
 static u8 spi_nor_get_cmd_ext(const struct spi_nor *nor,
 			      const struct spi_mem_op *op)
 {
-	switch (nor->cmd_ext_type) {
+	switch (nor->params->cmd_ext_type) {
 	case SPI_NOR_EXT_INVERT:
 		return ~op->cmd.opcode;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 2ebc5c3caca1..835076d86e3b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -370,6 +370,7 @@ struct spi_nor_otp {
  *                      in the array, the higher priority.
  * @page_programs:	page program capabilities ordered by priority: the
  *                      higher index in the array, the higher priority.
+ * @cmd_ext_type:	the command opcode extension type for DTR mode.
  * @erase_map:		the erase map parsed from the SFDP Sector Map Parameter
  *                      Table.
  * @otp:		SPI NOR OTP info.
@@ -399,6 +400,7 @@ struct spi_nor_flash_parameter {
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
 	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
+	enum spi_nor_cmd_ext		cmd_ext_type;
 
 	struct spi_nor_erase_map        erase_map;
 	struct spi_nor_otp		otp;
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 090049b67044..dc2ed784f519 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -109,7 +109,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	seq_printf(s, " erase\t\t0x%02x\n", nor->erase_opcode);
 	seq_printf(s, " program\t0x%02x\n", nor->program_opcode);
 
-	switch (nor->cmd_ext_type) {
+	switch (params->cmd_ext_type) {
 	case SPI_NOR_EXT_NONE:
 		str = "none";
 		break;
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index c75b0a1cd567..186362066c6b 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -177,7 +177,7 @@ static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
 	spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
 				SPINOR_OP_PP_4B, SNOR_PROTO_8_8_8_DTR);
 
-	nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
+	nor->params->cmd_ext_type = SPI_NOR_EXT_REPEAT;
 	nor->params->rdsr_dummy = 8;
 	nor->params->rdsr_addr_nbytes = 0;
 
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 00a66d13cbff..7e44d3c4d89a 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -664,11 +664,11 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	/* 8D-8D-8D command extension. */
 	switch (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
 	case BFPT_DWORD18_CMD_EXT_REP:
-		nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
+		params->cmd_ext_type = SPI_NOR_EXT_REPEAT;
 		break;
 
 	case BFPT_DWORD18_CMD_EXT_INV:
-		nor->cmd_ext_type = SPI_NOR_EXT_INVERT;
+		params->cmd_ext_type = SPI_NOR_EXT_INVERT;
 		break;
 
 	case BFPT_DWORD18_CMD_EXT_RES:
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 4b92494827b1..e75c1b4cb4c0 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -366,7 +366,6 @@ struct spi_nor_flash_parameter;
  * @program_opcode:	the program opcode
  * @sst_write_second:	used by the SST write operation
  * @flags:		flag options for the current SPI NOR (SNOR_F_*)
- * @cmd_ext_type:	the command opcode extension type for DTR mode.
  * @read_proto:		the SPI protocol for read operations
  * @write_proto:	the SPI protocol for write operations
  * @reg_proto:		the SPI protocol for read_reg/write_reg/erase operations
@@ -408,7 +407,6 @@ struct spi_nor {
 	enum spi_nor_protocol	reg_proto;
 	bool			sst_write_second;
 	u32			flags;
-	enum spi_nor_cmd_ext	cmd_ext_type;
 	struct sfdp		*sfdp;
 	struct dentry		*debugfs_root;
 	u8			dfs_sr_cache[2];
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
