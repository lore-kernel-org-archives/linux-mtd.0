Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05C5C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 15:33:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E69A61972
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 15:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E69A61972
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mu0h2EMZUXI3DQOtN7QBfEiEi1/MPk6gaWIZg58X0lo=; b=EzFWSLz5eFvWijEsJRTUKKBPT
	ZJgWFawuhcCXDJkclVSJc26uSI8rt9ZeTsgDvOc49OnYMuAsoZNborAUiiAyRd9CV2VTjQXcVk4In
	2fuQ7laW+gJLrhIIp2pYQkc+sTMefaE9DpS4ZH1PuozAZDU4oZy+Ga0usxZivJKXe9PDJNXkZ3GkY
	3RkBJ/lIcqCOAf/PQQHEieFCqKNzeakIhbHlk9yJFAIrx3Vgw/A5UfKWo41dwv/2vvoNGwL7v7DYw
	37M9bCBS09dzcxMlru+DuPvF7iycXL0NhTOyCyVcXaBb0izdnFaew53PpKC81RTwAAUO+pyimkGs5
	ibEWLC5tA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOMYB-00Bu6i-Lo; Mon, 22 Mar 2021 15:33:03 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOMY1-00Bu5q-Is
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 15:32:59 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D4FEC22235;
 Mon, 22 Mar 2021 16:32:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616427169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DVUQI3Lse6+HoHd1uk+xPOrieiim8YGOVOTtWddlYjo=;
 b=q4TLvmDHCVffQSl6b5sf5N7uV2aJBhmM3wpMIh7tvQfa5ycJ/sUzpYHOqzWWHnFYXUR7Wa
 YIqEO9X0ODB9dmIgJakCHZiBHa7Prh7fq1ltTsuMCPyhHO/no2YlEsUuCHuybb7RebhRD5
 48zccJTE7SopB4L/OH9NPHG7WBQ9ORo=
MIME-Version: 1.0
Date: Mon, 22 Mar 2021 16:32:49 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sfdp: save a copy of the SFDP data
In-Reply-To: <20210322142141.pd7ondg6l76idz7d@ti.com>
References: <20210318092406.5340-1-michael@walle.cc>
 <20210318092406.5340-2-michael@walle.cc>
 <20210322142141.pd7ondg6l76idz7d@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0efba47de8737059b4f3c593c26297bf@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_153257_443644_591A440F 
X-CRM114-Status: GOOD (  41.36  )
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

Am 2021-03-22 15:21, schrieb Pratyush Yadav:
> On 18/03/21 10:24AM, Michael Walle wrote:
>> Due to possible mode switching to 8D-8D-8D, it might not be possible 
>> to
>> read the SFDP after the initial probe. To be able to dump the SFDP via
>> sysfs afterwards, make a complete copy of it.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  drivers/mtd/spi-nor/core.h  | 10 ++++++++
>>  drivers/mtd/spi-nor/sfdp.c  | 49 
>> +++++++++++++++++++++++++++++++++++++
>>  include/linux/mtd/spi-nor.h |  3 +++
>>  3 files changed, 62 insertions(+)
>> 
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index 4a3f7f150b5d..668f22011b1d 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -407,6 +407,16 @@ struct spi_nor_manufacturer {
>>  	const struct spi_nor_fixups *fixups;
>>  };
>> 
>> +/**
>> + * struct sfdp - SFDP data
>> + * @num_dwords: number of entries in the dwords array
>> + * @dwords: array of double words of the SFDP data
>> + */
>> +struct sfdp {
>> +	size_t	num_dwords;
>> +	u32	*dwords;
>> +};
>> +
>>  /* Manufacturer drivers. */
>>  extern const struct spi_nor_manufacturer spi_nor_atmel;
>>  extern const struct spi_nor_manufacturer spi_nor_catalyst;
>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> index 25142ec4737b..2b6c96e02532 100644
>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -16,6 +16,7 @@
>>  	(((p)->parameter_table_pointer[2] << 16) | \
>>  	 ((p)->parameter_table_pointer[1] <<  8) | \
>>  	 ((p)->parameter_table_pointer[0] <<  0))
>> +#define SFDP_PARAM_HEADER_PARAM_LEN(p) ((p)->length * 4)
>> 
>>  #define SFDP_BFPT_ID		0xff00	/* Basic Flash Parameter Table */
>>  #define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
>> @@ -1263,6 +1264,8 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>>  	struct sfdp_parameter_header *param_headers = NULL;
>>  	struct sfdp_header header;
>>  	struct device *dev = nor->dev;
>> +	struct sfdp *sfdp;
>> +	size_t sfdp_size;
>>  	size_t psize;
>>  	int i, err;
>> 
>> @@ -1285,6 +1288,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>>  	    bfpt_header->major != SFDP_JESD216_MAJOR)
>>  		return -EINVAL;
>> 
>> +	sfdp_size = SFDP_PARAM_HEADER_PTP(bfpt_header) +
>> +		    SFDP_PARAM_HEADER_PARAM_LEN(bfpt_header);
>> +
>>  	/*
>>  	 * Allocate memory then read all parameter headers with a single
>>  	 * Read SFDP command. These parameter headers will actually be 
>> parsed
>> @@ -1311,6 +1317,49 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>>  		}
>>  	}
>> 
>> +	/*
>> +	 * Cache the complete SFDP data. It is not (easily) possible to 
>> fetch
>> +	 * SFDP after probe time and we need it for the sysfs access.
>> +	 */
>> +	for (i = 0; i < header.nph; i++) {
>> +		param_header = &param_headers[i];
>> +		sfdp_size = max_t(size_t, sfdp_size,
>> +				  SFDP_PARAM_HEADER_PTP(param_header) +
>> +				  SFDP_PARAM_HEADER_PARAM_LEN(param_header));
> 
> *sigh* If BFPT header was not made a part of the main SFDP header, two
> "sfdp_size = ..." would not be needed, and we could do it all in one
> place.
> 
> You can do that refactor if you're feeling like it, but I won't insist
> on it.

I think that could be refactored when we also use the SFDP cache for
the remaining parsing.

> 
>> +	}
>> +
>> +	/*
>> +	 * Limit the total size to a reasonable value to avoid allocating 
>> too
>> +	 * much memory just of because the flash returned some insane 
>> values.
>> +	 */
>> +	if (sfdp_size > PAGE_SIZE) {
>> +		dev_dbg(dev, "SFDP data (%zu) too big, truncating\n",
>> +			sfdp_size);
>> +		sfdp_size = PAGE_SIZE;
> 
> Ok. 4K should be large enough for any reasonable SFDP table.
> 
>> +	}
>> +
>> +	sfdp = devm_kzalloc(dev, sizeof(*sfdp), GFP_KERNEL);
>> +	if (!sfdp) {
>> +		err = -ENOMEM;
>> +		goto exit;
>> +	}
> 
> I assume you made nor->sfdp a pointer and not an embedded struct so it
> can easily indicate if SFDP was found or not, correct?

Correct.

> 
>> +
>> +	sfdp->num_dwords = DIV_ROUND_UP(sfdp_size, sizeof(*sfdp->dwords));
> 
> The SFDP spec says that Parameter Table Pointer should be DWORD aligned
> and Parameter Table length is specified in number of DWORDs. So,
> sfdp_size should always be a multiple of 4. Any SFDP table where this 
> is
> not true is an invalid one.
> 
> Also, the spec says "Device behavior when the Read SFDP command crosses
> the SFDP structure boundary is not defined".
> 
> So I think this should be a check for alignment instead of a round-up.

Well, that woundn't help for debugging. I.e. you also want the SFDP data
in cases like this. IMHO we should try hard enough to actually get a
reasonable dump.

OTOH we also rely on the header and the pointers in the header. Any
other ideas, but just to chicken out?

>> +	sfdp->dwords = devm_kcalloc(dev, sfdp->num_dwords,
>> +				    sizeof(*sfdp->dwords), GFP_KERNEL);
>> +	if (!sfdp->dwords) {
>> +		err = -ENOMEM;
> 
> Free sfdp here since it won't be used any longer.

I see, spi_nor_parse_sfdp() is optional and won't fail the probe.
Nice catch.

> 
>> +		goto exit;
>> +	}
>> +
>> +	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sfdp_size, sfdp->dwords);
>> +	if (err < 0) {
>> +		dev_dbg(dev, "failed to read SFDP data\n");
>> +		goto exit;
> 
> Free sfdp and sfdp->dwords here since they won't be used any longer.
> 
>> +	}
>> +
>> +	nor->sfdp = sfdp;
>> +
>>  	/*
>>  	 * Check other parameter headers to get the latest revision of
>>  	 * the basic flash parameter table.
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index a0d572855444..55c550208949 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -351,6 +351,7 @@ enum spi_nor_cmd_ext {
>>  struct flash_info;
>>  struct spi_nor_manufacturer;
>>  struct spi_nor_flash_parameter;
>> +struct sfdp;
> 
> nor->sfdp is a pointer. This should not be needed.
> 
>> 
>>  /**
>>   * struct spi_nor - Structure for defining the SPI NOR layer
>> @@ -375,6 +376,7 @@ struct spi_nor_flash_parameter;
>>   * @read_proto:		the SPI protocol for read operations
>>   * @write_proto:	the SPI protocol for write operations
>>   * @reg_proto:		the SPI protocol for read_reg/write_reg/erase 
>> operations
>> + * @sfdp:		the SFDP data of the flash
>>   * @controller_ops:	SPI NOR controller driver specific operations.
>>   * @params:		[FLASH-SPECIFIC] SPI NOR flash parameters and settings.
>>   *                      The structure includes legacy flash 
>> parameters and
>> @@ -404,6 +406,7 @@ struct spi_nor {
>>  	bool			sst_write_second;
>>  	u32			flags;
>>  	enum spi_nor_cmd_ext	cmd_ext_type;
>> +	struct sfdp		*sfdp;
>> 
>>  	const struct spi_nor_controller_ops *controller_ops;
>> 
>> --
>> 2.20.1
>> 

-- 
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
