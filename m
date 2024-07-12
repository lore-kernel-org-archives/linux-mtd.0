Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105E9C3DA4B
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 14:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1W13nWSQUhUV+ThxSdfK3GH8v2AXMy+EVNuiSZpRck=; b=rE+XN3Y2iyOUWz9u9yLH4Jysb7
	M70Xe7dn4vTcoOfdQkZF/s5K22E7X/bmICPbDVuCZ/hHXL1USyXuT3xSBXROIABxzNXVN3d4oZIBG
	n+aDqTuEDXhi+3rBLex7E7nNs/FN5iF6t2bDsSgvEja29IMoh9EUNej5LdRQmF99CKB7+zQ/4t7CU
	T+PB+lMAqDLuFTgLiEM48mkQJVIeoPmVb5lMV9uhFKxqOoUXfHO10GIOoutTunw0xfJv6WuqYO5V3
	SEzwv8Mv5NbNRp9RRhyUX22N9kyCDAp5FLOJSSCdHqBwSWtFQh7R0BL3wQ+VaIK1EYaqzK1O3vBfB
	YujzB7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSH00-00000000HRx-2iHy;
	Fri, 12 Jul 2024 14:11:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSGzy-00000000HRP-04Z7
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jul 2024 14:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720793504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o2DwS+N+WpDe9hXUlwXatDaB5K36zULgGVjjk0aits0=;
	b=HkQjljxlILzTzV1aj+mMzoq99YUaImdsbkQj5kio7EJKjoJu1moa6thlhUZw6ARtpFljpm
	K37lKQDd5fQkMQ4p1bUUzeA4RJNz9vVieSGSlgA80oi/UGUzDFuLKQZosvebsgWdYp/VHK
	TAyvSPCBZi/LxcNRpcxUQtAfUgfcLQM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-l0snUfUyN9y20wRRo_QidQ-1; Fri, 12 Jul 2024 10:11:42 -0400
X-MC-Unique: l0snUfUyN9y20wRRo_QidQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3678e549a1eso1106747f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 12 Jul 2024 07:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720793501; x=1721398301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2DwS+N+WpDe9hXUlwXatDaB5K36zULgGVjjk0aits0=;
        b=HEGa04XxMEISGeVGtbUsr8a3eRWcXV8AJViqasfUUjkqGoReEk/kgB4lJvp839dhkJ
         sRs23niraJGuQWVfMnEOiQA/bPkqAWMhuiRjKnQ5wNSpKp7czwdEyPABAQsF9ifQq5BE
         PqJjA9g5HX5aLGItggGi7Nwkra8QmXst3Sc8eHkl3/FMPk48eXebQSr4F6sro+16pet8
         9MbvC0A2AKwmtsc6dkos5abaXiYrK6FM4VVGrUtcGbzEw8ykHKKX4w38eoHd4Ji9EJ5d
         nOQNywfvD435Izd9GLpcxACJRENadYvEoKriuAMj8HsjYd6zy0NTRxky2R4EBpGOrUN0
         bU+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVil1jhbGj/XNvc/WjlJ6qnRoeiH/2w1v2327wkg2BHTcrKR9N/GCJNz60haxArysCbm2jnGlzGMGZtMfDafQVWF1AiTVftjEcyW1GEoQ==
X-Gm-Message-State: AOJu0YyO+OC02uBaEi3TT9kStD7vdDotWjZXypSXT3LNPb04OXK4HAS6
	n8vO+2Pp8IAi79M2GvsO7byzYF6eusq1PmYAgTlX4vo87BavFDOuIxMIdW8aHI+elWCGMOmHe24
	4Iqegx5WcmglR0HDfbQJE/EybZg7zYBBBoxDpzyIcO48h4CMhD8CN4E+w10Lyx6k=
X-Received: by 2002:adf:f8d2:0:b0:367:40eb:a3c3 with SMTP id ffacd0b85a97d-36804fec57emr1911307f8f.34.1720793501792;
        Fri, 12 Jul 2024 07:11:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf3U4d9gFM4veykTOQEiy8D2ryeNYD+ff/pVMiWh3YGrTu6bLAg3UO2081Jf+2o1pI3Alwgw==
X-Received: by 2002:adf:f8d2:0:b0:367:40eb:a3c3 with SMTP id ffacd0b85a97d-36804fec57emr1911266f8f.34.1720793501451;
        Fri, 12 Jul 2024 07:11:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e187sm10376600f8f.21.2024.07.12.07.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 07:11:40 -0700 (PDT)
Message-ID: <a24ea2d7-9f48-412c-9a40-9624f6c4f9d9@redhat.com>
Date: Fri, 12 Jul 2024 16:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
To: Kees Cook <kees@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
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
 <2d886ba5-950b-4dff-81ea-8748d7d67c55@redhat.com>
 <277007E3-48FA-482C-9EE0-FA28F470D6C4@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <277007E3-48FA-482C-9EE0-FA28F470D6C4@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_071146_173605_AFCB947D 
X-CRM114-Status: GOOD (  10.98  )
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



On 12/07/2024 15:34, Kees Cook wrote:
> 
> 
> On July 12, 2024 2:59:30 AM PDT, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> Gentle ping, I need reviews from powerpc, usermod linux, mtd, pstore and hyperv, to be able to push it in the drm-misc tree.
> 
> Oops, I thought I'd Acked already!
> 
> Acked-by: Kees Cook <kees@kernel.org>
> 
> And, yeah, as mpe said, you're all good to take this via drm-misc.

Thanks a lot. If there is no objection I will push it to drm-misc mid 
next week. I may have all required acks by then.
> 
> Thanks!
> 
> -Kees
> 
> 

Best regards,

-- 

Jocelyn


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
