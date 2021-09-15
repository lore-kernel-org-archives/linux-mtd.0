Return-Path: <SRS0=jHjM=OF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587EAC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 09:59:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B32E60F46
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 09:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B32E60F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZUhVlRSke9o8lahLwd/LU7FHEemmCFtn0bO2ROff50=; b=uQqRZhwXmA6QDa
	CnVXGCClQo/wwtpAR1AJ0dbXZyhpdBPNpCer6jEG/0x8QkRNju2//QxbtXY6ea7RUv5+6C1m2poIS
	BOcLTVnoWr+Cqy3sP/e22BQwAEnZuJvbU26QmGfvIKdJWyItX9LSKIG+uzciO/mEcJjZ0nMe8zdzv
	xwRIBWDMMFcsZ2W5Z4/Y6bzwLq4tb8/uDnbdwltnj8VuxUYcM9rpWZOH5/XX+q4C9XsDYHkxbytOd
	vAZUY1nq1TNSJ7q1y7/LK93wPX3V5QwPD8yWgLRs7AtRY48Py+IYimQntzcVlBwC3yFBlI1j4YRcG
	3md0VtUEDuN3v/R6FmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQRgU-008kLN-O7; Wed, 15 Sep 2021 09:58:30 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQRg6-008kFE-Ao
 for linux-mtd@lists.infradead.org; Wed, 15 Sep 2021 09:58:07 +0000
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 15 Sep 2021 02:58:06 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 15 Sep 2021 02:58:04 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 15 Sep 2021 15:28:03 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id C0D9622353; Wed, 15 Sep 2021 15:28:01 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: mdalam@codeaurora.org,
	sricharan@codeaurora.org
Subject: [PATCH 2/3] mtd: rawnand: qcom: Add sg list to handle status pipe
 request
Date: Wed, 15 Sep 2021 15:27:30 +0530
Message-Id: <1631699851-12172-3-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631699851-12172-1-git-send-email-mdalam@codeaurora.org>
References: <1631699851-12172-1-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_025806_487587_9A6A4165 
X-CRM114-Status: GOOD (  13.25  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From QPIC V2.0 onwards there is separate pipe to read status
for each code word while reading in enhanced mode. page scope
read and multi page read.

This sgl list will be use to handle the request via status pipe
during page scope and multi page read.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 42c6291..07448c4 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -213,6 +213,7 @@ nandc_set_reg(chip, reg,			\
 #define QPIC_PER_CW_CMD_ELEMENTS	32
 #define QPIC_PER_CW_CMD_SGL		32
 #define QPIC_PER_CW_DATA_SGL		8
+#define	QPIC_PER_CW_STS_SGL		8
 
 #define QPIC_NAND_COMPLETION_TIMEOUT	msecs_to_jiffies(2000)
 
@@ -258,6 +259,7 @@ struct bam_transaction {
 	struct bam_cmd_element *bam_ce;
 	struct scatterlist *cmd_sgl;
 	struct scatterlist *data_sgl;
+	struct scatterlist *sts_sgl;
 	u32 bam_ce_pos;
 	u32 bam_ce_start;
 	u32 cmd_sgl_pos;
@@ -266,6 +268,8 @@ struct bam_transaction {
 	u32 tx_sgl_start;
 	u32 rx_sgl_pos;
 	u32 rx_sgl_start;
+	u32 sts_sgl_pos;
+	u32 sts_sgl_start;
 	bool wait_second_completion;
 	struct completion txn_done;
 	struct dma_async_tx_descriptor *last_data_desc;
@@ -508,6 +512,8 @@ alloc_bam_transaction(struct qcom_nand_controller *nandc)
 		((sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS) +
 		(sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL) +
 		(sizeof(*bam_txn->data_sgl) * QPIC_PER_CW_DATA_SGL));
+	if (nandc->props->qpic_v2)
+		bam_txn_size += (sizeof(*bam_txn->sts_sgl) * QPIC_PER_CW_STS_SGL);
 
 	bam_txn_buf = devm_kzalloc(nandc->dev, bam_txn_size, GFP_KERNEL);
 	if (!bam_txn_buf)
@@ -526,6 +532,12 @@ alloc_bam_transaction(struct qcom_nand_controller *nandc)
 
 	bam_txn->data_sgl = bam_txn_buf;
 
+	if (nandc->props->qpic_v2) {
+		bam_txn_buf +=
+			sizeof(*bam_txn->sts_sgl) * QPIC_PER_CW_STS_SGL * num_cw;
+		bam_txn->sts_sgl = bam_txn_buf;
+	}
+
 	init_completion(&bam_txn->txn_done);
 
 	return bam_txn;
@@ -554,6 +566,12 @@ static void clear_bam_transaction(struct qcom_nand_controller *nandc)
 		      QPIC_PER_CW_CMD_SGL);
 	sg_init_table(bam_txn->data_sgl, nandc->max_cwperpage *
 		      QPIC_PER_CW_DATA_SGL);
+	if (nandc->props->qpic_v2) {
+		bam_txn->sts_sgl_pos = 0;
+		bam_txn->sts_sgl_start = 0;
+		sg_init_table(bam_txn->sts_sgl, nandc->max_cwperpage *
+				QPIC_PER_CW_STS_SGL);
+	}
 
 	reinit_completion(&bam_txn->txn_done);
 }
@@ -808,6 +826,12 @@ static int prepare_bam_async_desc(struct qcom_nand_controller *nandc,
 		bam_txn->tx_sgl_start = bam_txn->tx_sgl_pos;
 		dir_eng = DMA_MEM_TO_DEV;
 		desc->dir = DMA_TO_DEVICE;
+	} else if (nandc->props->qpic_v2 && chan == nandc->sts_chan) {
+		sgl = &bam_txn->sts_sgl[bam_txn->sts_sgl_start];
+		sgl_cnt = bam_txn->sts_sgl_pos - bam_txn->sts_sgl_start;
+		bam_txn->sts_sgl_start = bam_txn->sts_sgl_pos;
+		dir_eng = DMA_DEV_TO_MEM;
+		desc->dir = DMA_FROM_DEVICE;
 	} else {
 		sgl = &bam_txn->data_sgl[bam_txn->rx_sgl_start];
 		sgl_cnt = bam_txn->rx_sgl_pos - bam_txn->rx_sgl_start;
@@ -1394,6 +1418,14 @@ static int submit_descs(struct qcom_nand_controller *nandc)
 			if (r)
 				return r;
 		}
+
+		if (nandc->props->qpic_v2) {
+			if (bam_txn->sts_sgl_pos > bam_txn->sts_sgl_start) {
+				r = prepare_bam_async_desc(nandc, nandc->sts_chan, 0);
+				if (r)
+					return r;
+			}
+		}
 	}
 
 	list_for_each_entry(desc, &nandc->desc_list, node)
@@ -1411,6 +1443,8 @@ static int submit_descs(struct qcom_nand_controller *nandc)
 		dma_async_issue_pending(nandc->tx_chan);
 		dma_async_issue_pending(nandc->rx_chan);
 		dma_async_issue_pending(nandc->cmd_chan);
+		if (nandc->props->qpic_v2)
+			dma_async_issue_pending(nandc->sts_chan);
 
 		if (!wait_for_completion_timeout(&bam_txn->txn_done,
 						 QPIC_NAND_COMPLETION_TIMEOUT))
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
