Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093DAC7EE22
	for <linux-mtd@archiver.kernel.org>; Tue,  9 May 2023 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHipYGIp7BjdFch82oENaPqosGjKPMBbt6H9bXUoASs=; b=KVWx6wjrzClitw
	hTmASPrNL3UPNF/K8xtj8OhTV9sKy0OOZ/Mw+h0KcHldhvlNqaAVO52RMVLAieSamOx2YESZxVdGs
	FDKk4Z0+ZwXWApBhbfOvNFwJy0rmGMGaUK+rAm1HpGnJQor5V1ZWeboypcXsI40I5WzpWSvCPqF6S
	751xGBg5U8F8IWyfYm/yaqjLKGfT5r1t8UULrPF6oTW0LFW//b+fPKFr8bnNE/V1bp1ZTBwa7H/5X
	mvq7SXgJOKwGZmBQC3cmEk922y0JbnKeV1wd7eXaxZIEifyC7xluaZIeFExpoPbjAZbCvygMMuABE
	omtz5blxBDbaTaOp6FGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwSxd-00471O-2C;
	Tue, 09 May 2023 19:25:21 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwSxY-00470G-19
	for linux-mtd@lists.infradead.org;
	Tue, 09 May 2023 19:25:20 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4eed764a10cso6969822e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 09 May 2023 12:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683660312; x=1686252312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlwZPVonowD5NeZWZeFy+H47+NTAgbeMkTo9feXnAlA=;
        b=BeJ6GqSc+RR7/1+vIkNUxCKSvDA5qG/OOWU+oO0mA9KWIAKSf1PtpxlJqnx3oDUyM9
         3RtjJiGcGxKFmJwhVRTveo7C9HnxnGTB29nElCbmE/HHm9j4Le6x4i7k5+8UfmLZj+8y
         GxowMC5zK8e6+21tu4nAgdfOYoCgOv3HPsVeo1c348se7xwNhOldLSgzoQk+SOD2W5xI
         zcqq3DFdYIe6FJvP/flh0JxFECGt4XP4b0bPj6IDYeMdCZzhUfGkRFQjWWCs57aO0Ci+
         0G5/djvNkUr9zlua9KJsCcK0YCwvS+z1UP7NrTBfLqT4o3UmDXiXVFukOjcdhFJ/07hv
         3deA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683660312; x=1686252312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlwZPVonowD5NeZWZeFy+H47+NTAgbeMkTo9feXnAlA=;
        b=RfmXSYrEsXHpScOH30pEgKi4+gQ1ZosbJUFtQrPLqYyX2gaOVQjvpn80bzUwlXiBAZ
         ++2qPXFYwC58EyrDiwaFx7ZObc6g/2khBBXpv+DtizT5+d39pGldDva5ZhnOZjpU9b7c
         /2TdkZKjbMhpSuMfum5a1NhTG36AYo2RFpYSKnurbA1mHM9DNQgPJdZsEidhVSkHKeCy
         8ZnNNEqAXKRCRGGJdAVg1tyinMNR+/1yPHvUF3JBf75KBz1PEvpm8+mBBgN9jBaYQhTr
         1Wbx4Gt4c9Dom9gQgWQiz0EpvPrxabeSbqHxPWddUhooiJB4vFRtU+6EbDWdWhn51Ggr
         IwhA==
X-Gm-Message-State: AC+VfDx+A9dQ2KYQdvojpttU1VwfQhv+GznIQe+idfJ2/tYzit1Nxo2L
	OoRpyaekpuURdUka+r3J5bBg2Q==
X-Google-Smtp-Source: ACHHUZ58dNpXVZ92PrAPLjAFX/l2ED0ejCnjnHgMc/JB8cptPNseKKGnosXD5GwiHBh4VsnDvj8J+Q==
X-Received: by 2002:a05:6512:11c2:b0:4e8:3dc1:70f4 with SMTP id h2-20020a05651211c200b004e83dc170f4mr948054lfr.34.1683660311711;
        Tue, 09 May 2023 12:25:11 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id 19-20020a05651c009300b002a6007383a0sm1681131ljq.135.2023.05.09.12.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 12:25:11 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: miquel.raynal@bootlin.com
Cc: pratyush@kernel.org,
	michael@walle.cc,
	richard@nod.at,
	vigneshr@ti.com,
	Takahiro.Kuwano@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	geert@linux-m68k.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 1/2] mtd: spi-nor: spansion: make sure local struct does not contain garbage
Date: Tue,  9 May 2023 19:25:05 +0000
Message-ID: <20230509192506.947094-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <749c2fc2-93dc-585-3826-dea581602d6e@linux-m68k.org>
References: <749c2fc2-93dc-585-3826-dea581602d6e@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_122516_418529_29D6B313 
X-CRM114-Status: GOOD (  12.02  )
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

Following error was seen with um-x86_64-gcc12/um-allyesconfig:
+ /kisskb/src/drivers/mtd/spi-nor/spansion.c: error: 'op' is used uninitialized [-Werror=uninitialized]:  => 495:27, 364:27

Initialise local struct spi_mem_op with all zeros at declaration in
order to avoid using garbage data for fields that are not explicitly
set afterwards.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: c87c9b11c53ce ("mtd: spi-nor: spansion: Determine current address mode")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 15f9a80c10b9..d44ffaac1dba 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -361,7 +361,7 @@ static int cypress_nor_determine_addr_mode_by_sr1(struct spi_nor *nor,
  */
 static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
 {
-	struct spi_mem_op op;
+	struct spi_mem_op op = {};
 	u8 addr_mode;
 	int ret;
 
-- 
2.40.1.521.gf1e218fcd8-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
