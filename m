Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E998BC43334
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 09:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLViYYzQtnOysZvGGIwJ+Kh8ivisBs4/rE1xdwME4SA=; b=eX27OsaKkjspxJ
	JSnL8vtem07YOda4mXSGEEcF/L7WzCfMPTci6Moag9gW86l31IoQ9b+5lp87EiqwM8NPMurfmVqc1
	AY4WwvDy54Y38y9GXXt+h8qltp35bwt2SojRZis7v7IPQOMhRmj0SrWJgkmgAxT7sFjoL+3sQpCnV
	iqCCly6cgOXpahlmmeZwvd7QkNkRbWzmB1YlVBnEjn9pRTJLmRSYREi3IDwzX49a5DjFrYqOIJFFy
	cZSDC8w4ilW5KLSBzQGiWwZFrErbcUfbiTmJ4gpu7WungQAzTZ3FEVLz4fzNfRWOWchV4bXopVsKd
	uYidmRBUUHbFz8l7NF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESXp-003N7k-75; Thu, 21 Jul 2022 09:32:33 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESXl-003Mrj-J9
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2022 09:32:31 +0000
X-IronPort-AV: E=Sophos;i="5.92,289,1650898800"; 
   d="scan'208";a="128642622"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jul 2022 18:32:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.81])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9D0CE40078D5;
	Thu, 21 Jul 2022 18:32:17 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: michael@walle.cc
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	p.yadav@ti.com,
	richard@nod.at,
	tudor.ambarus@microchip.com,
	vigneshr@ti.com
Subject: Re: [PATCH 5/6] mtd: spi-nor: add generic flash driver
Date: Thu, 21 Jul 2022 10:32:16 +0100
Message-ID: <202205132220.uRTFaqNA-lkp@intel.com> (raw)
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513133520.3945820-6-michael@walle.cc>
References: <20220513133520.3945820-6-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_023229_788049_68F3D505 
X-CRM114-Status: GOOD (  25.17  )
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
Message-ID: <20220721093216.ZjX_zjDkJZMtmnR28nTDJ9N1o8EEFvo9ONrim9KYd5I@z>

> Our SFDP is parsing is everything we need to support all basic operations of
> a flash device. If the flash isn't found in our in-kernel flash database,
> gracefully fall back to a driver described solely by its SFDP tables.
> 
> It is still recommended to add the flash to the in-kernel database.
> First, we get a proper partname and secondly, for all features not described
> by the SFDP like OTP we need the entry anyway.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c | 13 +++++++++++++  drivers/mtd/spi-nor/core.h |
> 1 +  drivers/mtd/spi-nor/sfdp.c | 27 +++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c index
> 65cd8e668579..ee193a61310a 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1632,6 +1632,11 @@ static const struct spi_nor_manufacturer
> *manufacturers[] = {
>  	&spi_nor_xmc,
>  };
> 
> +static const struct flash_info spi_nor_generic_flash = {
> +	.name = "spi-nor-generic",
> +	.parse_sfdp = true,
> +};
> +
>  static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
>  						 const u8 *id)
>  {
> @@ -1670,6 +1675,14 @@ static const struct flash_info *spi_nor_detect(struct
> spi_nor *nor)
>  		return ERR_PTR(-ENOMEM);
> 
>  	info = spi_nor_match_id(nor, id);
> +
> +	/* Fallback to a generic flash described only by its SFDP data. */
> +	if (!info) {
> +		ret = spi_nor_check_sfdp_signature(nor);
> +		if (!ret)
> +			info = &spi_nor_generic_flash;
> +	}

May be this can be combined as

 	if (!info && (!spi_nor_check_sfdp_signature(nor)))
		info = &spi_nor_generic_flash;

Cheers,
Biju

>  	if (!info) {
>  		dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
>  			SPI_NOR_MAX_ID_LEN, id);
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h index
> 153cb4b174ee..b084cb6db401 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -703,6 +703,7 @@ int spi_nor_controller_ops_read_reg(struct spi_nor *nor,
> u8 opcode,  int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8
> opcode,
>  				     const u8 *buf, size_t len);
> 
> +int spi_nor_check_sfdp_signature(struct spi_nor *nor);
>  int spi_nor_parse_sfdp(struct spi_nor *nor);
> 
>  static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd) diff --
> git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c index
> a5211543d30d..9bdb3d5dc7e8 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1247,6 +1247,33 @@ static void spi_nor_post_sfdp_fixups(struct spi_nor
> *nor)
>  		nor->info->fixups->post_sfdp(nor);
>  }
> 
> +/**
> + * spi_nor_check_sfdp_header() - check for a valid SFDP header
> + * @nor:		pointer to a 'struct spi_nor'
> + *
> + * Used to detect if the flash supports the RDSFDP command as well as
> +the
> + * presence of a valid SFDP table.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +int spi_nor_check_sfdp_signature(struct spi_nor *nor) {
> +	u32 signature;
> +	int err;
> +
> +	/* Get the SFDP header. */
> +	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(signature),
> +					   &signature);
> +	if (err < 0)
> +		return err;
> +
> +	/* Check the SFDP signature. */
> +	if (le32_to_cpu(signature) != SFDP_SIGNATURE)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  /**
>   * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
>   * @nor:		pointer to a 'struct spi_nor'
> --
> 2.25.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
