Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78902C4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ah5eaE1jlQqkKAcVkWNBya4GYiz7ZSqxgm++uKjWOxw=; b=eNh1DxOBAFs6sG
	dcrCQ1h1jrE9BMzqX6tLmsM+tolY0HFviRV1juH5a/WUsJIS/902pcZizipAQ/JiNECKDOunv5jxs
	VFrz/08cufL3jZz2CY5yxdzLqkqi/t/IoFtOmqp81smaTQLVzhDRPika4+rTeXfG/KHaVa88SRBZD
	kGJOAANiWv2By/+AgK5JffuAtIVrawjHqnRsX6H71rhujiArqVt7nv5wCLId6Xij2dpyNZyZxNiiq
	UOuQi6EcXlN4zPj5AKZ3VM2/oTHTyjuoSsTZlCmo8lLMADelHyxAajpTqsNgtv3cTUphVdMXP6cGk
	X3OYWCoiTQJxJ0oaw3aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5VV-0000000GC3i-2Bwj;
	Wed, 17 Apr 2024 13:39:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5VS-0000000GC0z-08Qc
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 13:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 388E2CE1288;
	Wed, 17 Apr 2024 13:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCD6C072AA;
	Wed, 17 Apr 2024 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713361159;
	bh=kAGKWwtoNDjk7HSM51GJieuaIFloBqHwAmZZJVJk9bw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YnsCEG7Pfo0YoG0nzsYFviiIuEAIOA6YuthUd8BdGqZaHQ5vzeAVtzA2Hu/Xw/Oga
	 n9DDPkvWHHW+Q8Fg9bkShSNTVbp2PeyktQF56TnKndgwrGZ2Td0VDnIZt7DBSuLdBL
	 WFHGBuHHQHFqTDRMYXbQZByPD//YoFYpf9WDXquTLdThuIG18gRRgsGxQTrCmS+4dM
	 SmPE8RJTGx2ADtjnMXjR90DWymomhgJFQhWKqQ95mT8vZzopGBaeMpxuRy94i5KPA+
	 yeH4ganCTxvFMmi4CcYS/zaVc+mzh8noVc57Qmu00550MGb7ofBqrHR/YuxgRetpe5
	 /nWS8TnIFp7gw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 3/6] mtd: spi-nor: get rid of SPI_NOR_NO_FR
In-Reply-To: <20240412134405.381832-4-mwalle@kernel.org> (Michael Walle's
	message of "Fri, 12 Apr 2024 15:44:02 +0200")
References: <20240412134405.381832-1-mwalle@kernel.org>
	<20240412134405.381832-4-mwalle@kernel.org>
Date: Wed, 17 Apr 2024 15:39:16 +0200
Message-ID: <mafs0sezk6rcr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_063922_610776_F61A091B 
X-CRM114-Status: GOOD (  28.31  )
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

Hi Michael,

On Fri, Apr 12 2024, Michael Walle wrote:

> The evervision FRAM devices are the only user of the NO_FR flag. Drop
> the global flag and instead use a manufacturer fixup for the evervision
> flashes to drop the fast read support.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> Please note, that the fast read opcode will still be set in
> spi_nor_init_default_params(), but the selection of the read opcodes
> just depends on the mask.

Since that is the case now, might as well drop the

    if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)

in spi_nor_init_default_params().

>
> That is also something I want to fix soon: the opcodes can always
> be set and the drivers/SFDP will only set the mask. Opcodes then can be
> switched between 3b and 4b ones if necessary.
> ---
>  drivers/mtd/spi-nor/core.c     | 12 +++++-------
>  drivers/mtd/spi-nor/core.h     |  2 --
>  drivers/mtd/spi-nor/everspin.c | 19 +++++++++++++++----
>  3 files changed, 20 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index fb76e0522665..65e6531ada0a 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2952,14 +2952,12 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>  	params->page_size = info->page_size ?: SPI_NOR_DEFAULT_PAGE_SIZE;
>  	params->n_banks = info->n_banks ?: SPI_NOR_DEFAULT_N_BANKS;
>  
> -	if (!(info->flags & SPI_NOR_NO_FR)) {
> -		/* Default to Fast Read for DT and non-DT platform devices. */
> -		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
> +	/* Default to Fast Read for DT and non-DT platform devices. */
> +	params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
>  
> -		/* Mask out Fast Read if not requested at DT instantiation. */
> -		if (np && !of_property_read_bool(np, "m25p,fast-read"))
> -			params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
> -	}
> +	/* Mask out Fast Read if not requested at DT instantiation. */
> +	if (np && !of_property_read_bool(np, "m25p,fast-read"))
> +		params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;

Nit: move this above where SNOR_CMD_READ_FAST is set up.

Also, I think this is a bit clearer:

	/* Default to Fast Read for non-DT and enable it if requested by DT. */
	if (!np || of_property_read_bool(np, "m25p,fast-read"))
		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;

>  
>  	/* (Fast) Read settings. */
>  	params->hwcaps.mask |= SNOR_HWCAPS_READ;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 072c69b0d06c..9aa7d6399c8a 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -479,7 +479,6 @@ struct spi_nor_id {
>   *                            Usually these will power-up in a write-protected
>   *                            state.
>   *   SPI_NOR_NO_ERASE:        no erase command needed.
> - *   SPI_NOR_NO_FR:           can't do fastread.
>   *   SPI_NOR_QUAD_PP:         flash supports Quad Input Page Program.
>   *   SPI_NOR_RWW:             flash supports reads while write.
>   *
> @@ -528,7 +527,6 @@ struct flash_info {
>  #define SPI_NOR_BP3_SR_BIT6		BIT(4)
>  #define SPI_NOR_SWP_IS_VOLATILE		BIT(5)
>  #define SPI_NOR_NO_ERASE		BIT(6)
> -#define SPI_NOR_NO_FR			BIT(7)
>  #define SPI_NOR_QUAD_PP			BIT(8)
>  #define SPI_NOR_RWW			BIT(9)

Move the other bits up since the slot is now free.

>  
> diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspin.c
> index 5f321e24ae7d..0720a61947e7 100644
> --- a/drivers/mtd/spi-nor/everspin.c
> +++ b/drivers/mtd/spi-nor/everspin.c
> @@ -14,28 +14,39 @@ static const struct flash_info everspin_nor_parts[] = {
>  		.size = SZ_16K,
>  		.sector_size = SZ_16K,
>  		.addr_nbytes = 2,
> -		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> +		.flags = SPI_NOR_NO_ERASE,
>  	}, {
>  		.name = "mr25h256",
>  		.size = SZ_32K,
>  		.sector_size = SZ_32K,
>  		.addr_nbytes = 2,
> -		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> +		.flags = SPI_NOR_NO_ERASE,
>  	}, {
>  		.name = "mr25h10",
>  		.size = SZ_128K,
>  		.sector_size = SZ_128K,
> -		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> +		.flags = SPI_NOR_NO_ERASE,
>  	}, {
>  		.name = "mr25h40",
>  		.size = SZ_512K,
>  		.sector_size = SZ_512K,
> -		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> +		.flags = SPI_NOR_NO_ERASE,
>  	}
>  };
>  
> +static void evervision_nor_default_init(struct spi_nor *nor)
> +{
> +	/* Everspin FRAMs don't support the fast read opcode. */
> +	nor->params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
> +}
> +
> +static const struct spi_nor_fixups evervision_nor_fixups = {
> +	.default_init = evervision_nor_default_init,
> +};
> +
>  const struct spi_nor_manufacturer spi_nor_everspin = {
>  	.name = "everspin",
>  	.parts = everspin_nor_parts,
>  	.nparts = ARRAY_SIZE(everspin_nor_parts),
> +	.fixups = &evervision_nor_fixups,
>  };

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
