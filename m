Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942C1EB64DD
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Aug 2023 08:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGKGMdaiAsQfT+tgxoZAMTLFvzjRvpGBe3PXIu92rG8=; b=F168tIlNuUsdjf
	udKY9Kcn5xwLi+dY89Lb9lk08tfeMnsAf+2+3EzWUWDenAxLNAoZtGr+8rKpy6bI74UmpQPDh82Wc
	Eq4a1XKp6w7gTVZh8Nfu/jEMNaYVeZGblxV89ujmszqF9J6uwsirgxKPtvxAqrLtx1DSKzNs35LOV
	DCg0K/B47aEo1+5wX+nVMwIVBzqNjBJYxxkzhHa4wAl8hadc5VxZ1WR/sMJH2OOI1xEzalunnaXTt
	FB5g4X360y7obmxMBwltYElTXPWEDL9+qEKZWYTa0NL7/zqWXCWyk8hupmf0nlkq7bDUu0i3Ak589
	6wWtNJWvVLBenI1XV5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQkYJ-000dLl-03;
	Tue, 01 Aug 2023 08:16:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQkYE-000dL0-2z
	for linux-mtd@lists.infradead.org;
	Tue, 01 Aug 2023 08:16:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so49528515e9.3
        for <linux-mtd@lists.infradead.org>; Tue, 01 Aug 2023 01:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690877775; x=1691482575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynAO5o4tSQ8s1HZg7ZJnmvdppAu0vY/vsEMze6xPyaM=;
        b=pvrJWFDLxQaVjipbhQbpBr+nQUPFI8Gnrl4Wl/EsUs/hKP9URaxhI/uT8xB8YI0uG0
         BkYB5xfXiILEzgk54V7MDiZ6RkOcoO8T/8qO2cytRSqQXmzF8pODpPzdH3qZYh2W89RG
         BG2W6iq94aUdKC6yEbYhCQFBaHUUD8QAEqXhZqNomdVruzzXyFxywF1CfwD8lWmKwCxi
         R+Cob9i7Ae85ynC7u6zdaBAtjczaQS69ItL3PoyHpIIhPBI5KOJgzxHbAz7v6XLeU6Y8
         Pu75BOA3xySvP/I5fJUG0m8PICdpIBXakZ4Jb+AUwpbe2wmPTuGxaI/jkjaIco9zbLEQ
         NfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690877775; x=1691482575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynAO5o4tSQ8s1HZg7ZJnmvdppAu0vY/vsEMze6xPyaM=;
        b=I85xo04J+ChOlrteQZQz5DZG6m2b3wNCkjHubQkBCWhp4KBLSj/Mp1+96IDcFMNXDY
         m1dxEfGLyQ6GeIPowTQMqkgOq+D5ANnyhw/nQ9CU2n0XtNZMprjfzr9wVR8UqqH+eAft
         zhxDCVqy264yHfB+6GM+dOe0XHRYqSH+ngp6xN9PrXS26hnkq0eDXKo/5Sz1ole6i56T
         tpk0ZHaU1gWI24i6RfuO3rjjcbkB5Dg94NwN2jCOad5PNT85k9nFtVLYjuyT+y0oFNP/
         Sax+vzqLh/sWoPqroVhGqN3Ahe8mWjP76ZOsbsyebZs5Uif6sCEGqkWg4mE2nBXu+nuA
         42NQ==
X-Gm-Message-State: ABy/qLYHFpBawBWfqccrk03y3x271ruNnFoXZM8a8ET10FjzxlKYAryA
	ULZBR3u7ncdJJQTuI01Vf2R2eTgK5vlRjTD9XJU=
X-Google-Smtp-Source: APBJJlG5krWO1AUw5UoNP0/w6PCVPaZSLzuDBsKcx3nnZyTvW6WldRNWq0c3tMyoULKVJzEHIHnT9A==
X-Received: by 2002:a5d:464c:0:b0:317:5f13:5c2f with SMTP id j12-20020a5d464c000000b003175f135c2fmr1628673wrs.0.1690877775121;
        Tue, 01 Aug 2023 01:16:15 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.2])
        by smtp.gmail.com with ESMTPSA id s6-20020a5d6a86000000b003143add4396sm15351192wru.22.2023.08.01.01.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 01:16:14 -0700 (PDT)
Message-ID: <1df1d6af-3499-68dd-4e55-952199f445f4@linaro.org>
Date: Tue, 1 Aug 2023 09:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add Octal DTR support for Macronix
 flash
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc,
 miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 JaimeLiao <jaimeliao@mxic.com.tw>
References: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
 <20230727091610.234132-2-jaimeliao.tw@gmail.com>
 <ae53bde4-33d0-861d-b7f4-b86114cd6f58@linaro.org>
 <CAAQoYR=89oZr3cjeXgei+Ofkjb76mphSFLy_QvQD9QTFcDPx+g@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAAQoYR=89oZr3cjeXgei+Ofkjb76mphSFLy_QvQD9QTFcDPx+g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_011619_067830_0BB37AA8 
X-CRM114-Status: GOOD (  28.33  )
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



On 8/1/23 08:24, liao jaime wrote:
> Hi Tudor
> 
>>
>>
>>
>> On 7/27/23 10:16, Jaime Liao wrote:
>>> From: JaimeLiao <jaimeliao@mxic.com.tw>
>>>
>>> Create Macronix specify method for enable Octal DTR mode and
>>> set 20 dummy cycles to allow running at the maximum supported
>>> frequency for Macronix Octal flash.
>>
>> 20 dummy cycles is particular for a specific operating frequency.
>>
>> If you test the flash at different speeds, let's say at 30 MHz, and
>> at their highest frequency (133, 200 MHZ?) does the flash work with
>> current settings?
> Yes, datasheet include "Dummy Cycle and Frequency Table" for checking.
> For Macronix spi-nor flash, 20 or 18 dummy cycles should be use at 200MHz.
> It alse means that DC 20 is suit for other frequency(<=200MHz).
> 

You didn't answer my question. Does the flash work at 30 MHz by using 20
dummy cycles?
>>>
>>> For enable Macronix flashes in Octal DTR mode, Configuration
>>> Register2 DOPI bit should be set and DC bit setting for dummy
>>> cycles.
>>
>> Use imperative.
> I didn't get it.

Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour. Please read:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

> 
>>>
>>> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
>>> Co-developed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>> ---
>>>  drivers/mtd/spi-nor/macronix.c | 97 ++++++++++++++++++++++++++++++++++
>>>  1 file changed, 97 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>>> index 04888258e891..b397fd274868 100644
>>> --- a/drivers/mtd/spi-nor/macronix.c
>>> +++ b/drivers/mtd/spi-nor/macronix.c
>>> @@ -8,6 +8,22 @@
>>>
>>>  #include "core.h"
>>>
>>> +#define SPINOR_OP_MXIC_RD_ANY_REG    0x71            /* Read volatile configuration register 2 */
>>> +#define SPINOR_OP_MXIC_WR_ANY_REG    0x72            /* Write volatile configuration register 2 */
>>> +#define SPINOR_REG_MXIC_CR2_MODE     0x00000000      /* For setting octal DTR mode */
>>> +#define SPINOR_REG_MXIC_CR2_DC               0x00000300      /* For setting dummy cycles */
>>> +#define SPINOR_REG_MXIC_OPI_DTR_EN   0x2             /* Enable Octal DTR */
>>> +#define SPINOR_REG_MXIC_SPI_EN               0x0             /* Enable SPI */
>>> +#define SPINOR_REG_MXIC_DC_20                0x0             /* Setting dummy cycles to 20 */
>>> +#define SPINOR_REG_MXIC_ADDR_BYTES   4               /* Fixed R/W volatile address bytes to 4 */
>>> +
>>> +/* Macronix SPI NOR flash operations. */
>>> +#define MXIC_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)              \
>>> +     SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MXIC_WR_ANY_REG, 0),                \
>>> +                SPI_MEM_OP_ADDR(naddr, addr, 0),                     \
>>> +                SPI_MEM_OP_NO_DUMMY,                                 \
>>> +                SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
>>> +
>>>  static int
>>>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>>>                           const struct sfdp_parameter_header *bfpt_header,
>>> @@ -105,9 +121,90 @@ static const struct flash_info macronix_nor_parts[] = {
>>>               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>>>  };
>>>
>>> +static int macronix_nor_octal_dtr_en(struct spi_nor *nor)
>>> +{
>>> +     struct spi_mem_op op;
>>> +     u8 *buf = nor->bouncebuf, i;
>>> +     int ret;
>>> +
>>> +     /* Use 20 dummy cycles for memory array reads. */
>>> +     buf[0] = SPINOR_REG_MXIC_DC_20;
>>> +     op = (struct spi_mem_op)
>>> +             MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
>>> +                                    SPINOR_REG_MXIC_CR2_DC, 1, buf);
>>> +
>>> +     ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     /* Set the octal and DTR enable bits. */
>>> +     buf[0] = SPINOR_REG_MXIC_OPI_DTR_EN;
>>> +     op = (struct spi_mem_op)
>>> +             MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
>>> +                                    SPINOR_REG_MXIC_CR2_MODE, 1, buf);
>>> +     ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     /* Read flash ID to make sure the switch was successful. */
>>> +     ret = spi_nor_read_id(nor, 4, 4, buf, SNOR_PROTO_8_8_8_DTR);
>>> +     if (ret) {
>>> +             dev_dbg(nor->dev, "error %d reading JEDEC ID after enabling 8D-8D-8D mode\n", ret);
>>> +             return ret;
>>> +     }
>>> +
>>> +     /* Macronix SPI-NOR flash 8D-8D-8D read ID would get 6 bytes data A-A-B-B-C-C */
>>> +     for (i = 0; i < nor->info->id_len; i++)
>>> +             if (buf[i * 2] != nor->info->id[i])
>>> +                     return -EINVAL;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int macronix_nor_octal_dtr_dis(struct spi_nor *nor)
>>> +{
>>> +     struct spi_mem_op op;
>>> +     u8 *buf = nor->bouncebuf;
>>> +     int ret;
>>> +
>>> +     /*
>>> +      * The register is 1-byte wide, but 1-byte transactions are not
>>> +      * allowed in 8D-8D-8D mode. Since there is no register at the
>>> +      * next location, just initialize the value to 0 and let the
>>> +      * transaction go on.
>>> +      */
>>> +     buf[0] = SPINOR_REG_MXIC_SPI_EN;
>>> +     buf[1] = 0x0;
>>> +     op = (struct spi_mem_op)
>>> +             MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
>>> +                                    SPINOR_REG_MXIC_CR2_MODE, 2, buf);
>>> +     ret = spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     /* Read flash ID to make sure the switch was successful. */
>>> +     ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
>>> +     if (ret) {
>>> +             dev_dbg(nor->dev, "error %d reading JEDEC ID after disabling 8D-8D-8D mode\n", ret);
>>> +             return ret;
>>> +     }
>>> +
>>> +     if (memcmp(buf, nor->info->id, nor->info->id_len))
>>> +             return -EINVAL;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int macronix_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
>>> +{
>>> +     return enable ? macronix_nor_octal_dtr_en(nor) :
>>> +                     macronix_nor_octal_dtr_dis(nor);
>>> +}
>>> +
>>>  static void macronix_nor_default_init(struct spi_nor *nor)
>>>  {
>>>       nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
>>> +     nor->params->octal_dtr_enable = macronix_nor_octal_dtr_enable;
>>
>> this must be done in the late_init hook, I'd like to get rid of the
>> default_init hook.
> nor->params->quad_enable should be move in late_init or
> nor->params->octal_dtr_enable only?

quad_enable should be parsed from sfdp, thus we have to get rid of
setting quad_enable in a dedicated hook. Remove it entirely, but in a
dedicated patch. Of course, I expect you test the change and verify
that quad still works on all the affected flashes.

octal_dtr_enable should be set in late_init as we don't retrieve the
octal dtr enable from SFDP yet.
> 
>>>  }
>>>
>>>  static void macronix_nor_late_init(struct spi_nor *nor)
> 
> Thanks
> Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
