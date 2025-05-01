Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B16C369DC
	for <linux-mtd@archiver.kernel.org>; Thu,  1 May 2025 16:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=enGNXHqsGRdCdBz3MkyuCmUD1PER962cXt2OdYw+iA4=; b=dH/YdPJxbGUT7x
	vOd8W5jpQhiiYQT1tS8fbNiPFg3nVfDIbij4YgZc2jioc448w0iB1SFFDtlfugbb8Dc0+ZPtud48B
	+CQuqm+A1BdxhcPsWRcNBjyM2Se4fpBOxklbnvyw/ARIRMg+ZxQgGj00E86/HMJjmN8f6KYHZ+uVy
	hr9pPDQg8S7OdDWYUnhnXwCz9NFz2jeoPxuTUKlmV23kXwZOn4ZhT0tYzi5LH4Cx/+NZVo3kWBqQW
	dYRK5jaZVxEqPVEVHIU+yeIWc6R80NMNixAZAoFI4G/zsMqoMC+hoZYsGa9KBFDmUaNGwryZa5jTq
	kdOintOctSdW5cA+dnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWe7-0000000GAV4-0kKB;
	Thu, 01 May 2025 16:20:23 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWe4-0000000GAUe-2iRa
	for linux-mtd@lists.infradead.org;
	Thu, 01 May 2025 16:20:22 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so191967366b.1
        for <linux-mtd@lists.infradead.org>; Thu, 01 May 2025 09:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746116419; x=1746721219; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uOmy2E0oN5vjJ0You/8n6Z0Pmepb4FK1Hw7LfqptwBg=;
        b=Yra4sUKQxLh7iWkTyCHN5U1LHscLO7tWUE4G74zpNU2AmHiuuX7gZGoxufB0iVJMMS
         lVXYMXCBW5J19QY4nKVnLWkz8Dtzx2gG+WIYRdUFLydSwputvZQ3BhrPrQFAvgKCyU3H
         P2bwQKc+dvn6ujkbfg9XDKIJGIOhXMyVohN83GOTe1P1Gf/jsei0KfYVjnOy4qmyYu/4
         bCMaE0NoWmPoMyZ6Tl3auE469Yrb/keVnhkfT6i51izmnnHVgLxKfAGjO2UZpreuACSg
         NHMohZvETzLZCWL6FuqXT4ToLRx2bwSg6t1/jRlJLO8uMbnaa+x/YuMNhQf1VOF+kG9N
         uXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746116419; x=1746721219;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOmy2E0oN5vjJ0You/8n6Z0Pmepb4FK1Hw7LfqptwBg=;
        b=mNjuivCZ/VjZVofxk34NlB3EKQyRIuQ6NpZxoM0Q6s3w/Jy/Da5zlcr0C6mGBYBucE
         P5nElvhHubP2qTCQcMSop2tXya9Fuj/wdbBT/EAOh9SaW0vdaeKhHe5Mpn/wAZHq8B0t
         LwgdwS9wR9LYyw8e50sFaIr2G+4zAWgiBGxIlmRmt+2745RHY1gTLlNOusVzpzq1vT7e
         x1oCQsbhKRu5+DwZXFrY29cyh9AHLZD+gpWdQ0WV8CsairzJgF7Hi5e0mtUJwpFgKdkE
         IlmsE401UXO9P2XBdin3e2qKL/uFZ1eHlJ4WPhKSwAvlwi7XuNB9hFDInWJeM74osK05
         s82Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpHF+2YIbrvPQ22TSpyM3ZJhInFUXndT7GvK6skvJxjOIB3Sk7zJf2RGdIloqVDIfrZgVikEhRjZE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5zPOlw3BXBJbQs/wmItx4tndawKpRmw6cFQDoU3gv9kQssMig
	vPId3eS+tpNFt3C1myz8nmkZ1f6OLjlxycz6oMi5Db4+Opkpj/SSBtw89g==
X-Gm-Gg: ASbGnct9MsQEOHQj9cVLYlcD0ptHpG1OD+oC/FmRe0u3yZPyQHwh/PPlNji1S4zbJLY
	3dLkR7tVthmRdg2vchdRmRbwT/1qkw66k70N8DHvfcIt+PbunI1SeYngcUuK6vyp3TlCARAD0sr
	pi9NeZeIrVWiG+s6hqlOgT14nxc+PKsHJuC1S/bUCA+Skr85TSS0xFW+ioB+2gRZ/feAM8gu5rq
	bFVaO+ZAluFfJ1UoljsyXXulKO6rG8kHWsCO4WiSXKpGSt9ZQso2qogwKJe9XoRGowwXxBhqSnR
	P+ClSwBpGcJOLjbBl2Tqu9nWhcv//p6+Ryv/k7VZeeuD1KdTg2evCSzpHHEvIeK0kJjm7Q==
X-Google-Smtp-Source: AGHT+IHzfi4VSpxpv+pztKx4Lp0PesbOchWTJcGKA3qJLKG6pRrja2Nh+1nKve5gcaP5v06HJrjpXg==
X-Received: by 2002:a17:907:6d28:b0:abf:7453:1f1a with SMTP id a640c23a62f3a-acef450d143mr416290066b.36.1746116418313;
        Thu, 01 May 2025 09:20:18 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad0c70d3a7bsm60970066b.25.2025.05.01.09.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 09:20:17 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 01 May 2025 18:19:16 +0200
Subject: [PATCH next] spi: spi-qpic-snand: validate user/chip specific ECC
 properties
MIME-Version: 1.0
Message-Id: <20250501-qpic-snand-validate-ecc-v1-1-532776581a66@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAOfE2gC/x3MQQqDMBBG4avIrDsQMwjiVaSLNPmrAzLaREQQ7
 27o8lu8d1FBVhQamosyDi26WkX7aijOwSawpmryzneucy3/No1cLFjiIyyawg5GjCy9fAQi8NJ
 TrbeMr57/80iGc6f3fT9cPBVCbwAAAA==
X-Change-ID: 20250501-qpic-snand-validate-ecc-383b3e33e238
To: Mark Brown <broonie@kernel.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_092020_697667_182DEF68 
X-CRM114-Status: GOOD (  23.67  )
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

The driver only supports 512 bytes ECC step size and 4 bit ECC strength
at the moment, however it does not reject unsupported step/strength
configurations. Due to this, whenever the driver is used with a flash
chip which needs stronger ECC protection, the following warning is shown
in the kernel log:

  [    0.574648] spi-nand spi0.0: GigaDevice SPI NAND was found.
  [    0.635748] spi-nand spi0.0: 256 MiB, block size: 128 KiB, page size: 2048, OOB size: 128
  [    0.649079] nand: WARNING: (null): the ECC used on your system is too weak compared to the one required by the NAND chip

Although the message indicates that something is wrong, but it often gets
unnoticed, which can cause serious problems. For example when the user
writes something into the flash chip despite the warning, the written data
may won't be readable by the bootloader or by the boot ROM. In the worst
case, when the attached SPI NAND chip is the boot device, the board may not
be able to boot anymore.

Also, it is not even possible to create a backup of the flash, because
reading its content results in bogus data. For example, dumping the first
page of the flash gives this:

  # hexdump -C -n 2048 /dev/mtd0
  00000000  0f 0f 0f 0f 0f 0f 0f 0f  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  *
  00000040  0f 0f 0f 0f 0f 0f 0f 0d  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  00000050  0f 0f 0f 0f 0f 0f 0f 0f  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  *
  000001c0  0f 0f 0f 0f ff 0f 0f 0f  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  000001d0  0f 0f 0f 0f 0f 0f 0f 0f  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  *
  00000200  0f 0f 0f 0f f5 5b ff ff  0f 0f 0f 0f 0f 0f 0f 0f  |.....[..........|
  00000210  0f 0f 0f 0f 0f 0f 0f 0f  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  *
  000002f0  0f 0f 0f 0f 0f 0f 0f 0f  0f 0f 0f 0f 0f 1f 0f 0f  |................|
  00000300  0f 0f 0f 0f 0f 0f 0f 0f  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  *
  000003c0  0f 0f 0f 0f 0f 0f 0f 0f  0f 0f 0f 0f ff 0f 0f 0f  |................|
  000003d0  0f 0f 0f 0f 0f 0f 0f 0f  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  *
  00000400  0f 0f 0f 0f 0f 0f 0f 0f  e9 74 c9 06 f5 5b ff ff  |.........t...[..|
  00000410  0f 0f 0f 0f 0f 0f 0f 0f  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  *
  000005d0  0f 0f 0f 0f ff 0f 0f 0f  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  000005e0  0f 0f 0f 0f 0f 0f 0f 0f  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  *
  00000600  0f 0f 0f 0f 0f 0f 0f 0f  0f 0f 0f 0f c6 be 0f c3  |................|
  00000610  e9 74 c9 06 f5 5b ff ff  0f 0f 0f 0f 0f 0f 0f 0f  |.t...[..........|
  00000620  0f 0f 0f 0f 0f 0f 0f 0f  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  *
  00000770  0f 0f 0f 0f 8f 0f 0f 0f  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  00000780  0f 0f 0f 0f 0f 0f 0f 0f  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  *
  00000800
  #

Doing the same by using the downstream kernel results in different output:

  # hexdump -C -n 2048 /dev/mtd0
  00000000  0f 0f 0f 0f 0f 0f 0f 0f  0f 0f 0f 0f 0f 0f 0f 0f  |................|
  *
  00000800
  #

This patch adds some sanity checks to the code to prevent using the driver
with unsupported ECC step/strength configurations. After the change, probing
of the driver fails in such cases:

  [    0.655038] spi-nand spi0.0: GigaDevice SPI NAND was found.
  [    0.659159] spi-nand spi0.0: 256 MiB, block size: 128 KiB, page size: 2048, OOB size: 128
  [    0.669138] qcom_snand 79b0000.spi: only 4 bits ECC strength is supported
  [    0.677476] nand: No suitable ECC configuration
  [    0.689909] spi-nand spi0.0: probe with driver spi-nand failed with error -95

This helps to avoid the aforementioned hassles until support for 8 bit ECC
strength gets implemented.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Marked for next because it depends on commit f48d80503504 ("spi: spi-qpic-snand:
use kmalloc() for OOB buffer allocation").
---
 drivers/spi/spi-qpic-snand.c | 42 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index d0e4f49cd89b977a64fc529aebbae36409efed0f..88f8fa98687fa292861d46648872135aa7fad80f 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -249,9 +249,11 @@ static const struct mtd_ooblayout_ops qcom_spi_ooblayout = {
 static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 {
 	struct qcom_nand_controller *snandc = nand_to_qcom_snand(nand);
+	struct nand_ecc_props *reqs = &nand->ecc.requirements;
+	struct nand_ecc_props *user = &nand->ecc.user_conf;
 	struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
 	struct mtd_info *mtd = nanddev_to_mtd(nand);
-	int cwperpage, bad_block_byte;
+	int cwperpage, bad_block_byte, ret;
 	struct qpic_ecc *ecc_cfg;
 
 	cwperpage = mtd->writesize / NANDC_STEP_SIZE;
@@ -260,11 +262,39 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 	ecc_cfg = kzalloc(sizeof(*ecc_cfg), GFP_KERNEL);
 	if (!ecc_cfg)
 		return -ENOMEM;
+
+	if (user->step_size && user->strength) {
+		ecc_cfg->step_size = user->step_size;
+		ecc_cfg->strength = user->strength;
+	} else if (reqs->step_size && reqs->strength) {
+		ecc_cfg->step_size = reqs->step_size;
+		ecc_cfg->strength = reqs->strength;
+	} else {
+		/* use defaults */
+		ecc_cfg->step_size = NANDC_STEP_SIZE;
+		ecc_cfg->strength = 4;
+	}
+
+	if (ecc_cfg->step_size != NANDC_STEP_SIZE) {
+		dev_err(snandc->dev,
+			"only %u bytes ECC step size is supported\n",
+			NANDC_STEP_SIZE);
+		ret = -EOPNOTSUPP;
+		goto err_free_ecc_cfg;
+	}
+
+	if (ecc_cfg->strength != 4) {
+		dev_err(snandc->dev,
+			"only 4 bits ECC strength is supported\n");
+		ret = -EOPNOTSUPP;
+		goto err_free_ecc_cfg;
+	}
+
 	snandc->qspi->oob_buf = kmalloc(mtd->writesize + mtd->oobsize,
 					GFP_KERNEL);
 	if (!snandc->qspi->oob_buf) {
-		kfree(ecc_cfg);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_free_ecc_cfg;
 	}
 
 	memset(snandc->qspi->oob_buf, 0xff, mtd->writesize + mtd->oobsize);
@@ -279,8 +309,6 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 	ecc_cfg->bytes = ecc_cfg->ecc_bytes_hw + ecc_cfg->spare_bytes + ecc_cfg->bbm_size;
 
 	ecc_cfg->steps = 4;
-	ecc_cfg->strength = 4;
-	ecc_cfg->step_size = 512;
 	ecc_cfg->cw_data = 516;
 	ecc_cfg->cw_size = ecc_cfg->cw_data + ecc_cfg->bytes;
 	bad_block_byte = mtd->writesize - ecc_cfg->cw_size * (cwperpage - 1) + 1;
@@ -338,6 +366,10 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 		ecc_cfg->strength, ecc_cfg->step_size);
 
 	return 0;
+
+err_free_ecc_cfg:
+	kfree(ecc_cfg);
+	return ret;
 }
 
 static void qcom_spi_ecc_cleanup_ctx_pipelined(struct nand_device *nand)

---
base-commit: a7f035c2c72496cf7ac34bfaa8c289e0d4c45836
change-id: 20250501-qpic-snand-validate-ecc-383b3e33e238

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
