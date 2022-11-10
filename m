Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBB1C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 15:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aPB79+riLyRbIoyEIV64X0ZuylbA6AxmTu19HVEqXxw=; b=g8QqJdHmkD7ttz
	HIRnggZBuBGzq+IB6q5pLC0rW67U6DJHqF0yGkHwoj+uqqPrSOgcnyQXFmSQBqJ0Xw1ciLNhX2e6O
	8Ck9SO5M0CRYrGLwv57ItsnHpWCke2hkKUDrisyUKmw98WHneM3cELoHPJVPRJSgHYbk4Z+l9GEaM
	Byw6bnfodL4JC9eSM4hf68t664jun8QwJ9Hi9nLvPuhe/aHcoFftYC1EV5hsGB5Y/ROud4j4b1sjR
	8mTS5c+g0SPDNnd5KrNL5YpPJkO4eC+MEsAbZOWD70xVKwuqu11yg3LWW4AIN8ktcKu6UCMBlv3Z5
	+BX1AYNtzjxmiUr2I80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9tx-006x1H-BR; Thu, 10 Nov 2022 15:55:37 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9tk-006wqv-0r
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 15:55:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EEA5220011;
	Thu, 10 Nov 2022 15:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668095721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGtk0OWXdIhOpM1q44s1VNQcx1PvS1/18u6Yz698hUU=;
	b=hA9iHMRDQjV5bRzsTqzFMnWmN8F8vaNZO09I2dgRPXmG2JrpyWbP1RY2mIWLvi6SUQcGrz
	ifw3kqyvqUgrFxbQ5ENVZZuk63dMaLl5NcwQBr915DH3oa2qgV2/b7BWiKLDSU+RkdNPxZ
	82i8m82/DUpfYMZm2oaf828F4H61JK7yYDcNFq2nwJflCuYXIIAQY34Aw4tk46lBIY5zBf
	v5FFvBvdIJWDXll7LlJAceJJQDAiRIT/qxfG3qVY1gFq3tsDLsuoEcUTKGVWcZ6GIlVCD8
	ta54XjvvCdshp3J+dFaZA6A/YiXJFq20ydoz/4T19+Dasgi7PpAc4fxe9KWtlw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 3/9] mtd: spi-nor: Add a macro to define more banks
Date: Thu, 10 Nov 2022 16:55:07 +0100
Message-Id: <20221110155513.819798-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110155513.819798-1-miquel.raynal@bootlin.com>
References: <20221110155513.819798-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_075524_274079_85B58892 
X-CRM114-Status: UNSURE (   8.38  )
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

Most of the chips on the market only feature a single bank. However, new
chips may support more than a single bank, with the possibility to
parallelize some operations. Let's introduce an INFOB() macro which also
takes a n_bank parameter.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 8a067d56c995..044d49d749e0 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -553,6 +553,10 @@ struct flash_info {
 	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
 	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
 
+#define INFOB(_jedec_id, _ext_id, _sector_size, _n_sectors, _n_banks)	\
+	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
+	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), (_n_banks)),
+
 #define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
 	SPI_NOR_ID6((_jedec_id), (_ext_id)),				\
 	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
