Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1068FF60D5
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2026 07:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXgxuIYjLIonNDRgVNpzIOWLFwsy0WJHfRU5XtLZ6CY=; b=GMpklwXGLHodPx
	SfPk8Q+28uLWyU/+XI83XT6kMliG4yBJgDDtRggHKK+X+vwhdCtwIVBztr47O++NY33ORJeFp41wt
	i1OlOvGsGEorpTCRQd4Tok9geHOwc2nWd45rQBue/rRooeoLlHy6rcFEpSkFqRD3bs1ay8Wn5IBR3
	7pKYW/NTW28mu3OYfsDxlPEj5tTPwRgRlqIfUYM+UUxRuCg9e9AxJkoYNh0CMT9WnZzjfVVJzuhkK
	hqsCvBZDVLuqgEU0pi2+esbjy2tHATsFqMx3FCFxsFW4u4n72Ng4Bkg5JgqE2rG3qjZbhHKEaannB
	iYgjQ3wcSXN4k0qtuF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TEx-0000000CR5s-0jfF;
	Tue, 31 Mar 2026 07:10:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TEw-0000000CR5P-0Kk8
	for linux-mtd@lists.infradead.org;
	Tue, 31 Mar 2026 07:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D5DC60127;
	Tue, 31 Mar 2026 07:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDDFC2BCB0;
	Tue, 31 Mar 2026 07:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774941016;
	bh=RR3CtjKWfDUOb/LevbVt+Lxojt6uAl8U9oM3JXrFdIU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y86lVtye1rdWVPwrVEvRH8o1K37HvVjyQirZihw4E0p8DbPAKTKqKZi+G/SSt0AGX
	 nIoKLg1LKnV2HOamHlHXe/xda7hwuWtm9HZDVWKYc6C8AgctlLRx6abA+zXoGDUJDZ
	 VPbzrWNNZzOcLz1dtwBhy1HMMqtA0Fs1C03eFyxlI4hYsQzzRrf0lUJ/jrPdAiwP5i
	 S3aoI4mX3cAh1W0nJOQ7N+ajaVxC+2hiuOH+A60h/scnQiQCU/RB40pGp7z06l6S9v
	 qrWDHjTkqc1EX2teqJgT9CkVw8k5imHZ+LZclfWoGbJUVth1qqGFU5xI/5TuhHuKsb
	 +B5PUlbHHrw5A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haoyu Lu <hechushiguitu666@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: micron-st: Enable die erase support
 for MT35XU02GCBA
In-Reply-To: <20260331030644.1120-1-hechushiguitu666@gmail.com> (Haoyu Lu's
	message of "Tue, 31 Mar 2026 11:06:42 +0800")
References: <20260331030644.1120-1-hechushiguitu666@gmail.com>
Date: Tue, 31 Mar 2026 07:10:13 +0000
Message-ID: <2vxzv7eciiei.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Tue, Mar 31 2026, Haoyu Lu wrote:

> The MT35XU02GCBA flash device does not support chip erase according
> to its datasheet, but supports die erase. The existing code had a TODO
> comment noting that the SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs
> to be enabled and the driver implementation needs to be converted to
> use die erase.
>
> This patch enables the SPI_NOR_IO_MODE_EN_VOLATILE flag and adds the
> mt35_two_die_fixups to the MT35XU02GCBA entry, which includes the
> micron_st_nor_two_die_late_init() function that sets up die erase
> support.
>
> With these changes, the flash device can properly use die erase
> operations instead of chip erase.
>
> Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
> ---
> v2: Remove TODO comment and rename mt35xu01gbba_fixups to mt35_two_die_fixups per review.
>
>  drivers/mtd/spi-nor/micron-st.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 4e8c6ef14697..c22d62545391 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -185,7 +185,7 @@ static const struct spi_nor_fixups mt35xu512aba_fixups = {
>  	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
>  };
>  
> -static const struct spi_nor_fixups mt35xu01gbba_fixups = {
> +static const struct spi_nor_fixups mt35_two_die_fixups = {
>  	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
>  	.late_init = micron_st_nor_two_die_late_init,
>  };
> @@ -202,7 +202,7 @@ static const struct flash_info micron_nor_parts[] = {
>  		.id = SNOR_ID(0x2c, 0x5b, 0x1b),
>  		.mfr_flags = USE_FSR,
>  		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
> -		.fixups = &mt35xu01gbba_fixups,
> +		.fixups = &mt35_two_die_fixups,
>  	}, {
>  		/*
>  		 * The MT35XU02GCBA flash device does not support chip erase,
> @@ -212,7 +212,6 @@ static const struct flash_info micron_nor_parts[] = {
>  		 * MT35XU01GBBA, the SPI_NOR_IO_MODE_EN_VOLATILE flag probably
>  		 * needs to be enabled.
>  		 *
> -		 * TODO: Fix these and test on real hardware.

I meant to drop the whole comment. But no problem, I can do that when
applying.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Thanks for the patch!

>  		 */
>  		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
>  		.name = "mt35xu02g",
> @@ -221,7 +220,7 @@ static const struct flash_info micron_nor_parts[] = {
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ,
>  		.mfr_flags = USE_FSR,
>  		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
> -		.fixups = &mt35xu01gbba_fixups,
> +		.fixups = &mt35_two_die_fixups,
>  	},
>  };
>  

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
