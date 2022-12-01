Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB77AC43217
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 19:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t46uJX3U+dVLOlrY2anOSIn5g77znAiI0ttd72sw0D4=; b=kTI4BRpA0MFts3
	2oV6LNYtRYJ6GAyRHMxUZSTpzM4686tEc1YUrkpbbv/gyWpR8MKXhGuflNvAL03yplvtPw+OkPRW8
	Phwa6EodWKkTj9UFZyKfyqiGhHeAlh6wJjUOhiVYBadD/4X46Z8ptRqjmV9oux00KXPnHJ02wrOhQ
	4swzixtEMXzXG6PbmpP7JCdU+dGUAS7OuE+4n35aV7iiVAx1gH64xbNFHci/FAtqQFyll0rWg5bj4
	Ter1J+vWsU6U8hVudQybGXse/pTnjm+YEa4u+Anja7j8LYqD0X3aDlK77Diwi1NC+TFQfPiXCHzCb
	a1QvkIqJtEeBZUR+Nlog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pJq-00ALmJ-9n; Thu, 01 Dec 2022 19:34:02 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pGI-00AHJg-5b
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2022 19:30:23 +0000
Received: by mail-qt1-x82b.google.com with SMTP id fz10so2203775qtb.3
        for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2022 11:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFCBGy/PHSqulvVt1jN7WYpo1L/uAw3+z6frKWBhRoc=;
        b=pJfX+eHFT2vr3LfxVwv0ulFSIwHsF3KFI6OdOpmKL4VLyW1+SxJnJmblhVqrm7ZfmB
         Cb8X9ZFzETRxMZQvrtL62/1zxbAlmXa9vlfoM8/x6XT5QZEB38f1id47sOYyCnsgsdAM
         U7RoIdCSHrpowQMCu5Y88BNH+MGRYlm4MqBT2wFnPNmkkfZsOCEIfVQJl6T6VFUMMseO
         jQLvSV+BbjvNykJyhiy9FMl+QtGb5eKud/YaOjk2Q6hHEdKTxAKranqC445PppZUj04K
         9LfQzu57Pr/2/s45N8b2h4ojeMlScCqJ+FZ/Rlt22WWoq8z1mlrI7OKakgdzhcsqxQJs
         PuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFCBGy/PHSqulvVt1jN7WYpo1L/uAw3+z6frKWBhRoc=;
        b=EobF26uCa02obspfopjlB1GLh/+7KOOZRkBZIAW22NrgXcU++/hrxFSn7iBsPApUxw
         hCPUl3t4J71s7nknb0ODzd0ZOgu+TCHSlM8AE5PIC2o9qttNfgyRYhWhmwp/pwu0LbYk
         O5sXAw8i4tYnIUphTcCh3ZQGRZ2LKropKS/eMO49VB691RM7AETUvkE4HtlCmsUhBeAj
         5IxJKzRPveOj3MeFsJtHSxunkDOodCD0Zm9uCZ6TqQ6bSUTQugGdIBX5YYMXH+SiCztI
         oOgwEl7ku3FMvJMxzS0oEK6HuwCeBi044LcSvQaUyAwHg0A3TAerNc83uSm5+WnrDLS5
         GlIA==
X-Gm-Message-State: ANoB5pkMaCgOS+GUH+5v0q9Hemrl2Z2eswEORXvyQskYjalfKSQx9oP+
	R241HG6Dk0GC4GgYu2HUVSudFA==
X-Google-Smtp-Source: AA0mqf7oOJj+mqSJLhu5GzlaWfWuN/sjSCuidJiPAU+TiPNDNySKnR0cHUv6efS6LIqcdmUngb98fw==
X-Received: by 2002:ac8:7497:0:b0:3a5:e592:37c8 with SMTP id v23-20020ac87497000000b003a5e59237c8mr61541174qtq.609.1669923017432;
        Thu, 01 Dec 2022 11:30:17 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id h19-20020ac85153000000b003a6328ee7acsm2977748qtn.87.2022.12.01.11.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:30:17 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: 
Cc: nathan.morrison@timesys.com,
	greg.malysa@timesys.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] mtd: spi-nor: Extend SFDP 4byte address instruction lookup table with new octal modes as per JEDEC JESD216F
Date: Thu,  1 Dec 2022 14:30:04 -0500
Message-Id: <20221201193007.261690-2-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201193007.261690-1-nathan.morrison@timesys.com>
References: <20221201193007.261690-1-nathan.morrison@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_113022_237681_487CE517 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

This adds the new bit fields for
reading: 1S-1S-8S, 1S-8S-8S, 1D-8D-8D
programming: 1S-1S-8S, 1S-8S-8S

Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
---
 drivers/mtd/spi-nor/sfdp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 2257f1b4c2e2..e4e87815ba94 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -953,11 +953,16 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 		{ SNOR_HWCAPS_READ_1_1_1_DTR,	BIT(13) },
 		{ SNOR_HWCAPS_READ_1_2_2_DTR,	BIT(14) },
 		{ SNOR_HWCAPS_READ_1_4_4_DTR,	BIT(15) },
+		{ SNOR_HWCAPS_READ_1_1_8,       BIT(20) },
+		{ SNOR_HWCAPS_READ_1_8_8,       BIT(21) },
+		{ SNOR_HWCAPS_READ_1_8_8_DTR,   BIT(22) },
 	};
 	static const struct sfdp_4bait programs[] = {
 		{ SNOR_HWCAPS_PP,		BIT(6) },
 		{ SNOR_HWCAPS_PP_1_1_4,		BIT(7) },
 		{ SNOR_HWCAPS_PP_1_4_4,		BIT(8) },
+		{ SNOR_HWCAPS_PP_1_1_8,         BIT(23) },
+		{ SNOR_HWCAPS_PP_1_8_8,         BIT(24) },
 	};
 	static const struct sfdp_4bait erases[SNOR_ERASE_TYPE_MAX] = {
 		{ 0u /* not used */,		BIT(9) },
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
