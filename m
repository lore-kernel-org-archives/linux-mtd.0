Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD1EC4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NahFzcnyqSo9yZwFWl+ikTL54PqueTIEciKWGn5Ub/g=; b=FJEzknW1DpOILi
	XYCJFjZcxJCAynr+P+6gl0W139BAH/+bIVdOmX4RC0HLfds3qvJvrlHDPUWQltfuOKPrQjgrds5OV
	nVMh56/ZzviXXihMRmMT13pYVBcd1CnGk5fjZBg5olvYXfpubkJZlIRr5Uk4pr0iiHutTY3n7H6P7
	gJMTHZ8sf7M6sqWhRMASv+49rQ3VkQXQ87818xYqGdSOSdv9SUy66jgqG405fv1ETYbHNMwHc3cCn
	tWK/fdgMa2Ho/fSYEAJ6WaJofg/Ur9DlIfOzVg22Y+MzYHb8ih2RfZREfNjNIR7EzueNFSlTmMv1a
	ZEW2sbbtrTBZ8+nsqXZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orxx3-00CzoO-SL; Mon, 07 Nov 2022 08:57:54 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orxuO-00Cxzr-7t
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 08:55:09 +0000
Received: by mail-lj1-x231.google.com with SMTP id u11so15142795ljk.6
        for <linux-mtd@lists.infradead.org>; Mon, 07 Nov 2022 00:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OCr2ISKh+YafpbCB0kPf8RGIXBfoaFAOt+wxNjTYToY=;
        b=npBaWexOm/XE00LZTEl5xH2F9rnHMAlNZtaOpHjLTsOkRcStkVvKmpEcpmh05M7XGE
         hF7PvmxSuQGDXUlgikWuU/na2WwFCRc8IMm49a/kHA/sF801fWkqT8HqabPi+2Yh92f+
         77ZY8w/0Ffl8VAhsSoHvnRiMHEkpjbbyV4ehYuiYTBeEG9HPPm3KWpKc//Sy65AsGjuZ
         22NO7ipNEe8vuIEPO6qy7eep/god0yI/ViBnNdkvwVQ9kBDHMAHM+cK8PjnmghRK5Mrg
         5xc/ccwE9tICBKzEvpd8tFkkURtGW+E7CvVKM8ZcUvfrZsgwvwU3MwhGWGssgHRnbupH
         y1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OCr2ISKh+YafpbCB0kPf8RGIXBfoaFAOt+wxNjTYToY=;
        b=6nWbsmEdRqrn1kXg6IXt9REXOnyK67VZxDq5anbIKI5q9pNC+wNrMc1DH90dmOPHOT
         wORm0SrG9VwmE423eJqG/M20l2BYag7+OUcKc4s/VUvTYqoanOsCjSn8xH/oO8E4XqBK
         jN2rTt72pIXhxKrD1mituuzBw2mLeEBT4znG2DMpXL4tITChgfOAY2BbkpR+7KQ91+ut
         URl39rs31QX4+GjuuI6a2nYtIauTIpgm7yQnLWdqM156wX1vIUsSwAPUKu8l6MpsvP22
         84LdBPyThLDF+r9e8wHNwgA/XeWt1wTz6hhnnDfKLU02sV3L1CTfDSDoPNOrIgUm+8eh
         NQeg==
X-Gm-Message-State: ACrzQf0xouPeu1P/IFaTa4yC8/b3A5vjDBB7JVdV1TUg0sn4AWtzfolk
	C5IIVh+d9qR08qI0zsoY7KxgGA==
X-Google-Smtp-Source: AMsMyM7rGKhCM6C7y8e7TdmUwKATYNhTY8uScYBir79zy6ZIF0aFkh+NX5galtcq7569oldmM2926g==
X-Received: by 2002:a2e:8e8a:0:b0:277:77a:b53b with SMTP id z10-20020a2e8e8a000000b00277077ab53bmr5112278ljk.59.1667811304919;
        Mon, 07 Nov 2022 00:55:04 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id d25-20020a19e619000000b0048a8c907fe9sm1120832lfh.167.2022.11.07.00.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 00:55:04 -0800 (PST)
Message-ID: <742d9ff1-8af8-8fa1-4f37-4b50bd874e82@linaro.org>
Date: Mon, 7 Nov 2022 09:55:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] mtd: onenand: omap2: add dependency on GPMC
Content-Language: en-US
To: Roger Quadros <rogerq@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20221104194934.384371-1-krzysztof.kozlowski@linaro.org>
 <eef60a26-ef23-1b79-22f7-adaee3be9360@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <eef60a26-ef23-1b79-22f7-adaee3be9360@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_005508_348300_03B8DA14 
X-CRM114-Status: GOOD (  16.88  )
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

On 07/11/2022 09:44, Roger Quadros wrote:
> Hello Krzysztof,
> 
> On 04/11/2022 21:49, Krzysztof Kozlowski wrote:
>> OMAP2 OneNAND driver uses gpmc_omap_onenand_set_timings() provided by
>> OMAP GPMC driver, so the latter cannot be module if OneNAND driver is
>> built-in:
>>
>>   /usr/bin/arm-linux-gnueabi-ld: drivers/mtd/nand/onenand/onenand_omap2.o: in function `omap2_onenand_probe':
>>   onenand_omap2.c:(.text+0x520): undefined reference to `gpmc_omap_onenand_set_timings'
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Fixes: 854fd9209b20 ("memory: omap-gpmc: Allow building as a module")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/mtd/nand/onenand/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/nand/onenand/Kconfig b/drivers/mtd/nand/onenand/Kconfig
>> index 34d9a7a82ad4..fa94c514626d 100644
>> --- a/drivers/mtd/nand/onenand/Kconfig
>> +++ b/drivers/mtd/nand/onenand/Kconfig
>> @@ -26,6 +26,7 @@ config MTD_ONENAND_OMAP2
>>  	tristate "OneNAND on OMAP2/OMAP3 support"
>>  	depends on ARCH_OMAP2 || ARCH_OMAP3 || (COMPILE_TEST && ARM)
>>  	depends on OF || COMPILE_TEST
>> +	depends on OMAP_GPMC || !OMAP_GPMC
> 
> Why did you add !OMAP_GPMC?
> 
> If OMAP_GPMC is not set we don't want to be able to build this driver correct?

It will build fine because of stubs, so building is not a problem. We
just want to forbid having this built-in if OMAP_GPMC is a module. The
question is whether this is a runtime dependency as well?

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
