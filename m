Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD957C2BD09
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2024 07:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wQ+ZWJaRMaBsnIb8SQd8oj0Ie9AjrjfSbbqIXNQKw4=; b=x5wvHq7jXQMSHQ
	GY8SRuhsYrWD2bN8M5PhQ0PBiSbuNPLMnBObbno6Np6U9+9aI2WM0Dr1RsmeUkXEPJBWPHH02xL3X
	q0Acovfn19y42YoGXTbNHIgX3cPRplEwRv5KrLCIiqHEcpxtwsQbimUXhNGTfIhWq5VNtyx6+ZZj6
	U8cimqpLFNJlPAo8eu5CZz9zSx+diVX2UdFKTn8PeBNVh5qZbGhMduNLLJP8A64iGG2MVCCs+iFC0
	PIWgbwVPZRKpNGbbw9NcS3wXuTwjQUDevW4Xo24SOx4bmAVJrJ4eYPnOxkFAkO6uFJnUro+9Wkh8X
	C8H0LEfVgE4ET0NNLM1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOurv-00000009NN4-2weL;
	Wed, 03 Jul 2024 07:57:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOurt-00000009NMX-0Crn
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jul 2024 07:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719993451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATgbDzJNw/2oGwBMOiWIjN3Qn1UCklmeTzoV2zYR45Y=;
	b=hTyE90hrZpPA7rCvoJMFBttsO84hdETHQoiOo1/6jzwCukxY6T2bJqoE6G7z6J9+icfcYG
	AV8QBOcXUB6QoJI9IMwhAm8nFAhK13lqnAX9/y5aAnaatKQBzWTyqkW3hob8jBfxMtWMoI
	asOHuqBjUXLAYd31D9SeL1stxR9nv4g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-_byDlsj6P6a9By7K2MrPfw-1; Wed, 03 Jul 2024 03:57:30 -0400
X-MC-Unique: _byDlsj6P6a9By7K2MrPfw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3630a676a07so3194510f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 03 Jul 2024 00:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719993449; x=1720598249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATgbDzJNw/2oGwBMOiWIjN3Qn1UCklmeTzoV2zYR45Y=;
        b=ttM4wrSuby05SCFBwRMOdvmbw8Me9Ze1t7vADxcuFam0LVORW7xGAgRloocrrtKInD
         0zYZ8bs1TPU0SzGVMas6OYJduNbJi2xhwrca2s/il/v2F4/gv0yfT4tp3iCvwpeE4dVF
         3FtQXGcEPMLbzN/BidCdeB1Sro4wCQmISunhRzQZK3qGA8UAKUmNJiubC8ruLckgueOU
         1VZTjmJGAuQgX4l1FzfyBSFdL2VTVio7lf30xSP0B7HCzgomNtn7IQGeK/UCadnVpmdF
         zC351u5booEjKpo55IMwqEv+oOP9M3dbPw0s9fU6HC/SzaIOe81W29OEME+RfC9wvjxj
         AIig==
X-Forwarded-Encrypted: i=1; AJvYcCWHHrdJHRD1YeH+/oHcUuJFOy902//0SAKGuIsH7eQQF3mlHqtU+LTPESJYat1v1/1+qZJAvOEM+/UoQTkjO1o5xYusPqtAeRL+xOGHzw==
X-Gm-Message-State: AOJu0YxM+CUg2q36FNJUNYv66TulaaQDd/f2vSrFk90yLLh6TJRWwSBG
	eXCZaRCtiDFLuYQGVsuPZXb7ijJJO2D32OzJCuv7ysP1pMM9NkpJe49EuTdDs6uZMfpk38qsiEn
	V9FpU0AlUHrxPvab4xJYpJioKVm9Bb+TXBTjaVzgRfTrqAqISoDkogXgNRIYMJ18=
X-Received: by 2002:a05:6000:400d:b0:366:e685:d0cb with SMTP id ffacd0b85a97d-3677569762bmr7597303f8f.6.1719993449010;
        Wed, 03 Jul 2024 00:57:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgd9U2eqDjR78JXH16dEWMefFhv6oCfwMwNT/hPSpZD56c2ut2zLCAdpneI7XMTfA346aUUg==
X-Received: by 2002:a05:6000:400d:b0:366:e685:d0cb with SMTP id ffacd0b85a97d-3677569762bmr7597268f8f.6.1719993448595;
        Wed, 03 Jul 2024 00:57:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b? ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd623sm15223623f8f.16.2024.07.03.00.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 00:57:28 -0700 (PDT)
Message-ID: <10ea2ea1-e692-443e-8b48-ce9884e8b942@redhat.com>
Date: Wed, 3 Jul 2024 09:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
To: Kees Cook <kees@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20240702122639.248110-1-jfalempe@redhat.com>
 <202407021326.E75B8EA@keescook>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <202407021326.E75B8EA@keescook>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_005733_200596_0035332D 
X-CRM114-Status: GOOD (  23.10  )
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



On 02/07/2024 22:29, Kees Cook wrote:
> On Tue, Jul 02, 2024 at 02:26:04PM +0200, Jocelyn Falempe wrote:
>> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
>> callback.
>> This patch adds a new struct kmsg_dump_detail, that will hold the
>> reason and description, and pass it to the dump() callback.
> 
> Thanks! I like this much better. :)
> 
>>
>> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
>> function and a macro for backward compatibility.
>>
>> I've written this for drm_panic, but it can be useful for other
>> kmsg_dumper.
>> It allows to see the panic reason, like "sysrq triggered crash"
>> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
>>
>> v2:
>>   * Use a struct kmsg_dump_detail to hold the reason and description
>>     pointer, for more flexibility if we want to add other parameters.
>>     (Kees Cook)
>>   * Fix powerpc/nvram_64 build, as I didn't update the forward
>>     declaration of oops_to_nvram()
> 
> The versioning history commonly goes after the "---".

ok, I was not aware of this.
> 
>> [...]
>> diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
>> index 906521c2329c..65f5a47727bc 100644
>> --- a/include/linux/kmsg_dump.h
>> +++ b/include/linux/kmsg_dump.h
>> @@ -39,6 +39,17 @@ struct kmsg_dump_iter {
>>   	u64	next_seq;
>>   };
>>   
>> +/**
>> + *struct kmsg_dump_detail - kernel crash detail
> 
> Is kern-doc happy with this? I think there is supposed to be a space
> between the "*" and the first word:
> 
>   /**
>    * struct kmsg...
> 
> 
Good catch, yes there is a space missing.

I just checked with "make htmldocs", and in fact 
include/linux/kmsg_dump.h is not indexed for kernel documentation.
And you can't find the definition of struct kmsg_dumper in the online doc.
https://www.kernel.org/doc/html/latest/search.html?q=kmsg_dumper

> Otherwise looks good to me!
> 

Thanks.

As this patch touches different subsystems, do you know on which tree it 
should land ?

-- 

Jocelyn


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
