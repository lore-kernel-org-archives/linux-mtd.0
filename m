Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795CFC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 01:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5+yNWnX4ZhNkRPDpttt8ulJ53m5nmyYdxNoyx+nn4o=; b=36cF1SA/oae/Si
	A00NeWktn74qWnhL1r53dFpSjFVZXz+osoF0cC41s6UYpfPejqTvvH5bl50UfPqkffs03Q1x5wH6u
	i9jUSUx0nEVLnO8m43X6A0Nlok2Ua5+9EdGMmeN0pEZO4aUnCFxnJ/GN+BdNOngcNrpKt3S+9LDU4
	ocAs+BbRCp6BYSIbGGRdV75VMrCU80A1WH4taahMC4N1nA1dJFpylSFSzQH+hTBwYIcEZQvPylFbi
	rI7ETM13J7AWFtBoKxdlXyhv4yuSUWCE0ZZ7Ds10Y+UjfpXYtnuLSogkCSN9T8cRoqJ85k6K0+fMa
	MjJ3cW2DUY7G5p8e00Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngzLQ-006sSB-HR; Wed, 20 Apr 2022 01:41:24 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngzLN-006sRh-21
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 01:41:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id n8so420723plh.1
 for <linux-mtd@lists.infradead.org>; Tue, 19 Apr 2022 18:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=riiDVs+c8qhGLm3l1O9suIpUZb3MOEg1Qp9R57GM8Mw=;
 b=Q43XZvKBl2xVnFURcEWf0uc/FT7rhnL3b/Da4tdASiz5+D4mgHpA+4FJ0cImL+D4HI
 pHfLRgEYKBjkXvQu0nhRBiW4m8bsg3Xca/YTALo4dt3iK04cyVs36B8m/1hKqe6KE/LD
 QsdFaHvE030W0OWXl9zJH16K4Np4l7n7f8eQfH1iqNv+6u3zKHDxVe1LWNac6+Xx8obT
 iLmvaIOJic0K29HtwYXzw/8DyL3Va388UO44fblLcX7RUjSXyQLQiJ5I5OjMU6u4++F/
 ss8P6vrlx2AJFJPqLSGbxvmNUfZSO7C0F2y9DZfx0SK7fm3fCkczzL/596865kw8zNEg
 6D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=riiDVs+c8qhGLm3l1O9suIpUZb3MOEg1Qp9R57GM8Mw=;
 b=UuSh0NRvh3uTjX5/cuaZqXoqCIThBymdvrPmY/l9lO49fOVoGNgJBljK3FzLncDZuc
 cr49JzChoLG2DRQ1KTHHRVberkTXyFZGMYdejdjjjiK8JlPrEbI+bolgWqH6Ly4UA5Vb
 Ml9HyQWEZQlOrbZV5qWtrDmPrQkLJ1CHrBvGCHDThlMQ9I/rcnO/feyFofTnbofhJYQV
 ka88Zb41eWmL3Uq7qqh2/RvzH0ZSbbRDefU22BDGZhmxMVvuQH5TVbAkT7FsnL8QYZDd
 BaBHPf87H3sU2BEqnA+9ZVZ/zfpxEXPIjV81dpNZ1qm9RmKXdpedsuz3QdGW8ttZyWoN
 DovA==
X-Gm-Message-State: AOAM531I6vJ9CBFrjGOaVR+s/24LWx3bRHJxf3qBwD6NUFRD7zyc4plb
 TBt+NqRqMcaaM6DKyEaHj1E=
X-Google-Smtp-Source: ABdhPJwKqf3CE4jIDWrLPiXr/lEGt/jv6rLFRIuBM1iS6cs8xEowJC+1p30Wkc3DjYHd8zuO8Dp2ag==
X-Received: by 2002:a17:903:1252:b0:154:ca85:59a0 with SMTP id
 u18-20020a170903125200b00154ca8559a0mr18620943plh.169.1650418879605; 
 Tue, 19 Apr 2022 18:41:19 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a17090ab28700b001ca9514df81sm16929804pjr.45.2022.04.19.18.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 18:41:19 -0700 (PDT)
Message-ID: <3ac22afa-b79c-7022-ebe6-a2e477b19d46@gmail.com>
Date: Wed, 20 Apr 2022 10:41:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v11 2/3] mtd: spi-nor: spansion: Add local function to
 discover page size
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <7695c40251f2fa13f42259ca28150d41b72e7cf0.1650259501.git.Takahiro.Kuwano@infineon.com>
 <3fbf1d6d-918b-2ebf-ee7d-6e09cc0eac74@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <3fbf1d6d-918b-2ebf-ee7d-6e09cc0eac74@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_184121_172620_41AB1FBF 
X-CRM114-Status: GOOD (  22.16  )
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



On 4/19/2022 5:06 PM, Tudor.Ambarus@microchip.com wrote:
> On 4/18/22 08:41, tkuw584924@gmail.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> The page size check in s28hs512t fixup can be used for s25hs/hl-t as well.
>> Move that to a newly created local function.
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>> Changes in v11:
>>   - Rebase on top of Tudor's series
>>     https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
>>   - Add addr_width param
>>
>>  drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++--------------
>>  1 file changed, 32 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 6bcd25180af4..493240ebfd70 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -177,6 +177,37 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>>         return 0;
>>  }
>>
>> +/**
>> + * cypress_nor_set_page_size() - Set page size which corresponds to the flash
>> + *                               configuration.
>> + * @nor:       pointer to a 'struct spi_nor'
>> + * @addr_width:        address width used in Read Any Register op
>> + *
>> + * The BFPT table advertises a 512B or 256B page size depending on part but the
>> + * page size is actually configurable (with the default being 256B). Read from
>> + * CFR3V[4] and set the correct size.
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +static int cypress_nor_set_page_size(struct spi_nor *nor, u8 addr_width)
>> +{
>> +       struct spi_mem_op op =
>> +               CYPRESS_NOR_RD_ANY_REG_OP(addr_width, SPINOR_REG_CYPRESS_CFR3V,
>> +                                         nor->bouncebuf);
>> +       int ret;
>> +
>> +       ret = spi_nor_read_reg(nor, &op, nor->reg_proto);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
>> +               nor->params->page_size = 512;
>> +       else
>> +               nor->params->page_size = 256;
>> +
>> +       return 0;
>> +}
>> +
>>  /**
>>   * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>>   * @nor:               pointer to a 'struct spi_nor'
>> @@ -231,28 +262,7 @@ static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
>>                                      const struct sfdp_parameter_header *bfpt_header,
>>                                      const struct sfdp_bfpt *bfpt)
>>  {
>> -       /*
>> -        * The BFPT table advertises a 512B page size but the page size is
>> -        * actually configurable (with the default being 256B). Read from
>> -        * CFR3V[4] and set the correct size.
>> -        */
>> -       struct spi_mem_op op =
>> -               CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR3V,
>> -                                         nor->bouncebuf);
>> -       int ret;
>> -
>> -       spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>> -
>> -       ret = spi_mem_exec_op(nor->spimem, &op);
>> -       if (ret)
>> -               return ret;
>> -
>> -       if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
>> -               nor->params->page_size = 512;
>> -       else
>> -               nor->params->page_size = 256;
>> -
>> -       return 0;
>> +       return cypress_nor_set_page_size(nor, 3);
> 
> not related to this patch, but can we use nor->add_width instead of 3?
> 
I confirmed with a s28hs512t device on hand that nor->addr_width is set
to 3 during BFPT parse. We can use nor->addr_width and eliminate addr_width
param from cypress_nor_set_page_size(). I will do it in next rev.

> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
>>  }
>>
>>  static const struct spi_nor_fixups s28hs512t_fixups = {
>> --
>> 2.25.1
>>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
