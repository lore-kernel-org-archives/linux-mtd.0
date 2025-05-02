Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F10C3ABB0
	for <linux-mtd@archiver.kernel.org>; Fri,  2 May 2025 19:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cw51xAa9cwtT+TUhYp4ZZFnUu6P4eSvawt68pNBK3RU=; b=3yRqzuFkH9zQgx
	WTfXlzZ9+1ByNC7TO127O9HgGT30M/2+IGKbLLYgZxdMkASEU/u0GbGgVkKpLHxRia6iStBz4PHGw
	q/XqKrGwP6gjXjL7yTD4GZMkPtp9GSunp6y3Y1leMkgspt3fzLozFjlPFNiZLg3Zfm77IKp7PoNsK
	VYE8ZZqwuehL8N+tRHOXqXT/xjPmUn4Orf24y0O/GV4fbPPoPJVm88ABD1zaCwdz7xTrwkqsvd4FD
	98ucbgaTemGXqjm6VxdyIcav3nAwxtzkNXSIZQrSHeN/BSXf1TI3ToGQ4jXf1esq23zEVFgN8WQBo
	BdsgI9T2LK9zOAdBolgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAw7f-00000002tFH-2Pmv;
	Fri, 02 May 2025 19:32:35 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAw6j-00000002t7a-1w9A
	for linux-mtd@lists.infradead.org;
	Fri, 02 May 2025 19:31:38 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5f435c9f2f9so3462097a12.1
        for <linux-mtd@lists.infradead.org>; Fri, 02 May 2025 12:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746214296; x=1746819096; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYru7OZrKrqfltHny9tU6nYbNSpx3ucjTn2eAVnRMu8=;
        b=JKtW3ycNtcrFfkulnfKDJMSt4lu+ZtJp6fRrW9xYbBpqUDlD1EN0+P8PSmXYIgqIn6
         kujnRTpHcGjSg75v5m3F/3oBgbozHmXDlaTma7gcuGunRcuRUOGGChMiL6GjhJCFlGQu
         dGLyGy9fOZdcg13Q/eK+qj9+Z5RTn3j/XL39tx/IUStvJ0rUK21345MA+ot+VJVV3vt5
         aovJqxwlTDUpUDndCjfKjfX52D6ylNcXC0RGuD/aXd0gcArcKFYW25+kTFNGvwGeYkuS
         qSeMlkLvV5rPbMnlNAWQa2iKhhZ9HY3gkb6YqKHYeA80JIJ3213VIgtYxQXOWrSzNw8i
         eLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746214296; x=1746819096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYru7OZrKrqfltHny9tU6nYbNSpx3ucjTn2eAVnRMu8=;
        b=wXTq6hGa7X9QOZG0STRUIweftn6GNoP7BJ1A62sE5eayGyGuBuQvyettUFF0ZWbbJK
         jivq2Jdzd6mVFCorGfxHC4ZI+O486FbBYWX4WGkRTdafS4lSPon1wHSOkfAp7TnWG5ya
         JR6rP2UnXzPWCa1dXUE5xZxxBud1lxI83aSSID5BwgFjAs4sr8g0/jklZ/4lZOV4BuHn
         q/NixpLJdsU3mouePmp0amlaGI1XqCrN5RAokU4D8WHFQ+g5VKEQsB8sy5lCBZ+uJWc1
         e31yjeIWugD9vPErpZW9NAes2OrwkhNJeMs+Y/jUzbeQGdbKz3QbJMch6luJKIieoQlr
         6ugQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeKcubYi3opWirRBMVL743By81I7CjOjC8o9XLAeuZVWE3g8cvR+HhD+ClQNXW4Y6vsNPSem9WTIo=@lists.infradead.org
X-Gm-Message-State: AOJu0YymuyyIc+yeE4RgN37JBO5TN6oq250LjqHXYpKgHzNp2laYjHtx
	LljIMJ4Oww8GcObLlRCYmB9yE9UDCtTICnb2ILanrtlO2w+wxxZO
X-Gm-Gg: ASbGncsTJiuSbGk41g+W5Cdf3hBZWJ03Lr+7aVL+rnHXYbr2WUen64554HjBNTDZX/w
	HhGygkl5IU6uHa9ki0X/WazBAOQU7tbw3hIEMpJAqKaW89PzqfsqwdR+uuUUnHqaxHbTRRObdhl
	0j0oLJ/K8HtSLkPPuK6pr5/1iOvaPKoMgeVm2DvhJNe257GYAeG1YfUugr/jMQCo1O8+GlC/uru
	DR+iWlJlGSJniYQA6TC/19ePzlaUBd7I3KHn/t6WEl5Fy2t5ENyu6pExRWTA0Gg+xKaLyeZslJq
	qYw1C46j1npGLoD38kzkdeSOe4q+b3F2aBO76dtdt97oySmlDD4HllWqA0LmSCvh69B26g==
X-Google-Smtp-Source: AGHT+IEP+FDZGU9hYZfYrSG5ghaZutVUFxUR9ebLBrAfE5499Gp7fnlH3NJSbsc49+MPHKS29brqmg==
X-Received: by 2002:a17:907:3d50:b0:aca:d4d1:37c2 with SMTP id a640c23a62f3a-ad17ad3a8b8mr387683666b.8.1746214295475;
        Fri, 02 May 2025 12:31:35 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad1894c025esm87824266b.114.2025.05.02.12.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 12:31:35 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 02 May 2025 21:31:16 +0200
Subject: [PATCH next 1/2] mtd: nand: qpic-common: add defines for ECC_MODE
 values
MIME-Version: 1.0
Message-Id: <20250502-qpic-snand-8bit-ecc-v1-1-95f3cd08bbc5@gmail.com>
References: <20250502-qpic-snand-8bit-ecc-v1-0-95f3cd08bbc5@gmail.com>
In-Reply-To: <20250502-qpic-snand-8bit-ecc-v1-0-95f3cd08bbc5@gmail.com>
To: Mark Brown <broonie@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_123137_504678_47B79C5F 
X-CRM114-Status: GOOD (  15.91  )
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

Add defines for the values of the ECC_MODE field of the NAND_DEV0_ECC_CFG
register and change both the 'qcom-nandc' and 'spi-qpic-snand' drivers to
use those instead of magic numbers.

No functional changes. This is in preparation for adding 8 bit ECC strength
support for the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c    | 6 +++---
 drivers/spi/spi-qpic-snand.c         | 2 +-
 include/linux/mtd/nand-qpic-common.h | 2 ++
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 5eaa0be367cdb847d48dbed6f8326a75a5922347..67641ce28bd6435fffda3ffe5e38c777f4708cf8 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1379,7 +1379,7 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	int cwperpage, bad_block_byte, ret;
 	bool wide_bus;
-	int ecc_mode = 1;
+	int ecc_mode = ECC_MODE_8BIT;
 
 	/* controller only supports 512 bytes data steps */
 	ecc->size = NANDC_STEP_SIZE;
@@ -1400,7 +1400,7 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	if (ecc->strength >= 8) {
 		/* 8 bit ECC defaults to BCH ECC on all platforms */
 		host->bch_enabled = true;
-		ecc_mode = 1;
+		ecc_mode = ECC_MODE_8BIT;
 
 		if (wide_bus) {
 			host->ecc_bytes_hw = 14;
@@ -1420,7 +1420,7 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 		if (nandc->props->ecc_modes & ECC_BCH_4BIT) {
 			/* BCH */
 			host->bch_enabled = true;
-			ecc_mode = 0;
+			ecc_mode = ECC_MODE_4BIT;
 
 			if (wide_bus) {
 				host->ecc_bytes_hw = 8;
diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 88f8fa98687fa292861d46648872135aa7fad80f..dfc8cc5d97624fe741121228b97d2b3562cc5cc4 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -349,7 +349,7 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 			       FIELD_PREP(ECC_SW_RESET, 0) |
 			       FIELD_PREP(ECC_NUM_DATA_BYTES_MASK, ecc_cfg->cw_data) |
 			       FIELD_PREP(ECC_FORCE_CLK_OPEN, 1) |
-			       FIELD_PREP(ECC_MODE_MASK, 0) |
+			       FIELD_PREP(ECC_MODE_MASK, ECC_MODE_4BIT) |
 			       FIELD_PREP(ECC_PARITY_SIZE_BYTES_BCH_MASK, ecc_cfg->ecc_bytes_hw);
 
 	ecc_cfg->ecc_buf_cfg = 0x203 << NUM_STEPS;
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index cd7172e6c1bbffeee0363a14044980a72ea17723..a070af4593754384d9df4f6206a24665e2040aad 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -101,6 +101,8 @@
 #define	ECC_SW_RESET			BIT(1)
 #define	ECC_MODE			4
 #define	ECC_MODE_MASK			GENMASK(5, 4)
+#define	ECC_MODE_4BIT			0
+#define	ECC_MODE_8BIT			1
 #define	ECC_PARITY_SIZE_BYTES_BCH	8
 #define	ECC_PARITY_SIZE_BYTES_BCH_MASK	GENMASK(12, 8)
 #define	ECC_NUM_DATA_BYTES		16

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
