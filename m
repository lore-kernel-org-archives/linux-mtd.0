Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4CCC3ABDE
	for <linux-mtd@archiver.kernel.org>; Wed, 14 May 2025 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n+MOejduPlzMVVG9bzFlGy9m2lcaVdq6nKEQjKfpbxQ=; b=STLXfwZH3Pruqx
	3FFrMvc/APdyIxnkG+j3DlVAPoZZR5VqAYPHbTyXDRTUU32m8qtJ2c2ZtnN7oN98V2crw0HLDwqLA
	kytg9YOCt+uq+WPp/Fw/BuiOKXN4s6ANMuT77WyPhGw/gsnPNox+kVlddktb5xZ2pE4U78QDfddOn
	UtPEIdzOKZ4GIZ/x+hnWVIKXFF+LoxPof3no3dL2l+qdRMwS6XTVg6nLwhJOxQtUuSV1XOaEvbfLq
	5GgaMDWXIltycbsnnoEzrTN+KzgY+lRxPafcrDwEYDFahgjyaMvdIaMjiktJCKBTKuQtmM9VBxrkS
	e9nfDfJAdRZybDZbC7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB5l-0000000F3XC-3QRQ;
	Wed, 14 May 2025 12:20:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF9AL-0000000Elbi-2lkP
	for linux-mtd@lists.infradead.org;
	Wed, 14 May 2025 10:16:46 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a1b8e8b2b2so3611968f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 14 May 2025 03:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747217804; x=1747822604; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xt5jpPl9R9r3M1DxHFUgl8SbNW1F0avaN7jhoorozrg=;
        b=dwgVBykyrq2UduGhcoOUeyC2Cc2GiJ5eYR5dNDe46Cmdr7SrsxCKwtDZvx9fPVcB05
         LYUwYfLzJ4wvbhbKCBvyuGSz2aL5xhlBSHy4IMvzCq34UUDPoSSnRs7vSI3Bq2gdlVhQ
         /IY9aBGoMJFkqq3gw+FrXMj0kw8HOr43W16QGdknvjevpUEkvIOCZ2Swjhx/FCXC1GD8
         kiSqnwgGt2e6vaURzDWkCvP2qNfQlak53L9/5qnZ4F8K2kBjOrukO/NaJyXTT85ESuBk
         7LMMTOl+PED0DAkNoKa/vPupc4qFiy1o3OFOvfqbeh0qd55I9oueHlIllTl5l3yUhWcM
         zg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747217804; x=1747822604;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xt5jpPl9R9r3M1DxHFUgl8SbNW1F0avaN7jhoorozrg=;
        b=oP969Kjcp5FmGoKrjiZeNfA5mA7MWtPZsUKKB/ig8qPSxsko5Ud0aG1bC3CmVCe+Yn
         TkOE1sysTCTpRu6Lr3tPUOw/8fmX/WCXfWywWnkGSDlcfbpyuKlrG3qC4f/5Q2VLGFYT
         khdnMmH/TymPoNdMOryGifZZhDNrEgo/6SudA0Gb7IXzI4T8IBAhjAWaGpKgF78wPhcv
         C12EzMHRg0685kVjZi/0y864iVg8cnu0QwYhaUa0CyX5NE0E55FunXCw2f/bGEUszmO7
         rsm88SDa6iYcpYuuHRHyT2TYxy9XRtrjaIqSaEX+cVzFZO4jgQYbWncGBQGhxUUBq13m
         Hcvg==
X-Forwarded-Encrypted: i=1; AJvYcCUHhkT4HatcbM70lk+Q/pbvzDGYOI6JpS5hP5KDuDQQgCeBYNiIqru3jS/HHguc2zf9Qde6imqhtQo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYkqcgYtutLmrFgN8K2VAxFNG0N/3zdYo9lfax4TBeGur69GuE
	QiECS8kQ8oRCyZzyr1NAFfavyBkA3E034mBDTn/0vmobTohctNfX
X-Gm-Gg: ASbGncsvmaNOdtdE4pTDkpxAkhSt0Qd4RLBCjZd9+76zv68YLfkGlqwdsuNfbcV2a4z
	bigaELzdHxIoFRZH/sWDorlNgOw3SW3BJ7iYIkyWX+ar/QoyF3Hy0FqYGGvUQiHvTJCWDAFhmUM
	PJsE99Pq285QT2YsnLzZpjAex4Fa4D5ppSLG09TgjJzxYMr3sSAjxbHa9Fgw6txEWKlpJaEPYb6
	eTZ4iJa40+PLSJl45q5nGq8aSVso+bFbnLZYAhOUeX1yaTj0UYe9FjuKax3Esw5Os/oiu9/EMVp
	bk4ODp+ED9Vqftl20eoObVUfgkhyZFYqAoftv/tPI2ag0GZ9WWBXQD2pTZJuCm96ibcTciF+5oY
	yUi11
X-Google-Smtp-Source: AGHT+IGTBzXJ8khuka4ANfCsJsFYflJ8G0mPpcLcLGB4Y+fmnHYrjMluF3TVeXvhgi5hMkdHZs1XCQ==
X-Received: by 2002:a05:6000:1a8c:b0:3a2:12a:e637 with SMTP id ffacd0b85a97d-3a34994fee5mr2322746f8f.56.1747217803976;
        Wed, 14 May 2025 03:16:43 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde27sm19596519f8f.17.2025.05.14.03.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:16:43 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 12:16:38 +0200
Subject: [PATCH] spi: spi-qpic-snand: reuse
 qcom_spi_check_raw_flash_errors()
MIME-Version: 1.0
Message-Id: <20250514-qpic-snand-error-check-v1-1-c0ebd3aae72a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIVtJGgC/x3MSwqAMAwA0auUrA3Y+gOvIi40jRqEWlMQQby7x
 eVbzDyQWIUT9OYB5UuSHCHDFgZom8LKKD4bXOmasrE1nlEIU5iCR1Y9FGlj2tHNbLu2o8qTgxx
 H5UXufzyM7/sBCVK1amgAAAA=
X-Change-ID: 20250514-qpic-snand-error-check-2be1767c3dc2
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_031645_703225_B3B6ED7C 
X-CRM114-Status: GOOD (  14.90  )
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

The qcom_spi_check_raw_flash_errors() function can be used to
verify the flash status after raw operations.

Move the function slightly up in the code and change the
qcom_spi_read_last_cw() function to call it instead of using
an open coded implementation of the same check.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 18a8e572434e81b698332aceeff852e88e1d6b13..3ee891fd5b5e334950a8da58221658b62b8378c2 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -492,6 +492,22 @@ static void qcom_spi_config_single_cw_page_read(struct qcom_nand_controller *sna
 	qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 1, 0);
 }
 
+static int qcom_spi_check_raw_flash_errors(struct qcom_nand_controller *snandc, int cw_cnt)
+{
+	int i;
+
+	qcom_nandc_dev_to_mem(snandc, true);
+
+	for (i = 0; i < cw_cnt; i++) {
+		u32 flash = le32_to_cpu(snandc->reg_read_buf[i]);
+
+		if (flash & (FS_OP_ERR | FS_MPU_ERR))
+			return -EIO;
+	}
+
+	return 0;
+}
+
 static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 				 const struct spi_mem_op *op)
 {
@@ -537,11 +553,9 @@ static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 		return ret;
 	}
 
-	qcom_nandc_dev_to_mem(snandc, true);
-	u32 flash = le32_to_cpu(snandc->reg_read_buf[0]);
-
-	if (flash & (FS_OP_ERR | FS_MPU_ERR))
-		return -EIO;
+	ret = qcom_spi_check_raw_flash_errors(snandc, 1);
+	if (ret)
+		return ret;
 
 	bbpos = mtd->writesize - ecc_cfg->cw_size * (num_cw - 1);
 
@@ -622,22 +636,6 @@ static int qcom_spi_check_error(struct qcom_nand_controller *snandc, u8 *data_bu
 	return 0;
 }
 
-static int qcom_spi_check_raw_flash_errors(struct qcom_nand_controller *snandc, int cw_cnt)
-{
-	int i;
-
-	qcom_nandc_dev_to_mem(snandc, true);
-
-	for (i = 0; i < cw_cnt; i++) {
-		u32 flash = le32_to_cpu(snandc->reg_read_buf[i]);
-
-		if (flash & (FS_OP_ERR | FS_MPU_ERR))
-			return -EIO;
-	}
-
-	return 0;
-}
-
 static int qcom_spi_read_cw_raw(struct qcom_nand_controller *snandc, u8 *data_buf,
 				u8 *oob_buf, int cw)
 {

---
base-commit: d43eef530946783cb5537ee58bec892253b68648
change-id: 20250514-qpic-snand-error-check-2be1767c3dc2

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
