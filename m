Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84627C5AE59
	for <linux-mtd@archiver.kernel.org>; Sun, 25 May 2025 17:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=526IKVSqOmCoTyIF+O3FAjZfd0KAVkM9W6LGHxly3Yw=; b=Qi7tBfU6dkaKei
	dyiUz10ybT9H/Y62f3aJHUSlwbari7EIaUCRktpdhjcH42sgkswSj8t6bvpkd+/BLNttruDXUO3zl
	ZW6bGcTFtJ3dHxe8o/I2YiJFS+gcZnDRJjtDcf8LVHvQmrxLtNsfV1qFa8vNcI6hnrTqXLr8dYoYN
	2rBLbX6Un3q3MjxSBJOMruIXU07ZEqkkpgVLWkjJ36VUXQCx9MNsg4l/AIJ5pXRh60HKpwXC2LTDF
	dlVe/+b7/yRPgi4fKWoO5cgBXvLOxm/5nTToybxGfIsV9wmyOUhbhvO6qxkropMMrxDMoP5z9kWcW
	1mN8/1iFKRPyvc2DxfrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJEnM-00000007Np5-2P8j;
	Sun, 25 May 2025 17:05:56 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJEnK-00000007Nnu-3Dpq
	for linux-mtd@lists.infradead.org;
	Sun, 25 May 2025 17:05:55 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a35c894313so1545070f8f.2
        for <linux-mtd@lists.infradead.org>; Sun, 25 May 2025 10:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748192753; x=1748797553; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AZCHLTSvr+Kp239n4uhMQzByzLdzwvmUgfcsFgbhC4=;
        b=Chkut0oLZdpQj9BbwHrmGGAMcpWNcUdV0O12EjZM/sks14/+UqlAJo6g39DvYWjnXc
         toVufawGTisgVOt9IodHcKRx9TAGB8PvlR0N6zsnw9lZ02spehtxNPW4+uWpYsv2kYis
         fpjlbQEyNdb6OmiE3Ivsy5gKaz0ChabRdRB+8ZlZHOMaXDn6dtK3Zo0mAKXilOYz4s06
         xIv2U3tNkoAMW46xYESv7g9D42Sjca+Q1YEw3THoUdo/UdA9A7MXIP4nB9EvkO9RtMSf
         viE3BZM7X53idFb9fDq6KL24fZ/xp2Q0YWKQBT4P3T3VB4wEH0AYKAz9z+yiYDP9RSU6
         jHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748192753; x=1748797553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AZCHLTSvr+Kp239n4uhMQzByzLdzwvmUgfcsFgbhC4=;
        b=AQvqC+gfcd4rKYGus92JCwSw/HZbXMXtKg1nGKFGtMZ4w4DJyMfZs3db6NxNmvyyPE
         a2a1UA2r01JEVyzwRQCurpkuYRHHvC58CuG8Hm0iygy1wpPK4jI6nUYvFxPwOOet7AP9
         rWHod1NjnZGFb+6Ga3nYrScAvaqn17RGELMPuwDpeJlZcIlOO4T7Bd26PO4r2C51XBUM
         Phy001vhHbCwlzOSAkbmDREITbpCgzfbauzKqjD3gx5I6FsVsFFF4zbx3o9f517Ze9nr
         Y6NY/KmRV+4JkSLMwuq+Hx/KSbNQfu0hT3hXoOvZk+EHZ7We7z9AlJy+kaNpckFPz4gV
         ECig==
X-Forwarded-Encrypted: i=1; AJvYcCWwABTDs8TTpX6HVYMFAP+3NxvuyAFle+/XfVTy52viqptMgIdj8zlAnbNLuEPveME0dihweVVUA/8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyO1GXB3TuJaEXYrabePmZamvqRm+MA3DvHRPKbrgvTJXRCQzhK
	4cXPZ35ZxXWizFan9GhiQ7CpgYXXo11yoB9jFU7T0YC49SHFKJaInSU3
X-Gm-Gg: ASbGncuGVIhMhvuuVAJHtHpuMNEUoUzWx+y/fsMlsEiM0zF69CHAPcSs/ye+jOSAuwj
	xVOq087Al4bb+ULTGyUjTVpFtQVnV79gLvg5ub9gBuQLhX9342TyPyrfwxjXsVQXB1rB6S2K1MY
	D69Y1iIyM1DgopladtgCe/G9xKGnR90m21d80ZYVhaxLRVzYj7OfCKLaQ2dwY1L9fk8eVrk5N4I
	CoSeULll9nVjjtj6CC1rQA7GefqnP2hJjAxd02F0WlBpRW6Dm0Fctqm4U+VVPgh3XigMo18aR+O
	7EG0Q02OAhuNVSTiCKoj0TcLr2JDa/qzEvQQO0+e0cfVhpFq+65p4xYFwWUr1ZCG4y+FBlyjUay
	kXXUF
X-Google-Smtp-Source: AGHT+IEaRE4F9pvTdKaRd61scHIFmk2f/nr9A2Sw3iKW5xW4aZumYhVm+RP64fWFLbqMq3dXkvXwaQ==
X-Received: by 2002:a05:6000:2389:b0:3a4:d238:682c with SMTP id ffacd0b85a97d-3a4d2386cfbmr2382498f8f.53.1748192753014;
        Sun, 25 May 2025 10:05:53 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a03fsm32317405f8f.22.2025.05.25.10.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 10:05:52 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sun, 25 May 2025 19:05:36 +0200
Subject: [PATCH 2/2] mtd: nand: qpic_common: prevent out of bounds access
 of BAM arrays
MIME-Version: 1.0
Message-Id: <20250525-qpic-snand-avoid-mem-corruption-v1-2-5fe528def7fb@gmail.com>
References: <20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com>
In-Reply-To: <20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com>
To: Mark Brown <broonie@kernel.org>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_100554_818695_0E3D4B66 
X-CRM114-Status: GOOD (  24.53  )
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

Tested with the 'spi-qpic-snand' driver only.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Preferably, this should go in via the SPI tree along with the previous
patch. It is not a strict requirement though, in the case it gets
included separately through the mtd tree it reveals the bug fixed in
the first patch.
---
 drivers/mtd/nand/qpic_common.c       | 28 ++++++++++++++++++++++++----
 include/linux/mtd/nand-qpic-common.h |  8 ++++++++
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
index e0ed25b5afea9b289b767cd3d9c2d7572ed52008..fb1f81e4bdacaa3e81660a20e164926c64633513 100644
--- a/drivers/mtd/nand/qpic_common.c
+++ b/drivers/mtd/nand/qpic_common.c
@@ -15,6 +15,13 @@
 #include <linux/slab.h>
 #include <linux/mtd/nand-qpic-common.h>
 
+static inline int qcom_err_bam_array_full(struct qcom_nand_controller *nandc,
+					  const char *name)
+{
+	dev_err(nandc->dev, "BAM %s array is full\n", name);
+	return -EINVAL;
+}
+
 /**
  * qcom_free_bam_transaction() - Frees the BAM transaction memory
  * @nandc: qpic nand controller
@@ -57,14 +64,15 @@ qcom_alloc_bam_transaction(struct qcom_nand_controller *nandc)
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
 
@@ -237,6 +245,9 @@ int qcom_prep_bam_dma_desc_cmd(struct qcom_nand_controller *nandc, bool read,
 	struct bam_cmd_element *bam_ce_buffer;
 	struct bam_transaction *bam_txn = nandc->bam_txn;
 
+	if (bam_txn->bam_ce_pos + size > bam_txn->bam_ce_nitems)
+		return qcom_err_bam_array_full(nandc, "CE");
+
 	bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_pos];
 
 	/* fill the command desc */
@@ -258,6 +269,9 @@ int qcom_prep_bam_dma_desc_cmd(struct qcom_nand_controller *nandc, bool read,
 
 	/* use the separate sgl after this command */
 	if (flags & NAND_BAM_NEXT_SGL) {
+		if (bam_txn->cmd_sgl_pos >= bam_txn->cmd_sgl_nitems)
+			return qcom_err_bam_array_full(nandc, "CMD sgl");
+
 		bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_start];
 		bam_ce_size = (bam_txn->bam_ce_pos -
 				bam_txn->bam_ce_start) *
@@ -297,10 +311,16 @@ int qcom_prep_bam_dma_desc_data(struct qcom_nand_controller *nandc, bool read,
 	struct bam_transaction *bam_txn = nandc->bam_txn;
 
 	if (read) {
+		if (bam_txn->rx_sgl_pos >= bam_txn->data_sgl_nitems)
+			return qcom_err_bam_array_full(nandc, "RX sgl");
+
 		sg_set_buf(&bam_txn->data_sgl[bam_txn->rx_sgl_pos],
 			   vaddr, size);
 		bam_txn->rx_sgl_pos++;
 	} else {
+		if (bam_txn->tx_sgl_pos >= bam_txn->data_sgl_nitems)
+			return qcom_err_bam_array_full(nandc, "TX sgl");
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
