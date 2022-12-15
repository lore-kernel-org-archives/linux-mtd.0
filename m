Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9128C4167B
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Dec 2022 08:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckxGxi63o9Lgg+q0eq7evEG38GUBvglTTNsErC8tnf4=; b=X5WlmLoS2tuewf
	i75V7V4o+DXmCDRx5uVDJJ+QmXEJ3eFNhPwoUBa77DFILweLMqo50IwiNJvlAQd4H1N6ZmGvps6Bx
	fcrw6XfJ5//Fp4NyL5n7CYIHv/mFFjKQv9Sxo7Y7M83xLw2iPdQQXcE86GKnv5ivQ8TtT1eKG8R3H
	mXBorq77XwB+pWX0ia6v3WYNQnBt+7aouGCclFh8NjxfAB9ABoaJ48NphxXe7j4TCAzhN7iuz2OuG
	l2WChyhJ4vUiO46W7+vdExyJpsst+D7HgirkvN6yBko+F9IvPxyN0xwJeOZwfsH853CEb5Aq26QqU
	IM74+6qVXy26OFkDrKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5jMs-007YXn-Md; Thu, 15 Dec 2022 08:13:26 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5jMO-007Y7W-46
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2022 08:12:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AFA2EE0002;
	Thu, 15 Dec 2022 08:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671091974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KpcnZIM/nvnkoOD5kEWESQw1w621rkkiGNkytdrjgTY=;
	b=fdtnilIzAeJljw9odILwipjvZnXxaltWG0pMc1TUVWmeEhGq2LX6Y5aukGlV/9KdESsLSB
	yXS2BADEoiXzCaSZxNHAaG/wkxF6lt496LNyjcZeOuX9naOstPDWNiDHXq2iXn4lGggU96
	Zlz4pFE+RznpEPZyV28sgYktUBPahKKI7egF6TMAnXgzVf+wugkmoXyzMHtja8klO6/60R
	w36rovAHHyhnq0fs+LjXS1VZTkWIVjKAPM7VGeCQUofx5menGlwoJrhTgEgFIoSTqFb4ll
	uX26BYb2GUo5bvaj+J3fqNL2De+84u6X9Pl2NSukl9jcPGff/6U2N5tg90xUNQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 9/9] mtd: spi-nor: macronix: Add support for mx25uw51245g with RWW
Date: Thu, 15 Dec 2022 09:12:41 +0100
Message-Id: <20221215081241.407098-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215081241.407098-1-miquel.raynal@bootlin.com>
References: <20221215081241.407098-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_001256_354733_93FE53D3 
X-CRM114-Status: UNSURE (   9.77  )
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

Describe this new part and provide the RWW flag for it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index d81a4cb2812b..e9b82afcd6c4 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -82,6 +82,9 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx25uw51245g", INFOB(0xc2813a, 0, 16 * 1024, 1024, 4)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_RWW)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
