Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500EDC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 18:55:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11CA960551
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 18:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11CA960551
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8ix+hHTZGxVQWJRNr1NzFI2y4ceVSNYKuRfV03fzn0=; b=fkUdi8evVP9fZv
	vwUaywlt4Yu5kfTCaRvPvf0QNlUeJHiN3bXIqzclwwFoAjgs2bSme10qevlBKmhMhCuf4MAUSH2xT
	xKXqEeVcppYRC+NgNvF2z0THGJgObF76eBAtzCf3p9X4Yq8mxW42xPvo08qUuV9FOg7jg3Mj2aO/j
	Wr+4Fzq4477ldtYVLbthZh/uTV1SwwzqlhVQbdGsl2IVQ9V5xPp7bdPcYGo/8wBn82SEiAm+2VhA3
	viTH18ZJRzVXrbqGW3Unsum/49BAkbuBsCYsOmULsWs6dbJFHrnc+7xr4X+AkczSIkmFKPoVISCNP
	uk7e3f1r9SUmxuqjZytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFhlV-0002OX-1Q; Mon, 16 Aug 2021 18:55:17 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFhlQ-0002O6-DD; Mon, 16 Aug 2021 18:55:16 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17GIsnrw098399;
 Mon, 16 Aug 2021 13:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629140090;
 bh=NQhPXQ0eKpfIgZ89JwLbO78q9fSh51NN5mMDC02weX0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=S3gbk7ardcEnnGWDgP0x+Kdm+NGwpECSYy2ZTXXrJBxNOPSohTNWQOANukaeg+LsF
 L0oW+gJ1uQK1UatJD2Axa2mncvTB+3p3EFIVHOMQH6ZCaWOh84zRpKSv4/WEzyvgoD
 XAreFA0rxe6/lsBS71MElm5j7EbyZKs5uEt3mbdM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17GIsn9C036226
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Aug 2021 13:54:49 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 16
 Aug 2021 13:54:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 16 Aug 2021 13:54:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17GIsm2Q070178;
 Mon, 16 Aug 2021 13:54:49 -0500
Date: Tue, 17 Aug 2021 00:24:48 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, <sr@denx.de>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v2 08/35] mtd: spi-nor: core: Introduce the ate_init() hook
Message-ID: <20210816185446.topxrgwmvpt6n4ct@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-9-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-9-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_115512_584720_A8710BD0 
X-CRM114-Status: GOOD (  31.42  )
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

Hi Tudor,

> Subject: [PATCH v2 08/35] mtd: spi-nor: core: Introduce the ate_init() hook
                                                              ^^^^^^^^
You ate the 'l' ;-)

On 27/07/21 07:51AM, Tudor Ambarus wrote:
> The goal is to get rid of the spaghetti way of initializing the flash
> parameters and settings. late_init() hook will be used to tweak various
> parameters that are not defined by the SFDP standard. Can be used by
> non SFDP compliant flashes in order to tweak flash parameters that
> are not/shouldn't be handled by the flash_info flags. Will replace the
> default_init() hook.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 15 +++++++++++----
>  drivers/mtd/spi-nor/core.h |  8 ++++++++
>  2 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index d30c8f350dc1..15ccc9994215 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2667,11 +2667,18 @@ static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
>   * spi_nor_late_init_params() - Late initialization of default flash parameters.
>   * @nor:	pointer to a 'struct spi_nor'
>   *
> - * Used to set default flash parameters and settings when the ->default_init()
> - * hook or the SFDP parser let voids.
> + * Used to tweak various flash parameters that are not defined by the SFDP
> + * standard. Can be used by non SFDP compliant flashes in order to tweek flash
> + * parameters that are not handled by the flash_info flags.

What about flashes that do have the SFDP table, but not all of them? For 
example, the Micron MT35XU512ABA flash currently uses the post_sfdp() 
hook to populate 8D-8D-8D fast read settings, command extension type, 
etc. These are supposed to be obtained from the xSPI Profile 1.0 table 
(like we do for Spansion/Cypress S28HS512T). But the flash does not 
populate this table. Should these go into the late_init() hook or the 
post_sfdp() hook?

FWIW, I think it should go into late_init(). post_sfdp() should only be 
used for correcting info obtained from the SFDP table. For populating 
the info not present in SFDP at all, late_init() should be used.

Thoughts?

>   */
>  static void spi_nor_late_init_params(struct spi_nor *nor)
>  {
> +	if (nor->manufacturer && nor->manufacturer->late_init)
> +		nor->manufacturer->late_init(nor);
> +
> +	if (nor->info->late_init)
> +		nor->info->late_init(nor);

Manufacturer late_init goes before flash late_init. Makes sense.

> +
>  	/*
>  	 * NOR protection support. When locking_ops are not provided, we pick
>  	 * the default ones.
> @@ -2713,8 +2720,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>   *    wrong).
>   *		spi_nor_post_sfdp_fixups()
>   *
> - * 5/ Late default flash parameters initialization, used when the
> - * ->default_init() hook or the SFDP parser do not set specific params.
> + * 5/ Late flash parameters initialization, used to initialize flash
> + * parameters that are not declared in the JESD216 SFDP standard.
>   *		spi_nor_late_init_params()
>   */
>  static int spi_nor_init_params(struct spi_nor *nor)
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index e9896cd60695..13d5c5edfd27 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -391,6 +391,11 @@ struct flash_info {
>  
>  	/* Part specific fixup hooks. */
>  	const struct spi_nor_fixups *fixups;
> +	/*
> +	 * Init flash parameters that are not declared in the JESD216 SFDP
> +	 * standard.
> +	 */
> +	void (* const late_init)(struct spi_nor *nor);
>  };
>  
>  /* Used when the "_ext_id" is two bytes at most */
> @@ -457,12 +462,15 @@ struct flash_info {
>   * @parts: array of parts supported by this manufacturer
>   * @nparts: number of entries in the parts array
>   * @fixups: hooks called at various points in time during spi_nor_scan()
> + * @late_init: used to init flash parameters that are not declared in the
> + *             JESD216 SFDP standard.
>   */
>  struct spi_nor_manufacturer {
>  	const char *name;
>  	const struct flash_info *parts;
>  	unsigned int nparts;
>  	const struct spi_nor_fixups *fixups;
> +	void (* const late_init)(struct spi_nor *nor);

The patch looks good to me other than the comments above.

>  };
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
