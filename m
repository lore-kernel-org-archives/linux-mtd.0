Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E944C55ABF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 14:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qlTsEoK9rvr2JAej5C5iabXz68VlQQ6skCecUrx19k=; b=JQDyN+O1DufKTh
	ic3m7xy27XJBXpGxCTVpiIk7mQh0KLgMWg82DaZYdiKdNCPJnpmdN31g7Mpa3xozgdDhAlIYj68L+
	dzlUMvrjsEmpiMNwIUIv8d4tvKp+CtPg70fHXIx50/vy1rVYy6ww8A3u1D5j3uyiQLqscC1ReLYXR
	+DjXwADLb3+Z7Ws6/xk9kE4o202Aa5oQ8PZACRyoD3G1fAKKZFUWbMl88iT30/Ni+ODz5pqB283Uf
	Mz/TwpJgo/rpvHmj3kZv4oaIrTlxUH4zSGD6kztIqDZV7hhplxlt0YBVCRFSFas1c5Qx/dM/FBuZM
	2jjK4mNufAWfeZ39v37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFl4-00000001zt5-3FDa;
	Tue, 04 Aug 2026 14:04:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFl3-00000001zrL-2Pcq
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 14:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EU9odphLDJ7Sp0A8jGyVHZpCPe8+Os6UWy7g5Vv1TYw=; b=czSanP1gkJz6b8tIjTuu1KVDhD
	P0mNT0O32CKP4RCVj+dFVeOtiuNc7TXNft7dxHY4jpF8zTDwnkQc9lOdsClYvLUwLJhrklZDv3SKM
	lm0lAv1MAr0RYZDB2rFRKCavCF2MqdMdXTL5oOcaH5J5fvilJTJ79y+7INiYRjM0h6xpB9H+BsLRk
	guknwE/91V4+/o6OhOvQkF4P8KqBE975dBBBWSGL3Kh6qLqJxNTIEcVLKSsViPWM9zCvWVE+xMLKk
	OTstHqA5Sf2I/A9UxxFmunPh0IST4VgyxVO4Tq4XPYvIUygRfXFGq4xuQOLIJwszb7KSrHUBwVC0l
	DODv9HGQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrFl0-00000009yHP-2sSy
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 14:04:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1AB5D1A13FA;
	Tue,  4 Aug 2026 14:04:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0DF36029E;
	Tue,  4 Aug 2026 14:04:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4750811C32D2A;
	Tue,  4 Aug 2026 16:04:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852277; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EU9odphLDJ7Sp0A8jGyVHZpCPe8+Os6UWy7g5Vv1TYw=;
	b=CgsmI73ApkzSUNBXqQ9kwy4hto0SZJ3r/HOcXlcBijmeZ+WKqIT2nSS4hGCwsDbJIm2dgL
	cc8HuAvrbfSGSZe5AHtQdROBwuVo4xCLD2bSXTfN7p3/1DTnmnSaC+D0RuahAfqioCnROT
	8VRUc1ktJZX1ObBL+RCoqLH10gmWUm/jeOnwsQzSnewDGvEvkYs1NnzVvda9dvIU+nLbgY
	g89fDRa5JPqwRw9visUmDhxVtogdPpad7PwFhykyZFuC4OzI4r8xnLhlpCqguN0POK6Pv5
	6nXJtI27YRuQpoM94P2ig6AnSt9CMiIecKsLc7XbMRAfymaPJpHZK+/cXE+1EQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 16:04:28 +0200
Subject: [PATCH v4 06/28] mtd: spi-nor: winbond: Move W25Q01NW to its right
 place
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-6-ee3445066e4e@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_150438_855960_F6E8054F 
X-CRM114-Status: GOOD (  10.34  )
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

Chips are sorted by families, and inside the families, by density. The
second ID byte indicates the family, the third indicates the
density. Move W25Q01NW to the right place.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/winbond.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 8ebdbcec0b3f..662a022d36e7 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -300,6 +300,12 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x20),
 		.name = "w25q512nwq",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
+	}, {
+		/* W25Q01NWxxIQ */
+		.id = SNOR_ID(0xef, 0x60, 0x21),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+		.fixups = &winbond_rdcr_fixup,
 	}, {
 		.id = SNOR_ID(0xef, 0x70, 0x15),
 		.name = "w25q16jv-im/jm",
@@ -365,12 +371,6 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x20),
 		.name = "w25q512nwm",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
-	}, {
-		/* W25Q01NWxxIQ */
-		.id = SNOR_ID(0xef, 0x60, 0x21),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
-			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_rdcr_fixup,
 	}, {
 		/* W25Q01NWxxIM */
 		.id = SNOR_ID(0xef, 0x80, 0x21),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
