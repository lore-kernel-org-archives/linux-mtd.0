Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6266FC98324
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxYpc0Asj4eZetJzPoay6rlLceRHH5ouLUBo+1hyPyw=; b=SPoOOC1iCDzam4
	yEvUd5FYi0H8b96TToa+V4M8fSy14MC0k4keAqJRG42gEMUsqUBd00vf1qO5LNhG3WDALO3th1zNb
	PyvpNY4WAYCGx8hQojcRLPzOhQrFXe6uWkNF71La8tjQg+3wI1BNt7tQI9s4KFSTa4GvBDSN0Mp3U
	HKlI8xnf2+3z++6A/s2abBN9ZGvm76UIyUMtQm9ocPNB7cqClh+F4eMaX7mkN8p5gkPIqK0ez9jRC
	+xAqrJTX8ZOBY4eCa3T5aJAiR8YAv9g4C55uOUqUnOqf9WCIfZPj/T2F+NYpPqexf6+AZHmmn9ULZ
	QTZh9PUpfvBhw6fqrsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgT-0000000C6HO-3wU7;
	Thu, 24 Sep 2026 20:04:45 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgP-0000000C6El-45HD
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:04:43 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f91so103021f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2026 13:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280280; x=1790885080; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=girgJjULVwYK69uHVXTl40PhKgdfAEex+6Vx4Om71qs=;
        b=kw5IjyNg79WZBATo70m23chfnIZ8zmnpshHV6dWjomgtIetQcgSxoPg/KjZulYEkSB
         znYBCiwx4TLv6/QqZQF6PyarQ2DS4VwPASMvXGuyoZ2qE0bSiXAhWzWVpdAw6ImiUbKg
         eU9cGguoJpwGSiu9EQ5yrb/p0qG+XUhOMn5DLCBkG1CuUnCyNoUbAAWkcLG6PuNPOdZy
         iugz8uT9Nt83mxAd57/amRHP7Z096xQR2XkhaOgTxB0AMwqeFNzs4/5hU3fvN9NMTTWk
         ZM7F9vKdrfCQDcKSF2g0eMHDw2/z9H+ph0HEw87KAKJEKXzQW/Fjgw8q7yX3Jz899xCF
         xlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280280; x=1790885080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=girgJjULVwYK69uHVXTl40PhKgdfAEex+6Vx4Om71qs=;
        b=WsBXyQWe6CJxbc0/6CNKVF2dPbEzBQRRwm1k7P/JMrLmcorEiL1tddB/l/p3XOTZB3
         3pflRM6N4Vw47jJlD1vUJn4la8jhhhioQDx70ZCDyiaHBrnDRt/ha83+w8vPYbq8bODi
         ZCuesEKxAkqhjY2uu5qlS6CbZ21iPvdd90mwv8vORmj8YzOgbKGRnsPnbVqSmDe9EHTR
         +mX4R8VFjQ93GC5GA4RoE+Z685s1jzCH6Wfygic+mBnKyw+XQpV94JeFF8kItctWoDYx
         4oAQzVvkA23/v9md/up8vqDI87iRha/9NddHQfpwN+vZxOSg/J8CjtDm12kU1IDw7ZCb
         yEbA==
X-Forwarded-Encrypted: i=1; AKwUvBxJh4q2Q7mYsCEGRfDWcjqVi3D47Fn2pQDz021Lr0tFNV7bsE7rNdhUBE0lYKYbIfbE/Rl1LPz0wb4=@lists.infradead.org
X-Gm-Message-State: AFuF++kd/6S9NxGpSRzK8+HjKNaBBxd67i6jSU4fIR8P1ZlYDWK/Umkn
	S3+KkKYlDf1pHAZmXXfpO4jkIgvIvIBGwCovegEJTRYehneVbifZG7SD
X-Gm-Gg: AYBFou0mC+chP4H4cRLjKcwA36qbJnSk/5jiNK8QIZ3M4PGa/vw8bAaBWlz2/S2HQvk
	w+KnzPHIDeo7y0+INX1P4/k/DF/JeD1dgOknLmd7L91aKH6B6UpySqj7zehaRTUyImn7n1uc5xU
	gYcifI7CC9FZpOX2yo9S9psyxPGxI/ZnN7SGg3S4iHx27+aSrrQpwpA+p1sMcuOe2RAli0fZ0Z8
	z4fU7ZW9TcUMb5e40BGOREwezT+/64T1v8G8Mo/UKk6nsB5yUMAoMO0A5qdPLhphu5LDMRbp8F7
	T2ItgK6FE92hn/8kQrpa9UHjbGw2HIwZJf0oGJsfSkYcE4r57khq5s0HyCGfR5S9lqzboKmHdpk
	cNHHcZpjhXLR9FhZAzPQ47TMshKqOl1WtXop377uBFA7TvSHt+oOQ8Hvuha/qrSNuPBP8TUxXhu
	gqlnA1fEh2hMe6uUfK319a922LVbPv2l7aTLwLyqoBgaY76f/4LGw9vFws92Nr6PnihjjgjxDFj
	h19CZlt4/4Rac4sI2eCK/AJl3I=
X-Received: by 2002:a05:600c:698d:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49ff06e504dmr1234455e9.21.1790280280382;
        Thu, 24 Sep 2026 13:04:40 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:39 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:19 +0200
Subject: [PATCH 4/8] mtd: rawnand: qcom: make config_nand_cw_write() more
 generic
MIME-Version: 1.0
Message-Id: <20260924-qcom_nandc-share-more-code-v1-4-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_130442_059248_91523A39 
X-CRM114-Status: GOOD (  14.67  )
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

The function gets a 'nand_chip' pointer as a parameter but it is
only used to extract a pointer to the nand controller's private
structure from that.

In order to make the function more generic, change the declaration
to get a 'qcom_nandc_controller' pointer directly, and update the
callers accordingly. While at it, also change the function name to
use a 'qpic_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 1f3c00823309..99fbf5458083 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -378,10 +378,8 @@ static void qcom_nandc_config_page_write(struct qcom_nand_controller *nandc)
  * Helper to prepare DMA descriptors for configuring registers
  * before writing each codeword in NAND page.
  */
-static void config_nand_cw_write(struct nand_chip *chip)
+static void qcom_nandc_config_cw_write(struct qcom_nand_controller *nandc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-
 	qcom_write_reg_dma(nandc, &nandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	qcom_write_reg_dma(nandc, &nandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
@@ -1018,7 +1016,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const u8 *buf,
 					    oob_buf, oob_size, 0);
 		}
 
-		config_nand_cw_write(chip);
+		qcom_nandc_config_cw_write(nandc);
 
 		data_buf += data_size;
 		oob_buf += oob_size;
@@ -1094,7 +1092,7 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 		qcom_write_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
 		oob_buf += oob_size2;
 
-		config_nand_cw_write(chip);
+		qcom_nandc_config_cw_write(nandc);
 	}
 
 	ret = qcom_submit_descs(nandc);
@@ -1144,7 +1142,7 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
 	qcom_nandc_config_page_write(nandc);
 	qcom_write_data_dma(nandc, FLASH_BUF_ACC,
 			    nandc->data_buffer, data_size + oob_size, 0);
-	config_nand_cw_write(chip);
+	qcom_nandc_config_cw_write(nandc);
 
 	ret = qcom_submit_descs(nandc);
 	if (ret) {
@@ -1220,7 +1218,7 @@ static int qcom_nandc_block_markbad(struct nand_chip *chip, loff_t ofs)
 	qcom_nandc_config_page_write(nandc);
 	qcom_write_data_dma(nandc, FLASH_BUF_ACC,
 			    nandc->data_buffer, host->cw_size, 0);
-	config_nand_cw_write(chip);
+	qcom_nandc_config_cw_write(nandc);
 
 	ret = qcom_submit_descs(nandc);
 	if (ret) {

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
