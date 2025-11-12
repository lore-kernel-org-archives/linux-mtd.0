Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9DFCCFA1A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 09:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3bJf1StBQmkFBgGpepTDNjvG4U3N4ofWpwEKj/C+ew8=; b=nWjO0x5B2PQi/k
	TXpetTByWU6pOch1M7EMn9aPm2EFYDtCTOxx49hNxlEIHmTBzyQkpZ/UtpOb868w5q7V3CE5bSM6d
	U6rQ4+PDxsoiE6QPWU0qrU0LlBowp06q1cOEKx7bWjk/fNnWomM1Y596H3IPnUMtWDvvOO4PROMaD
	8sfSVdc+I3ybH+2Ux75gsTq0wO5hQ8sG9TJJAWTlSy5APGBwOCVk3Jh30eYzL9U5twjv0E8gNLkYM
	WlWtClKL4r7Y1mjMasiezrq0r74XF8DsALcz78L448KSnQPjsglju8elO+655WTMbfW3iV6Y5Z4j/
	dGZlEbpOB8OggppdzOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ73u-00000008SdL-2x6n;
	Wed, 12 Nov 2025 09:22:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ73r-00000008Scm-2ag4
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 09:22:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42b3108f41fso327869f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2025 01:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762939362; x=1763544162; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xwBqkT0dayuRt6r3Xh02njTiGQp2OWToLaNl9xy/5Ho=;
        b=GbwAg/SZJ6Ka3mX10N6ABBlrG+m/3/7LimEBjEtOSNrzPwi7YV7mdv4usKiHEZfcO+
         uJUOu4BztbpvNYQBgIGcL9FKyFqAQ1/GVf6+NLUpBD6fosA12QASlhQq6HdIkNcUUJf/
         OrQBI85n/jIfARt580t5RBJXfVngFsqHRmK+N5h4w3n094n1ACsmvieum/zgbcbMLhUB
         nGgT7dzQpHNHQ2L2cxHVzDIg7/gQesVm3Ue3fMKnCHOSY/s2DLgHC6DkSvyiwEQM8SNd
         ZcDi4xck5zV74hpbcNblWWEk+x639tHhAKLcE/p6vjCXhlTBAA7Ih2/c86JHFgsW34RU
         4mNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939362; x=1763544162;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwBqkT0dayuRt6r3Xh02njTiGQp2OWToLaNl9xy/5Ho=;
        b=cfv+Tz+c+Ey3OuI83pmbeBebPEfWKIS0x4oxllRPFzI6JBLvNFhNje3RPfargKUbA6
         De8MeDWRWSUnhRQs7Bx9nclD/ODBqCHScubKYgmID1jqx//bCCj0yBASw9WQP9XOTZ+F
         4Wi1ARO3bpnSPxu7s2qarjFTh0NG9l4I7Rb4nksrLSXxlLXfhzA60Q9xlNUL0c1llIpX
         zM4t8MWnK1WNxSVk/u+7G7vo7mxw+NZ/Rn6IcTbz7G7UIRaH3Iim7tYnzTEkI12F03J2
         B0RH7QYRJBCKglfv8JIfdYSnNZ15LvLvWfeAszfLW77D0eyJlIA5z36BQhe/exK07Scp
         Aqeg==
X-Gm-Message-State: AOJu0Yw9SM2INp134+JE1HhgCyfRA4TLDU46ryTce9eUJbHumO0SEVOm
	jK31GJs/wthaKaAHxU691jrKWk3fcFKI+ZaH1gjRjcYNI/n2Gclrqg0jslTVXkp2IkE=
X-Gm-Gg: ASbGncuZctBQeFzicuZG0mgIdDzduaFFYAwW+uLoq72cg2U3JHPfQ2JuEBbItQqO4Si
	9+eeLPYCu3ZEtJ4ffPW642QDnnAlQ2OeRo3cagczL6y4mH6Vp4i3azXLJFrN+EmAAOsgtDh/+MB
	UrkAHRb1Ll0CkGalq5esoz3D0WdncHvxSH++s1Yf1gL2MWpLqKQtwCCVDAI7yIGkrZWiCW20jkk
	pURzBFW3H1uUBevw2j/8gFnl6P+/5toDrPvTcMNeqveEqZLpn30DPcVe719SVp7qQ7xFsQhzOt0
	w0EAu4r0S/LWvK5AoBdVDP+ZmFVb8fdxnYvDrKal4OS+ovqZVzJoF23bGM4zPcecSxdJKTBidC1
	nF3xiZvaivPf8wIXP+N6nUTn8Yviq+5pTPdZt+tNN8jQcRfrgFgt8Kpv8HAtryDRHcfPn7hcJmx
	YKeKB55Q==
X-Google-Smtp-Source: AGHT+IHVj/yhPNsguLn+9iN6v36uGx0TqDeIQDAvMb7zZQB2BMHPjxqAzj8p/cZVed7p0kysc8mvog==
X-Received: by 2002:a05:6000:4308:b0:42b:4185:e590 with SMTP id ffacd0b85a97d-42b4bdd5872mr1717415f8f.58.1762939361592;
        Wed, 12 Nov 2025 01:22:41 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679c5dcsm37014843f8f.44.2025.11.12.01.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:22:41 -0800 (PST)
Message-ID: <ea9d58d9-30bc-4793-a111-1df428f74e31@linaro.org>
Date: Wed, 12 Nov 2025 11:22:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] mtd: spi-nor: micron-st: add comment for
 mt35xu02gcba
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251112-nor-v3-0-20aaff727c7d@nxp.com>
 <20251112-nor-v3-5-20aaff727c7d@nxp.com>
 <013215bb-3562-484f-868d-485d0da095d8@linaro.org>
Content-Language: en-US
In-Reply-To: <013215bb-3562-484f-868d-485d0da095d8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_012244_423067_15BDAE25 
X-CRM114-Status: GOOD (  22.33  )
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



On 11/12/25 11:21 AM, Tudor Ambarus wrote:
> 
> 
> On 11/12/25 8:48 AM, Haibo Chen wrote:
>> mt35xu02gcba is similar with mt35xu01gbba, but with four
>> dies inside. According to datasheet, it contain SFDP and
>> support 8D-8D-8D mode. Add comments here, remider to change
>> the code in future if has a chance to test on this chip.
> 
> you'll need to rephrase a bit the above> 
>> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
>> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>> ---
>>  drivers/mtd/spi-nor/micron-st.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
>> index 6d081ec176c37249e5ddb724b61bd70f68088163..cc053b4d615ade3f12068618f8355779561dce55 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -206,6 +206,12 @@ static const struct flash_info micron_nor_parts[] = {
>>  		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
>>  		.fixups = &mt35xu01gbba_fixups,
>>  	}, {
>> +		/*
>> +		 * MT35XU02GCBA contain SFDP, so no need the size
>> +		 * and no_sfdp_flags here, should similar with
> 
> this is expected for all the flashes that have SFDP, so no need to
> specify this again here.
> 
>> +		 * MT35XU01GBBA, but with 4 dies. If someone can
>> +		 * test on this chip, can change accordingly.
>> +		 */
> 
> How about we rephrase this to:
> The MT35XU02GCBA flash device does not support chip erase, according to
> its datasheet. It only supports die erase, which means the current driver

drop "only" as it supports sector erase as well :)

> implementation will likely need to be converted to use die erase.
> Furthermore, similar to the MT35XU01GBBA, the SPI_NOR_IO_MODE_EN_VOLATILE
> flag probably needs to be enabled.
> 
> With something along the above lines you can add:
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
>>  		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
>>  		.name = "mt35xu02g",
>>  		.sector_size = SZ_128K,
>>
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
