Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91164C3DA49
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61HVw8/WObNErthyG1YJBzoGMCKpnoUeLRu1p706iKQ=; b=wKfZcfrLBZ1Kcj
	BCEDBShFppih1IyxC0LqKwb4vvGSqKo0VpgZC2Etnl5DyWBAM+FUi+SC60GvQEx2IvTT9e9/v48D1
	PewK6xebH9RICX17fRwHYROQKJjLOqbW2W3x125sds0cJG4qI5657npkBqErTqmfgy5KQene4FzBR
	29EO8L1bD4dAQK94VFEaG4GbQh4xNh0hF5ub43rBSDAGO4ep8I+dIrrZYy/eWZzLfvQxsDoHsrNpA
	nMtCmjWm3mV4fn0nDBE50yfW+pCnqJFkqyeVv9WtfRq8Os9lajHOdy08Dk8RUbbV0qPM41W5acfPR
	sxbK484SUYj/p2u49erQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtUL-0000000E4bk-2gTO;
	Thu, 11 Jul 2024 13:05:33 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtPe-0000000E1dr-3fUt;
	Thu, 11 Jul 2024 13:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/x3Xwhy/zD+b8/iFmghy0uZLwRTAG0iaB95lyFsIrSY=; b=0R5/4YvH1GzTT+eLqA1zYwGrfo
	DHt9Ex2kTaC1MkaMxG62DZghwUbzo3kanJQeIIxBrzxb2L5+dHn0jZJit/QJnWqAjHJ0kYF+5V3cE
	x2SumkbwFgM33pGdjIqHg7INNR206RI9h8tPryTgQUQWbMUiHtZrlIyAHf39asq2x/InRnBucqs57
	RlvZb5thdESwRGcEal4g5o3oHIHpdpO0doNPulnfdfd9dQ8HU3mRgeX5vj386JwFAWITYpKBCSlsh
	ZniLxpsvHXN8UgxBwSPbMEnx4ezxzw5goP6nGI5HrxLCR1y/5O2h8Yi0Vboj2v0dyOxn2Xri5IrNP
	4b345A3Q==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sRtPd-000BXZ-EN; Thu, 11 Jul 2024 15:00:41 +0200
Received: from [87.49.147.209] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sRtPY-0005XX-0j;
	Thu, 11 Jul 2024 15:00:35 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 11 Jul 2024 15:00:15 +0200
Subject: [PATCH v3 15/15] mtd: spi-nor: spansion: Drop redundant
 SPI_NOR_SKIP_SFDP flag
MIME-Version: 1.0
Message-Id: <20240711-macronix-mx25l3205d-fixups-v3-15-99353461dd2d@geanix.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720702815; l=2782;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=32WUeUrKPTK1On8oYr52pGY8kKKsIcbyD/ktcMgTl0I=;
 b=kv2cu/A4E4HA+a4EuZNTqqPIMM+PoYEAWa3H1GKwKtiJ/oVRh7A0CWiRoFQt8GBkr8psS8Pbl
 WfhMZzwLWsNAHxwdFNHKEg4bHEN1i00QOJnEkQduDBUG3+bN44oIiZC
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27333/Thu Jul 11 10:35:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_060042_950901_ADC7AB81 
X-CRM114-Status: GOOD (  15.23  )
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

With the implementation of SPI_NOR_TRY_SFDP flag, the removal of the
deprecated mechanism for trying SFDP parsing, and the alignment of
->default_init() hooks handling, the SPI_NOR_SKIP_SFDP flag has become a
no-op, so it can safely be removed.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/mtd/spi-nor/core.c     | 2 +-
 drivers/mtd/spi-nor/core.h     | 5 +----
 drivers/mtd/spi-nor/spansion.c | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d58f107f62ec..518b2707ce80 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3024,7 +3024,7 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	if (spi_nor_needs_sfdp(nor)) {
 		ret = spi_nor_parse_sfdp(nor);
 		if (ret) {
-			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP or SPI_NOR_TRY_SFDP when declaring the flash\n");
+			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_TRY_SFDP when declaring the flash\n");
 			return ret;
 		}
 	} else {
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index f4a76f42051a..ae10e12e9078 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -485,9 +485,7 @@ struct spi_nor_id {
  *
  * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
  *                  Used when SFDP tables are not defined in the flash. These
- *                  flags are used together with the SPI_NOR_SKIP_SFDP or
- *                  SPI_NOR_TRY_SFDP flag.
- *   SPI_NOR_SKIP_SFDP:       skip parsing of SFDP tables.
+ *                  flags are used together with the SPI_NOR_TRY_SFDP flag.
  *   SECT_4K:                 SPINOR_OP_BE_4K works uniformly.
  *   SPI_NOR_TRY_SFDP:        try parsing SFDP tables before using the
  *                            parameters specified in this struct.
@@ -536,7 +534,6 @@ struct flash_info {
 #define SPI_NOR_RWW			BIT(9)
 
 	u8 no_sfdp_flags;
-#define SPI_NOR_SKIP_SFDP		BIT(0)
 #define SECT_4K				BIT(1)
 #define SPI_NOR_TRY_SFDP		BIT(2)
 #define SPI_NOR_DUAL_READ		BIT(3)
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index a58c0229003d..afcb684ffe4d 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -793,7 +793,7 @@ static const struct flash_info spansion_nor_parts[] = {
 		.name = "s25fl256s0",
 		.size = SZ_32M,
 		.sector_size = SZ_256K,
-		.no_sfdp_flags = SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_CLSR,
 	}, {
 		.id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x00, 0x81),

-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
