Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE6AC76196
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 06:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MA0LBzhEuCj1GRgkOayxcoDBOxOPDXj8C+HppiaOLAs=; b=c9gd2ULo117re5
	VkN3aHWlo6i+zLjpDq0QSYegUZvjLzjcQCz4I56/2Fxy4iNjstWW3qWOWsoPAEeaxASTEQiUw0X2/
	5xAz1PMHI+lHfvk1AwAi3K3Ac1Akwu8rL6ws/T4jVnU4VT3Z2+5RyxRxVm0V44u63H7FvtWAJZ6xU
	N6JCAwLbUR7q4s91WwOUhQz1d7Q1dW7+ZynBvBQVv9CKDg9Onbzk7n4/NMqgOECObFJZYToIdOTAR
	yUWDYnXk63u2Y6ACwOY6P95OxxiNOzN12A690GLda3LHnpGu2auUTNcpJXdej0xfhwJTV0ulsru8Z
	t73HKnQYxDIfdEVEOS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfRn-009Fy6-2s;
	Fri, 07 Apr 2023 06:19:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfRj-009FxW-0u
	for linux-mtd@lists.infradead.org;
	Fri, 07 Apr 2023 06:19:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id he13so3941520wmb.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2023 23:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680848375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2lRhQuNyEiS2pI7fMDvuPJ+5XPBpdrdt8Gyr2HdUC4=;
        b=cJGwN8a4mjpkXmlp6+8KJi3KZ7qNnMX+8uL/ua9pvyjhwlKKgvMk4tGrP7NOVeUiNw
         xn0C5Fv6O0/Z39zv7Xm5wDG987ZGz4TqMawQ+T/uugSExURZEoX3LpRgb05L1MrDwSpK
         69R+SYXxGWJkXWn3CmvppkbAxjMD9ge95R1bGNfSqtTz5tnwdD3JgAEplLCyQjKlO/8e
         KYMRumyGYe2tsVR6cOequsnWc70wV0gKcejiFEYxffK+XuOzBSJwfOHpWmsoot5pdvjw
         l2t/qE085toeKPLVNhBysfLx0Vi+/HyppoPwzIOOPBwO4RzgztG9qqZ4usaT1nU9hO3E
         gfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680848375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2lRhQuNyEiS2pI7fMDvuPJ+5XPBpdrdt8Gyr2HdUC4=;
        b=APHtFDSliGd8EmGbfaD0x1j/Rg9nP8j5tWhRfFIyRCBxZaP+TSnm36k5GxT9fS9EhZ
         YhlAR2y6H2esb0KEQJm9fuRcG6s5JC02ionQZ7IHxr3ddAL+eU6DYQ7L2c9KK0i4tlXe
         72bNKRsMGn+nzjZnv8siHBP5Ij6GqjSrk/uT342O0qrRSqN2PJw5SSkrNqI8Zieb9V5N
         Xtyy+fQi+NuI96AYgSGnUWl3Jw33SkOLVBN3fUwktVrh29qr5IjvpmcXPBv6BFiTMVnz
         /1i2nQdAA9WueoqM8+/fJYPlICzocgFVJVHxTt6/z8oLTGXDslp+3Fk1NUJViGFKN7ST
         QpIg==
X-Gm-Message-State: AAQBX9fkVmscsJyAYWzbVp/U7Id8eWOqGl9IRX9uAEq0E7/w4sPFRMkR
	2Ns3pLiQUbru0fZf6kGZ38gWuw==
X-Google-Smtp-Source: AKy350bg5i3fu9+QHJkL6sW9Jr7WGzpirkSgRbh31WEsUFu9rM98FFQrzV51SKN8rWhQ+6O9iZqwHg==
X-Received: by 2002:a05:600c:21d1:b0:3ed:fddf:b771 with SMTP id x17-20020a05600c21d100b003edfddfb771mr481188wmj.12.1680848375356;
        Thu, 06 Apr 2023 23:19:35 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id z12-20020a7bc7cc000000b003edd1c44b57sm3504865wmk.27.2023.04.06.23.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 23:19:13 -0700 (PDT)
Message-ID: <0c0cdfcc-a5ca-296c-34f5-a46134ed48ce@linaro.org>
Date: Fri, 7 Apr 2023 07:19:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/8] mtd: spi-nor: sfdp: Add support for SCCR map for
 multi-chip device
Content-Language: en-US
To: Takahiro Kuwano <tkuw584924@gmail.com>, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
 <89b7eb9508b28a48c4d0a8b1ef46983202a0d360.1680749578.git.Takahiro.Kuwano@infineon.com>
 <248c1367-b561-1caa-431c-fdf1ebd78d36@linaro.org>
 <7204cf60-3d20-f5dd-cc6a-ef4788e67650@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <7204cf60-3d20-f5dd-cc6a-ef4788e67650@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_231939_357223_C92F3DBC 
X-CRM114-Status: GOOD (  18.86  )
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



On 4/7/23 03:23, Takahiro Kuwano wrote:
> Hi Tudor,
> 

Hi!

> On 4/6/2023 7:44 PM, Tudor Ambarus wrote:
>>
>>
>> On 4/6/23 07:18, tkuw584924@gmail.com wrote:
>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>
>>> SCCR map for multi-chip devices contains the number of additional dice in
>>> the device and register offset values for each additional dice.
>>>
>>> spi_nor_parse_sccr_mc() is added to determine the number of dice and
>>> volatile register offset for each die. The volatile register offset table
>>> may already be allocated and contains offset value for die-0 via SCCR map
>>> parse. So, we should use devm_krealloc() to expand the table with
>>> preserving die-0 offset.
>>>
>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>> ---
>>>  drivers/mtd/spi-nor/sfdp.c | 73 ++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 73 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>>> index 9d43e18d3770..00a40bd8aa1e 100644
>>> --- a/drivers/mtd/spi-nor/sfdp.c
>>> +++ b/drivers/mtd/spi-nor/sfdp.c
>>> @@ -26,6 +26,11 @@
>>>  					 * Status, Control and Configuration
>>>  					 * Register Map.
>>>  					 */
>>> +#define SFDP_SCCR_MAP_MC_ID	0xff88	/*
>>> +					 * Status, Control and Configuration
>>> +					 * Register Map Offsets for Multi-Chip
>>> +					 * SPI Memory Devices.
>>> +					 */
>>>  
>>>  #define SFDP_SIGNATURE		0x50444653U
>>>  
>>> @@ -1264,6 +1269,70 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
>>>  	return ret;
>>>  }
>>>  
>>> +#define SCCR_MC_MAX_DICE		255
>>> +
>>> +/**
>>> + * spi_nor_parse_sccr_mc() - Parse the Status, Control and Configuration
>>> + *                           Register Map Offsets for Multi-Chip SPI Memory
>>> + *                           Devices.
>>> + * @nor:		pointer to a 'struct spi_nor'
>>> + * @sccr_mc_header:	pointer to the 'struct sfdp_parameter_header' describing
>>> + *			the SCCR Map offsets table length and version.
>>> + *
>>> + * Return: 0 on success, -errno otherwise.
>>> + */
>>> +static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
>>> +				 const struct sfdp_parameter_header *sccr_mc_header)
>>> +{
>>> +	struct spi_nor_flash_parameter *params = nor->params;
>>> +	u32 *dwords, addr;
>>> +	u8 i, n_dice;
>>> +	size_t len;
>>> +	int ret;
>>> +
>>> +	len = sccr_mc_header->length * sizeof(*dwords);
>>> +	dwords = kmalloc(len, GFP_KERNEL);
>>> +	if (!dwords)
>>> +		return -ENOMEM;
>>> +
>>> +	addr = SFDP_PARAM_HEADER_PTP(sccr_mc_header);
>>> +	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
>>> +	if (ret)
>>> +		goto out;
>>> +
>>> +	le32_to_cpu_array(dwords, sccr_mc_header->length);
>>> +
>>> +	/*
>>> +	 * Pair of DOWRDs (volatile and non-volatile register offsets) per
>>> +	 * additional die. Hence, length = 2 * (number of additional dice).
>>> +	 */
>>> +	n_dice = 1 + sccr_mc_header->length / 2;
>>> +	if (params->n_dice > SCCR_MC_MAX_DICE) {
> s/params->n_dice/n_dice
> 
>>
>> smatch warnings:
>> drivers/mtd/spi-nor/sfdp.c:1310 spi_nor_parse_sccr_mc() warn: impossible
>> condition '(params->n_dice > 255) => (0-255 > 255)'
>>
>> declaring the local variable n_dice as unsigned int should solve the
>> problem.
>>
> 'sccr_mc_header->length' is u8 so n_dice can be 1-128. We can keep
> n_dice as u8.
> 
> (n_dice > SCCR_MC_MAX_DICE) is impossible condition anyway...
> We don't need n_dice check. Otherwise define SCCR_MC_MAX_DICE as smaller
> value something like 16. What do you think?
> 

Indeed. Let's get rid of the check entirely. Keep n_dice as u8, remove
SCCR_MC_MAX_DICE and the check.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
