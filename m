Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD527C433FE
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Nov 2022 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ks9he4L1Np29XHL6Ur0Vbe6iLs2IHgEf/jVt3NFagaI=; b=pMZy7VZe20wtxH
	f5E3Fyqw6v0kBHXJKP+Z6juNdfgnR6TSEYyVypvpL+1pYyZ89BmXLcDZYKd6lbyrzrlQLawe5OU8u
	Y5TwcemDU2P47VXtrElXg8/Mom3jmd94AGCSokShu5p86SfsLDzkGyZ4Sk/SnGSvyysJoyD40e2Ms
	La7rLTliILzFHxazfnWBVE6KZNE3HVlUXyUdlamODcs1CtfssPzRtKawxruHcmquyE65osDHQwj9K
	rtDHauWR+IYbDXHPB+Kay9mGh5syE0QfzAv5H6UAkRRSt/fzek0HGjvP4i1RQThk1mI/0gdnfJ9Uz
	6LybqdxHYbHVoZI+TWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owmvA-005XSr-Sl; Sun, 20 Nov 2022 16:11:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owmv7-005XRz-VS
	for linux-mtd@lists.infradead.org; Sun, 20 Nov 2022 16:11:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6159AB8094D;
	Sun, 20 Nov 2022 16:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA14AC433D6;
	Sun, 20 Nov 2022 16:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668960707;
	bh=CjIEAeeXZeAr8Q20wk3Izj5rNT8IRYFwXV3s9MECt5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kiqhyvPHdcBlZQ2gNKK43wmmLM9tIVmf68AgkJKZN0h6Kj30oegQib0ck411a3YjC
	 WRhmBqZ79DE2Y2xuRRBmKTn0rDdcFa/v/6e4V1so2ZKcSsO1s9utBYZ3U/6BPT+Sl0
	 w4Z1YqfLIWHgzCMV/j36gS0dq+3itUp1XenjgfyUk1TG23iUQ2YrlHEBp9cvcghy3p
	 ViGZxFC0wsV30zFMveSF6vAXVTh9ogyhRCt0MiwfrnOjYmjBtmIQdta2WbyU7LEUYj
	 7Y3YP/dttLEZhz+rEeQD5CyLk5iISWV0ZEcOxQu3j1wB9wQK1kP1QpwL4EyLryhiSz
	 nAZWzLymK5FCQ==
Date: Sun, 20 Nov 2022 17:11:35 +0100
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 2/9] mtd: spi-nor: Introduce the concept of bank
Message-ID: <20221120161135.e33livsa5rdolmx2@yadavpratyush.com>
References: <20221110155513.819798-1-miquel.raynal@bootlin.com>
 <20221110155513.819798-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221110155513.819798-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_081150_329576_A5D0AF3C 
X-CRM114-Status: GOOD (  24.58  )
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

On 10/11/22 04:55PM, Miquel Raynal wrote:
> SPI-NOR chips are made of pages, which gathered in small groups make
> (erase) sectors. Sectors, gathered together, make banks inside the
> chip. So far there was only one bank per device supported, but we are
> about to introduce support for new chips featuring several banks (up to
> 4 so far) where different operations may happen in parallel.
> 
> Let's allow describing these additional bank parameters.

Just to be sure, are the multiple banks still used via a single Chip 
Select, or do we need multi-CS support for this as well? I do remember 
seeing an RFC about multi-CS support from you some time back and I am 
not sure if that is related.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/core.c |  3 ++-
>  drivers/mtd/spi-nor/core.h | 16 +++++++++++-----
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f2c64006f8d7..38a57aac6754 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2539,7 +2539,8 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>  
>  	/* Set SPI NOR sizes. */
>  	params->writesize = 1;
> -	params->size = (u64)info->sector_size * info->n_sectors;
> +	params->bank_size = (u64)info->sector_size * info->n_sectors;
> +	params->size = params->bank_size * info->n_banks;
>  	params->page_size = info->page_size;
>  
>  	if (!(info->flags & SPI_NOR_NO_FR)) {
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index dc74c7be3e28..8a067d56c995 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -336,7 +336,8 @@ struct spi_nor_otp {
>   * by the spi_nor_fixups hooks, or dynamically when parsing the JESD216
>   * Serial Flash Discoverable Parameters (SFDP) tables.
>   *
> - * @size:		the flash memory density in bytes.
> + * @bank_size:		the flash memory bank density in bytes.
> + * @size:		the total flash memory density in bytes.
>   * @writesize		Minimal writable flash unit size. Defaults to 1. Set to
>   *			ECC unit size for ECC-ed flashes.
>   * @page_size:		the page size of the SPI NOR flash memory.
> @@ -374,6 +375,7 @@ struct spi_nor_otp {
>   * @locking_ops:	SPI NOR locking methods.
>   */
>  struct spi_nor_flash_parameter {
> +	u64				bank_size;
>  	u64				size;
>  	u32				writesize;
>  	u32				page_size;
> @@ -434,7 +436,8 @@ struct spi_nor_fixups {
>   * @id_len:         the number of bytes of ID.
>   * @sector_size:    the size listed here is what works with SPINOR_OP_SE, which
>   *                  isn't necessarily called a "sector" by the vendor.
> - * @n_sectors:      the number of sectors.
> + * @n_sectors:      the number of sectors per bank.
> + * @n_banks:        the number of banks.
>   * @page_size:      the flash's page size.
>   * @addr_nbytes:    number of address bytes to send.
>   *
> @@ -493,6 +496,7 @@ struct flash_info {
>  	u8 id_len;
>  	unsigned sector_size;
>  	u16 n_sectors;
> +	u16 n_banks;
>  	u16 page_size;
>  	u8 addr_nbytes;
>  
> @@ -538,23 +542,25 @@ struct flash_info {
>  	.id = { SPI_NOR_ID_3ITEMS(_jedec_id), SPI_NOR_ID_3ITEMS(_ext_id) }, \
>  	.id_len = 6
>  
> -#define SPI_NOR_GEOMETRY(_sector_size, _n_sectors)			\
> +#define SPI_NOR_GEOMETRY(_sector_size, _n_sectors, _n_banks)		\
>  	.sector_size = (_sector_size),					\
>  	.n_sectors = (_n_sectors),					\
> +	.n_banks = (_n_banks),						\
>  	.page_size = 256
>  
>  /* Used when the "_ext_id" is two bytes at most */
>  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
>  	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
> -	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors)),
> +	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
>  
>  #define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
>  	SPI_NOR_ID6((_jedec_id), (_ext_id)),				\
> -	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors)),
> +	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
>  
>  #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_nbytes)	\
>  		.sector_size = (_sector_size),				\
>  		.n_sectors = (_n_sectors),				\
> +		.n_banks = 1,						\
>  		.page_size = (_page_size),				\
>  		.addr_nbytes = (_addr_nbytes),				\
>  		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,		\

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
