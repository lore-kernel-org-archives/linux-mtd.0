Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A152BC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 14:23:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EEAC6196C
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 14:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EEAC6196C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=leoqxU4AWzBG8ERynkBFGDT1WNBF9pJ1I4i2inzWeoo=; b=QuvWF9hjbxNJZ6XEFlvH8kiK9
	vb2r1TEZFToZ0bAKJTh/8aoYQOuN4Eh0K8/SWPIIZGbk2QSrLifqewqb+sXwrdc9cQ5CTKhz1B32Z
	f86HIe+fuVOkhjU4xvAtCOyKF60Vw61HfpUFC81GdSUGhSaupZPDO/WJNznF/4zAdj5E2LsdJdFd5
	dwYEsQrc2GnVQTc7/XhSfH14nTrSkyjzBfmkFsns/sHlkfW1l9yJYFBAKUUhDrgwohprvJmz4o9Rc
	yuH41KnSx6rYkZZ45Y40xcWd26b9bsWNCgbiF2/Ft938T6RAeTR3V6AqJOjuLdR0mtaPpNHAE17i+
	FOCkl5Vqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOLRL-00Bn29-BB; Mon, 22 Mar 2021 14:21:55 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOLRF-00Bn1K-4L
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 14:21:52 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12MELivq006009;
 Mon, 22 Mar 2021 09:21:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1616422904;
 bh=XdzUQgWZFZCothi/lXch71vyPWr7WWsOqb+dKmvwneE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=PjZXfuiRbCrRLYHgS1VrqJ1P7RAnbPp/rnkvR87zm4frY3+xwWO1rS5PkFjh2aTUc
 GnJaNu2z3GbM8VigGLCFAYDuEKhvBqBVYzkVtHPd7AJnXZvopJw9asIB2oXCPBOZFV
 1f28bRO8y+/jXy5J+nC0VOebKExgYXriBat0Aivc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12MELiRh023857
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Mar 2021 09:21:44 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 22
 Mar 2021 09:21:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 22 Mar 2021 09:21:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12MELhok039159;
 Mon, 22 Mar 2021 09:21:44 -0500
Date: Mon, 22 Mar 2021 19:51:43 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sfdp: save a copy of the SFDP data
Message-ID: <20210322142141.pd7ondg6l76idz7d@ti.com>
References: <20210318092406.5340-1-michael@walle.cc>
 <20210318092406.5340-2-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210318092406.5340-2-michael@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_142149_688207_37947D17 
X-CRM114-Status: GOOD (  37.32  )
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

On 18/03/21 10:24AM, Michael Walle wrote:
> Due to possible mode switching to 8D-8D-8D, it might not be possible to
> read the SFDP after the initial probe. To be able to dump the SFDP via
> sysfs afterwards, make a complete copy of it.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.h  | 10 ++++++++
>  drivers/mtd/spi-nor/sfdp.c  | 49 +++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h |  3 +++
>  3 files changed, 62 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 4a3f7f150b5d..668f22011b1d 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -407,6 +407,16 @@ struct spi_nor_manufacturer {
>  	const struct spi_nor_fixups *fixups;
>  };
>  
> +/**
> + * struct sfdp - SFDP data
> + * @num_dwords: number of entries in the dwords array
> + * @dwords: array of double words of the SFDP data
> + */
> +struct sfdp {
> +	size_t	num_dwords;
> +	u32	*dwords;
> +};
> +
>  /* Manufacturer drivers. */
>  extern const struct spi_nor_manufacturer spi_nor_atmel;
>  extern const struct spi_nor_manufacturer spi_nor_catalyst;
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 25142ec4737b..2b6c96e02532 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -16,6 +16,7 @@
>  	(((p)->parameter_table_pointer[2] << 16) | \
>  	 ((p)->parameter_table_pointer[1] <<  8) | \
>  	 ((p)->parameter_table_pointer[0] <<  0))
> +#define SFDP_PARAM_HEADER_PARAM_LEN(p) ((p)->length * 4)
>  
>  #define SFDP_BFPT_ID		0xff00	/* Basic Flash Parameter Table */
>  #define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
> @@ -1263,6 +1264,8 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>  	struct sfdp_parameter_header *param_headers = NULL;
>  	struct sfdp_header header;
>  	struct device *dev = nor->dev;
> +	struct sfdp *sfdp;
> +	size_t sfdp_size;
>  	size_t psize;
>  	int i, err;
>  
> @@ -1285,6 +1288,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>  	    bfpt_header->major != SFDP_JESD216_MAJOR)
>  		return -EINVAL;
>  
> +	sfdp_size = SFDP_PARAM_HEADER_PTP(bfpt_header) +
> +		    SFDP_PARAM_HEADER_PARAM_LEN(bfpt_header);
> +
>  	/*
>  	 * Allocate memory then read all parameter headers with a single
>  	 * Read SFDP command. These parameter headers will actually be parsed
> @@ -1311,6 +1317,49 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>  		}
>  	}
>  
> +	/*
> +	 * Cache the complete SFDP data. It is not (easily) possible to fetch
> +	 * SFDP after probe time and we need it for the sysfs access.
> +	 */
> +	for (i = 0; i < header.nph; i++) {
> +		param_header = &param_headers[i];
> +		sfdp_size = max_t(size_t, sfdp_size,
> +				  SFDP_PARAM_HEADER_PTP(param_header) +
> +				  SFDP_PARAM_HEADER_PARAM_LEN(param_header));

*sigh* If BFPT header was not made a part of the main SFDP header, two 
"sfdp_size = ..." would not be needed, and we could do it all in one 
place.

You can do that refactor if you're feeling like it, but I won't insist 
on it.

> +	}
> +
> +	/*
> +	 * Limit the total size to a reasonable value to avoid allocating too
> +	 * much memory just of because the flash returned some insane values.
> +	 */
> +	if (sfdp_size > PAGE_SIZE) {
> +		dev_dbg(dev, "SFDP data (%zu) too big, truncating\n",
> +			sfdp_size);
> +		sfdp_size = PAGE_SIZE;

Ok. 4K should be large enough for any reasonable SFDP table.

> +	}
> +
> +	sfdp = devm_kzalloc(dev, sizeof(*sfdp), GFP_KERNEL);
> +	if (!sfdp) {
> +		err = -ENOMEM;
> +		goto exit;
> +	}

I assume you made nor->sfdp a pointer and not an embedded struct so it 
can easily indicate if SFDP was found or not, correct?

> +
> +	sfdp->num_dwords = DIV_ROUND_UP(sfdp_size, sizeof(*sfdp->dwords));

The SFDP spec says that Parameter Table Pointer should be DWORD aligned 
and Parameter Table length is specified in number of DWORDs. So, 
sfdp_size should always be a multiple of 4. Any SFDP table where this is 
not true is an invalid one.

Also, the spec says "Device behavior when the Read SFDP command crosses 
the SFDP structure boundary is not defined".

So I think this should be a check for alignment instead of a round-up. 

> +	sfdp->dwords = devm_kcalloc(dev, sfdp->num_dwords,
> +				    sizeof(*sfdp->dwords), GFP_KERNEL);
> +	if (!sfdp->dwords) {
> +		err = -ENOMEM;

Free sfdp here since it won't be used any longer.

> +		goto exit;
> +	}
> +
> +	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sfdp_size, sfdp->dwords);
> +	if (err < 0) {
> +		dev_dbg(dev, "failed to read SFDP data\n");
> +		goto exit;

Free sfdp and sfdp->dwords here since they won't be used any longer.

> +	}
> +
> +	nor->sfdp = sfdp;
> +
>  	/*
>  	 * Check other parameter headers to get the latest revision of
>  	 * the basic flash parameter table.
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index a0d572855444..55c550208949 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -351,6 +351,7 @@ enum spi_nor_cmd_ext {
>  struct flash_info;
>  struct spi_nor_manufacturer;
>  struct spi_nor_flash_parameter;
> +struct sfdp;

nor->sfdp is a pointer. This should not be needed.

>  
>  /**
>   * struct spi_nor - Structure for defining the SPI NOR layer
> @@ -375,6 +376,7 @@ struct spi_nor_flash_parameter;
>   * @read_proto:		the SPI protocol for read operations
>   * @write_proto:	the SPI protocol for write operations
>   * @reg_proto:		the SPI protocol for read_reg/write_reg/erase operations
> + * @sfdp:		the SFDP data of the flash
>   * @controller_ops:	SPI NOR controller driver specific operations.
>   * @params:		[FLASH-SPECIFIC] SPI NOR flash parameters and settings.
>   *                      The structure includes legacy flash parameters and
> @@ -404,6 +406,7 @@ struct spi_nor {
>  	bool			sst_write_second;
>  	u32			flags;
>  	enum spi_nor_cmd_ext	cmd_ext_type;
> +	struct sfdp		*sfdp;
>  
>  	const struct spi_nor_controller_ops *controller_ops;
>  
> -- 
> 2.20.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
