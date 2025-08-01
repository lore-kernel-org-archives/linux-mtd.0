Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BB1C87FCB
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Aug 2025 07:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KUHdOieuOhoXuiVwa2yINZIgn2q0+V7+j7BARCcCIS8=; b=XlsvbOKRPaPqik
	+Z9phP9YlXoUpvyoBtPTTWLfqCTLlk+7I+TVn0SeZinQPVJdFiFTAJ/uHaY7ww65f1scnlMJoSCz3
	aP6s0YCAJbVzJ0hutaCPQdnVJgf7AJ+V8gnEGnx5+6TH8Ub0Q0zY/asN4iGFdBR4LkhamLeyrsMaN
	qc9jmuLYf2YFNxFKhnrvoBuHxNuAe0OS0+L8XV5xvq/0+rm+RXekHsU6wpvXL+X32X1UfRQ/k4jeI
	i1M8CuREXimEM8a7Uf6UOUuaNHGRDbyQ0nFiLXKMXiYkgEWgPNLeM6CMTz1/oGFnqLsD3x88o7r/K
	Y8l6r5t++eqLxyQSrs7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkf6-00000005Bow-1N5t;
	Fri, 01 Aug 2025 07:58:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkf3-00000005BnK-2YPS
	for linux-mtd@lists.infradead.org;
	Fri, 01 Aug 2025 07:58:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4555f89b236so10883345e9.1
        for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2025 00:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754035120; x=1754639920; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=if+jrugCoYKdMUAChMOY2irCS/mGgiPfCTcd1NEbdjY=;
        b=U9dqmaPr2qIjGfmg8zpLqTnw9pByVoWDTSglYkv9WVLfFk0/r4IVb3E0nQlb12BL9+
         xw0i8a+UFQXUc8zRCAZ2jzzg+7a2Tv27qh0UeQ7Ke4xhCIdMhoIARy98Zr479Unvnk1k
         E3I6Ma1YsJMmHDCw2N9vaNYRt3c8QUJ8JKL1UtnovkvoIRBgllgtBJjOSSN+/pEopz0g
         Ib0wF5Aoa3tysihfVv0DwoBxbN3jYdCC0S/nPfIoe0VGTgLiroKEWd6tEijusWEAfMbY
         ZKiTtbSa5dNaS2zgZCw+AxydWYX2+biEAt1aP58ThJYbhht1RqQhq3TQo6IfrGV/1zJZ
         tvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754035120; x=1754639920;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=if+jrugCoYKdMUAChMOY2irCS/mGgiPfCTcd1NEbdjY=;
        b=dXCdcmknA5Qs/C4Yy8iXaa2ZL6MLAJnUIzcQmXrC6bv6tXNemmm25euJxYELoL6bAZ
         YnN55/3w1tkA4V1gXA+QGUX3Yet/ntUrUFl0VhDihQ4uUr3RXa53dmUEDBzyEEU7SXjw
         Mchj5uzo4cnuNLxqW1sdByrmMRAPOYMTFeHatdq48IWki6YQf81lhlDRsfEBV90JMBBD
         /4dD5+dIBgqlk792mG59FFcZgigz4QtmNio0E+Z8kXZdp7NQIYMgAIRxuPBSXjEQuqR9
         zzMEL+1DHCEm88wVx69v3O7jXj5LmCPEtggiWrBJfqW2Jt85NBbQPyCN6x+TEsUD0YZ4
         z8Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXPubcNnTPRt5JkSzxaEXyK1jeFl53rzkCM513oS7mH4iM29fdzxXAfYaXA9pl5gSDFk48UMamrIC0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKDmi+26z+d39IQde0ZgVR/Fqh9P4WdNWb9DRmLhxoXpcICHTR
	nseF8jDslJe3r5zpYm4sdjD3iSwqSmWKba/K3wBHBigEEUqNf7oQYyku
X-Gm-Gg: ASbGnctJpiXI6ovMBiobBMHmq5lyhIPLk1m5RfaXARwg+0BWI8pKcGvo2Z1LBMi2fd6
	ZDqWBdbT4MKan9zd7pbJ2bincKETXQny6Q+NU2ssk1xoLXOmg6F+46LPkgifQncEBmKwNvZArHe
	0SNnYPGBrxn54CIV6gWIcsYjjGn5MgPE1Ka6+lf4iyZBdPWpDyhiKXAoaUoZB609SyudfEx0ko+
	5e0Je+lW+RT5NQmhUUl9VedALub0oWj0yBEVgwfTjRTu3i5QJqpKp5Vyeo/05IUGu1sVmB7fIbc
	VUuep5b/y9eb14uJjElul5jNZIGYebdYCTKUETwdLZjnXaq5jymOygJGJQsXbiwtW+5KYB4BGE2
	aAcf4xI4sBPzmvXNl/JuB1duE3mk4M9QW53K3OzaqKBuRHaS9KcG6ZsE71D57YQ==
X-Google-Smtp-Source: AGHT+IHyWNxPi2finIbBIOeg6Q79VKyVKB7VXLAIFgQqUupvSjpN3TOAAtQGbNCGEpDirXnIys3JeQ==
X-Received: by 2002:a05:600c:1c21:b0:456:27a4:50ac with SMTP id 5b1f17b1804b1-458aa45997emr13496465e9.23.1754035119694;
        Fri, 01 Aug 2025 00:58:39 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4589ee4f0f8sm55368405e9.15.2025.08.01.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 00:58:39 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 01 Aug 2025 09:58:35 +0200
Subject: [PATCH] spi: spi-qpic-snand: use correct CW_PER_PAGE value for OOB
 write
MIME-Version: 1.0
Message-Id: <20250801-qpic-snand-oob-cwpp-fix-v1-1-f5a41b86af2e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKpzjGgC/x2MQQqAIBAAvyJ7bsFMC/pKdDDdai9qChVEf086z
 sDMA4UyU4FRPJDp5MIxVGgbAW63YSNkXxmUVEYOXYtHYocl2OAxxgXdlRKufGO/qJ5IGzfoDmq
 dMlX9n6f5fT+oq7uKaQAAAA==
X-Change-ID: 20250731-qpic-snand-oob-cwpp-fix-6b26ee45c743
To: Mark Brown <broonie@kernel.org>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_005841_652752_C4BB9E64 
X-CRM114-Status: GOOD (  16.99  )
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

The qcom_spi_program_oob() function uses only the last codeword to write
the OOB data into the flash, but it sets the CW_PER_PAGE field in the
CFG0 register as it would use all codewords.

It seems that this confuses the hardware somehow, and any access to the
flash fails with a timeout error after the function is called. The problem
can be easily reproduced with the following commands:

    # dd if=/dev/zero bs=2176 count=1 > /tmp/test.bin
    1+0 records in
    1+0 records out
    # flash_erase /dev/mtd4 0 0
    Erasing 128 Kibyte @ 0 -- 100 % complete
    # nandwrite -O /dev/mtd4 /tmp/test.bin
    Writing data to block 0 at offset 0x0
    # nanddump -o /dev/mtd4 >/dev/null
    ECC failed: 0
    ECC corrected: 0
    Number of bad blocks: 0
    Number of bbt blocks: 0
    Block size 131072, page size 2048, OOB size 128
    Dumping data starting at 0x00000000 and ending at 0x00020000...
    [   33.197605] qcom_snand 79b0000.spi: failure to read oob
    libmtd: error!: MEMREADOOB64 ioctl failed for mtd4, offset 0 (eraseblock 0)
            error 110 (Operation timed out)
    [   35.277582] qcom_snand 79b0000.spi: failure in submitting cmd descriptor
    libmtd: error!: cannot read 2048 bytes from mtd4 (eraseblock 0, offset 2048)
            error 110 (Operation timed out)
    nanddump: error!: mtd_read

Change the code to use the correct CW_PER_PAGE value to avoid this.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 0cfa0d960fd3c245c2bbf4f5e02d0fc0b13e7696..5216d60e01aab26f927baaea24296571a77527cb 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1196,7 +1196,7 @@ static int qcom_spi_program_oob(struct qcom_nand_controller *snandc,
 	u32 cfg0, cfg1, ecc_bch_cfg, ecc_buf_cfg;
 
 	cfg0 = (ecc_cfg->cfg0 & ~CW_PER_PAGE_MASK) |
-	       FIELD_PREP(CW_PER_PAGE_MASK, num_cw - 1);
+	       FIELD_PREP(CW_PER_PAGE_MASK, 0);
 	cfg1 = ecc_cfg->cfg1;
 	ecc_bch_cfg = ecc_cfg->ecc_bch_cfg;
 	ecc_buf_cfg = ecc_cfg->ecc_buf_cfg;

---
base-commit: 926406a85ad895fbe6ee4577cdbc4f55245a0742
change-id: 20250731-qpic-snand-oob-cwpp-fix-6b26ee45c743

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
