Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDEDC74A5B
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 06:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFMSppbHoDwPPMv2aWv/8g1kCMesb4hL65fCCMzY1y8=; b=LKWQmAXT0vOjWH
	CGT8AtJ4rhHFEQPQQrsR3RGcLTToxs/Km8Cqzo/7MR9TdiLNhgxGbchaknG54SHevL6COwZAq6jR6
	madDKxiGoMjX5v2lDh3UQIricREjh+zi/gYtrPLclDogJrS+BM1Bamq6dMJIcTTbukhbZp0Y9Z+zZ
	tuf3Rxk2LWLvSZN8U5tRZyqXPU5308O3vpcH80i7x+AwqwF2dNFlLlqj+r/VBZa4LzQru1kWkv8ka
	j3Mu9/4OShi7bXN2Eby3nBq85keKk/iNHM4Eh2yxRngAlF33TXa7Bhiud26P2KmeEFdU+Fyq9fU5Q
	hS8AtPHr4RdCSKe5rRBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9R-00Etq4-37;
	Wed, 22 Mar 2023 06:40:49 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9L-00EtkJ-2M
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 06:40:45 +0000
Received: by mail-lf1-x131.google.com with SMTP id t11so22078183lfr.1
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 23:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679467243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJfZKigBIeChWOChUBeVAQfEZHFms3jVy0ZK/PQ531k=;
        b=GXOWONJwTRivIy6517fCgO6hyO0N3AxoYQNRie7uPM3oSvUEtTfErM2Ju2Q+JMhwrh
         02KdBggKf8GXBSQxTATLVlizdGXlaSxSk1nSP8Tk1dU0RQu0gDc5dlLb5Xud1wOVxLfm
         +05ecDO2Rhnr4cW/nwVFJcBZrtxcYO6gmrqcCHTIPM23CMFDE8QJ04GeT8A6TjZUW4fq
         vVnkmzNj5CwUGHY2SLY+QSAaudULkkR3Z0Nbm1VrNGgvRmj+wtfmUdW2AfeJ4Ci4Pr8c
         b216+98OAE3zfra/5eSupJyZ+f5v+4fR7Q1yHw7JoxAlzftJEEXq1By36uUSpgOHLBwg
         2/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679467243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJfZKigBIeChWOChUBeVAQfEZHFms3jVy0ZK/PQ531k=;
        b=JHvVkqAhg+inkUldR8NUihE9/85gesVHpwsbPxNo6pp4Z9JHMfs4LmzXWIGDNpq9dY
         seehi4b91fPDFYPFbWE7WpmrPrn2MihUIFTCCOyzLYZ7qzxnufgpMlLsjh//uKvXfQjW
         /4HgMPB6XPI2On7JM9zSOI3/GYog/xIRQeEHUTNNC3zZq+iYkP/Rlh2h4UR5q31vjgLB
         zsGVNP2hdQBKc7NRHo4T0Z3IvZm0EjUfiogVwAlA0s5vscmSUYvRmLUNxpopLgoJes55
         k6ev/G5uJVJBDGrw0aNP98PgtuKMrNIo3ax2ozA4y78S6uetn4d3Vx/LwuYMzKUUU4oW
         ZApg==
X-Gm-Message-State: AO0yUKVTw9XGja5cPThFtH4LWd5KkjnX6C9DjBGoyuY4rgYrbVQXsGSp
	RDKyFzyhGokqBUrv/IVM2Xzf9A==
X-Google-Smtp-Source: AKy350aU6oZfJKOyA5joErp2v+jd3KokKBm3ODOpDtqzLBKBfJpb9+F7caJ9EwuQ56pHTjQbER2k6Q==
X-Received: by 2002:ac2:428e:0:b0:4ea:c730:aac3 with SMTP id m14-20020ac2428e000000b004eac730aac3mr391733lfh.3.1679467243288;
        Tue, 21 Mar 2023 23:40:43 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020ac242d4000000b004dafde0e7b7sm2462255lfl.279.2023.03.21.23.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 23:40:42 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 08/11] mtd: spi-nor: Stop exporting spi_nor_restore()
Date: Wed, 22 Mar 2023 06:40:30 +0000
Message-Id: <20230322064033.2370483-9-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
References: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_234043_783881_05940934 
X-CRM114-Status: GOOD (  14.85  )
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

Some SPI NOR controllers that used this method were moved to
drivers/spi/. We don't accept new support for the existing SPI NOR
controllers drivers under drivers/mtd/spi-nor/controllers/ and we
encourage their owners to move the drivers under drivers/spi/.
Make spi_nor_restore() private as we're going to use it just in core.c.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/driver-api/mtd/spi-nor.rst | 3 ---
 drivers/mtd/spi-nor/core.c               | 3 +--
 include/linux/mtd/spi-nor.h              | 6 ------
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index 4a3adca417fd..c22f8c0f7950 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -63,6 +63,3 @@ The main API is spi_nor_scan(). Before you call the hook, a driver should
 initialize the necessary fields for spi_nor{}. Please see
 drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to spi-fsl-qspi.c
 when you want to write a new driver for a SPI NOR controller.
-Another API is spi_nor_restore(), this is used to restore the status of SPI
-flash chip such as addressing mode. Call it whenever detach the driver from
-device or reboot the system.
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2a08f8de97fa..1cf566fed9c6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2924,7 +2924,7 @@ static void spi_nor_put_device(struct mtd_info *mtd)
 	module_put(dev->driver->owner);
 }
 
-void spi_nor_restore(struct spi_nor *nor)
+static void spi_nor_restore(struct spi_nor *nor)
 {
 	int ret;
 
@@ -2944,7 +2944,6 @@ void spi_nor_restore(struct spi_nor *nor)
 	if (nor->flags & SNOR_F_SOFT_RESET)
 		spi_nor_soft_reset(nor);
 }
-EXPORT_SYMBOL_GPL(spi_nor_restore);
 
 static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
 						   const char *name)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index a3f8cdca90c8..8aac4522bf2a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -437,10 +437,4 @@ static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps);
 
-/**
- * spi_nor_restore_addr_mode() - restore the status of SPI NOR
- * @nor:	the spi_nor structure
- */
-void spi_nor_restore(struct spi_nor *nor);
-
 #endif
-- 
2.40.0.rc1.284.g88254d51c5-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
