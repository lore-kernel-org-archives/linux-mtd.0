Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54AEC3DA4B
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2024 11:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPkvFkX4uNvjhNOSL3r9AE3k5CSZzLcHNXrA2JrOPGo=; b=wUE9LUxh/ScOaeOvzSmp9A6zuN
	+FYlwk/DKmr7jVLIpVqU35Z1UcW5jePTg13mfxKsX3R5iJuwhxk309wT21242K+P/FMiN58WI+TXi
	4xZjFZeXtKGj+u//ggyXGXJvRKVNCddtkbE+HK/91+TFJIwltZq/D62iMi+tw2wjUXEo7E0/XeExv
	LRLduNVh2me1Ix6OkbJn4HiEAoMWa6sTwioUvo2rzkbJBOep63OeF0QnhxuWxZwb5emrOnMGecgPg
	qc5/j9u2AROZCmu+Lnq3g53PqeefenMTzdQ+ItON2eBtOhAlEada4oL+5aAaiV7ZeZoqI7zA8vpFF
	M4beZYMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU2c2-0000000DawU-2lg8;
	Wed, 17 Jul 2024 11:14:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU2bv-0000000Dav6-0Ujs
	for linux-mtd@lists.infradead.org;
	Wed, 17 Jul 2024 11:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721214852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RAGmeywEZ/JgSZ6hAqPsmz089vwWWyWA+lKvknqNmtE=;
	b=SE3AWkhA+4UZaCJekQMUNxUI9cKBoZAZXU1LGG3dxjhyaSgB06lZJDVczgpoPTNGwYLf1r
	s+8nBGvPnKI2f6rg6xfsnAfOVIYhOEP0yOX4kPdcXT6zDidvGMhkUih5aKUN9cWP2p/UoY
	go16Wgh0r/ACUqZjOL6XvY1btn+ijxM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-WWa_5qKhP_aH5JCcY10esg-1; Wed, 17 Jul 2024 07:14:11 -0400
X-MC-Unique: WWa_5qKhP_aH5JCcY10esg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-36805bfd95aso3551292f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 17 Jul 2024 04:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721214850; x=1721819650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RAGmeywEZ/JgSZ6hAqPsmz089vwWWyWA+lKvknqNmtE=;
        b=W0nZzV5ymR1ZmLqE7toUvNP9CmFXKwDicIFdcj+3A/oyN3HMBTbylnt+X5U+oCIr1A
         2dfEHe+QIBfMRfHndaJYr06PA7W3DQsPCdJeve+V9Sp6lvwBfWWPSDYwojZ+Q4lYI7VJ
         7+ygcwFn1zwm+iiLcyPoSWWsfPEmK2D3vlpFuGfvayksgjHtm2tv+UwqQA01J/l+fj9p
         sUk8ayhcPWpTby+ltR5Sdhg/yXJek72Ovb+IKRl/sOV4pdWZwqLujidUmL8D/d8bWflo
         e9HpL36l2VAuy++ZqBoEMUu4uHjsvm4RVSjMa2JQt2KocRLNPIwyD6MLjadfBTAkx0R/
         1Y3A==
X-Forwarded-Encrypted: i=1; AJvYcCVRDB4jC6rWXEKAtxGyHig/FwrpQBqLt22vUEXnWkrARVkseOq2cAOObpCPUv+aCHxJWHpo4I+dHLd8mA3gQstP7D1KtPZ/ic03f4CFNQ==
X-Gm-Message-State: AOJu0YyVT6GeNnBc9arC0mn1dzJnkZ90i3hvDqxuKZUAAmVz20EDuare
	hLiYhm0TGaJ4MMadIqe3MVj/8fy1szln0V7nQnIF8HdwNhpKKoQVie6fpWjuDi7bEgJRV65noYb
	9ErG5uNfwshXe6ZUpTHygDXoU+RRgUviaempHJv4rBpqbFkQaZHAnUNypTeDH7PI=
X-Received: by 2002:a5d:5f8c:0:b0:367:943e:f436 with SMTP id ffacd0b85a97d-36831652b7cmr1395241f8f.30.1721214850120;
        Wed, 17 Jul 2024 04:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkv5VJxD9qI1kB5PB9WhCMM3ozFKBNBC+x5bcWuyaH6WTwCYKMg89QMw7W+wtEnk2KMCsWzg==
X-Received: by 2002:a5d:5f8c:0:b0:367:943e:f436 with SMTP id ffacd0b85a97d-36831652b7cmr1395208f8f.30.1721214849630;
        Wed, 17 Jul 2024 04:14:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbec3sm11450684f8f.85.2024.07.17.04.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 04:14:09 -0700 (PDT)
Message-ID: <f559a33a-6d2e-476d-87f6-cb1887e99b62@redhat.com>
Date: Wed, 17 Jul 2024 13:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
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
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20240702122639.248110-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240702122639.248110-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_041415_761773_61947E48 
X-CRM114-Status: GOOD (  18.26  )
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


On 02/07/2024 14:26, Jocelyn Falempe wrote:
> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> callback.
> This patch adds a new struct kmsg_dump_detail, that will hold the
> reason and description, and pass it to the dump() callback.
> 
> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> function and a macro for backward compatibility.
> 
> I've written this for drm_panic, but it can be useful for other
> kmsg_dumper.
> It allows to see the panic reason, like "sysrq triggered crash"
> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
> 
> v2:
>   * Use a struct kmsg_dump_detail to hold the reason and description
>     pointer, for more flexibility if we want to add other parameters.
>     (Kees Cook)
>   * Fix powerpc/nvram_64 build, as I didn't update the forward
>     declaration of oops_to_nvram()
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   arch/powerpc/kernel/nvram_64.c             |  8 ++++----
>   arch/powerpc/platforms/powernv/opal-kmsg.c |  4 ++--
>   arch/um/kernel/kmsg_dump.c                 |  2 +-
>   drivers/gpu/drm/drm_panic.c                |  4 ++--
>   drivers/hv/hv_common.c                     |  4 ++--
>   drivers/mtd/mtdoops.c                      |  2 +-
>   fs/pstore/platform.c                       | 10 +++++-----
>   include/linux/kmsg_dump.h                  | 22 +++++++++++++++++++---
>   kernel/panic.c                             |  2 +-
>   kernel/printk/printk.c                     | 11 ++++++++---
>   10 files changed, 45 insertions(+), 24 deletions(-)
> 

[...]

I pushed it to drm-misc-next, with the whitespace change in kmsg_dump.h

Thanks all for your reviews and comments.

Best regards,

-- 

Jocelyn


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
