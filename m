Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD87C001DB
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9vHr0YUlvckr0JFjz+0tFS0+x2a39qVOz3+6lJjHS8=; b=NWTf7GDBpq5dFZ
	+YAkWUvHq8l9/dqGXSIrGOBdsBpRlGZVq9Q7nUISEXxZyRmjxE0Kc/nDfGQIYfNOEmuLd/4yZXCVh
	lXALkoPDIZMJRu8ZikBncNHqS6ZAqpg4udmM0SBa/A3bsMT8fR+RB2vzFgpOXwyPItXDFMUDxCLn5
	+29ns97HtRVX6PzTrW0Dx9vKCM9bSGNPKn31/4Kxi9jbvXVMKzq+UtPPqBFIZ3ImgW38sg/67l/QA
	hKjEJH0PDtEPFq1WlqsE+qp5OjK6heuRMC8elLeYyoxuzAPJ7D6lZA4KP2LzrbCRak61uS5NIs6Dg
	KJar+P7bSED+8LHgmE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0DC-00HMVA-1z;
	Mon, 07 Aug 2023 13:23:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CR-00HLjQ-0L
	for linux-mtd@bombadil.infradead.org;
	Mon, 07 Aug 2023 13:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IE4eauRJF29U+rDli/OXa2o/HvwBfmYdm6rpvh7Dsi4=; b=knSfy6pqMtFQUApq9Wq+4KtICh
	HXBEXiGYI8GYK9SPYE/ARVg1lXAWF/Z2YnuFi91gDWt6pAeq3ZAKCUao2rGR9No5C7IWBepuWyuUQ
	vLJ0RDpHdmft8U9UUnHYEZu/OSkwhJACz0zPNOurSXRFLU3jWXNxTPxirCz4MznLDUG7m/G98qfO7
	HWkkFwMCWAWFi5WW/uPkMo+8rxQcjvvrWsFMhXiB9zRX5ADBavXsZECb0OVuMqSBsjsQ6tCPeABbF
	4ZiLzlIzAYCE82oenqwue6GhZnLe+SisJCClXPr2ER6ufoyRCWCR7aFXG0NVa4AOfwKrYUgRobk+0
	/Egx1FDw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CL-003qgE-0a
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:23:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E415861ADA;
	Mon,  7 Aug 2023 13:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43F3C433C8;
	Mon,  7 Aug 2023 13:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414580;
	bh=yf+i4Rv/o/8TXBlVhYljTJbV/eUqv5ZZTBjDmCQ4PA0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c7w/2nHMiI1Ih+Msu1UD6s4O38rZIEENrYqf7XuoFBaFf15Fe4+JSOfuKFujzqNm3
	 A1uGMOVTB+QDlH9TKaLUmev4LBE2nFYOmK8GUlTTyu6rmIstFXbCyn6oh8uUsaf2cM
	 R/65hn4+hV41m5w/416ZA8zHr1Z3ZBl3QH5s1h9AmNcDqyw00EfflTzK3EGgyi7r0q
	 RpRNgQrrdLQCJT8YWwWTfnMm8CNAO8AtBzwhmCOV9drfyEUXWhpsKihRNN0AlcT0X5
	 DdW+B6CkLJX0liDI1dZUsAkpaF3/yYTTIGIRaoCGj5fk4puaTCFpU2AubQgYbW7tEJ
	 vKe4TutaePmgg==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:26 +0200
Subject: [PATCH 32/41] mtd: spi-nor: eon: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-32-3d3d5bef4ba4@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_142304_319929_7F76DA44 
X-CRM114-Status: GOOD (  10.84  )
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

The flash ID is the new primary key into our database. Sort the entry by
it. Keep the most specific ones first, because there might be ID
collisions between shorter and longer ones.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/eon.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/eon.c b/drivers/mtd/spi-nor/eon.c
index ba09cb6c2abd..c1ddf662f782 100644
--- a/drivers/mtd/spi-nor/eon.c
+++ b/drivers/mtd/spi-nor/eon.c
@@ -10,32 +10,37 @@
 
 static const struct flash_info eon_nor_parts[] = {
 	{
-		.id = SNOR_ID(0x1c, 0x31, 0x16),
-		.name = "en25f32",
-		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K,
-	}, {
 		.id = SNOR_ID(0x1c, 0x20, 0x16),
 		.name = "en25p32",
 		.size = SZ_4M,
-	}, {
-		.id = SNOR_ID(0x1c, 0x30, 0x16),
-		.name = "en25q32b",
-		.size = SZ_4M,
 	}, {
 		.id = SNOR_ID(0x1c, 0x20, 0x17),
 		.name = "en25p64",
 		.size = SZ_8M,
+	}, {
+		.id = SNOR_ID(0x1c, 0x30, 0x14),
+		.name = "en25q80a",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+	}, {
+		.id = SNOR_ID(0x1c, 0x30, 0x16),
+		.name = "en25q32b",
+		.size = SZ_4M,
 	}, {
 		.id = SNOR_ID(0x1c, 0x30, 0x17),
 		.name = "en25q64",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
-		.id = SNOR_ID(0x1c, 0x30, 0x14),
-		.name = "en25q80a",
-		.size = SZ_1M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+		.id = SNOR_ID(0x1c, 0x31, 0x16),
+		.name = "en25f32",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.name = "en25s64",
+		.id = SNOR_ID(0x1c, 0x38, 0x17),
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0x1c, 0x70, 0x15),
 		.name = "en25qh16",
@@ -57,11 +62,6 @@ static const struct flash_info eon_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0x1c, 0x70, 0x19),
 		.name = "en25qh256",
-	}, {
-		.name = "en25s64",
-		.id = SNOR_ID(0x1c, 0x38, 0x17),
-		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K,
 	},
 };
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
