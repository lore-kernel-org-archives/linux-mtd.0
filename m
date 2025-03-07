Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FFDC19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVcF/VHLM/JYZudlRVSJaWTNVGdkcCWP/f2i8gzKMZU=; b=QWP/LPgEcKdtgt
	R9FvXLBlYnjl28fXmGjLj92zalNpUnQmy/cDAKORenme6I7NCFUW5QBLrhmEyZocdMNgzjRdZLYin
	/ChmWIJ8z8ds+F2DmZ66lcnwKQ1I2D35AsBgUfbzruG81EDFOylMi7MRanikVXVP5+MpTTxR2erTe
	yxOIfRNsGWyJqsBbk4IRoYVl0/AZ7ZMZaVCQjarRZ+jfSu6NdTtj0qw6leZaHiuRUpZvvLG4CQYP6
	+jbqczOlPT4l0+tli2Nz0W4jr2Qyh6eBHlfl3qs/+Cg+s3t9nBbeUTxAC7HHxV8TCYZtplh/9iml+
	de2xh/9oBJEOkDEjT9Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTwq-0000000DhkP-0Cdi;
	Fri, 07 Mar 2025 09:24:52 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTuO-0000000DhGp-0ZkK
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 09:22:21 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f42992f608so2956820a91.0
        for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2025 01:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741339339; x=1741944139; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XztObitingC3692I+pBVpdt55S8NywKGMFDoLFkCI1M=;
        b=VB4NuLBlHqJeiI605Yw/xVMopYXsWktZBOmq0I09dN0H+Wrw+TSdBobC+CRYAwV7NH
         r2xSJF0kjPYkdlcZqzegQ8xUCinLCkJkBJ6hD0F7zvTn4oO4PJAKC/ZIr786usySJTjg
         OvSfGRzM5XMS4jZMkOcqXCcGGiDr4VyVKjcKTiYt5qzFrixOuTReHWFWSaYKqg7dEjXB
         vHxoBnAhmF8IbWu6JH+HJ6FDQtjqf7MoJa0zhfKv8p9171zY9VodMC5+rbYDV5pzH0xt
         Kaj0Ppsm/MrhCmqLRnpSsvXom11u/D3h1GecHGffgaquHt2V90CV1HjkEmaRp92pcF/Z
         qqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339339; x=1741944139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XztObitingC3692I+pBVpdt55S8NywKGMFDoLFkCI1M=;
        b=xRJ2qUxSV/1PebtjxV0CURXgzChg7rlPNv16YfaC8CCo7Qk5vk6b00w58IgF3qEsmk
         Kf06kaBCgb3oUINXlQvJikJPgpCkGxrfoFaZHQVCd1YW/c5/Y8BDrgFlwzltC4qw4nCF
         OTE2DCdQXvUSaf+wvctkCtToSN0oPWzCE7ITf8LKD68VN6a0T6fdmpqF/FlWjOxM9Omx
         MdVTu4RPtPpZa70sIbdrxHvSxWpAtLYMNqcgFmQWR8ne+bAvOWJYJ+ZCGfRqj0CNc1i2
         o5hQjEy07EUbI5rwdmMqz8S7l06bYlWHQ+SdabLZNus8bIHbw0tYLnWc7xmKjLaPJJm9
         Pojg==
X-Forwarded-Encrypted: i=1; AJvYcCU1fdy0Se4pHDjTS3iXBtM93CPz+wYsXHmgdwuR5metXBaQ84vJ63M1LNcdQ/iFAwaFpYj6A3gBkzk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIAcR6aWc1+DDwvtQIKa4rTtAOx7RArOTVci1oJhM15wdqx+wO
	lSHi3xhkDnjBuNujDAFlcImvtv3/y2V8nEANTl0/h3HNkDUGBl94
X-Gm-Gg: ASbGncvhlbUr9ArIieWGEXl+4ztMq2f/+DJaV8myXj9EzHuyvrXQem6jLQDelU6jrvq
	jM0dgi6niP1rnyZz0QGvjOGZV2sbeaJ+XgAMub3UMke9WdHwtQZDdm8QBx4TXQht8PaDoSx/ii5
	S8Y8aP6ydUvGRi+HhOUa+BtoQ0y9aCYo7PksQesBGMTl8IJz5YsbGveE+hUquI8QNlKiI2U4k+d
	WGLHJNw74TEsR8Fs2ePA8JqWcKERV8rDnXnB/1YfcTxXER9JGoBLPgVTsA3Pc1c+GTlXTwEudir
	kBOMpGJ8NVbf0yTP7ZAREThGTBPaMqd5B6ljDV5PzDHEJ4XB9bp/WvMMgxqef8dELt+Ev245
X-Google-Smtp-Source: AGHT+IGO3Fg5mznURfAXFZCPAiOd6NJZ8MzxOEXeMR65d6OVc42NCiVYA5M/yoTVlsiOwEwCHpbcoQ==
X-Received: by 2002:a17:90b:3911:b0:2fa:1a23:c01d with SMTP id 98e67ed59e1d1-2ff7ce8b5ffmr4029616a91.21.1741339339019;
        Fri, 07 Mar 2025 01:22:19 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e7fb5sm2876725a91.37.2025.03.07.01.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:22:18 -0800 (PST)
Date: Fri, 7 Mar 2025 17:22:08 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
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
	yury.norov@gmail.com, akpm@linux-foundation.org, hpa@zytor.com,
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
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z8q6wPWXImCeGI8P@visitorckw-System-Product-Name>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <3dfc81eb-caa1-42fe-8fd6-61101de0ef13@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3dfc81eb-caa1-42fe-8fd6-61101de0ef13@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_012220_175089_780E35F8 
X-CRM114-Status: GOOD (  21.16  )
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

Hi Jiri,

On Fri, Mar 07, 2025 at 07:57:48AM +0100, Jiri Slaby wrote:
> On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:
> > Several parts of the kernel contain redundant implementations of parity
> > calculations for 16/32/64-bit values. Introduces generic
> > parity16/32/64() helpers in bitops.h, providing a standardized
> > and optimized implementation.
> > 
> > Subsequent patches refactor various kernel components to replace
> > open-coded parity calculations with the new helpers, reducing code
> > duplication and improving maintainability.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > In v3, I use parityXX() instead of the parity() macro since the
> > parity() macro may generate suboptimal code and requires special hacks
> > to make GCC happy. If anyone still prefers a single parity() macro,
> > please let me know.
> 
> What is suboptimal and where exactly it matters? Have you actually measured
> it?
> 
In the previous thread, David and Yury had different opinions regarding
the implementation details of the parity() macro. I am trying to find a
solution that satisfies most people while keeping it as simple as
possible.

I cannot point to any specific users who are particularly concerned
about efficiency, so personally, I am not really concerned about the
generated code either. However, I am not a fan of the #if gcc #else
approach, and Yury also mentioned that he does not like the >> 16 >> 16
hack. At the same time, David pointed out that GCC might generate
double-register math. Given these concerns, I leaned toward reverting
to the parityXX() approach.

If you still prefer using the parity() macro, we can revisit and
discuss its implementation details further.

> > Additionally, I changed parityXX() << y users to !!parityXX() << y
> > because, unlike C++, C does not guarantee that true casts to int as 1.
> 
> How comes? ANSI C99 exactly states:
> ===
> true
> which expands to the integer constant 1,
> ===
> 
I gave a more detailed response in my reply to Peter. If we can confirm
that casting bool to int will only result in 1 or 0, I will remove the
!! hack in the next version.

Regards,
Kuan-Wei


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
