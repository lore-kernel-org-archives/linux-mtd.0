Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98886CD8C85
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Nov 2025 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrB8LVov148lczEKAOQYBIPOLePoruU84HTk/OHRlfw=; b=fkLyaFGaN9wCQb
	yjB3gJYSqeKnLM6ZMcKJhpceEIxbeWBGeLcjMq5lj6k4tsboTRDnX5wiqaiUK0Q91X2cYYklwunhF
	g0Bv5ZTu0/GEcda5Cguev6OaVlkWpV8brqGWdjjt62FDwKGqFw3LlWL4F2QqFXbYcCpMSozyDIGrU
	JfHtzp9oO2lmbuyDkC3adhnrMyb3eS7teh73YpgovH0dgfz58WvlzxFDnEvdd1qieeht8wEUJOUbS
	kqdTSudj0VoYJTljqMuUSFKl2amsgV6ooKOZUW/0FMb7O4gGdqF+9ARFh+SJr0PJaxEsR1/j7ccZf
	yGaw+4wQMG8G99qh2M5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZSf-0000000Ak4Z-0S1T;
	Thu, 13 Nov 2025 15:42:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZSc-0000000Ak43-1qjW
	for linux-mtd@lists.infradead.org;
	Thu, 13 Nov 2025 15:42:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47117f92e32so8428965e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 13 Nov 2025 07:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763048528; x=1763653328; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdckbTlZRYgwauz5tn8aS58Sj8fDyGi1aX7HfTm8ByM=;
        b=dY1aOa0JFS7D6vmnXtLuQA0TUFYJWz8sKa7fgeFbYxTKDCEau7uUPdOSgyIsVK2Wj9
         LYbvqzfs6ciU7KdOMeE8U9E+UADsG8bhmOfmpycPBfrdeIFMTbDgXhjaeHe/q/TF0J7w
         +7g2fn7QrN0pPvsikDsmwVXn55lbsS+YuEun+EHFRsIXfgzIYP8fIWKZ9PuI96m+r0xM
         GsZ/vEylMk+3065xK2Cv2f4jE/SI4u+RcMGdOjP4+vAGbpVeFtSXZLIecMMSC+YLrww+
         bdzIHfXAhrKViCiwE7t19+Sb2hiHnDAt1LFGFM/GVC5tGyF+UnduU+iIRf2PUeygtqkY
         AT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763048528; x=1763653328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdckbTlZRYgwauz5tn8aS58Sj8fDyGi1aX7HfTm8ByM=;
        b=vJyA6a5k6QIQ7D0W98jJ22Ovagy8QtpoheAKAceGqcWhImAnqps4lXTLKIk+o46TCh
         vniM4co+ytdZhDWHci96Wz2ymefN/ttUQAEWEspVH6+SsvOjTE7XPZWiaX2qwQWJFEvy
         KK88qkOY11ti5OTs0uMMZ2f7AHegcpgop9se29ULayiYjD4xl47AI8N2pmCtM4l7MsA0
         DMbxeonT6odmCt0Z4XxIXAi/YKhDn83YwwLo4Q4yzDJAklkIMrUntD+tpYlix9UNhn/y
         KYsmPQ2XH95pHCx3vqLNo6QqSPMETESiBjwfWaEHGsKxQDuWUFMHyQ5XCGaSIMgC/tsJ
         m6UA==
X-Forwarded-Encrypted: i=1; AJvYcCUywihFRTd3JFduTmIiKxt1uxV6vTQO20yr9VAYdyxJceU1dDKIioHUVQt3a87lUTGgY6GAirQfVyE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqtyuJ8Si+j7ILCbOLnBA322P1nCwc/F7ukPkNfhzC1OA3MN1Q
	PFKXaon3iWUweljriBfAWgALCAPNDeWxafHYQRMywSVlEs8frWzk8r2cUYqC/wTvIn8=
X-Gm-Gg: ASbGnctWdIWXV+5iTLpaxmOclMEZGxo9b2x4H0MApiTo53djydpSs3+FvwrhQOYDuhZ
	NgroyLrzxDGQ74BSHKttO0yAQlHdZsSMb790okHewi7GvHOS0H7pqbkN/av1jcfAR5WLZCFXbxz
	GnE82RuStN7jNkZKlmwQGffmr0xR0H7rKHc+SbUFPbfmhCx9V5ShLXQu+ypy2+LECGhIOW/TLqg
	ugaDv7GHwQCw0azVHyVWvy6OSJ5RLpj35fh69aPYX6rOjKOL9GIZn9Tfk41v1LNMSmWSsZgmFOV
	VeUIiiqM+VOancF18ZzWb+0tkK0/8zzqoP3flYda0ubXuIJnp+Ddg7dJc3uceNAJBf1PdUCMJFL
	0gZeFy5gojuceqXW0zGSeBM8o9z7fKhRpiXiB3jUPtrYYda8urRco1WiRzKXk7q2yx8hGvKwSSh
	YuYWdCnA==
X-Google-Smtp-Source: AGHT+IFlCo98BPfCIQ5CH901ne1qG93gSkHrk0bVofSu01+xDEnw6EvzRBsaTLdl3pxJ6Hq04gASjQ==
X-Received: by 2002:a05:600c:4585:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-4778704406emr72935215e9.3.1763048528417;
        Thu, 13 Nov 2025 07:42:08 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e35b7esm101023995e9.4.2025.11.13.07.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 07:42:07 -0800 (PST)
Message-ID: <a7c3db5c-bad5-401a-ac97-d59f81950b92@linaro.org>
Date: Thu, 13 Nov 2025 17:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] mtd: spi-nor: micron-st: add comment for
 mt35xu02gcba
To: Pratyush Yadav <pratyush@kernel.org>, Haibo Chen <haibo.chen@nxp.com>
Cc: Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251112-nor-v4-0-e4637be82a0a@nxp.com>
 <20251112-nor-v4-5-e4637be82a0a@nxp.com> <mafs08qga9ehe.fsf@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <mafs08qga9ehe.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_074210_529185_E72AB322 
X-CRM114-Status: GOOD (  23.76  )
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



On 11/13/25 4:47 PM, Pratyush Yadav wrote:

Hi!

> On Wed, Nov 12 2025, Haibo Chen wrote:
> 
>> The MT35XU02GCBA flash device does not support chip erase,
>> according to its datasheet. It supports die erase, which
>> means the current driver implementation will likely need
>> to be converted to use die erase.
>>
>> Furthermore, similar to the MT35XU01GBBA, the
>> SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs to be enabled.
>>
>> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>> ---
>>  drivers/mtd/spi-nor/micron-st.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
>> index c89c06b1fc61a581fea2e18732be2501a15715f9..f94e9d2d17bf4aa7c36ba3aa37d34f767a9f93ac 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -204,6 +204,16 @@ static const struct flash_info micron_nor_parts[] = {
>>  		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
>>  		.fixups = &mt35xu01gbba_fixups,
>>  	}, {
>> +		/*
>> +		 * The MT35XU02GCBA flash device does not support
>> +		 * chip erase, according to its datasheet.
>> +		 * It supports die erase, which means the current
>> +		 * driver implementation will likely need to be
>> +		 * converted to use die erase.
>> +		 * Furthermore, similar to the MT35XU01GBBA, the
>> +		 * SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs
>> +		 * to be enabled.
>> +		 */
> 
> Maybe I am missing some context from previous patches, but why are we
> adding this comment here instead of fixing the support for this flash?
> What does "the driver will likely need to be converted to use die erase"
> mean? If it doesn't support chip erase, then it _does_ need to be fixed
> by using die erase.
> 
> Also, why does the flash "probably" need SPI_NOR_IO_MODE_EN_VOLATILE?
> Are you guessing based on datasheet and do not have the hardware at
> hand?

Yes, no hardware at hand. He can test with mt35xu01gbba which is a smaller
flash that share the datasheet with this flash, so that's why the TODO
and not a direct change.

> 
> The changelog should also explain _why_ this comment is added here, and
> not just repeat the text.
> 
>>  		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
>>  		.name = "mt35xu02g",
>>  		.sector_size = SZ_128K,
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
