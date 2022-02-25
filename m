Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC12CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+uwW4N7nRBDr/lROMewmRjA8yzq+iUiobMVLpaiOWw=; b=PFPjPtfV1C4tw0
	bX4FtcPaBpHxZ+Q5ZTEpLNLGPsnwAIQ/E0SP3wsouLYV9/v9b2tJLsPcinXYJjZ6H9E5Af4VXjtiF
	UF1ExIUNjj/+vL6W7IraYfU+4VHCP5J889PMkkLqkM1CPKbXvqb1RPNfZ5+XnM5tEdJmtSERe9Knj
	JhrGmfZZb5Jh0EqpiD2VuGdh8Tn/XIHV55Y1e2GXZySqE6rRHimabTPo6ytcfaf0FHP4H6tsLAzIm
	yFXfOUkRiSdUutFXIshczLJiqFDo6DuaUqLBkYPqwhONcLm7z0KSkfXJSbBEFWT2FkSooNN7tJvS9
	/W1MF5nLMicN5+F3aqTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNWgY-00466z-Si; Fri, 25 Feb 2022 09:14:47 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNWgT-00464Y-I1
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 09:14:43 +0000
Received: by mail-pg1-x533.google.com with SMTP id z4so4101715pgh.12
 for <linux-mtd@lists.infradead.org>; Fri, 25 Feb 2022 01:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4Bf/T5ldGMk1GxkLqDHpGCJBOCKRaqWaBmPfvoxiyPs=;
 b=DJr66FzcVMgyOuw3gKae9OXZxRemRIS5eZA2cNlJvYeQUDk1dunWBNrOxmA/VNS6WA
 1Yh04evYKQfan70S/9VYcVQuaqVuOO/dBhjQ4ScO1d68YuoPyslmtqNlTIJedSv+3Mx9
 N5lQg0MdfM7Ehf0jEyHcagLIi7OmcDacskxv/dmGaMU15wudjoykqmWUURCzF98bKHFm
 ImhKk1Ko/tL1wJRfRG6BhMT0rvvjHmNhSIhfxMLBAYcGUITICNAE70QzJLT/fDZm5SFE
 pZ6IPHVAMsfXgrfBj5dx/7fY19tArqayBWCnA9kpb37qVM9Mb1mWDPohEKeNIy3WVeu3
 k9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4Bf/T5ldGMk1GxkLqDHpGCJBOCKRaqWaBmPfvoxiyPs=;
 b=B3Xh1pSGjW0UDHmEa5JbIsqQEI9VYPigDpdfd0ilJS7l9jDkBsdv8NtYHgsWB9YbPI
 tXKJIWPjlnZ7HBLq66DcqTuU8pEv9OB0x4maEmD/wAXKCgIW2x/X21NTtZ0DDqtfS1Iq
 o9ChUIedvC8EjvDEf+hMmawzDL1GcrXS50MAauiWNcvmYrjz/cuSCqXvjJcP94MvN+Or
 6dvSObGZzDXsscvjB4G22I2vGtNbGLUToB5NLGPd+77xnWWJ5cjH74YkVJfJZ6KoGcq/
 kuMdq4eT8yJ1coHVGQvmOgePBtn6b8tukka3ht6RXAHfQZs+T02lj7N6GhzfRPkdEt4+
 OIaA==
X-Gm-Message-State: AOAM530LcwW0Btuitmvm9eFldQaLjMfzQWepA63ehcn8MC7pA6A7u3Nb
 rdaeEybME9GlKDWy4bYytJ/3NtMm1Ds=
X-Google-Smtp-Source: ABdhPJzti97Nwi8Fqjc7Op47BcUsBJ6sbLa9jrJb3W/G7KxBY1kk8yEBnUxZaETWm3GfhFC13K1MUQ==
X-Received: by 2002:a63:2263:0:b0:364:5189:abbd with SMTP id
 t35-20020a632263000000b003645189abbdmr5318862pgm.373.1645780480193; 
 Fri, 25 Feb 2022 01:14:40 -0800 (PST)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a056a0022c700b004e11d3d0459sm2495778pfj.65.2022.02.25.01.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 01:14:39 -0800 (PST)
Message-ID: <620da2c9-a726-714b-35f5-fce74a535630@gmail.com>
Date: Fri, 25 Feb 2022 18:14:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v8 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1645426789.git.Takahiro.Kuwano@infineon.com>
 <3a795886130b006d5d93591d1d08269f076cc3e4.1645426789.git.Takahiro.Kuwano@infineon.com>
 <20220225072651.td7qvbzpwzoa3nf5@ti.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20220225072651.td7qvbzpwzoa3nf5@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_011441_669874_A495F530 
X-CRM114-Status: GOOD (  16.91  )
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

On 2/25/2022 4:26 PM, Pratyush Yadav wrote:
> On 21/02/22 04:14PM, tkuw584924@gmail.com wrote:
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
>>
>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>> uniform sector sizes are supported. This is due to missing or incorrect
>> entries in SMPT. Fixup for other sector sizes configurations will be
>> followed up as needed.
>>
>> Tested on Xilinx Zynq-7000 FPGA board.
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>> Changes in v8:
>>   - Call write_disable in error case only
>>   - Use spi_nor_read_reg() helper
>>   - Use nor->bouncebuf instead of variable on stack
>>   - Update ID table to use FLAGS macro
>>   
>> Changes in v7:
>>   - Add missing device info table in v6
>>   
>> Changes in v6:
>>   - Remove 2Gb multi die pacakge support
>>
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
>>  drivers/mtd/spi-nor/spansion.c | 103 +++++++++++++++++++++++++++++++++
>>  1 file changed, 103 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 5453b89a1c22..4511c0cfd090 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -166,6 +166,93 @@ static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy)
>>  	return 0;
>>  }
>>  
>> +static int s25hx_t_quad_enable(struct spi_nor *nor)
>> +{
>> +	int ret = spansion_quad_enable_volatile(nor, 0);
>> +
>> +	/* Reset WEL bit in any error cases */
>> +	if (ret)
>> +		spi_nor_write_disable(nor);
>> +
>> +	return ret;
>> +}
>> +
>> +static int
>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>> +			 const struct sfdp_parameter_header *bfpt_header,
>> +			 const struct sfdp_bfpt *bfpt)
>> +{
>> +	struct spi_mem_op op;
>> +	int ret;
>> +
>> +	ret = spi_nor_set_4byte_addr_mode(nor, true);
>> +	if (ret)
>> +		return ret;
>> +	nor->addr_width = 4;
> 
> Why do you enable 4 byte address mode here? Why not set 
> nor->params->set_4byte_addr_mode and let spi_nor_init() do it?
> 
The addr_width is used by Read Any Register op that called in SMPT parse
and in this hook. I would like to sync device's addr mode and addr_width
to a known state here.
nor->params->set_4byte_addr_mode is not called due to SNOR_F_4B_OPCODES
flag set in spansion_late_init(). 

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
