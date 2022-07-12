Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78676C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Jul 2022 16:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xETbfTblDgqx44qLZmCfkrga3m+2nGWUNlWI/iyfots=; b=jOsr9PUyOWremt
	MCAJa/ZM2T2CqZUlozSYqGJ/Yvz/BZBbymVh3JzxJNACIbECbfpLX7Z0uhCG6otEdmkTrQr2NpAiW
	k4zf41GnFu2zU2V+tLKS+XkFw7Aw5EOC511ZrZMFpq6grfCMVuCRW9k7B+FVh5seXAtQH9NxDfonf
	CmDbxOlk9h/k7GCsIIXHuDNdmP22vJqX4098Xb21nz0rCr0oqhhI5otW1AxzKNDlTA4VU8wMy7Rrc
	XvSmsdmXFg7PpjtLiski4EoNTCjAl1XFR1R74AY7jbJ1LNiVu058FkP7qvOYgzPCAnREmAUDeQMkd
	ifJFqApI5iYPbTSCI42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIvB-00Cup1-W9; Tue, 12 Jul 2022 16:39:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIuD-00CuC6-Ko
	for linux-mtd@lists.infradead.org; Tue, 12 Jul 2022 16:38:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id c131-20020a1c3589000000b003a2cc290135so5538773wma.2
        for <linux-mtd@lists.infradead.org>; Tue, 12 Jul 2022 09:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BXuXiklFcl+vK0kmoMLD007iJW5hMW9mAc7xKGHZhfc=;
        b=Vro/dFbucTFTfY+imZQ1WkqMIYTcCBhqfgdDiw/JxxWQ4P0kgHI1akI7oBBajJOTcy
         fbxA1sjcXfsXZLM99JJDrF61XuA+Yt9jfRPrRvI3zXRuuGT7veCBHYlrtDqUdAQ+D5c1
         cMitPM2+JPJEXy7DL12czQV+/2Sn+56Qdjx8V6cX8gMRHKptYtO03R1BLJtLKAddLq+L
         WV3lRDp5jE6pKPVhtV8QTqOEKc52tvlJWaM3udCW28xwQLzT7c42ozqDXTuGjKOWOBVa
         ho9d/HjLRIza73WOIfqiULK1bQG7PxQh9nnVHAkg4U2TDMLuy79CM6fiq8BlTjB2WWyg
         Wr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BXuXiklFcl+vK0kmoMLD007iJW5hMW9mAc7xKGHZhfc=;
        b=Lmf4vCTwXoU0G4I1gqjz6h/lR8brklDKAu4v8oxNEvKC3lsbx1hKd+VTZnqc0zkeiZ
         WwLAxcX3ka+fPQKnZCACijfZi8xen3ZNAjJ/EWunCrhoU2+45vvLw0kn3BKnA4ON8JEa
         Lu6y5s/HcZi5UkLI/B/nX/1FTjbosVuoU2+JOd+fomwcdhMZXZl+jSvhNGOukpXo8Dgq
         LL0x+UnPdrY09Oe2IQ8AQ+TwVMg8qQgy/buJMWrSRJ4piLoT3TxQL1i/8Xgfd8jRAmEY
         ObdBGrDPf7nWxVgWyQCCQkqUbe1gA5l8i9FtLb4TpbQH+X0pgQz8tevSY+3OLLQCO9i0
         s5Gg==
X-Gm-Message-State: AJIora/2LNZS9yILajoOwj/SsRKglT+MTaFTTF1K0y3UIplV782EskZt
	H/KM6q3LA+566fXvnpilzObrKA==
X-Google-Smtp-Source: AGRyM1tb4EZs5ZikIvKJ/L8Kuec2ek3EENJV7eDH3jpkwW7n1kyTihutuzdDuVWp/U0dOXQ1AV41Lw==
X-Received: by 2002:a05:600c:354e:b0:3a1:9ddf:468d with SMTP id i14-20020a05600c354e00b003a19ddf468dmr4841011wmq.145.1657643911325;
        Tue, 12 Jul 2022 09:38:31 -0700 (PDT)
Received: from localhost.localdomain (host-78-150-47-22.as13285.net. [78.150.47.22])
        by smtp.gmail.com with ESMTPSA id s14-20020a5d424e000000b0021d4d6355efsm8623751wrr.109.2022.07.12.09.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 09:38:30 -0700 (PDT)
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: greentime.hu@sifive.com,
	jude.onyenegecha@sifive.com,
	william.salmon@sifive.com,
	adnan.chowdhury@sifive.com,
	ben.dooks@sifive.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudip.mukherjee@sifive.com>
Subject: [PATCH 1/3] mtd: spi-nor: extend no_sfdp_flags to use u16
Date: Tue, 12 Jul 2022 17:38:21 +0100
Message-Id: <20220712163823.428126-2-sudip.mukherjee@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712163823.428126-1-sudip.mukherjee@sifive.com>
References: <20220712163823.428126-1-sudip.mukherjee@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_093837_825044_755BF3FC 
X-CRM114-Status: GOOD (  12.99  )
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

Currently no_sfdp_flags is u8 and all the bits have been used. Extend
it to use u16 so that we can add more support.

Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 drivers/mtd/spi-nor/core.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ce5d69317d46c..e5f7691c5bd40 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2335,7 +2335,7 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *map = &params->erase_map;
-	const u8 no_sfdp_flags = nor->info->no_sfdp_flags;
+	const u16 no_sfdp_flags = nor->info->no_sfdp_flags;
 	u8 i, erase_mask;
 
 	if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 61886868cd022..58fbedc94080f 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -501,7 +501,7 @@ struct flash_info {
 #define NO_CHIP_ERASE			BIT(7)
 #define SPI_NOR_NO_FR			BIT(8)
 
-	u8 no_sfdp_flags;
+	u16 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
 #define SECT_4K				BIT(1)
 #define SPI_NOR_DUAL_READ		BIT(3)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
