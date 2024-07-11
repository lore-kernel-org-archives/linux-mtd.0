Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6F1C3DA49
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 13:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ddaxw5lAGN2VDuDQ2H2byAe+wFxI/LPAxOyGlGe9I2A=; b=fOA2kainRJAnsj
	5jbLipehACcEiImwebBTSeMeS1ysx+XUkWAlJUUAzveCOhH5K5JL37AxyhDWbsPjiO3P6qzdwQJH3
	Ae4btp6+gYbbYYcLI6hBc/uOy+4kSolpRizd7KLk5md38YPRxzW0PnsgVvAx7fsyT/vlfu8SaG6Ih
	kuviD0A/z+Vgv+eyNq4SOJe7tnx32wFlK6clGtUyGxzpCWt6PmgaNrFt4nRnRbcZGaUFJIxbGiiqt
	TEGV3OmWc1w926MDvSXmX64f/6uvkS/AdWhT7CYiR69ycnkdB3F8D94RerTgM07by/A8JLBNPBKD6
	S/V0h7jo7sWPae4xWUDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtU2-0000000E4Qx-2mln;
	Thu, 11 Jul 2024 13:05:14 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtPZ-0000000E1aj-0mNM;
	Thu, 11 Jul 2024 13:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7xyZ8HHn0IZWh6egUhr+Bg7rKb1uk2wj2zFy5v+GCaQ=; b=aCUl1B0v47gN1/uvq5rteboPaf
	apgKX4cWeUJ1cYM32MyHLdlDJESJUuiLLgMW4S1RyGVoSDXgk4wZft8hih4YdXBh3BOsLzDh4eIuh
	f2K2mVj1rLvmlZMhgo+RGeU9qpIvexglBb8udkC4tbdWbUWnM9rXMfTrcAMTXyTsp6sWSJ0CmKKSf
	3ZSPh2ll6k3Jn6C0fJOxtsAsLTKWcoJxtMyEOhR43GLLA7n1srtlYjwYOauHX2i0dgybu9gptBMiQ
	4xLdfBq5M+CBTc+C+orAi5NifFulIJ1qcqctB+5lp67LgmWUnHlU4smsdxG0J2QQPhs5ziEzKakGy
	s2RjH2bA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sRtPX-000BXO-QP; Thu, 11 Jul 2024 15:00:35 +0200
Received: from [87.49.147.209] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sRtPX-0005Sd-21;
	Thu, 11 Jul 2024 15:00:35 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 11 Jul 2024 15:00:14 +0200
Subject: [PATCH v3 14/15] mtd: spi-nor: Drop deprecated mechanism for
 optional SFDP parsing
MIME-Version: 1.0
Message-Id: <20240711-macronix-mx25l3205d-fixups-v3-14-99353461dd2d@geanix.com>
References: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
In-Reply-To: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720702815; l=1575;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=lx0qh4MEN+MdnHMi3c/iFde5nWg07mHVMzlT3b+knLE=;
 b=a22i1tAFizJHUc1rtMZlDS3qeje8OHPMmoxGx1U79ayOl1Y1paFDvuxTl14XxgibUqAhjI2GE
 3QVO/Fqm3/vDgMHVi2ms0gY4AJahWN7z2IuAAJ364aL4LqcjxyC/tvc
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27333/Thu Jul 11 10:35:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_060037_252678_F388806A 
X-CRM114-Status: GOOD (  11.01  )
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

With all drivers converted to the new SPI_NOR_TRY_SFDP flag, we can remove
the old deprecated mechanism for triggering optional SFDP parsing.

New flashes must use SPI_NOR_TRY_SFDP to get this behavior. Hopefully, all
new drivers will be fore pure SFDP flashes, so no or at least very few new
users of this flag is expected.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/mtd/spi-nor/core.h | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index dfc81716e068..f4a76f42051a 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -719,24 +719,7 @@ static inline bool spi_nor_needs_sfdp(const struct spi_nor *nor)
  */
 static inline bool spi_nor_try_sfdp(const struct spi_nor *nor)
 {
-	if (nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP)
-		return false;
-	if (nor->info->no_sfdp_flags & SPI_NOR_TRY_SFDP)
-		return true;
-
-	/* Deprecated/legacy way for triggering optional SFDP parsing.
-	 * If one of the no_sfdp_flags indicating dual, quad or octal read is
-	 * set, SFDP parsing will be tried.
-	 * When all drivers have been converted to set SPI_NOR_TRY_SFDP where
-	 * needed, this deprecated mechanism can be removed.
-	 */
-	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
-					SPI_NOR_QUAD_READ |
-					SPI_NOR_OCTAL_READ |
-					SPI_NOR_OCTAL_DTR_READ))
-		return true;
-
-	return false;
+	return (nor->info->no_sfdp_flags & SPI_NOR_TRY_SFDP)
 }
 
 #ifdef CONFIG_DEBUG_FS

-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
