Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301ECC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 20:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g6WmZZHKNf0HnBIS/qkk8fu6DgfR7/S85Z6FfBkZph8=; b=MMB9RWslcIvYrQ
	H/y0rHG6SX8fH5nMA7kUiUrdGJLxF55ABfERGVDhGGWJ0fXrOI2wM2eaPaJkMoSXNR+c8SAySKhx/
	bJXZg81SdMjfKMjPA1zrDll3QKjpkam8APSHJ4SOwxLXCxNyde0XGWcxKxE915m5zGkU0RUGjqZZZ
	ZzxJlYGy5ykt4k6guKSFfybiB9y/cWaDCnLhryYoIToa83VqKKlmMgvm6HRBH98rIIb8Y/rh77XHU
	zIZAumoCfRxAhrhWoiPDMDqTxl/o0fyQrdudFYSl45HZWKlgkHe6BckVkrIo/bmYq3OZCP3MWPypd
	M6oFcF1y2DfL8XPhmxeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQEAA-00BrC4-Vb; Fri, 04 Mar 2022 20:04:31 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQEA7-00BrAu-Da
 for linux-mtd@lists.infradead.org; Fri, 04 Mar 2022 20:04:29 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 40-20020a9d032b000000b005b02923e2e6so8301841otv.1
 for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2022 12:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=7J5xZolceiL495PA4LrptiYb01qKHBDWhuLdkam6bj8=;
 b=UQRxHd9yjv5NrGtZb3wTkZO/S0f+DyyHvqEsmvjMk1Oqg2H+t5Sd6EeC817WdlDGFF
 XBu43L6pggqUtK+nLbo2lWpai+HHZx0LJJxLDXQrNBkiJWRGPkTWBTTh8skHtUcPrfH5
 ISCe+OeKtoGySHbXyENb+bEbJsExQQZBEBn4pTEECbf7gqa6JJwGXVcXXnN7wwB0/2nL
 HV6XFHFiRGObYfxH040xH/AbI41TUzsPFwGXV4esGyDmuVLxYuWUVVibQ/RuFpizrvdM
 5A86kdABWi+aTNgBrC62Meg9ld6ypQ0RXIipwphoZnxcLeU79EPRf3CkY/Pk57hrXTDJ
 WEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=7J5xZolceiL495PA4LrptiYb01qKHBDWhuLdkam6bj8=;
 b=47GskD0UpyY/rDPnOcLXZrdG6VAPV0uqKUaaEq5bDojAgGCwUL8wfJe5JBv2p9NQOY
 UhQLVzxRVfCEJCz+N4eLChGlU6Qq83dfTRSkvSQUXtSW4iQ+dVAdOOaDZ0FGc4/XOGJj
 FX/9r+9BMbm9DbBg/oX6V2gZsTk5+c6errVeVHLAisZdcWbE2dcskekFLpGI9ba83a7l
 pL2rVxnnmybtfcXguJOgm6bRT1QFGcv6dtS1WTyq6C5V4tuybIMmOF1IpgVDwV38sddC
 /Ns7JONtqZtm/KzpTOHz8rUdCXdO8oRt8d9PzahnL5gPHPZJht2auaimA8Gw0k0h5bUl
 aWGg==
X-Gm-Message-State: AOAM533MYbNtOvy/KGzIGHz9tHpm8PUkEiz1khZSwzm/c3UGcRrbFnkU
 g2x7wHiGOfNVJaP9ZNa8thY=
X-Google-Smtp-Source: ABdhPJxfegI64M6j8rtErGH0VoGb2dwzS4/4bmu63bVt8mFLR2+HcBhmQZ9Kb8OYw4J0dH0VBJfEHg==
X-Received: by 2002:a9d:6e09:0:b0:5ad:1fcd:bfd0 with SMTP id
 e9-20020a9d6e09000000b005ad1fcdbfd0mr181791otr.312.1646424264609; 
 Fri, 04 Mar 2022 12:04:24 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a4aa507000000b0031c01a4ef37sm2652822ook.32.2022.03.04.12.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 12:04:23 -0800 (PST)
Message-ID: <fc6d94ff-4c06-8dcb-b53c-2ba7cd64ef7b@roeck-us.net>
Date: Fri, 4 Mar 2022 12:04:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: Roger Quadros <rogerq@kernel.org>, krzysztof.kozlowski@canonical.com,
 vigneshr@ti.com, nm@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220220004415.GA1519274@roeck-us.net>
 <4bbe337e-8cd8-a4d6-303d-d5aa21bee2e0@infradead.org>
 <20220304165451.0129012e@xps13>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] mtd: rawnand: omap2: Actually prevent invalid
 configuration and build error
In-Reply-To: <20220304165451.0129012e@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_120427_475535_5B69969A 
X-CRM114-Status: GOOD (  23.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/4/22 07:54, Miquel Raynal wrote:
> Hi Guenter, Roger,
> 
> rdunlap@infradead.org wrote on Sat, 26 Feb 2022 22:55:28 -0800:
> 
>> On 2/19/22 16:44, Guenter Roeck wrote:
>>> On Sat, Feb 19, 2022 at 09:36:00PM +0200, Roger Quadros wrote:
>>>> The root of the problem is that we are selecting symbols that have
>>>> dependencies. This can cause random configurations that can fail.
>>>> The cleanest solution is to avoid using select.
>>>>
>>>> This driver uses interfaces from the OMAP_GPMC driver so we have to
>>>> depend on it instead.
>>>>
>>>> Fixes: 4cd335dae3cf ("mtd: rawnand: omap2: Prevent invalid configuration and build error")
>>>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>>>
>>> Tested-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Sorry for noticing that just now, but there is still a problem with
> this patch: we now always compile-in the OMAP_GPMC driver whenever we
> need the NAND controller, even though it is not needed. This grows the
> kernel for no reason.
> 

Sorry, you lost me.

> In fact, Roger once said:
> 
> 	"We will figure out how to enable OMAP_GPMC for K3 architecture
> 	some other way."
> 
> It turns out this is not what was finally proposed. Could we try yet
> another solution?
> 
>>
>> Thanks.
>>
>>>    
>>>> ---
>>>>   drivers/mtd/nand/raw/Kconfig | 3 +--
>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
>>>> index 36e697456ec4..9b078e78f3fa 100644
>>>> --- a/drivers/mtd/nand/raw/Kconfig
>>>> +++ b/drivers/mtd/nand/raw/Kconfig
>>>> @@ -42,8 +42,7 @@ config MTD_NAND_OMAP2
>>>>   	tristate "OMAP2, OMAP3, OMAP4 and Keystone NAND controller"
>>>>   	depends on ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
>>>>   	depends on HAS_IOMEM
>>>> -	select MEMORY
>>>> -	select OMAP_GPMC
>>>> +	depends on OMAP_GPMC

No matter if select or depend, both result in OMAP_GPMC enabled
if MTD_NAND_OMAP2={m,y}, and both suggest that OMAP_GPMC is
needed for MTD_NAND_OMAP2. That conflicts with

  we now always compile-in the OMAP_GPMC driver whenever we
  need the NAND controller, even though it is not needed
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If it isn't needed, why the dependency in the first place ?
Also, commit 4cd335dae3cf2 states "this driver depends on OMAP_GPMC
driver and uses symbols from there". Are you saying that this is not
correct ?

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
