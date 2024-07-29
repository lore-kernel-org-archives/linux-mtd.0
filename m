Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A816C3DA4A
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2024 10:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GoKQWYCgu6RpPKuymJFSnAoSBz8AFCbjvHLUFzX5grc=; b=1Qwr4Sc6uLBGNv
	c9XJXZx/Kjkwih1E4x4YXyKRCZVGSWkWQbxtrK5MrJMAfIaSLKEV/HRRClWAD98VApyz0qAvgimKg
	HiMh7IcV+UZdwvbjnnELZ5RZiV/IWA02tFvAKCc0jBY3AOj6WNR3IQZ7CYS9kQ7w4JF23R8UgaB/u
	GekhKMUCvNAlGZjTdsrgUmGx3/lUYguuEqDJmrzjx+AICRkr8rl5cmJjWpSDZ7/l3ZDEJw7yHQyBn
	sD9QJxw6BbnqGni+NaQdP9kycVndC6iZfIwD18YZhfDjugTBbSzRWACaLcfaw73x09mXKh5eokWRb
	UqEDAAjMuLpH1A+Wuw/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNUu-0000000ArYV-3JB4;
	Mon, 29 Jul 2024 10:20:56 +0000
Received: from mta-65-226.siemens.flowmailer.net ([185.136.65.226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNUr-0000000ArWI-2hdA
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jul 2024 10:20:55 +0000
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202407291020520954c394e947065632
        for <linux-mtd@lists.infradead.org>;
        Mon, 29 Jul 2024 12:20:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ofM8BPauPwCaw7EnMHA4zEp4o/OJV8PDKv4vyqGyTe0=;
 b=TDfuOe1W6U1RMRXHtxX02yOJzcN9WBLe0E5+EcgBg2MME1grIpHv/PcvBl5ZNFSpmwrViU
 5KZ2sFzT186sOEs5DnUdpNcC+aQJ64fsmrUkXqSO2x/uCFGfpDLHLgOZd3kWPttiR74b+ANI
 3XV2a7mZYaLyefbIsrsTvPSmVppYcaimZenzjdIhryX924ePxExPgqC5p2zEJV8PJAzU+yTJ
 Lr8dx56ENlhclhmxZXCOGy4WuvsAwRHTpsi4wPmTHwy4fsQXiYRVazd221Ey7beCROYVNIzp
 ko/UdMwZWETPQQFB38I5Ti8pCC166W/iK2j8EiM2niVnA68hq7q7N1zg==;
From: "A. Zini" <alessandro.zini@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 3/3] mtd: spi-nor: add support for Cypress cy15b102q
Date: Mon, 29 Jul 2024 12:20:16 +0200
Message-ID: <20240729102016.8527-4-alessandro.zini@siemens.com>
In-Reply-To: <20240729102016.8527-1-alessandro.zini@siemens.com>
References: <20240729102016.8527-1-alessandro.zini@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_032053_844494_1336F02C 
X-CRM114-Status: GOOD (  11.49  )
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

From: Alessandro Zini <alessandro.zini@siemens.com>

The Cypress cy15b102q is a 2Mbit serial SPI F-RAM device.
Add support for it to the spi-nor driver.

As per datasheeet, manufacturer id is 0xC2, which from the official
JEDEC JEP106 corresponds to Ramtron. Ramtron has been later acquired by
Cypress, which in turn merged with Infineon. Prior to this acquisition,
Cypress merged with Spansion. Given this history, add the device to
spansion.c, as it already includes other products part of the Infineon
family.

The JEDEC-assigned manufacturer ID places the Cypress (Ramtron)
identifier in bank 7.

This patch depends on patch #1.

Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
 drivers/mtd/spi-nor/spansion.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6cc237c24e07..9687dfb62a9b 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -981,6 +981,13 @@ static const struct flash_info spansion_nor_parts[] = {
 		.name = "s28hs02gt",
 		.mfr_flags = USE_CLPEF,
 		.fixups = &s28hx_t_fixups,
+	}, {
+		.id = SNOR_ID(0xc2, 0x25, 0xc8),
+		.name = "cy15b102q",
+		.size = SZ_256K,
+		.sector_size = SZ_256K,
+		.flags = SPI_NOR_NO_ERASE,
+		.mfr_bank = 7,
 	}, {
 		.id = SNOR_ID(0xef, 0x40, 0x13),
 		.name = "s25fl004k",
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
