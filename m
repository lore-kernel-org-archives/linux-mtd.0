Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC443C98328
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 19:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KAXvSrbB5ZNcLeQBDlXT5Ud2UDc29XEjILwQF5/3dPs=; b=OQ/hA1fXGwbJnZ
	uQT6rZXNY+05qeLVFU+VsS0wK2TJpKI0Q+GadK3qC5dXZB2EXvtkl+qukoWDGrQcymue76/ne1/A3
	PuLO2QNypHIHm+HyOlz4cJHdLX8fJUFlQxjR0CrPSSMUNjBsWHhZCe33ySz+zC/77WAtf/xajxY9g
	vmbwUUa7QmpKLIEKcFQud2Rn6p8EaynhOmT9N75A5SRp4aabgvT8uIITDUicmsZSZ9ZyV1B/hu6TP
	hrrOGpH09X626WVv611S75Bb2RF24JDBcSLjmGLDb0fxtoAkM3iwdLLaEUmcyqrYHsNacHiGDpDRn
	ZRlFc4TikCK+IX7NiJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFi-0000000EDXr-3Rxg;
	Fri, 25 Sep 2026 19:06:34 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFg-0000000EDWe-0ErE
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 19:06:33 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48879d4fd8aso697675f8f.2
        for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2026 12:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363190; x=1790967990; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qGsLFVBH+PkOR+pSsm1K1BuRl8tuo2QZGCmeMXdvZ8=;
        b=H2juwMML7mWB3UR/J9bJhY3ygy6tysOXdRJaAflg2xiuRFst/XurgKyJbp1IBl5bZF
         ebZa3frZxi2x49ZumlXch06v+UMZZcly+7Bn2mYSz8kqyFpDZI/5txtAT6i7GY43H5SQ
         ZzaHSrWAkg/SqvHuIVrx5nGTSOph7g+spffh/cgCQYTucyZ+TQrjPYlHFVDaG4cRTygB
         orsBukn+bww1dOK4qx0fuN8po6BiekAGL3fxPryq6mUttZUzUgyy765hasQjd2gv90HS
         75C1g0a6xRNTiDvWAVDsNeV6ZFdYbn3EDn8T9SdLE4mN36DzEGlK2+0C/27j69nAbG1l
         nvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363190; x=1790967990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qGsLFVBH+PkOR+pSsm1K1BuRl8tuo2QZGCmeMXdvZ8=;
        b=qkXNcyvcPKEtR/sPkH0noE9dQUdwnV/SLollTJGX4SbgwuCvqfvyUkd6W76w8Zp8Qe
         Bj56AdCSTVAiuXa9tmQwjdpTIFGPdRRsJC/5q8euoKvoCwBFATH5Z7ziT7zxIYhlE1wg
         n5OKmBZICRCuB/G6T83iVdblnsvmZYMi7SaDuwWeIgy3b3G7i+sZc9eGLV1gCnEB32fS
         rHCzJ0kcI/QCXDvW0e6ma1pbr7RRXwmmLUqLG6shh7T9XUOZB7OXaQGghcLc7QfDZE8g
         HVtvkvtV5wLyvWXvYjPaGhxiAvjR8YSA6ZMvmLViBb5HkWdFpvfuex3yGcwLl/zsnHvj
         me3A==
X-Forwarded-Encrypted: i=1; AKwUvByD3S0sS9GqEYD76PHaTgpmx9O6ODLoGWcA1qCXFg28x08hC8raIFafHcBkbnHhAhq0cxS3jNoGSME=@lists.infradead.org
X-Gm-Message-State: AFuF++lq0PbFBapBq4yZuIGRkU2lOqfwQ6sIK60sK0EJs0PlCcJTOoFr
	JUkTSxMzsXwHZY76B7JlG1F4/0cHtDNvzwJyzEFNj8WCL7IdZolu+LTs
X-Gm-Gg: AYBFou35kq8GuiwmcDm6PflmG2/s90UaOqi6m7l5ORwkJSL6hP724V7Ya4+4GPqtsUm
	JCOvb7hVkTlfmd8nr6renUArT6gU8CLuziAorGnT5IzIpsj5BpU9CCdVe7d/pp1NKoPayZub6Nz
	mtvxY/ZM96SDNjU0mgLE+V8/VSY+8PLBalWwUGysEzvouISh+O/0DZeR0cxZcpnMFuMVoE98Dep
	s+8HsnSxN2WQtUX62gHLbU0FXURG6dPb7MCR63tY71eVWRA2RJkfDKh22m4eGiRjH+EdxzbhcVU
	ojTusDTemTB1rFR1XqIZDt5wvw5y44uTivkmeOcHYOaZjF0I0V2ICBgbnDP+wtwiDXCabSeU/4P
	Td4yTbAkwppUK85CC0Cc507uvj5qEIHSR8Ukfi40RaNDZmm5jlX72Uhx/6uoCzd99ChwilqRWsX
	5RIhoWp9VSGGAVjOm7YGIY0uWQ67hjGyREnibpz1Rl6a5lEFB+dUwbV5oIJY4yQdxgTdU7xNR9j
	J5ZVGuJdsTSq5GbK2vc+Qf567Y15RVYpkdVlw==
X-Received: by 2002:a05:6000:4b05:b0:488:8131:c684 with SMTP id ffacd0b85a97d-4888131c7f1mr3986610f8f.13.1790363190377;
        Fri, 25 Sep 2026 12:06:30 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:29 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:13 +0200
Subject: [PATCH v2 4/8] mtd: rawnand: qcom: make config_nand_cw_write()
 more generic
MIME-Version: 1.0
Message-Id: <20260925-qcom_nandc-share-more-code-v2-4-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_120632_249730_CB378E39 
X-CRM114-Status: GOOD (  15.88  )
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
use a 'qcom_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - Replace 'qpic_nandc' to 'qcom_nandc' in the commit message to match
    the actual code (spotted by sashiko-bot)
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
