Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D658BC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 19:40:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8442864E61
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 19:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8442864E61
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjNASy8+FuPIcS8FMwBYcy+amkuw0TmC78MrrTWUaww=; b=s7M5ZVZyVno+3+Lh42bIdFdkDV
	JWhW8opUzcRAEGD0iWUPxd+xNDinC1lu4X2vxBMRurS94rVI6KMmFu7n90Vf1FduQAO1/lewK3ZeY
	4ZHp5qX3F4lOOBHyV7QzxhlwHcSS0NzLaop1srKasLRlOAp6CDtXI1sl+DTxLbk3ogbwdTtfciMZk
	xLoVKogtEFtoc6twrcRrnLP498rxVPF6krULDsOWFpUgtGtYVzbGoE4qz711bPZ/ZN6LcH1SHEdSl
	epUrBCGx2IdG0xyFyRsmdd/SbAjDrOqr7G+Nf+0juMbXv8x6mV07opOwLZGiN7hHi8/+NaPaqNqNo
	AB1KGxPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEdX2-0005vw-6K; Tue, 23 Feb 2021 19:39:40 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEdWr-0005sP-Rw
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 19:39:31 +0000
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 23 Feb 2021 11:39:28 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 23 Feb 2021 11:39:27 -0800
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 24 Feb 2021 01:09:06 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id 0340A20E1F; Wed, 24 Feb 2021 01:09:05 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] mtd: rawnand: qcom: Add helper to check last code word
Date: Wed, 24 Feb 2021 01:08:58 +0530
Message-Id: <1614109141-7531-2-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614109141-7531-1-git-send-email-mdalam@codeaurora.org>
References: <1614109141-7531-1-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_143930_269536_D65853FF 
X-CRM114-Status: GOOD (  12.63  )
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

Add the qcom_nandc_is_last_cw() helper which checks if
the input cw index is the last one or not.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4898d32..9a890ef 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -662,6 +662,12 @@ static void nandc_set_reg(struct nand_chip *chip, int offset,
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
@@ -1629,7 +1635,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 	oob_size1 = host->bbm_size;
 
-	if (cw == (ecc->steps - 1)) {
+	if (qcom_nandc_is_last_cw(ecc, cw)) {
 		data_size2 = ecc->size - data_size1 -
 			     ((ecc->steps - 1) * 4);
 		oob_size2 = (ecc->steps * 4) + host->ecc_bytes_hw +
@@ -1710,7 +1716,7 @@ check_for_erased_page(struct qcom_nand_host *host, u8 *data_buf,
 	}
 
 	for_each_set_bit(cw, &uncorrectable_cws, ecc->steps) {
-		if (cw == (ecc->steps - 1)) {
+		if (qcom_nandc_is_last_cw(ecc, cw)) {
 			data_size = ecc->size - ((ecc->steps - 1) * 4);
 			oob_size = (ecc->steps * 4) + host->ecc_bytes_hw;
 		} else {
@@ -1770,7 +1776,7 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 		u32 flash, buffer, erased_cw;
 		int data_len, oob_len;
 
-		if (i == (ecc->steps - 1)) {
+		if (qcom_nandc_is_last_cw(ecc, i)) {
 			data_len = ecc->size - ((ecc->steps - 1) << 2);
 			oob_len = ecc->steps << 2;
 		} else {
@@ -1869,7 +1875,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size, oob_size;
 
-		if (i == (ecc->steps - 1)) {
+		if (qcom_nandc_is_last_cw(ecc, i)) {
 			data_size = ecc->size - ((ecc->steps - 1) << 2);
 			oob_size = (ecc->steps << 2) + host->ecc_bytes_hw +
 				   host->spare_bytes;
@@ -2048,7 +2054,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size, oob_size;
 
-		if (i == (ecc->steps - 1)) {
+		if (qcom_nandc_is_last_cw(ecc, i)) {
 			data_size = ecc->size - ((ecc->steps - 1) << 2);
 			oob_size = (ecc->steps << 2) + host->ecc_bytes_hw +
 				   host->spare_bytes;
@@ -2068,7 +2074,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
 		 * itself. For the last codeword, we skip the bbm positions and
 		 * write to the free oob area.
 		 */
-		if (i == (ecc->steps - 1)) {
+		if (qcom_nandc_is_last_cw(ecc, i)) {
 			oob_buf += host->bbm_size;
 
 			write_data_dma(nandc, FLASH_BUF_ACC + data_size,
@@ -2123,7 +2129,7 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
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
