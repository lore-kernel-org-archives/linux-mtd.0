Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62265C4708F
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 08:10:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EDF86128A
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 08:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EDF86128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jcu6/IMbhVP+iAkVNCKj1Cut2A30aYCFA9CGx8NwHbE=; b=nEOEmEyskWlpIdRIVkZ6Bhys82
	RMZhkKfO7unJKlOXHtjSURK+1s1mOsdJIii0TASlvG/V7uNQi8JMPJ4cqjsK7akQjYm2xP4TUnmst
	yd0EFMkLGGQYUW95HvawFKcudhIkBJ1gfyQ295w8XPh0P0ZNk4vNT2IhFFDefz5OpUa/beGAVLAlT
	Kxhn7fRcr4NomS+An1h+DX5gP5beHlQudRSyoFztm7ACajQqkukKm8J3Lvn66CR7jDSVzeEXoEyL4
	JhoNL/35KrfR7MCla5eh+AxCVcTWimel4IXg/zD9AFlqzOpUu+HG1nTwvHmJcFgV3c2fNI/FLmp3Y
	mnvhPE8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnzTF-00FF03-HO; Tue, 01 Jun 2021 08:09:53 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnzTC-00FEze-CG
 for linux-mtd@lists.infradead.org; Tue, 01 Jun 2021 08:09:51 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso1159535pjz.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Jun 2021 01:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FVHU4gNGZOy159lKqrbDL1WElwI4JBhy8fgas6K5BAg=;
 b=Wdjghhe8LjBSRnoa7muuOYIe46AIFNOac73WDrVb0xOkMlt40AJ02LL9bU2ygiFalZ
 YItqNoQU08a5ZfYesNzT92tVxtFhgdue9WWZ22tlBYGlmbsbaOMgiVpeLnzFCs2Ha6+O
 9JzIIP8gie24cJcGYffSMxHY9tVZdbzjptcRZRpePBibP7EWA1sSoPqd4uUM6RlRRIvy
 Xx+vl+4nUisHq+noOk3iSsNFdA2stltkpy5Nec4OETWFHTm590mn0RBND0hglWYVrSUQ
 AhQSNSX4W8hKCJ52kPEJqrlcP9vMBMtoaubyXuGY8NQ++MWMchanhF5PzmGqQex4elCa
 52dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FVHU4gNGZOy159lKqrbDL1WElwI4JBhy8fgas6K5BAg=;
 b=HvA5t2LD2KyCr5+rPztM+MgNQcY7sWrI7ZjgTcUruY0QiCuLrH2PxdvhucaGsbVt+u
 jbR1Roy8M8TPQugVE3O0U1uR4jJb8cwNXd0p6gdzcHzpCd26Qgi7+HM3pHdADoPpIpZG
 iAC0r7/q/6561rN/ESgKvOdDK64Shi8lyPvIQ9yQfb3CcEIFuqcph+mlCPlNlaYqgwl0
 s8oaPyG+EmiCJCmZSU/Ok9XVm1A0c2KKMlOaY90ZH5GOR76qDIEIt2DfokclWsEko4J5
 hYp8OQUsAj7tx9N8wgQjai0e8nQiCQUa6y0PjmmRisXybnTEy+dT83Y4olxYNE75Yd+w
 wfsA==
X-Gm-Message-State: AOAM531zc4oKraCIcHiEF+muLqKezQGvOQ6TuEKTMRbt+QKlFCS4iheX
 DIW3MPdqsFXoNMVk1nvbRwI=
X-Google-Smtp-Source: ABdhPJz86TbXWYRH3/sVh5kqT2fyLpmJEMBJmGQCBX0r2eqyKTFJkN07QHJVLSSnK/y3bJJH1N4ZbA==
X-Received: by 2002:a17:90b:e04:: with SMTP id
 ge4mr11253732pjb.230.1622534989169; 
 Tue, 01 Jun 2021 01:09:49 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id o27sm13638064pgb.70.2021.06.01.01.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 01:09:48 -0700 (PDT)
Subject: Re: [PATCH v5 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
To: Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 p.yadav@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
 <28d1a4015f37156a8bebe88959ea643e64b030f8.1619504535.git.Takahiro.Kuwano@infineon.com>
 <6b329250-93f4-bbbe-048f-696de9436342@ti.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
Message-ID: <eaef8b5b-a0bc-164b-11f6-3deced631029@gmail.com>
Date: Tue, 1 Jun 2021 17:09:37 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <6b329250-93f4-bbbe-048f-696de9436342@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_010950_470547_92D63873 
X-CRM114-Status: GOOD (  28.26  )
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

Hi Vignesh,

On 5/27/2021 10:20 PM, Vignesh Raghavendra wrote:
> 
> 
> On 4/27/21 12:39 PM, tkuw584924@gmail.com wrote:
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
>>
>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>> uniform sector sizes are supported. For the multi-die package parts (2Gb),
>> only uniform sector sizes is supprted. This is due to missing or incorrect
>> entries in SMPT. Fixup for other sector sizes configurations will be
>> followed up as needed.
>>
>> Tested on Xilinx Zynq-7000 FPGA board.
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
>> ---
>> Changes in v5:
>>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
>>
>> Changes in v4:
>>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
>>
>> Changes in v3:
>>   - Remove S25HL256T and S25HS256T
>>   - Add S25HL02GT and S25HS02GT 
>>   - Add support for multi-die package parts support
>>   - Remove erase_map fix for top/split sector layout
>>   - Set ECC data unit size (16B) to writesize 
>>
>>  drivers/mtd/spi-nor/spansion.c | 117 +++++++++++++++++++++++++++++++++
>>  1 file changed, 117 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 79d3249ed0aa..b3b006874b4f 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -229,6 +229,103 @@ static int spansion_mdp_ready(struct spi_nor *nor, u8 reg_dummy, u32 die_size)
>>  	return 1;
>>  }
>>  
>> +static int s25hx_t_quad_enable(struct spi_nor *nor)
>> +{
>> +	return spansion_quad_enable_volatile(nor, 0, SZ_128M);
> 
> Number of dies should be part of struct flash_info
> Die size can then be derived from total_size / die_num
> 
> 
>> +}
>> +
>> +static int s25hx_t_mdp_ready(struct spi_nor *nor)
>> +{
>> +	return spansion_mdp_ready(nor, 0, SZ_128M);
> 
> Hmm, is it necessary to poll second die if writes/erases were targeted
> to first die only?
> 
> Please split multi die support into a separate series. SPI NOR core
> should be aware of multiple dies and thus call poll on each of the dies
> separately.
> 
> This will also allow base S25hx support to be accepted faster.
> 
OK, I will do it.

>> +}
>> +
>> +static int
>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>> +			 const struct sfdp_parameter_header *bfpt_header,
>> +			 const struct sfdp_bfpt *bfpt,
>> +			 struct spi_nor_flash_parameter *params)
>> +{
>> +	int ret;
>> +	u32 addr;
>> +	u8 cfr3v;
>> +
>> +	ret = spi_nor_set_4byte_addr_mode(nor, true);
>> +	if (ret)
>> +		return ret;
>> +	nor->addr_width = 4;
> 
> Don't we need to check if flash size is actual >16M before enabling 4
> byte addressing?
> 
S25HL/HS-T family has >16M devices only so we don't have to check it.

>> +
>> +	/* Replace Quad Enable with volatile version */
>> +	params->quad_enable = s25hx_t_quad_enable;
>> +
>> +	/*
>> +	 * The page_size is set to 512B from BFPT, but it actually depends on
>> +	 * the configuration register. Look up the CFR3V and determine the
>> +	 * page_size. For multi-die package parts, use 512B only when the all
>> +	 * dies are configured to 512B buffer.
>> +	 */
>> +	for (addr = 0; addr < params->size; addr += SZ_128M) {
>> +		ret = spansion_read_any_reg(nor,
>> +					    addr + SPINOR_REG_CYPRESS_CFR3V, 0,
>> +					    &cfr3v);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (!(cfr3v & SPINOR_REG_CYPRESS_CFR3V_PGSZ)) {
>> +			params->page_size = 256;
>> +			return 0;
>> +		}
>> +	}
>> +	params->page_size = 512;
>> +
>> +	return 0;
>> +}
>> +
> Regards
> Vignesh
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
