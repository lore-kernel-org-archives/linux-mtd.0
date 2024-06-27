Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256CDC2BD09
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 07:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rme+aO5wGbMIFCHQDBtklfF0BIFojpZfsgxlt/FBK30=; b=YEFKAx/cZM+q6G
	erxNyQ1VWGr1JhwpaAPkK3vHJTQWzuE9fG0Ul4XS/zDudscW6lwGryvX64R+Y5oUhJtlwUFFxVDm9
	9mEUA4BLTlDapQc0S/l4zH/usGfw9yOGGL+QIaIpnO4ptg733GeK4z+cXmgDovoV5rP87wC1mk7j1
	6nm3nSNcJxFxB84aris3qMZzm7snndDGbdipPsmzrur1lxQU2C3Ys2Rmr8uGW24w/yQZdnbfcKKk2
	duYBxR4SldXe5gY6E3LGKY0Z4JACEKvKCcDCbiOCvgHDgYm6u95ViGMKNYb7CbvV1UBs1b95p8KPK
	goWwxgCYC8WnZb+dJLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjZd-00000009YtX-2ZmB;
	Thu, 27 Jun 2024 07:29:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjZY-00000009Ys4-0niu
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 07:29:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719473372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ArljJjB0JyJS00KNOlxMunWxUs1/GD1Wf4W99edQFdU=;
	b=EyLJ7UdomRa9e5Z3kF/dB3puDnEMRL8o8z/0OQy9cUudAiFpF01X+0Xn+XRnlLE6HGwfzJ
	V7L4YL7i5TNl5ZTcnSqPbmLmefjxtcaJqjgscy9uMf9Sphe19AfO38egrTFrRexM4WN3pm
	lwVMhmkUfRxfFVzZCr0xGAuqg7zAN+o=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-bAhw0KRxPbW2iyKcWC3e4Q-1; Thu, 27 Jun 2024 03:29:30 -0400
X-MC-Unique: bAhw0KRxPbW2iyKcWC3e4Q-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52cdd05fec8so4657116e87.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2024 00:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719473369; x=1720078169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ArljJjB0JyJS00KNOlxMunWxUs1/GD1Wf4W99edQFdU=;
        b=Uw0Lg0rNa0JwPHfHFDnzPo3+KsB8WeUvJvVbUUG4Cz89Fo07ytqdHSW3IMgF9DcMZf
         +Sd869uxlBDpIRjOaEikFOItjHyntblM+zvx9GM5+MGiTNmSGXHUyBUt3065G3+lRRfv
         4djfNFq8M/RfiFk8+Cx4u6Qh1d2pxGhbtLXY5uLXz7yePz1wl6hEPWmrvmSZ+4QhI/4Z
         tqeqrdAJncNmLvMAqn/lT0TBihUPBITO86rruhSA/pwbiZyt9LLDixgl2fXYfmzFmSEd
         P9kwnCIuakxx8+EYl/SGaMOn8CTxXByWmw4K19vbauT0Sq6mDSOfh63PGld9Sztse1hJ
         4Bkg==
X-Forwarded-Encrypted: i=1; AJvYcCWK/08U4fem97cnZuJ3JsnFg5wa6iH1QytNe0PAwfikeQjr4fH3P/lb1YQ9esv1ed0LNW1jfxA2x488XegSQ2OQ8ZFmTDcIcEhJ6asN5Q==
X-Gm-Message-State: AOJu0YzI6wtCev50jjm9EVk3RjmW/Bh747gWtcDytKbBLYZy0avIFOsp
	FwvemDnrwiBnRFrUyNnS0Gw3mcanKLM3dzXqBMshJYkKUWpYCshSknrXWJFRpCByAOMK1u2hjCL
	7rkJqgtnHkRYxGrCv6EkF8eF9VsYkIsDJOQT1rnilGbLez68hn4H/uc/CWi7bdMA=
X-Received: by 2002:a05:6512:688:b0:52c:8837:718a with SMTP id 2adb3069b0e04-52ce185cffdmr9405290e87.43.1719473369041;
        Thu, 27 Jun 2024 00:29:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbOO3gAiuM5teegTvAjdpAZYISeHz2jPAZuVwH5HNKIpTCZBH+tcy4/G9Q3EUr6abmm1rODg==
X-Received: by 2002:a05:6512:688:b0:52c:8837:718a with SMTP id 2adb3069b0e04-52ce185cffdmr9405275e87.43.1719473368602;
        Thu, 27 Jun 2024 00:29:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8245e7csm52601955e9.3.2024.06.27.00.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 00:29:28 -0700 (PDT)
Message-ID: <4aa3a028-04e5-4658-9879-df60dab06c54@redhat.com>
Date: Thu, 27 Jun 2024 09:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] printk: Add a short description string to kmsg_dump()
To: Petr Mladek <pmladek@suse.com>
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
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
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
References: <20240625123954.211184-1-jfalempe@redhat.com>
 <ZnvKcnC9ruaIHYij@pathway.suse.cz>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZnvKcnC9ruaIHYij@pathway.suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_002936_894176_E9D1A28F 
X-CRM114-Status: GOOD (  21.14  )
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



On 26/06/2024 10:00, Petr Mladek wrote:
> On Tue 2024-06-25 14:39:29, Jocelyn Falempe wrote:
>> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
>> callback.
>> This patch adds a new parameter "const char *desc" to the kmsg_dumper
>> dump() callback, and update all drivers that are using it.
>>
>> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
>> function and a macro for backward compatibility.
>>
>> I've written this for drm_panic, but it can be useful for other
>> kmsg_dumper.
>> It allows to see the panic reason, like "sysrq triggered crash"
>> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   arch/powerpc/kernel/nvram_64.c             |  3 ++-
>>   arch/powerpc/platforms/powernv/opal-kmsg.c |  3 ++-
>>   drivers/gpu/drm/drm_panic.c                |  3 ++-
>>   drivers/hv/hv_common.c                     |  3 ++-
>>   drivers/mtd/mtdoops.c                      |  3 ++-
>>   fs/pstore/platform.c                       |  3 ++-
>>   include/linux/kmsg_dump.h                  | 13 ++++++++++---
>>   kernel/panic.c                             |  2 +-
>>   kernel/printk/printk.c                     |  8 +++++---
>>   9 files changed, 28 insertions(+), 13 deletions(-)
> 
> The parameter is added into all dumpers. I guess that it would be
> used only drm_panic() because it is graphics and might be "fancy".
> The others simply dump the log buffer and the reason is in
> the dumped log as well.

Ok, I also tried to retrieve the reason from the dumped log, but that's 
really fragile.

> 
> Anyway, the passed buffer is static. Alternative solution would
> be to make it global and export it like, for example, panic_cpu.

It's not a static buffer, because the string is generated at runtime.
eg: https://elixir.bootlin.com/linux/latest/source/arch/arm/mm/init.c#L158

So it will be hard to avoid race conditions.

> 
> Best Regards,
> Petr
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
