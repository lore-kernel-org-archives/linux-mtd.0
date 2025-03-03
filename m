Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9DAC282D3
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Mar 2025 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+IFD/3N8aw4fLgKnHnWwR8Qq3uYJqNjjLT2CVQLRpI=; b=N+HM0FwXIGjYKL
	t0sCMaqgTojb2TnHt+yzY/VHYb5/XSiFjZCcB+afeL0Xi9CTWdwFR1IKFDOFXcd6zkws66VuTW6c/
	xqmsR1MubB6gOYfw9AdO6iQ43TbAoytUu0DSOXczPAD8+OjR2zihGhPcwkNC1LTvlDitHDWc0GEVR
	Ptk5IMZ8U5k4+xm/EuMbEtlhdScYvJwmNXNk8qxRmYIQwryV+0NjRToqDGcWyjE73g4K7akv0C89J
	HS07SB0BQ+XAxEVxYEQLxti4F9ZdEzgvA6ncrtP43H/VZ/Q31fwDjslcoySTG2+yVuvOvMPnrcpvQ
	a1PHIMddVGT6kSnz3lcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8PW-00000001SRm-3S6L;
	Mon, 03 Mar 2025 16:12:54 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7x5-00000001Mpy-1yvm
	for linux-mtd@lists.infradead.org;
	Mon, 03 Mar 2025 15:43:32 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e589c258663so5042920276.1
        for <linux-mtd@lists.infradead.org>; Mon, 03 Mar 2025 07:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741016610; x=1741621410; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1bze7IhHFHWNKOAl2fnuzVpo5poDDbwUFQZHYPw6zzY=;
        b=QNXsmNDpkdmZKpsClXO79GhV1xwwMaII0RrWkQ9FWybrYJRimqyj0Mkuk0Y4dAykES
         hi36KA/Z+2efMT+pvLhWdqbbreYf9U7tGxYx4d4pB53fP3UAeFN/op6wDQ6tAK93/HJ5
         X23EAoihi7P6FBK3Vypoxn0sCCwPvkNPbxC2QukGXojiGjLlKJFDxrdvJWOIKpWVlkyv
         QLs9YeFceJ8KO8shy7uNQ8mxjuRjgz62oU+UC7V1DqE63vWjvw8IjPcrtHRjUt0RHlZw
         8vnxu9P83imBYOskJXP41hVaQeFZ6T7MQGux+pDLhVGrDPBuLy754cR1AxEVXuPG3wGe
         zH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741016610; x=1741621410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bze7IhHFHWNKOAl2fnuzVpo5poDDbwUFQZHYPw6zzY=;
        b=kVvs8yTOi6G2j3OE8ayPIpRMCNiGhUn1BDuG9WRUbs1ITRQCYddeXPtG3Zi+WZ3Dcq
         S0ArqNNQYHToeZr4azN7CGopuXLHcfcFrPtwIzldn/2+ZEI0g51CDNiwdQ3RXHy8pS7t
         Wo1DakdCwBG/3rtjwZ5PVuX04J1AhjWexmBAsiZKkuhlU8vbC7Fp4vq5aj12BYhfbbAU
         rLMi0yDGw+APSL5yoYW93xe8CeVzJpI5UOtt8H8TqTsGJJ7FO5cpW+1heYqN6Uju7li9
         wh7U0XmHEfxTKKRD8/B0VA0jQxEIxH00hQQiTG+cgyV/+Y5xPOfuXWlFF1olT9Gw/Vi1
         LRhA==
X-Forwarded-Encrypted: i=1; AJvYcCVXB5xwFJAi15nI21kO6+/1NFjAf6TaC2LHukKV5ExZeabKu+QB+JlMg8aWvwAJ+0uRKtmmFFiTwM8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLcrsEM9Mxt93cuPPw1Co0p6vZCi5tZd7dPwyd1j+F1wxISCBB
	+QpHOE+AISWWNQfPRkIrdWLXIy6RGDVboRqK+FkfSN2Rc15KRIRl
X-Gm-Gg: ASbGncvHZxA8jJ8577sgAgtQHP6Qypd5cQBT3dp+QIAa/w9yqgOmq538lbqpk96eOWf
	xKxJqcY5IKSxvTGO4rVAbKOvbqvre/GIcD5VEY60HefsYnVr1zTZudUkBJZgV2LzCMsX5JhJFvN
	eGCKAihvGX3DV2SOYVPYbyDkeN60MLhzGRL5yonD5wSzLfE5kKCok4B19eanXeC+FuElbxyILqz
	CZ48+rAUxFGyZm9w0jRPRMXOLVLcmz1z0AerDRyx9+M9iA1/RhYI1Oxc2hePrEP8M1Mj0ock5z4
	I5TsI/u/E/aqOtdoAEOcgiLACny9MradOGYY4DVg8zH1oSk0Iq5OI+6DFIDiHaXhDR09Ren5Cwl
	K/zQX
X-Google-Smtp-Source: AGHT+IG89LZIvDJlj/3HacLk9/vOGUR8YR6jlY63nvw+Gy77ela/IFHbq/QbvXbn9Hpv7+y9TBQguw==
X-Received: by 2002:a05:6902:2748:b0:e5d:dda6:d25 with SMTP id 3f1490d57ef6-e60b2f5f1d5mr16067385276.45.1741016609877;
        Mon, 03 Mar 2025 07:43:29 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e60a3a20448sm3017480276.3.2025.03.03.07.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:43:29 -0800 (PST)
Date: Mon, 3 Mar 2025 10:43:28 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
	eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <Z8XOF2DMMRKqam6R@thinkpad>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
 <Z8SBBM_81wyHfvC0@thinkpad>
 <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
 <20250302190954.2d7e068f@pumpkin>
 <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_074331_510166_29442423 
X-CRM114-Status: GOOD (  19.59  )
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

On Mon, Mar 03, 2025 at 10:47:20AM +0800, Kuan-Wei Chiu wrote:
> > > #define parity(val)					\
> > > ({							\
> > > 	__auto_type __v = (val);			\
> > > 	bool __ret;					\
> > > 	switch (BITS_PER_TYPE(val)) {			\
> > > 	case 64:					\
> > > 		__v ^= __v >> 16 >> 16;			\
> > > 		fallthrough;				\
> > > 	case 32:					\
> > > 		__v ^= __v >> 16;			\
> > > 		fallthrough;				\
> > > 	case 16:					\
> > > 		__v ^= __v >> 8;			\
> > > 		fallthrough;				\
> > > 	case 8:						\
> > > 		__v ^= __v >> 4;			\
> > > 		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > > 		break;					\
> > > 	default:					\
> > > 		BUILD_BUG();				\
> > > 	}						\
> > > 	__ret;						\
> > > })
> > 
> > I'm seeing double-register shifts for 64bit values on 32bit systems.
> > And gcc is doing 64bit double-register maths all the way down.
> > 
> > That is fixed by changing the top of the define to
> > #define parity(val)					\
> > ({							\
> > 	unsigned int __v = (val);			\
> > 	bool __ret;					\
> > 	switch (BITS_PER_TYPE(val)) {			\
> > 	case 64:					\
> > 		__v ^= val >> 16 >> 16;			\
> > 		fallthrough;				\
> > 
> > But it's need changing to only expand 'val' once.
> > Perhaps:
> > 	auto_type _val = (val);
> > 	u32 __ret = val;
> > and (mostly) s/__v/__ret/g
> >
> I'm happy to make this change, though I'm a bit confused about how much
> we care about the code generated by gcc. So this is the macro expected
> in v3:

We do care about code generated by any compiler. But we don't spread
hacks here and there just to make GCC happy. This is entirely broken
strategy. Things should work the other way: compiler people should
collect real-life examples and learn from them.

I'm not happy even with this 'v >> 16 >> 16' hack, I just think that
disabling Wshift-count-overflow is the worse option. Hacking the macro
to optimize parity64() on 32-bit arch case doesn't worth it entirely.

In your patchset, you have only 3 drivers using parity64(). For each
of them, please in the commit message refer that calling generic
parity() with 64-bit argument may lead to sub-optimal code generation
with a certain compiler against 32-bit arches. If you'll get a
feedback that it's a real problem for somebody, we'll think about
mitigating it. 
 
> #define parity(val)					\
> ({							\
> 	__auto_type __v = (val);			\
> 	u32 __ret = val;				\
> 	switch (BITS_PER_TYPE(val)) {			\
> 	case 64:					\
>                 __ret ^= __v >> 16 >> 16;		\
> 		fallthrough;				\
> 	case 32:					\
> 		__ret ^= __ret >> 16;			\
> 		fallthrough;				\
> 	case 16:					\
> 		__ret ^= __ret >> 8;			\
> 		fallthrough;				\
> 	case 8:						\
> 		__ret ^= __ret >> 4;			\
> 		__ret = (0x6996 >> (__ret & 0xf)) & 1;	\
> 		break;					\
> 	default:					\
> 		BUILD_BUG();				\
> 	}						\
> 	__ret;						\
> })

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
