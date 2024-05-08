Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB8AC25B5F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2024 11:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZeiEMYA5dAT4idgcTsU6gHOAIisdG8tt1aR+Xjtrd4=; b=l9bkl/fNvXyWpX
	HSqYR9kvuOoGYSpyM/Vqw3nTqRcTRPbGAmjUdZU4fGKAPt1zb0KsHW+TGOErBXM7Qi/wCHRkvuM4n
	AKkVnWsT9wO019mCboBrmx910GogYAtm+uQplIBaUW46gWswKwePQjLQ5DkTXfIhSmH0nVFpZuovu
	vku5aGJhQWBBefyHOEe3lpT0vgRFiC8cAr/9SVzRnPLgVbtM8QL1J2m6sB6sCsaEL/67q7vS9ZujP
	JuGKqYId0KT2KMxmWgDmbLLckHT7DMZwCWi48BZ04wyOWaZiLyqdQz7nHKTuxgToXGhvJN6ELmLOq
	pn0soM2SqBli52Hqrb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fAN-0000000F8QZ-2P3h;
	Wed, 08 May 2024 11:08:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fAK-0000000F8OQ-2Cyu
	for linux-mtd@lists.infradead.org;
	Wed, 08 May 2024 11:08:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s4fAA-0001iq-NQ; Wed, 08 May 2024 13:08:42 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s4fA9-000GOC-FN; Wed, 08 May 2024 13:08:41 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s4fA9-000NrM-1B;
	Wed, 08 May 2024 13:08:41 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 08 May 2024 13:08:29 +0200
Subject: [PATCH v2 3/3] mtd: nand: mxc_nand: support software ECC
MIME-Version: 1.0
Message-Id: <20240508-mtd-nand-mxc-nand-exec-op-v2-3-6b7366b7831f@pengutronix.de>
References: <20240508-mtd-nand-mxc-nand-exec-op-v2-0-6b7366b7831f@pengutronix.de>
In-Reply-To: <20240508-mtd-nand-mxc-nand-exec-op-v2-0-6b7366b7831f@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166521; l=5562;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=/VEH8HbAUQ9vRq1WUQ5QTlx2rcRXtWl9g9yWb1j/h/A=;
 b=9e3+uvrm0Hv+rOQCGeL/ysM5mV0yTHEE6utD6QipEFWa/qtp47wqMmRquhU1/zJCCpP2A2Iq+
 36uyRsfVo5FDjZHjzQhuvMF1yUAivaeKjnYKu4qCxOhXWPDWk/A0srW
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_040852_622537_E77D030F 
X-CRM114-Status: GOOD (  21.46  )
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

With these changes the driver can be used with software BCH ECC which
is useful for NAND chips that require a stronger ECC than the i.MX
hardware supports.

The controller normally interleaves user data with OOB data when
accessing the NAND chip. With Software BCH ECC we write the data
to the NAND in a way that the raw data on the NAND chip matches the
way the NAND layer sees it. This way commands like NAND_CMD_RNDOUT
work as expected.

This was tested on i.MX27 but should work on the other SoCs supported
by this driver as well.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/mxc_nand.c | 84 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 75 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 1e8b4553e03ba..7004fd57c80f7 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -178,6 +178,7 @@ struct mxc_nand_host {
 	int			used_oobsize;
 	int			active_cs;
 	unsigned int		ecc_stats_v1;
+	unsigned int		column;
 
 	struct completion	op_completion;
 
@@ -1397,10 +1398,10 @@ static int mxcnd_attach_chip(struct nand_chip *chip)
 	chip->ecc.bytes = host->devtype_data->eccbytes;
 	host->eccsize = host->devtype_data->eccsize;
 	chip->ecc.size = 512;
-	mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
 
 	switch (chip->ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
+		mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
 		chip->ecc.read_page = mxc_nand_read_page;
 		chip->ecc.read_page_raw = mxc_nand_read_page_raw;
 		chip->ecc.read_oob = mxc_nand_read_oob;
@@ -1465,6 +1466,54 @@ static int mxcnd_setup_interface(struct nand_chip *chip, int chipnr,
 	return host->devtype_data->setup_interface(chip, chipnr, conf);
 }
 
+static void copy_page_to_sram(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mxc_nand_host *host = nand_get_controller_data(this);
+	void *buf = host->data_buf;
+	unsigned int n_subpages = mtd->writesize / 512;
+	int oob_per_subpage, i;
+
+	/* mtd->writesize is not set during ident scanning */
+	if (!n_subpages)
+		n_subpages = 1;
+
+	oob_per_subpage = (mtd->oobsize / n_subpages) & ~1;
+
+	for (i = 0; i < n_subpages; i++) {
+		memcpy16_toio(host->main_area0 + i * 512, buf, 512);
+		buf += 512;
+
+		memcpy16_toio(host->spare0 + i * host->devtype_data->spare_len, buf,
+			      oob_per_subpage);
+		buf += oob_per_subpage;
+	}
+}
+
+static void copy_page_from_sram(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mxc_nand_host *host = nand_get_controller_data(this);
+	void *buf = host->data_buf;
+	unsigned int n_subpages = mtd->writesize / 512;
+	int oob_per_subpage, i;
+
+	/* mtd->writesize is not set during ident scanning */
+	if (!n_subpages)
+		n_subpages = 1;
+
+	oob_per_subpage = (mtd->oobsize / n_subpages) & ~1;
+
+	for (i = 0; i < n_subpages; i++) {
+		memcpy16_fromio(buf, host->main_area0 + i * 512, 512);
+		buf += 512;
+
+		memcpy16_fromio(buf, host->spare0 + i * host->devtype_data->spare_len,
+				oob_per_subpage);
+		buf += oob_per_subpage;
+	}
+}
+
 static int mxcnd_exec_op(struct nand_chip *chip,
 			 const struct nand_operation *op,
 			 bool check_only)
@@ -1496,8 +1545,11 @@ static int mxcnd_exec_op(struct nand_chip *chip,
 			 */
 			break;
 		case NAND_OP_CMD_INSTR:
-			if (instr->ctx.cmd.opcode == NAND_CMD_PAGEPROG)
+			if (instr->ctx.cmd.opcode == NAND_CMD_PAGEPROG) {
+				if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
+					copy_page_to_sram(mtd);
 				host->devtype_data->send_page(mtd, NFC_INPUT);
+			}
 
 			host->devtype_data->send_cmd(host, instr->ctx.cmd.opcode, true);
 
@@ -1506,6 +1558,8 @@ static int mxcnd_exec_op(struct nand_chip *chip,
 			if (instr->ctx.cmd.opcode == NAND_CMD_STATUS)
 				statusreq = true;
 
+			host->column = 0;
+
 			break;
 		case NAND_OP_ADDR_INSTR:
 			for (j = 0; j < instr->ctx.addr.naddrs; j++) {
@@ -1517,9 +1571,14 @@ static int mxcnd_exec_op(struct nand_chip *chip,
 			buf_write = instr->ctx.data.buf.out;
 			buf_len = instr->ctx.data.len;
 
-			memcpy32_toio(host->main_area0, buf_write, buf_len);
-			if (chip->oob_poi)
-				copy_spare(mtd, false, chip->oob_poi);
+			if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
+				memcpy32_toio(host->main_area0, buf_write, buf_len);
+				if (chip->oob_poi)
+					copy_spare(mtd, false, chip->oob_poi);
+			} else {
+				memcpy(host->data_buf + host->column, buf_write, buf_len);
+				host->column += buf_len;
+			}
 
 			break;
 		case NAND_OP_DATA_IN_INSTR:
@@ -1552,11 +1611,18 @@ static int mxcnd_exec_op(struct nand_chip *chip,
 
 			host->devtype_data->read_page(chip);
 
-			if (IS_ALIGNED(buf_len, 4)) {
-				memcpy32_fromio(buf_read, host->main_area0, buf_len);
+			if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
+				if (IS_ALIGNED(buf_len, 4)) {
+					memcpy32_fromio(buf_read, host->main_area0, buf_len);
+				} else {
+					memcpy32_fromio(host->data_buf, host->main_area0, mtd->writesize);
+					memcpy(buf_read, host->data_buf, buf_len);
+				}
 			} else {
-				memcpy32_fromio(host->data_buf, host->main_area0, mtd->writesize);
-				memcpy(buf_read, host->data_buf, buf_len);
+				if (!host->column)
+					copy_page_from_sram(mtd);
+				memcpy(buf_read, host->data_buf + host->column, buf_len);
+				host->column += buf_len;
 			}
 
 			break;

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
