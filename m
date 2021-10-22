Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC64DC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:42:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91FA46101C
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91FA46101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyVzh0JCorKoQDRoUzKJYAgR3jBqPzTLgG0WA0PemMw=; b=tDbne1VT77t4HsElIDqJ5fBoh2
	XZLYJatB/rHP6M+xX3xa65vXUwkY80UKWVKwpR7mGqoqnE3fvZ4s3ziX3SWlK0i/cgnyAwMd8v1eK
	odClXzgW8+LhwpKxtVaibNqjFcgRWmVDk5AW30Ri+twt2vIg02wlbCWBcfbO92ZYLeRFBVVEdh9PS
	KOVR/EORF9EFt7MZpWFDMHAKV4ov/w1M+JO6HNI1CzYZuaVfcnXpD3/vccetHpqLZ3TiTunKNtN8e
	RtoFtyD6hBq/uOU4ZXfkr11rF1DAhQ9thGopTMckq/e6M0XJPUG7qY2SoFrI6p0qQ5iHTqW7TatrI
	gRWps0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtrx-00Av3M-HO; Fri, 22 Oct 2021 12:41:57 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtrN-00Aupw-GI; Fri, 22 Oct 2021 12:41:23 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 14046221E1;
 Fri, 22 Oct 2021 14:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1634906479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6sTXouViOiPmAoRuK6VBrhne5A+9kl803eEHdAqh9tE=;
 b=gLpPtRAOSvuzXOMbVmSQyrx/a/25G+IcrfXs8jZd/mV5qJ3xxTubjLpemyCOc70jK/VcXG
 oxhLGRHcGBPfaksM5EhL97MiX2TsimxmN/mDwb2gUuep9ejP1iYX1XUKZfBjIR6Cp3bnfN
 UsjCu8IIb2UimM5WzQ9/xXu2DTNJIs8=
MIME-Version: 1.0
Date: Fri, 22 Oct 2021 14:41:17 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v2 26/35] mtd: spi-nor: core: Introduce
 spi_nor_init_default_params()
In-Reply-To: <42dd1311-7e75-a57c-c62c-d0d452608cdf@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-27-tudor.ambarus@microchip.com>
 <20210824173018.n6fw6t6mg4bwah37@ti.com>
 <42dd1311-7e75-a57c-c62c-d0d452608cdf@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <2919e1cfdf2b52780fbab6a196642d9d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_054121_902826_8E056DCE 
X-CRM114-Status: GOOD (  28.20  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-10-04 06:17, schrieb Tudor.Ambarus@microchip.com:
> On 8/24/21 8:30 PM, Pratyush Yadav wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> On 27/07/21 07:52AM, Tudor Ambarus wrote:
>>> Called for all flashes, regardless if they define SFDP tables or not.
>>> 
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>> ---
>>>  drivers/mtd/spi-nor/core.c | 92 
>>> +++++++++++++++++++++-----------------
>>>  1 file changed, 52 insertions(+), 40 deletions(-)
>>> 
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index b3a01d7d6f0b..9193317f897d 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -2543,6 +2543,56 @@ static int spi_nor_setup(struct spi_nor *nor,
>>>       return spi_nor_set_addr_width(nor);
>>>  }
>>> 
>>> +/**
>>> + * spi_nor_init_default_params() - Default initialization of flash 
>>> parameters
>>> + * and settings. Done for all flashes, regardless is they define 
>>> SFDP tables
>>> + * or not.
>>> + * @nor:     pointer to a 'struct spi_nor'.
>>> + */
>>> +static void spi_nor_init_default_params(struct spi_nor *nor)
>>> +{
>>> +     struct spi_nor_flash_parameter *params = nor->params;
>>> +     const struct flash_info *info = nor->info;
>>> +     struct device_node *np = spi_nor_get_flash_node(nor);
>>> +
>>> +     params->quad_enable = spi_nor_sr2_bit1_quad_enable;
>>> +     params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
>>> +     params->setup = spi_nor_default_setup;
>>> +     params->otp.org = &info->otp_org;
>>> +
>>> +     /* Default to 16-bit Write Status (01h) Command */
>>> +     nor->flags |= SNOR_F_HAS_16BIT_SR;
>>> +
>>> +     /* Set SPI NOR sizes. */
>>> +     params->writesize = 1;
>>> +     params->size = (u64)info->sector_size * info->n_sectors;
>>> +     params->page_size = info->page_size;
>> 
>> I think these two lines should go in spi_nor_info_init_params() since
>> you are using the nor info to initialize these parameters. Otherwise,
>> what even is the difference between these two functions?
> 
> I think a better name for spi_nor_info_init_params() is
> spi_nor_nonsfdp_info_init_params(). This method will eventually be 
> called
> just for non SFDP flashes. Check conversation in 18/35.
> 
> And maybe I should rename spi_nor_nonsfdp_flags_init to
> spi_nor_nonsfdp_info_init_snor_f.

Urgh. I really dislike that suffix. Somehow the flags prefix
creeps into the function name. If that function is expected
to only set the SNOR_F_ flags then there should be a comment.

>> 
>>> +
>>> +     if (!(info->flags & SPI_NOR_NO_FR)) {
>>> +             /* Default to Fast Read for DT and non-DT platform 
>>> devices. */
>>> +             params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
>>> +
>>> +             /* Mask out Fast Read if not requested at DT 
>>> instantiation. */
>>> +             if (np && !of_property_read_bool(np, "m25p,fast-read"))
>>> +                     params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
>>> +     }

Hm, this looks really weird.

why not:

/* default to fast read */
params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;

/* unless the flash doesn't support it */
if (info->flags & SPI_NOR_NO_FR)
     params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;

/* or the device tree doesn't explicitly request it */
if (np && !of_property_read_bool(np, "m25p,fast-read"))
     params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;

I know the old code was the same, but it might go into another
patch. The SPI_NOR_NO_FR suggests that fast read was always the
default. Otherwise, it would have been SPI_NOR_HAS_FAST_READ.

>>> +
>>> +     /* (Fast) Read settings. */
>>> +     params->hwcaps.mask |= SNOR_HWCAPS_READ;
>>> +     spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
>>> +                               0, 0, SPINOR_OP_READ,
>>> +                               SNOR_PROTO_1_1_1);
>>> +
>>> +     if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
>>> +             
>>> spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
>>> +                                       0, 8, SPINOR_OP_READ_FAST,
>>> +                                       SNOR_PROTO_1_1_1);
>>> +     /* Page Program settings. */
>>> +     params->hwcaps.mask |= SNOR_HWCAPS_PP;
>>> +     spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
>>> +                             SPINOR_OP_PP, SNOR_PROTO_1_1_1);
>>> +}
>>> +
>>>  /**
>>>   * spi_nor_manufacturer_init_params() - Initialize the flash's 
>>> parameters and
>>>   * settings based on MFR register and ->default_init() hook.
>>> @@ -2609,43 +2659,8 @@ static void spi_nor_info_init_params(struct 
>>> spi_nor *nor)
>>>       struct spi_nor_flash_parameter *params = nor->params;
>>>       struct spi_nor_erase_map *map = &params->erase_map;
>>>       const struct flash_info *info = nor->info;
>>> -     struct device_node *np = spi_nor_get_flash_node(nor);
>>>       u8 i, erase_mask;
>>> 
>>> -     /* Initialize default flash parameters and settings. */
>>> -     params->quad_enable = spi_nor_sr2_bit1_quad_enable;
>>> -     params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
>>> -     params->setup = spi_nor_default_setup;
>>> -     params->otp.org = &info->otp_org;
>>> -
>>> -     /* Default to 16-bit Write Status (01h) Command */
>>> -     nor->flags |= SNOR_F_HAS_16BIT_SR;
>>> -
>>> -     /* Set SPI NOR sizes. */
>>> -     params->writesize = 1;
>>> -     params->size = (u64)info->sector_size * info->n_sectors;
>>> -     params->page_size = info->page_size;
>>> -
>>> -     if (!(info->flags & SPI_NOR_NO_FR)) {
>>> -             /* Default to Fast Read for DT and non-DT platform 
>>> devices. */
>>> -             params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
>>> -
>>> -             /* Mask out Fast Read if not requested at DT 
>>> instantiation. */
>>> -             if (np && !of_property_read_bool(np, "m25p,fast-read"))
>>> -                     params->hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
>>> -     }
>>> -
>>> -     /* (Fast) Read settings. */
>>> -     params->hwcaps.mask |= SNOR_HWCAPS_READ;
>>> -     spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
>>> -                               0, 0, SPINOR_OP_READ,
>>> -                               SNOR_PROTO_1_1_1);
>>> -
>>> -     if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
>>> -             
>>> spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
>>> -                                       0, 8, SPINOR_OP_READ_FAST,
>>> -                                       SNOR_PROTO_1_1_1);
>>> -
>>>       if (info->flags & SPI_NOR_DUAL_READ) {
>>>               params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
>>>               
>>> spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
>>> @@ -2674,11 +2689,6 @@ static void spi_nor_info_init_params(struct 
>>> spi_nor *nor)
>>>                                         SNOR_PROTO_8_8_8_DTR);
>>>       }
>>> 
>>> -     /* Page Program settings. */
>>> -     params->hwcaps.mask |= SNOR_HWCAPS_PP;
>>> -     spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
>>> -                             SPINOR_OP_PP, SNOR_PROTO_1_1_1);
>>> -
>>>       if (info->flags & SPI_NOR_OCTAL_DTR_PP) {
>>>               params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
>>>               /*
>>> @@ -2823,6 +2833,8 @@ static int spi_nor_init_params(struct spi_nor 
>>> *nor)
>>>       if (!nor->params)
>>>               return -ENOMEM;
>>> 
>>> +     spi_nor_init_default_params(nor);
>>> +
>>>       spi_nor_info_init_params(nor);
>>> 
>>>       spi_nor_manufacturer_init_params(nor);
>> 
>> I am neutral towards this patch. I don't think it improves much, but 
>> at
>> the same time it doesn't make anything worse either.
> 
> I think it helps readability. It splits spi_nor_init_params() into
> smaller logical chunks,
> based on the type of initialization. We should usually avoid long
> methods where we can split
> them in logical chunks, it makes the code pleasant to read.

I'm fine with that. Just want to say, that then we have to think
about what goes where and where we draw the line.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
