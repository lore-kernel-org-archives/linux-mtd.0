Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBEECDB465
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 06:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cW3Y/wLa4h6bhrAwkCbxhBiVEf6z+sMKK8477MJMRZk=; b=mnhBa7kPAnDvo5
	oMY8L3+uuHlIEG3Sm/c7hySsMyE02mqpXUdfCGLMwe6YTejLEWdON1g/S7PG+4Ic6xIq2kUJCjlSe
	1IrdI3neSF1HPyuF6ZRE4G19EJJ3DR10oZuQNXsO1kV3ysSGm3wzRT2SLhJMAzF9Yxj1Jv5606eyQ
	gT9sxYJqg/DkHiXc+44Cle582k5Dl/68Z3zuaJIxEk+5B9TfgbhKBwI8tuM2imbqJIne4ukHJwJJL
	yqA+mRYUu3mcALgpNTfKLqmhbZmiNI7gkI2Vy++MyzXY19pGORQQ3cHRiV2HilpA5muqHnkK/C+zF
	0IG0C8Ql0qwTgB6XVoaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMn5-00GX0m-0D;
	Thu, 19 Oct 2023 06:45:55 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMn1-00GX0H-2r
	for linux-mtd@lists.infradead.org;
	Thu, 19 Oct 2023 06:45:54 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so5757680a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 18 Oct 2023 23:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697697950; x=1698302750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VnD+4+o/AktznkdSPALDpojy3+u5FZvAU0rtTI4+TYE=;
        b=lnZYxmpX6xMBGymj6WTwVKFxHFPAPrNDpYJ4NIn8HDqaQ/SIUjHItq3TTMDn9qWrZZ
         bJUFLUgWMho5eqBU3FyKQQ4J1RIXP7ei25l1ExSEClsS9kwKva8ymqAXevGdaM3iyLP/
         Pp29Ln5K4gvy3BILSj1KL8xWpFJs8uQuKem1hT+7k4Cwav6JH0C/9F9tzDs4IfXJJO3r
         Q7SYcyoXN6mAhmVQ5T/dzk847LgoUJXbt489v/C+Y8e29JMkPtPcVKt0JEKyU5PmK7vH
         8x2MOea5O8hf0rF88y7LqL4kIDlG5WB632Hd2Qmj9y+PJowCc/LmZG2ifGVyg7BYOaDS
         eh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697697950; x=1698302750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnD+4+o/AktznkdSPALDpojy3+u5FZvAU0rtTI4+TYE=;
        b=hHQMSNGBcOLUU0I/sO0cTtsSLtNeFDWtVGXmQrlyeFHW/DSgtMeRiKO6cZevG1dLsO
         AaG+q51oBrmIuy/AbAtTR8kACtFvZe0+THosErICWJIh7+7syWGukP3LNBXc8K4hhf/A
         kHZ5odO8Xq3et7xf0nEbiVaXq1dAa/tUrdnyHFf86vtao5q9+Tdp8/GHPquT7iHYaofO
         Ki7C4XEYWq3VHGqXr9DlhcFhzS2TYbC01qKpFmWLdP38/ezu6UPPi0JsimN5eglummbJ
         MgtOJKk8+HadIb/1uMhs8hVgp3g4CYiZNMLMfl/oec0o4cH6YL3wht4rcFBkVOEkiSMh
         K3mg==
X-Gm-Message-State: AOJu0YznCqQ5wYdzpNbLK8gjPJJu6fWqGq7M5sNrlWU8sY6CN6LGgRKI
	0PAbjPpZNxzFmf628SiBpv0=
X-Google-Smtp-Source: AGHT+IE1WPyhscv9usKnV6Tvcm7NkIcFn9ykGqFUpUm5bk7HtzJmvn92SJo6z7jtF5q3VfnCewsPhw==
X-Received: by 2002:a17:90a:94c2:b0:27d:2b81:5798 with SMTP id j2-20020a17090a94c200b0027d2b815798mr1179229pjw.48.1697697950140;
        Wed, 18 Oct 2023 23:45:50 -0700 (PDT)
Received: from localhost (211-75-139-217.hinet-ip.hinet.net. [211.75.139.217])
        by smtp.gmail.com with ESMTPSA id t8-20020a17090ae50800b0026b46ad94c9sm879353pjy.24.2023.10.18.23.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 23:45:49 -0700 (PDT)
From: AceLan Kao <acelan.kao@canonical.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: Lower the priority of the software reset failure message
Date: Thu, 19 Oct 2023 14:45:47 +0800
Message-Id: <20231019064547.348446-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_234551_947453_28F86F0B 
X-CRM114-Status: GOOD (  10.86  )
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

From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>

Not all SPI drivers support soft reset enable and soft reset commands.
This failure is expected and not critical. Thus, we avoid reporting it
to regular users to prevent potential confusion regarding power-off issues.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1b0c6770c14e..7bca8ffcd756 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3252,7 +3252,7 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
 
 	ret = spi_mem_exec_op(nor->spimem, &op);
 	if (ret) {
-		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
+		dev_info(nor->dev, "Software reset failed: %d\n", ret);
 		return;
 	}
 
@@ -3262,7 +3262,7 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
 
 	ret = spi_mem_exec_op(nor->spimem, &op);
 	if (ret) {
-		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
+		dev_info(nor->dev, "Software reset failed: %d\n", ret);
 		return;
 	}
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
