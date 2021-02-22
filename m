Return-Path: <SRS0=UneP=HY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754ACC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 06:26:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDC4564E76
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 06:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDC4564E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y7QqkoteLkrtZAGzbwxVvL9G8Nzi9HZkfgFHZYsiSsc=; b=ekkVGEh3qtRxzOY/lGEYu28fYK
	NZmHl1gRwpQ7d4+VytKYZNBEUl4BUr9yPjE3KBJrCM6vRo8Ma30mjoU/+FmG0lOrrUSEWEkO82R44
	twpUZPiYcxCxnpZ1Uz31UbthdkzUgjTYsFmWiqDZht3qqC3oyEK0ic8N3kYQBEV+CkzBRzcQ9KY0R
	iTVAXMqzCvbmIrIgdrVtoH3nCNV9LsdiwKEVU7Hmru7QiBD3d6kkhIXtMiUBgbsPSPsb8v97j2cCB
	8BgqK/pw/hyMrcS+E89UrysqdSPaPw68AmcNmQp/LzIr7WeUkizC6iiLHW0NPOJXH349543OmatXs
	l4QHJLqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE4eq-0002nz-08; Mon, 22 Feb 2021 06:25:24 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE4en-0002nd-8Y
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2021 06:25:22 +0000
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 21 Feb 2021 22:25:19 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Feb 2021 22:25:17 -0800
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 22 Feb 2021 11:54:57 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id 7B1E221107; Mon, 22 Feb 2021 11:54:57 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: qcom: Add helper to check last code word
Date: Mon, 22 Feb 2021 11:54:55 +0530
Message-Id: <1613975095-15550-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_012521_502553_2FE986B2 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: mdalam@codeaurora.org, sricharan@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This change will add helper qcom_nandc_is_last_cw()
which will check for last code word and return true for
last code word and false for other code word.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index ae8870ec..4189a7f 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -661,6 +661,12 @@ static void nandc_set_reg(struct qcom_nand_controller *nandc, int offset,
 		*reg = cpu_to_le32(val);
 }
 
+/* Helper to check the code word, whether it is last cw or not */
+static bool qcom_nandc_is_last_cw(struct nand_ecc_ctrl *ecc, int cw)
+{
+	return cw == (ecc->steps - 1);
+}
+
 /* helper to configure address register values */
 static void set_address(struct qcom_nand_host *host, u16 column, int page)
 {
@@ -1632,7 +1638,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 	oob_size1 = host->bbm_size;
 
-	if (cw == (ecc->steps - 1)) {
+	if (qcom_nandc_is_last_cw(ecc, cw)) {
 		data_size2 = ecc->size - data_size1 -
 			     ((ecc->steps - 1) * 4);
 		oob_size2 = (ecc->steps * 4) + host->ecc_bytes_hw +
@@ -1713,7 +1719,7 @@ check_for_erased_page(struct qcom_nand_host *host, u8 *data_buf,
 	}
 
 	for_each_set_bit(cw, &uncorrectable_cws, ecc->steps) {
-		if (cw == (ecc->steps - 1)) {
+		if (qcom_nandc_is_last_cw(ecc, cw)) {
 			data_size = ecc->size - ((ecc->steps - 1) * 4);
 			oob_size = (ecc->steps * 4) + host->ecc_bytes_hw;
 		} else {
@@ -1773,7 +1779,7 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 		u32 flash, buffer, erased_cw;
 		int data_len, oob_len;
 
-		if (i == (ecc->steps - 1)) {
+		if (qcom_nandc_is_last_cw(ecc, i)) {
 			data_len = ecc->size - ((ecc->steps - 1) << 2);
 			oob_len = ecc->steps << 2;
 		} else {
@@ -1872,7 +1878,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size, oob_size;
 
-		if (i == (ecc->steps - 1)) {
+		if (qcom_nandc_is_last_cw(ecc, i)) {
 			data_size = ecc->size - ((ecc->steps - 1) << 2);
 			oob_size = (ecc->steps << 2) + host->ecc_bytes_hw +
 				   host->spare_bytes;
@@ -2051,7 +2057,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size, oob_size;
 
-		if (i == (ecc->steps - 1)) {
+		if (qcom_nandc_is_last_cw(ecc, i)) {
 			data_size = ecc->size - ((ecc->steps - 1) << 2);
 			oob_size = (ecc->steps << 2) + host->ecc_bytes_hw +
 				   host->spare_bytes;
@@ -2068,10 +2074,10 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
 		 * when ECC is enabled, we don't really need to write anything
 		 * to oob for the first n - 1 codewords since these oob regions
 		 * just contain ECC bytes that's written by the controller
-		 * itself. For the last codeword, we skip the bbm positions and
-		 * write to the free oob area.
+		 * itself. For the last codeword, we skip the bbm positions and write
+		 * to the free oob area.
 		 */
-		if (i == (ecc->steps - 1)) {
+		if (qcom_nandc_is_last_cw(ecc, i)) {
 			oob_buf += host->bbm_size;
 
 			write_data_dma(nandc, FLASH_BUF_ACC + data_size,
@@ -2126,7 +2132,7 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 		data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 		oob_size1 = host->bbm_size;
 
-		if (i == (ecc->steps - 1)) {
+		if (qcom_nandc_is_last_cw(ecc, i)) {
 			data_size2 = ecc->size - data_size1 -
 				     ((ecc->steps - 1) << 2);
 			oob_size2 = (ecc->steps << 2) + host->ecc_bytes_hw +
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
