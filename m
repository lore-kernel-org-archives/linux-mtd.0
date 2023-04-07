Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70510C761A6
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 02:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSpygplbSwXR81P0NIrV80Wh9jpjb5yp9bx9VDlXn+w=; b=BkdUvq0USL+pGq
	akvhiBzwB66zwAbeUVxoHrgAClpa4KqMsR1jWKnEIGAem+7DKeB+ih2+fwXGONMjTXo62Q7K3z1CM
	p+G2y06fRor8H9RIYjt3NMexfy7OUiQ5b5v4SUflf4VuHAX6do8taOkhl24tJ9rrn9wBEutHw8gWx
	ijbkoFEuHpgmIkLnAJ9JlOrhSGX1sqB0M6XZ5pKykiQCLQlZcEXSo/1pt7IMd09NBHonbmtG0iGcZ
	L0pUAb7DinCmnt4lSCUvo05Wf0zGVu7G+ij2S8fsfd4rI00Fl1kAWkkciei/eyHR2QZZbP9ONBJan
	m5m6TETctp5crAghIfqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkbkv-0090m8-14;
	Fri, 07 Apr 2023 02:23:13 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkbks-0090la-1W
	for linux-mtd@lists.infradead.org;
	Fri, 07 Apr 2023 02:23:11 +0000
Received: by mail-pj1-x1029.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso42262201pjb.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2023 19:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680834189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HZNQFqhyykpum10OuaEqEXWmH6GpfH6pqpADmiN9y94=;
        b=e0x1RMxAO5c8GCN6eFmaT1vYagXs85ItkHSaqOHwAE3k49mf4r/d6Y3cbCdGyNdSCG
         07JA53l9/Z6mLuYM4Q+v8U42jh5UaIKFR72nbPNK5hsazZt3ucm4shpepQxyUu+snIPh
         pTjIWG46sarTk4Wmw715D3uQjzL04sZci3LhYYtMbQeSgkgiwIA8iwqn3tyj4YqtwnfU
         pdPSR/FamCRhfEq8MVJKM9rfagWCShTG6faxgNmuv3JZRKwCQ8hS2K+hh0BrphfxRpRe
         Hcxn5+tC9tEe8SmgXv2CU9TvGypYCeY1eDz9qC3x7upLhge/m8ZqBmhIUSkb9XsYceFZ
         7xEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680834189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZNQFqhyykpum10OuaEqEXWmH6GpfH6pqpADmiN9y94=;
        b=2kLsgc6+Lh1lmjCOXMNEFAnYomqPQt95Lq6WBK1zj51gTdGrOlMoMIji1y6invdnP8
         jMXwsgPPpDl4pAZE1HXI/u7/qGsw6u5AI8wrzjLi90RtielH8k5QmRdQ9YgXfei8Camg
         2scJpGtFHyKzfz7C8Q8RkLwz9dlUcyyrGA+jB5CDM5fN6kvAXz0orwmUUEdNLieNjody
         oKLOstp7utowFEwaLIzd8WlI00G2/+42VrcPENoB++lDCXtjcGUJPv4n9jSjY601+/rq
         +LtE91ZZjV1OKjHCL/jerFQPjGA7NWFWcBaP1jg9GlwedPbalh2/tjZREaoq99nmXZV6
         GX9w==
X-Gm-Message-State: AAQBX9eAmPn+pD7Rd45gZMV+Rp7dR/EaH/QSIq/1zx53BNAGexcM7eEY
	57Ypv+b/HMkXBtVjiFuxy3U=
X-Google-Smtp-Source: AKy350bfq+U9K+smBtsD8rSixM3nY97g6gm0PwRn4zPfmYPFw5rBv78AskEJVebTCdmc2fu6BM/eOg==
X-Received: by 2002:a17:903:230d:b0:199:1160:956c with SMTP id d13-20020a170903230d00b001991160956cmr427838plh.31.1680834188782;
        Thu, 06 Apr 2023 19:23:08 -0700 (PDT)
Received: from [192.168.197.151] (sp49-98-220-119.msd.spmode.ne.jp. [49.98.220.119])
        by smtp.gmail.com with ESMTPSA id a11-20020a170902ee8b00b001a190baea88sm327200pld.97.2023.04.06.19.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 19:23:08 -0700 (PDT)
Message-ID: <7204cf60-3d20-f5dd-cc6a-ef4788e67650@gmail.com>
Date: Fri, 7 Apr 2023 11:23:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 4/8] mtd: spi-nor: sfdp: Add support for SCCR map for
 multi-chip device
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
 <89b7eb9508b28a48c4d0a8b1ef46983202a0d360.1680749578.git.Takahiro.Kuwano@infineon.com>
 <248c1367-b561-1caa-431c-fdf1ebd78d36@linaro.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <248c1367-b561-1caa-431c-fdf1ebd78d36@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_192310_510393_477BC507 
X-CRM114-Status: GOOD (  19.11  )
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

On 4/6/2023 7:44 PM, Tudor Ambarus wrote:
> 
> 
> On 4/6/23 07:18, tkuw584924@gmail.com wrote:
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> SCCR map for multi-chip devices contains the number of additional dice in
>> the device and register offset values for each additional dice.
>>
>> spi_nor_parse_sccr_mc() is added to determine the number of dice and
>> volatile register offset for each die. The volatile register offset table
>> may already be allocated and contains offset value for die-0 via SCCR map
>> parse. So, we should use devm_krealloc() to expand the table with
>> preserving die-0 offset.
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>>  drivers/mtd/spi-nor/sfdp.c | 73 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 73 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> index 9d43e18d3770..00a40bd8aa1e 100644
>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -26,6 +26,11 @@
>>  					 * Status, Control and Configuration
>>  					 * Register Map.
>>  					 */
>> +#define SFDP_SCCR_MAP_MC_ID	0xff88	/*
>> +					 * Status, Control and Configuration
>> +					 * Register Map Offsets for Multi-Chip
>> +					 * SPI Memory Devices.
>> +					 */
>>  
>>  #define SFDP_SIGNATURE		0x50444653U
>>  
>> @@ -1264,6 +1269,70 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
>>  	return ret;
>>  }
>>  
>> +#define SCCR_MC_MAX_DICE		255
>> +
>> +/**
>> + * spi_nor_parse_sccr_mc() - Parse the Status, Control and Configuration
>> + *                           Register Map Offsets for Multi-Chip SPI Memory
>> + *                           Devices.
>> + * @nor:		pointer to a 'struct spi_nor'
>> + * @sccr_mc_header:	pointer to the 'struct sfdp_parameter_header' describing
>> + *			the SCCR Map offsets table length and version.
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
>> +				 const struct sfdp_parameter_header *sccr_mc_header)
>> +{
>> +	struct spi_nor_flash_parameter *params = nor->params;
>> +	u32 *dwords, addr;
>> +	u8 i, n_dice;
>> +	size_t len;
>> +	int ret;
>> +
>> +	len = sccr_mc_header->length * sizeof(*dwords);
>> +	dwords = kmalloc(len, GFP_KERNEL);
>> +	if (!dwords)
>> +		return -ENOMEM;
>> +
>> +	addr = SFDP_PARAM_HEADER_PTP(sccr_mc_header);
>> +	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
>> +	if (ret)
>> +		goto out;
>> +
>> +	le32_to_cpu_array(dwords, sccr_mc_header->length);
>> +
>> +	/*
>> +	 * Pair of DOWRDs (volatile and non-volatile register offsets) per
>> +	 * additional die. Hence, length = 2 * (number of additional dice).
>> +	 */
>> +	n_dice = 1 + sccr_mc_header->length / 2;
>> +	if (params->n_dice > SCCR_MC_MAX_DICE) {
s/params->n_dice/n_dice

> 
> smatch warnings:
> drivers/mtd/spi-nor/sfdp.c:1310 spi_nor_parse_sccr_mc() warn: impossible
> condition '(params->n_dice > 255) => (0-255 > 255)'
> 
> declaring the local variable n_dice as unsigned int should solve the
> problem.
> 
'sccr_mc_header->length' is u8 so n_dice can be 1-128. We can keep
n_dice as u8.

(n_dice > SCCR_MC_MAX_DICE) is impossible condition anyway...
We don't need n_dice check. Otherwise define SCCR_MC_MAX_DICE as smaller
value something like 16. What do you think?

>> +		dev_dbg(nor->dev, "Improbable number of dice defined in SCCR MC table, use one die.\n");
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	/* Address offset for volatile registers of additional dice */
>> +	params->vreg_offset =
>> +			devm_krealloc(nor->dev, params->vreg_offset,
>> +				      n_dice * sizeof(*dwords),
>> +				      GFP_KERNEL);
>> +	if (!params->vreg_offset) {
>> +		ret = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	for (i = 1; i < n_dice; i++)
>> +		params->vreg_offset[i] = dwords[SFDP_DWORD(i) * 2];
>> +
>> +	params->n_dice = n_dice;
> 
> we then truncate it to u8, which is fine.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
