Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A461EC7115A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 20:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Gn4AoB4p/IhSWQHaNdMuqOVpgZ0/noh+0NUu5Od3p4=; b=MQlj9RmsX0mr4X
	cdJb6v/xolsE7pE0HofcGKOEXUiKXxMJLshEUMgkzKFTZ8rdACnlNXvhPCM43WmIx1ZFdYhAdzPre
	NKIK9EA74050bbJiqQOhq7fBrq7kfFMsPX9ykcL5Br6Yu++UnZc2PnhFVXLIwg9u1X4f3JhjNCG5U
	r9TqFKUWTIrezQRi4J9BFiKGlYmUtSPRt95X8AXASquR5qnY32TyyQKrMMXSQBwEs2yuML4cpfPLk
	D6WVTpM3WBo7usJm+fihQsKmGqRHPZBPEC2fj5c1TtQv83jOL1SQxYBO/jBs+Lu4zh47e3Ud9grb7
	yLZQ74KyLPdO0bffLUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzJP-0000000BJqa-3OeW;
	Wed, 18 Jun 2025 20:23:11 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzJN-0000000BJpO-2ZtQ
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 20:23:10 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so777835e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2025 13:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750278188; x=1750882988; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zz2TBp0pjY/WMvfYk1bPkXEQytqjKMNtkLb7lT6s4eg=;
        b=g5ABXB2EIEJ6qoUL6IY1MJIGwnxTJqrlXt7IHMX8yFdtihEbOqUOIh7khTEJ8ztzas
         +wyj+Lx2wejCwLgch7y7HggslzNOXiaguS3HkZd6E8U3C217+8zJMLCTd7gpuFLl7fti
         h9KNax27ttCVcWtn6NjDczNdTkFKZ9HI/TAMYimrtSoLq4OPzy5T/D99pNGrP1oXViIR
         Zcczs3FxcmLYRVUQtF1f+gE6w2YITzY2H9iEdM7d3mkh5JiPYD9C9+V1uiOyPfRArYv+
         OcwMWUc2juD7VSJesSa26tnIpWuh//IN9Ui/Zg6qaXyVYo7EWirWa1ibx5I+MxzT2ktT
         tpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278188; x=1750882988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zz2TBp0pjY/WMvfYk1bPkXEQytqjKMNtkLb7lT6s4eg=;
        b=LhOZL5Ni2Jvs3ldzdoFypVQm7x9IHByoBemzS2nWgqnodXLSEMfYYnTaG79RB37mC5
         oHILz/xZxD/2tNCQ1D4EFpleK44+VCR7xz09xW9jaShDXr3YoVoHG65jonVb7IAwpYQY
         sbPJf2Rc1tpPJKB6G3qLT/JHz7+JqvDC1LhomeLPtSvuWLKcz8uCj0jz7tzVJ8B+qaUV
         uSTcCv42vzLRl35gWWSvj+3U0eEs8Ty74cKDw08+dRX3Ci+QAMt1DX2b9Gzuc8KzyClY
         V+liFJAMwtFReEHESzdcM+HMm9clQHONtNzrJaVyBOgGOrDL2UQvywDU79r5rORTKTij
         5b+A==
X-Forwarded-Encrypted: i=1; AJvYcCWKKvN1SbDdZvdmqrxIsNFTq+mgYw56w4E/i2h/j/DUEZfqk7NK03RAUxWEYk42IVSFS2MTRkANRE4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5xzZ8OoNgxp8QqJEUNgVy9lWJJfY++m0dvLZaBPbO16E6a5cZ
	xu0LOyf2P9Ln2MHMf9TWebrA12LGRgAjojbrSBosKVvMqlJONY89S+nr
X-Gm-Gg: ASbGnctMLMRuLzuX5mlVXxj/10fj1ptT0cvRi2/fzYm2K6kjhOR00TdZRPK1ZbsNHIK
	c0O3wusL1nC7ZxcNSlOB/mVWnOieTCfuELQuui0A0OMJsq6lxRJ5FSr43ybxujzP5M2AB2KA8Ni
	lknolkSNDe8/wjPBQFfuHJBViBb1ZfhAYafVKE6sND3W8nAoJprI6NAQXsCOIGxh2/U3Y4mle1l
	9Wn5VNCsvP8ZTzQrKryJ9B0lK2Ka95sE+5rUosVUI5lSJwG5zfTY324gyJLHDRNQdsrvK3L8ixW
	1WiNG7VddobYjBExZvOAJ/vWlbHoBApve2qzKUTkr8Q447TjJTyUlSN+H7mfR2Cs0qgce8aBWLQ
	AVDR29eTpf1uCxfY=
X-Google-Smtp-Source: AGHT+IFGCTxhPw+wSP0jPu77VRIxkVUr880h0EnHf+PjeGUKZbP4V/4LgJOa4U95A+YAseeBsivXww==
X-Received: by 2002:a05:600c:1549:b0:441:b076:fce8 with SMTP id 5b1f17b1804b1-4533cab472cmr181785015e9.14.1750278187682;
        Wed, 18 Jun 2025 13:23:07 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a568a633ddsm17617951f8f.26.2025.06.18.13.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:23:07 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 18 Jun 2025 22:22:50 +0200
Subject: [PATCH v3 2/2] mtd: nand: qpic_common: prevent out of bounds
 access of BAM arrays
MIME-Version: 1.0
Message-Id: <20250618-qpic-snand-avoid-mem-corruption-v3-2-319c71296cda@gmail.com>
References: <20250618-qpic-snand-avoid-mem-corruption-v3-0-319c71296cda@gmail.com>
In-Reply-To: <20250618-qpic-snand-avoid-mem-corruption-v3-0-319c71296cda@gmail.com>
To: Mark Brown <broonie@kernel.org>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, Lakshmi Sowjanya D <quic_laksd@quicinc.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_132309_662066_619A7331 
X-CRM114-Status: GOOD (  23.97  )
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

The common QPIC code does not do any boundary checking when it handles
the command elements and scatter gater list arrays of a BAM transaction,
thus it allows to access out of bounds elements in those.

Although it is the responsibility of the given driver to allocate enough
space for all possible BAM transaction variations, however there can be
mistakes in the driver code which can lead to hidden memory corruption
issues which are hard to debug.

This kind of problem has been observed during testing the 'spi-qpic-snand'
driver. Although the driver has been fixed with a preceding patch, but it
still makes sense to reduce the chance of having such errors again later.

In order to prevent such errors, change the qcom_alloc_bam_transaction()
function to store the number of elements of the arrays in the
'bam_transaction' strucutre during allocation. Also, add sanity checks to
the qcom_prep_bam_dma_desc_{cmd,data}() functions to avoid using out of
bounds indices for the arrays.

Tested-by: Lakshmi Sowjanya D <quic_laksd@quicinc.com>     # on SDX75
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v3:
  - rebase on top of current spi/for-6.16
  - add 'Acked-by' tag from Miquel

Changes in v2:
  - remove the inline qcom_err_bam_array_full() function and print the error
    messages directly from the respective functions instead
  - add 'Tested-by' tag from Lakshmi Sowjanya D, and remove the
    "Tested with the 'spi-qpic-snand' driver only." line from the
    commit message as SDX75 uses the qcom_nandc driver
  - move the note about of the preferred merging order into the cover letter
---
 drivers/mtd/nand/qpic_common.c       | 30 ++++++++++++++++++++++++++----
 include/linux/mtd/nand-qpic-common.h |  8 ++++++++
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
index 4dc4d65e7d323e2843edecca8e3849a5090b775d..8e604cc22ca310159edf4d8dbc2f6a82d5119eb4 100644
--- a/drivers/mtd/nand/qpic_common.c
+++ b/drivers/mtd/nand/qpic_common.c
@@ -57,14 +57,15 @@ qcom_alloc_bam_transaction(struct qcom_nand_controller *nandc)
 	bam_txn_buf += sizeof(*bam_txn);
 
 	bam_txn->bam_ce = bam_txn_buf;
-	bam_txn_buf +=
-		sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS * num_cw;
+	bam_txn->bam_ce_nitems = QPIC_PER_CW_CMD_ELEMENTS * num_cw;
+	bam_txn_buf += sizeof(*bam_txn->bam_ce) * bam_txn->bam_ce_nitems;
 
 	bam_txn->cmd_sgl = bam_txn_buf;
-	bam_txn_buf +=
-		sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL * num_cw;
+	bam_txn->cmd_sgl_nitems = QPIC_PER_CW_CMD_SGL * num_cw;
+	bam_txn_buf += sizeof(*bam_txn->cmd_sgl) * bam_txn->cmd_sgl_nitems;
 
 	bam_txn->data_sgl = bam_txn_buf;
+	bam_txn->data_sgl_nitems = QPIC_PER_CW_DATA_SGL * num_cw;
 
 	init_completion(&bam_txn->txn_done);
 
@@ -238,6 +239,11 @@ int qcom_prep_bam_dma_desc_cmd(struct qcom_nand_controller *nandc, bool read,
 	struct bam_transaction *bam_txn = nandc->bam_txn;
 	u32 offset;
 
+	if (bam_txn->bam_ce_pos + size > bam_txn->bam_ce_nitems) {
+		dev_err(nandc->dev, "BAM %s array is full\n", "CE");
+		return -EINVAL;
+	}
+
 	bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_pos];
 
 	/* fill the command desc */
@@ -258,6 +264,12 @@ int qcom_prep_bam_dma_desc_cmd(struct qcom_nand_controller *nandc, bool read,
 
 	/* use the separate sgl after this command */
 	if (flags & NAND_BAM_NEXT_SGL) {
+		if (bam_txn->cmd_sgl_pos >= bam_txn->cmd_sgl_nitems) {
+			dev_err(nandc->dev, "BAM %s array is full\n",
+				"CMD sgl");
+			return -EINVAL;
+		}
+
 		bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_start];
 		bam_ce_size = (bam_txn->bam_ce_pos -
 				bam_txn->bam_ce_start) *
@@ -297,10 +309,20 @@ int qcom_prep_bam_dma_desc_data(struct qcom_nand_controller *nandc, bool read,
 	struct bam_transaction *bam_txn = nandc->bam_txn;
 
 	if (read) {
+		if (bam_txn->rx_sgl_pos >= bam_txn->data_sgl_nitems) {
+			dev_err(nandc->dev, "BAM %s array is full\n", "RX sgl");
+			return -EINVAL;
+		}
+
 		sg_set_buf(&bam_txn->data_sgl[bam_txn->rx_sgl_pos],
 			   vaddr, size);
 		bam_txn->rx_sgl_pos++;
 	} else {
+		if (bam_txn->tx_sgl_pos >= bam_txn->data_sgl_nitems) {
+			dev_err(nandc->dev, "BAM %s array is full\n", "TX sgl");
+			return -EINVAL;
+		}
+
 		sg_set_buf(&bam_txn->data_sgl[bam_txn->tx_sgl_pos],
 			   vaddr, size);
 		bam_txn->tx_sgl_pos++;
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index e8462deda6dbf61f99bbcb39e7cb12cdf66898fd..f0aa098a395f7140c3c4ad5640f973293f73a1cc 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -237,6 +237,9 @@
  * @last_data_desc - last DMA desc in data channel (tx/rx).
  * @last_cmd_desc - last DMA desc in command channel.
  * @txn_done - completion for NAND transfer.
+ * @bam_ce_nitems - the number of elements in the @bam_ce array
+ * @cmd_sgl_nitems - the number of elements in the @cmd_sgl array
+ * @data_sgl_nitems - the number of elements in the @data_sgl array
  * @bam_ce_pos - the index in bam_ce which is available for next sgl
  * @bam_ce_start - the index in bam_ce which marks the start position ce
  *		   for current sgl. It will be used for size calculation
@@ -255,6 +258,11 @@ struct bam_transaction {
 	struct dma_async_tx_descriptor *last_data_desc;
 	struct dma_async_tx_descriptor *last_cmd_desc;
 	struct completion txn_done;
+
+	unsigned int bam_ce_nitems;
+	unsigned int cmd_sgl_nitems;
+	unsigned int data_sgl_nitems;
+
 	struct_group(bam_positions,
 		u32 bam_ce_pos;
 		u32 bam_ce_start;

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
