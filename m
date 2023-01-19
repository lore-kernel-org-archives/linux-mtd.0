Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A12DC004D4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jan 2023 16:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8UfNhcfukojAmckV4+BtauRYbVcnLTYskGLc+QWvqZI=; b=AesAjQQywXm9+l
	8YFLlKe9ObK9+UW/iPLwBPBhOJ9ufc8x7qHSoTehcoNcqOM0hxgAoKNYSPixTkxbzkMtkrDhGNJfg
	btW1iyfRKjq13ECAlgg1A1rT2SU9fWk3yYOp/4P1vuaNftenzv3uEkQTiSOi3QV4pdeGzyM0iC/fI
	ReIs7dUxTQbxDor4XdvfO9YO/+osijUdwgHWSdLhfi3XAZHj6aEstSgOoUE8etyUrtw/REZKx0qso
	xDyMFmyHUBbTTv8et10lbk1XAApai0B5D8yUXcN/buhRo1njny1QGDlmRES3275bGvK6ag6MNVi4g
	j6w2yIyzMnQ83idYo+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXsA-0061NN-JK; Thu, 19 Jan 2023 16:34:42 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXs7-0061Le-6B
	for linux-mtd@lists.infradead.org; Thu, 19 Jan 2023 16:34:40 +0000
Received: by mail-wr1-x42a.google.com with SMTP id r9so2422632wrw.4
        for <linux-mtd@lists.infradead.org>; Thu, 19 Jan 2023 08:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=saiJFucjMaTIrBkzeX1YppKPNkk+ZKR77zP7pfNt27o=;
        b=tkARWA6PBP14RKYpND71O/D+WLwk/FtiPT+0GLd70v2BtWkcLAhbdRkGhtVdJWTgDT
         A8okOFwxAjHWz0cA6WiztRasqvBQMKrOADVJVUTtxff4G3PoWCN0JJURLSCFEbbW0Ktq
         gmjc1ntLOxERc/d4utM4FgpxzJNoRH5QNRG76i+r8FavAAyePKrhdiKu/6n7/NxLi0ES
         /sYxoJotWUarj73LyQLwh02aeJIzLwf07uprrokKJvArNqOHWdolMJcITr/UqRlOvpIx
         JKsZOyj/pAdvqqfMfHZy/J0TDQafWJmjRS51V0AWfskjKZDTOEyrINNn8Fplrp8pqIVS
         8hLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=saiJFucjMaTIrBkzeX1YppKPNkk+ZKR77zP7pfNt27o=;
        b=2ujFUmegUsDxO6SNnqjohzi2h9avk9PsfTrD7hCBsCjnTrwwwQLYSjWWrZH8CEQsq5
         TYG4VSaGqEbL7yThVQdEegThH0ztAXT9PdtVmIeBrWJ/M4RuC45yD+PLt9D3Wf5Z+4Ld
         pdcFVuzfiggz9cG2ejhzE6BGaeZop0xghtiAsgKxjelJraoQI91dhsvZt/CEprR2/8BW
         8cNBAgp8Z0NhuH75r5S6eWaslMBAPGbdNyb0oSyGQzFmVhAyoS0PkF8HiPBDByYgRhs8
         m6ZAxqhd/k/TQKtYJa9vqYppCvGSmLIENITyUBX0jbjFbjmWnyuCRqfHbwfywbxsaM9V
         efxA==
X-Gm-Message-State: AFqh2ko6ytUKu/s1t3JZD05MMfNWw9/C1w1KhLAeieRYbJ2wANsO7By7
	cLFYkNJkiH47oGhetN053XN34g==
X-Google-Smtp-Source: AMrXdXuhU4FaPpehS48d6Wjya8FWRyOs5zxp0LUzChTTZ3uMACKz8SxPytJ49wsqhGoj3AbtXddZsA==
X-Received: by 2002:adf:cd86:0:b0:2be:34fb:37ea with SMTP id q6-20020adfcd86000000b002be34fb37eamr6025648wrj.32.1674146077036;
        Thu, 19 Jan 2023 08:34:37 -0800 (PST)
Received: from [192.168.2.104] ([79.115.63.215])
        by smtp.gmail.com with ESMTPSA id i2-20020adfdec2000000b002b9b9445149sm40962203wrn.54.2023.01.19.08.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 08:34:36 -0800 (PST)
Message-ID: <9e5f4a2b-b232-880f-e1dd-37e23e4a98b6@linaro.org>
Date: Thu, 19 Jan 2023 16:34:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/9] mtd: spi-nor: Introduce the concept of bank
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221215081241.407098-1-miquel.raynal@bootlin.com>
 <20221215081241.407098-3-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20221215081241.407098-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_083439_374634_1903467E 
X-CRM114-Status: GOOD (  23.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Miquel,

On 12/15/22 08:12, Miquel Raynal wrote:
> SPI-NOR chips are made of pages, which gathered in small groups make

nit: s/SPI-NOR/ SPI NOR

> (erase) sectors. Sectors, gathered together, make banks inside the
> chip. So far there was only one bank per device supported, but we are
> about to introduce support for new chips featuring several banks (up to
> 4 so far) where different operations may happen in parallel.
> 
> Let's allow describing these additional bank parameters.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> ---
>   drivers/mtd/spi-nor/core.c |  3 ++-
>   drivers/mtd/spi-nor/core.h | 16 +++++++++++-----
>   2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f2c64006f8d7..38a57aac6754 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2539,7 +2539,8 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>   
>   	/* Set SPI NOR sizes. */
>   	params->writesize = 1;
> -	params->size = (u64)info->sector_size * info->n_sectors;
> +	params->bank_size = (u64)info->sector_size * info->n_sectors;
> +	params->size = params->bank_size * info->n_banks;

Is the datasheet for these chips public? I see JESD216 says nothing
about flash banks.

I'm wondering whether we should keep the n_sectors as the total number 
of sectors per flash or not. Does this flash type support Software Block
Protection? How do they count the sectors on Block Protection, per flash
or per bank?

>   	params->page_size = info->page_size;
>   
>   	if (!(info->flags & SPI_NOR_NO_FR)) {
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index dc74c7be3e28..8a067d56c995 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -336,7 +336,8 @@ struct spi_nor_otp {
>    * by the spi_nor_fixups hooks, or dynamically when parsing the JESD216
>    * Serial Flash Discoverable Parameters (SFDP) tables.
>    *
> - * @size:		the flash memory density in bytes.
> + * @bank_size:		the flash memory bank density in bytes.
> + * @size:		the total flash memory density in bytes.
>    * @writesize		Minimal writable flash unit size. Defaults to 1. Set to
>    *			ECC unit size for ECC-ed flashes.
>    * @page_size:		the page size of the SPI NOR flash memory.
> @@ -374,6 +375,7 @@ struct spi_nor_otp {
>    * @locking_ops:	SPI NOR locking methods.
>    */
>   struct spi_nor_flash_parameter {
> +	u64				bank_size;
>   	u64				size;
>   	u32				writesize;
>   	u32				page_size;
> @@ -434,7 +436,8 @@ struct spi_nor_fixups {
>    * @id_len:         the number of bytes of ID.
>    * @sector_size:    the size listed here is what works with SPINOR_OP_SE, which
>    *                  isn't necessarily called a "sector" by the vendor.
> - * @n_sectors:      the number of sectors.
> + * @n_sectors:      the number of sectors per bank.
> + * @n_banks:        the number of banks.
>    * @page_size:      the flash's page size.
>    * @addr_nbytes:    number of address bytes to send.
>    *
> @@ -493,6 +496,7 @@ struct flash_info {
>   	u8 id_len;
>   	unsigned sector_size;
>   	u16 n_sectors;
> +	u16 n_banks;
>   	u16 page_size;

We can try u8 nbanks for now. And we would define it here, to avoid
struct padding.
>   	u8 addr_nbytes;
>   
> @@ -538,23 +542,25 @@ struct flash_info {
>   	.id = { SPI_NOR_ID_3ITEMS(_jedec_id), SPI_NOR_ID_3ITEMS(_ext_id) }, \
>   	.id_len = 6
>   
> -#define SPI_NOR_GEOMETRY(_sector_size, _n_sectors)			\
> +#define SPI_NOR_GEOMETRY(_sector_size, _n_sectors, _n_banks)		\
>   	.sector_size = (_sector_size),					\
>   	.n_sectors = (_n_sectors),					\
> +	.n_banks = (_n_banks),						\
>   	.page_size = 256
>   
>   /* Used when the "_ext_id" is two bytes at most */
>   #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
>   	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
> -	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors)),
> +	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
>   
>   #define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
>   	SPI_NOR_ID6((_jedec_id), (_ext_id)),				\
> -	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors)),
> +	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
>   
>   #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_nbytes)	\
>   		.sector_size = (_sector_size),				\
>   		.n_sectors = (_n_sectors),				\
> +		.n_banks = 1,						\
>   		.page_size = (_page_size),				\
>   		.addr_nbytes = (_addr_nbytes),				\
>   		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,		\

you need to update S3AN_INFO as well.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
