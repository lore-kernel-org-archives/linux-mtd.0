Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE28EB64DA
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 14:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5ramVzd8/1Tw2vKo3lliJBWa+0+dgXRoNnJCpPoRUk=; b=MTudwXQq1aaK5x
	YtL0Rtcb04wWTi5ifCaTn9IZppYrhu6EsBZJhWXQZmf+vQSruQomUq5nxdH+IloX9Fdgmv2U+hu/W
	eDqR0iuS4giYUJ03Enb8/ZsmmThvnQeitWjG4qnapLRTpl8iMb+/CD27YpKPMMykMNxlf63jTt1Ry
	p1zKriBdJ/jsLudR+RfJocSy2jbFK2r7zTZBRh4+fFj21EtFVJWLqYegmGspePk4sjmE6KiPqUCrf
	DiTbE3L9zYmjcwUfGjtfkU14DH7HMV4CeyLHnUxRBRs6aD1bxZ2vxnrq1pc2gb7EBFUen7jOTSKkK
	mtF9Y/YOAIpj5RvRuskg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAA7y-000lOK-1i;
	Fri, 16 Jun 2023 14:08:38 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAA7t-000lKs-02
	for linux-mtd@lists.infradead.org;
	Fri, 16 Jun 2023 14:08:35 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686924506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r3lnRPQng9Mg85UFpBlL4MOLQN12E1GUmndSSnfMvLI=;
	b=fhL3S/jtwWqfVAvXWGSF3pZDcrqOeL5VQFLloDsqVL8T9GVbZmk5EszCklyLMJIlY3ZQzo
	kQrPh/ng733Nsc3ExZcTjnMvTp+A4B+YYJphpNJv63WMhlw0P4NxIaVOc9l8WWyUU+R63R
	/NZTwv1Nb9xtR2QhndbaEFZwLyyN6MVNUUE/nzzXBs6yy+GXwKcUt5gb0eVMu1wVwb9/zN
	drtKW7faVe4EZPbytPsYGiX2xupLQQeAjSeuxjFIcG0dLR4r75L6K5Td+nyLgnSWg1sfP+
	vWHputzQrkjS8iAnVR5eF6+uBcCysoY55hdyr4AwiJM08mrT2O6CE5x5KBxi/A==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15BC71BF207;
	Fri, 16 Jun 2023 14:08:25 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 2/2] mtd: spi-nor: Drop redundant information on the sst26vf flash series
Date: Fri, 16 Jun 2023 16:08:22 +0200
Message-Id: <20230616140822.2789638-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616140822.2789638-1-miquel.raynal@bootlin.com>
References: <20230616140822.2789638-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_070833_185379_EE1FED48 
X-CRM114-Status: GOOD (  10.83  )
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

It seems like the whole sst26vf flash series share the exact same
properties, beside the final size due to a lower/higher number of blocks
in the final die. As the intermediate version fully supports SFDP
parsing, we assume the others as well.

Drop the redundant information and use the PARSE_SFDP flag instead.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sst.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 48970d2f78fa..467154176dd6 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -109,17 +109,17 @@ static const struct flash_info sst_nor_parts[] = {
 	{ "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32)
+	{ "sst26vf016b", INFO(0xbf2641, 0, 0, 0)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ)
+		PARSE_SFDP
 		.fixups = &sst26vf_nor_fixups },
 	{ "sst26vf032b", INFO(0xbf2642, 0, 0, 0)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		PARSE_SFDP
 		.fixups = &sst26vf_nor_fixups },
-	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
+	{ "sst26vf064b", INFO(0xbf2643, 0, 0, 0)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		PARSE_SFDP
 		.fixups = &sst26vf_nor_fixups },
 };
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
