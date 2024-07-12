Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A09C2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQ1tQWi8aTPuICD9b96nUtYxjEsalIlDX2ezxQinyBM=; b=phE8NywDRIJcN8
	3a1VHLeTSwkcpyPIUSv/igt1uNinaEOhZlqVTYxZXsSXLdlarNvbYZPgEWiHaFhaein8Sd0EuvjJ3
	Mi1e/PwF2fPGXGZn8CC0WJ+IW8DsnTfmbQEjiMzZQP8StVOzprbspNaPEH08juHXXfvFbiT1wx6Rn
	rtX0hGWyqjTPU6AqzBkFSOHzJqV4omI6DkT5FwkeDhbajVykz1VFeFZzaEqKO9WI84dU3ZfgKmS6b
	fybqoktzzwbArfLmO6/2G6QGphXhqkHOJeioe6uvKnmzFgu8enm+IZax6lwUghd2A9T1QAO5bWUFw
	zXCNqH3P4YGKSScEH6Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCbg-0000000H7PR-3X9v;
	Fri, 12 Jul 2024 09:30:24 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCXy-0000000H5mJ-0XU8;
	Fri, 12 Jul 2024 09:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Mr/oLSebsAjrIhR//GSxa555Ns9T6USHYiGG2DRTKnM=; b=x458Hlnls9sQkvci39L51g2Oej
	21LoK3PM7sE9QmB2meixSowq0mOeFojd4kxI/Ea+DdLWktGZW5LClgC/L+OLPkHISp56Kf0pPIPv/
	YltrOgtC1nyTYPiZ1JWBD/BxoHBVECAKqY4RG6g03Hi5/JU0nHO6w0YNvIUa5dhIRNf3ypq5hSiOy
	8cEQs3ZYms+XzQTi9RJp1JlXJFSTxcIuUGkjlaI56cnpl3x0qGadsPQHiV46K+xcKb/C33whJ1Mfj
	xsTvhkcOnkf465yS8dR6TXdqKuhYkOTOsvIeUX4KFgopTjt41W6oTd0Y4vBzKl/l/oiDCctJUZ5N/
	uArKweyw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sSCXv-000CeK-MD; Fri, 12 Jul 2024 11:26:31 +0200
Received: from [87.49.147.209] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sSCXv-000I8s-00;
	Fri, 12 Jul 2024 11:26:31 +0200
From: Esben Haabendal <esben@geanix.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Rasmus Villemoes
 <rasmus.villemoes@prevas.dk>,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 15/15] mtd: spi-nor: spansion: Drop redundant
 SPI_NOR_SKIP_SFDP flag
In-Reply-To: <20240711-macronix-mx25l3205d-fixups-v3-15-99353461dd2d@geanix.com>
	(Esben Haabendal's message of "Thu, 11 Jul 2024 15:00:15 +0200")
References: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
	<20240711-macronix-mx25l3205d-fixups-v3-15-99353461dd2d@geanix.com>
Date: Fri, 12 Jul 2024 11:26:30 +0200
Message-ID: <87zfqnufjt.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27333/Thu Jul 11 10:35:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_022634_257941_F8AD3AC5 
X-CRM114-Status: GOOD (  22.11  )
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

Esben Haabendal <esben@geanix.com> writes:

> With the implementation of SPI_NOR_TRY_SFDP flag, the removal of the
> deprecated mechanism for trying SFDP parsing, and the alignment of
> ->default_init() hooks handling, the SPI_NOR_SKIP_SFDP flag has become a
> no-op, so it can safely be removed.
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>

Should I split this into a commit for the spansion change, and one for
the core change?

/Esben

> ---
>  drivers/mtd/spi-nor/core.c     | 2 +-
>  drivers/mtd/spi-nor/core.h     | 5 +----
>  drivers/mtd/spi-nor/spansion.c | 2 +-
>  3 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index d58f107f62ec..518b2707ce80 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3024,7 +3024,7 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  	if (spi_nor_needs_sfdp(nor)) {
>  		ret = spi_nor_parse_sfdp(nor);
>  		if (ret) {
> -			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP or SPI_NOR_TRY_SFDP when declaring the flash\n");
> +			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_TRY_SFDP when declaring the flash\n");
>  			return ret;
>  		}
>  	} else {
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index f4a76f42051a..ae10e12e9078 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -485,9 +485,7 @@ struct spi_nor_id {
>   *
>   * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
>   *                  Used when SFDP tables are not defined in the flash. These
> - *                  flags are used together with the SPI_NOR_SKIP_SFDP or
> - *                  SPI_NOR_TRY_SFDP flag.
> - *   SPI_NOR_SKIP_SFDP:       skip parsing of SFDP tables.
> + *                  flags are used together with the SPI_NOR_TRY_SFDP flag.
>   *   SECT_4K:                 SPINOR_OP_BE_4K works uniformly.
>   *   SPI_NOR_TRY_SFDP:        try parsing SFDP tables before using the
>   *                            parameters specified in this struct.
> @@ -536,7 +534,6 @@ struct flash_info {
>  #define SPI_NOR_RWW			BIT(9)
>  
>  	u8 no_sfdp_flags;
> -#define SPI_NOR_SKIP_SFDP		BIT(0)
>  #define SECT_4K				BIT(1)
>  #define SPI_NOR_TRY_SFDP		BIT(2)
>  #define SPI_NOR_DUAL_READ		BIT(3)
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index a58c0229003d..afcb684ffe4d 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -793,7 +793,7 @@ static const struct flash_info spansion_nor_parts[] = {
>  		.name = "s25fl256s0",
>  		.size = SZ_32M,
>  		.sector_size = SZ_256K,
> -		.no_sfdp_flags = SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.mfr_flags = USE_CLSR,
>  	}, {
>  		.id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x00, 0x81),

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
