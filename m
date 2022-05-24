Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E9CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 24 May 2022 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Cc:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mAIlj3k4wuz/uVb2a36JiXdYz9hJt/sTQ8WhtcYKz5I=; b=CC+YocA+317M3w
	b8fE/iphYXATPnFQrvANgQrTnfrz4zmzORwgVJ8wvFcMz1caJe8tIs9chr6560AEVjEZNRUyXrlFS
	6nTUCLJy+8tVL1joqbTy+MlpDx2OfNyhjiEjzbXXWeCOVyMcasOlJ7lLCLRX1IoWdB6u6ENAoJT0v
	mPsGEq1IfgAt/yWirgM+RmFzpxSn9hUk5eNSQYNorqkhTtPI4LofE6fcg3Ah4YpObXxMW5MCgynMs
	0l3RJzMjgGNoJ9TOXxxlnob+Ii7lYuP8I9kIY4Z30fJkpCYrzDeiiwdk4/CdjmtYfNzr5GqvV8z9d
	AUNf1noWD4eSvwngQNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nta4s-0090yo-36; Tue, 24 May 2022 19:20:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nta4p-0090xz-7k; Tue, 24 May 2022 19:20:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id x12so2837003wrg.2;
 Tue, 24 May 2022 12:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:subject:from:reply-to:to:cc:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=Mt9M1gkKLEXdm19V1RfAKfuaLVzEHPQcfZI5XRLDbh4=;
 b=PrABYHIthafLbtt2NStkcGUWnO5SCbjjjzTw21Pbth452TR7xqAeVPv2Y/HhOHJLdj
 EpRuW5CpzFyZ7BX+aS9dw18F/oSjjR6J+KKWAwPrlAgHGqYFwgQo+cAvAydT1oryibWi
 Ld6RlTGccTEhtPCnJzrHPB+sc4fQMHBT3LqhzGh9jI2HOVl+IMLxm8VD2WcFoO6SgEES
 0kJqd+r5yZWUT5jNJ2qKkIy1nGiVtk6JllvWclX8Pj6imU5ZXSSQccIWBtCNTG0yfTwG
 /SGpdubZZttf64U6cmG3+enqXA8CtJZf9NOSLJ8Blu7OKxo12GDTNzd43BSY5CbjMKDJ
 EQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :user-agent:mime-version:content-transfer-encoding;
 bh=Mt9M1gkKLEXdm19V1RfAKfuaLVzEHPQcfZI5XRLDbh4=;
 b=lWCj0k67nKMlqe9+cO3rDf8rtUczQuti7reZXYQnrBQ8PyqTj3oFxHW/MwkwLAYgSs
 BO0ntMq1Unsj3obMTr6IAwOMYxZu3ahhGM2DOVU45gwfUnvDbXPQ6djMX32ghAJn5V6C
 BepRVQ+ffmNH0qCkryLoaNcRnMtqoOzcK4hc/aIVDR4d7+gcbUI3dNf0RNqHb92eDDv3
 myO4zij/4tGz0l3TFPlcSVfQBZCJa05AfRK+nQ7VskpqbQo8dO0rLhe5B4TCOdjX9IIE
 idkchTezfRW5j8tCp/xTcTc1ESi5tWturQPxYeUV+JdsUTT7uPBf6sIWdXN9t98yRMsr
 M2DA==
X-Gm-Message-State: AOAM53057A92iqbIHU4jIAwkdoagTANQSFokyKNxLxhO4JToCdhrlTfL
 HcXan7bztsKGLAUMh7V1qr4=
X-Google-Smtp-Source: ABdhPJycIU8EUWa6sk6j8pSnaz8LvsntfLNkERrRa89WZqkB7pk10YjIdZwAi5wZTQSkZIxIr2USWg==
X-Received: by 2002:a5d:4948:0:b0:20e:58f8:f4ce with SMTP id
 r8-20020a5d4948000000b0020e58f8f4cemr25040149wrs.229.1653420015848; 
 Tue, 24 May 2022 12:20:15 -0700 (PDT)
Received: from mars.fritz.box ([2a02:8070:bb0:8700:3e7c:3fff:fe20:2cae])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a056000024800b0020fdc90aeabsm213865wrz.82.2022.05.24.12.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 12:20:15 -0700 (PDT)
Message-ID: <48b49de3712267780916b665d3b2a3323e6f10ce.camel@googlemail.com>
Subject: [PATCH] mtd: spi-nor: atmel: Add at25ql641 support
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>,  Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  ClaudiuBeznea
 <claudiu.beznea@microchip.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Date: Tue, 24 May 2022 21:20:13 +0200
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_122019_346647_B2AAF7C5 
X-CRM114-Status: GOOD (  11.54  )
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
Reply-To: chf.fritz@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch adds AT25QL641 to the list of supported nor flashs.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/mtd/spi-nor/atmel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 656dd80a0be7..dfbc12071093 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -186,6 +186,8 @@ static const struct flash_info atmel_nor_parts[] = {
 		.fixups = &atmel_nor_global_protection_fixups },
 	{ "at25sl321",	INFO(0x1f4216, 0, 64 * 1024, 64)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "at25ql641",	INFO(0x1f4317, 0, 64 * 1024, 128)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8)
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16)
-- 
2.30.2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
