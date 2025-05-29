Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD109C5AE59
	for <linux-mtd@archiver.kernel.org>; Thu, 29 May 2025 17:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yx1quaB/w6lkydxV5+p3PWV2sy2H0OLw8GdYXJTmdrM=; b=Aoz97PnzA49AWV
	tnw1wXwmlUVoawwW7gINPVJyOAfqEKiojkrQZY4W7whDJSSv/9KccNkF/L4GiHHgYGvqYK1YMC2yl
	pKLmeWqB9kpZYHTXKWHStRxqLOP6c7H52psaAMKjpRUYCoPUymvOmV3KVNNIocttG5YTXMjVs4XCp
	Crp76ceBKyJchj+eWskWo8e0vbO69L9TPfTJkWWhJxXDnzdjip4oCHyr7pSehzQ8V2uhKwuZs9uJx
	aT9Yb/WSSoRQPJXAuDXqe8gk25iXdpuL+PLQmvkzhHNOkuxggpK1LrBcdq8X4GerIGz1FqUGAk4hd
	rrKAUA4wHvRYwwF3pHsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKh2Y-0000000GHbh-09AK;
	Thu, 29 May 2025 17:27:38 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKh0P-0000000GHLu-22iD
	for linux-mtd@lists.infradead.org;
	Thu, 29 May 2025 17:25:26 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-604e2a2f200so2147223a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 29 May 2025 10:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748539524; x=1749144324; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XV2butVDw2bUeLpVaXq6xRsCyjyAgxB8qAYckam2iV4=;
        b=InFCBJkEX0vpGLWhtO71UPaTOI4rfz7TnzgF3UiwUMjIpa3K3afwVQI99h7tvyYx7B
         Yowp0uEB/m7Fml53eKsqypSwRl5UFqKk6rSb26cMXhP+W1736PMPclzIZ2Ts7aOwEQIx
         lRiXm3B/1u3L9rRhdOS/eaEOCZBVzkLYWRNoGayhpG+OFeMbB6+5LIq3bWXD4TnEwtZl
         5UouHV/uiA2Reqj2Gh9voICYv0NjeMZD2WR/I4IMMmBgmqhwiEW2FNzrVCyHJW68JXat
         CIad+KEvC9zhkI53QntDKoA2HVvymPoZE8fOlTV5p59KXb8xSK9EAV5wI6TBEj8Umzoz
         MvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748539524; x=1749144324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XV2butVDw2bUeLpVaXq6xRsCyjyAgxB8qAYckam2iV4=;
        b=VVxo1pkxYO05tp7rLk89ZUKZNRho3Xll3gM/UVHZN9cz667LrYsexIF/tQWwm67ycL
         Fk/ZIyqHo5jWKwFTInKP2Ro4qfyicdlKILP8ri9ThYQGncHIcywRlBJRA3ZIfRl5b0ra
         rTifs477X43YzUmjco3SlTx5nr4x/x1CEl5B2jjE5Lom2VJB9tMOF2a0tPrhPNaRTB7L
         mSnhBYDBlnmaIgC+Er2COKGYzWF/7olWHkES2lo+p0MIoEAjuGpmiLi5M9N2LnJQd2mY
         dZGccDxDOdQIzJt5BHTI4xvpfAleMhE9V0PtrqYp2IpAMF5eHmS1f+Fb0FMJ6K8rSGR+
         79cw==
X-Forwarded-Encrypted: i=1; AJvYcCUYh3wqt/sNvkLo/QWjshC8U0+TiRi74MVTpShJOGg6u5byt9VX8072rSgEkPpk+Eo4SQXfXWTxdXw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4kFdNo8JyTIX+KCALRncwAJwhT0RYCPkvOKwqOUG7gde/RhD6
	o8K5K4AkHVIUKqllwfNvX/JQEnJxWr0opjwRxbDnU4F8XWcOgeHQlxx4
X-Gm-Gg: ASbGncsxBMHfrIka8XFvwwij64KjJSRbhO72Mod+I4qG4iDlGajHiITlpahX1+l2rsK
	FP3meY7QJHWtUIglcAtEPmywy/0eB90DxOyKsQnCtZ+zita75jJj1q7injMPRl2pL5aeJnvLA/8
	WhNDtpJjf62JvCObSY4e+M/1VMvATzaRJkXD/MpgAjwSWVUp2vkrWsfYC4J6yfOGC20dHuBvQ/X
	evdtEOHDMNTgE+PsxNkHcPdT7b1viYmremq02aaKtDTliVjp4BqoLLuqdLTBunHRyatykJfKFaa
	92fB/e6ownEk1o3UOJXbMp0OWXQnfVsF2MxVAYNmM0kW1roMPsIoTzcJ+7XCKhYl7QmErs0nYtL
	9ld1xaLEUgksrs9A=
X-Google-Smtp-Source: AGHT+IEZkkD1K+H0tmuFbouKJ3viSpyOf9KVWq/Uggp+KKsRk/X1ojEXByAsL9hV2hKgOrH6f6eaTQ==
X-Received: by 2002:a17:907:7fa4:b0:ad8:8529:4f9b with SMTP id a640c23a62f3a-adb325838e8mr28059366b.38.1748539523503;
        Thu, 29 May 2025 10:25:23 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ada5d82d95bsm177793366b.57.2025.05.29.10.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:25:23 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 29 May 2025 19:25:11 +0200
Subject: [PATCH v2 2/2] mtd: nand: qpic_common: prevent out of bounds
 access of BAM arrays
MIME-Version: 1.0
Message-Id: <20250529-qpic-snand-avoid-mem-corruption-v2-2-2f0d13afc7d2@gmail.com>
References: <20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gmail.com>
In-Reply-To: <20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gmail.com>
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
X-CRM114-CacheID: sfid-20250529_102525_541563_7E923D35 
X-CRM114-Status: GOOD (  23.98  )
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
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
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
index e0ed25b5afea9b289b767cd3d9c2d7572ed52008..30f17d959300cc7448d0c2e9e2516c52655494f0 100644
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
 
@@ -237,6 +238,11 @@ int qcom_prep_bam_dma_desc_cmd(struct qcom_nand_controller *nandc, bool read,
 	struct bam_cmd_element *bam_ce_buffer;
 	struct bam_transaction *bam_txn = nandc->bam_txn;
 
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
index cd7172e6c1bbffeee0363a14044980a72ea17723..3ca4073a496b8fd2a99112a9caefd3f110260568 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -240,6 +240,9 @@
  * @last_data_desc - last DMA desc in data channel (tx/rx).
  * @last_cmd_desc - last DMA desc in command channel.
  * @txn_done - completion for NAND transfer.
+ * @bam_ce_nitems - the number of elements in the @bam_ce array
+ * @cmd_sgl_nitems - the number of elements in the @cmd_sgl array
+ * @data_sgl_nitems - the number of elements in the @data_sgl array
  * @bam_ce_pos - the index in bam_ce which is available for next sgl
  * @bam_ce_start - the index in bam_ce which marks the start position ce
  *		   for current sgl. It will be used for size calculation
@@ -258,6 +261,11 @@ struct bam_transaction {
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
