Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB949C3DA6E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jan 2024 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdp3Ah2+vFmcgn2fOfoQymPB4JjeEHu9h49Y+p/a0PE=; b=lvw6yJF9dhZqZbsUnxovvDMTNd
	oOk2RgIEp/X6p5yUQ+epokQKQNilDdydQHhTfiFVYS92ScuyTaBSFRGhArCx0WaR6CHxRDaXOGBMp
	deS68/cT/FxQP7RbQUacfBtCjNOhgdbnZ5ykXyvbof2ayBXetH+6cG3mb22eMfS+r3qCB9FT/Cn3H
	k4eM9o1C5X8mfBjm3zr/4zQHpi4V2sle55jiqo4nQApdifkKdkrb2w6/L5Q6jAAa/ZMWgjgh/UAmC
	F41CNbbRoOl5t+4cJ9vy5l1d8PpuHM/gkLk8NPivmab5aQHz5OI3LC1Pi9FCi7hGAa0Sr/HgtXQLv
	XYiOwiWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjn9-00Gt3P-10;
	Fri, 05 Jan 2024 12:59:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjn5-00Gt30-1X
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jan 2024 12:59:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D3306B81C9C;
	Fri,  5 Jan 2024 12:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8079AC433C8;
	Fri,  5 Jan 2024 12:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704459549;
	bh=ka5FjBQD6h9MVnE7ywo1QjJyFD10E0RfnM+xr8ah7nE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GU4k/XH31uTap6FK2sP+rDyK7Va2IfWd7KfkRMkxgobSZZIolvF6hwdwiBqiBNjW8
	 wUzgKPhRImkUQ1sHjKw/FTa+dVjUEFbvMW8MP9/SBOgKUg4yr8VxXiYEUeGmj/wqnd
	 qfNPkqVH1NRF9VQAmBaUTg2R8EFkhx25yd4tRvdOZZl9zLmLAC4W0b2b9Hds9DLtpN
	 k9vGa/TCAizWWO1uPLRbqJ8+mUknw94ZFkjrVEB8z8FlbpEIlN92NomOkMdZlwcgOu
	 dzJIrPLCosIvNtXdXNg62b7wyxkf0Dc7hmncBLriLbJgOd0YTi4qTNHT6KtSKlV7RC
	 wgv4AKJOL45AA==
MIME-Version: 1.0
Date: Fri, 05 Jan 2024 13:59:05 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v7 3/7] mtd: spi-nor: core: Allow specifying the byte
 order in DTR mode
In-Reply-To: <20231221090702.103027-4-jaimeliao.tw@gmail.com>
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-4-jaimeliao.tw@gmail.com>
Message-ID: <103152f83138bbbadeea2798a11e6e2c@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_045911_817322_C6F2E3DE 
X-CRM114-Status: GOOD (  21.74  )
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

Hi,

> Macronix swaps bytes on a 16-bit boundary when configured in Octal DTR.
> The byte order of 16-bit words is swapped when read or written in 
> 8D-8D-8D
> mode compared to STR modes. Allow operations to specify the byte order 
> in
> DTR mode, so that controllers can swap the bytes back at run-time to
> address the flash's endianness requirements, if they are capable. If 
> the
> controllers are not capable of swapping the bytes, the protocol is
> downgrade via spi_nor_spimem_adjust_hwcaps(). When available, the 
> swapping
> of the bytes is always done regardless if it's a data or register 
> access,
> so that we comply with the JESD216 requirements: "Byte order of 16-bit
> words is swapped when read in 8D-8D-8D mode compared to 1-1-1".
> 
> Merge Tudor's patch and add modifications for suiting newer version
> of Linux kernel.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/core.c | 8 ++++++++
>  drivers/mtd/spi-nor/core.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1c443fe568cf..f659dd037a25 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -70,6 +70,13 @@ static u8 spi_nor_get_cmd_ext(const struct spi_nor 
> *nor,
>  	}
>  }
> 
> +static inline bool spi_nor_is_octal_dtr_swab16(const struct spi_nor 
> *nor,
> +						enum spi_nor_protocol proto)
> +{
> +	return (proto == SNOR_PROTO_8_8_8_DTR) &&
> +		(nor->flags & SNOR_F_DTR_SWAB16);
> +}
> +
>  /**
>   * spi_nor_spimem_setup_op() - Set up common properties of a spi-mem 
> op.
>   * @nor:		pointer to a 'struct spi_nor'
> @@ -105,6 +112,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor 
> *nor,
>  		op->addr.dtr = true;
>  		op->dummy.dtr = true;
>  		op->data.dtr = true;
> +		op->data.dtr_swab16 = spi_nor_is_octal_dtr_swab16(nor, proto);

Just use
   dtr_swap16 = nor->flags & SNOR_F_DTR_SWAP16;

Again, I don't really like DTR_SWAP16. JESD216 just mention swapping for
8d8d8d. Depends on how generic we want to go. I'd go with swap16 and 
mention
that for now, it is only applicable if data.buswidth == 8 and
data.dtr == true.

-michael

>  		/* 2 bytes per clock cycle in DTR mode. */
>  		op->dummy.nbytes *= 2;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 93cd2fc3606d..fe1259b32110 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -140,6 +140,7 @@ enum spi_nor_option_flags {
>  	SNOR_F_RWW		= BIT(14),
>  	SNOR_F_ECC		= BIT(15),
>  	SNOR_F_NO_WP		= BIT(16),
> +	SNOR_F_DTR_SWAB16       = BIT(17),
>  };
> 
>  struct spi_nor_read_command {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
