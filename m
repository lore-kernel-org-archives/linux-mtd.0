Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C53C36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 19:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMgPRcIt+6tGx2EdN6vObDxdh41Q4EHw3GaxC8a249o=; b=OM2Rqio7P0pcVv
	8HWQSYnK1T5GwSvVHFrMsHpGx+gplCE09NMNAfrUD70McsL5EzBruyYHCiOHW7Vxu3Amufza2zzon
	j6SPJSgbBRvxB066mB362fzfxpv18yivh9U9T71cmmQt+nwCVEJmGQx1hbR6KpMJWffR1oRbm9yM1
	QdKULUF/hBsWGZgYHO5Z2XaqJL47XCeRlVyUoCHleCvQjcYX/ggVDcX1kRS8FI2t602OEwamQ+KBF
	B8ul9lWX4OC5oDQzcXoBx4Mg0SzOCFQQK/VTOw7kjPWyzf7bpNSr+g935C/7LVtztK6tczq1J6G2U
	qQoTlu2hH4PMSZjMyR1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2azP-00000008ImV-2uXV;
	Wed, 09 Apr 2025 19:21:35 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2azN-00000008Ilo-2VXW;
	Wed, 09 Apr 2025 19:21:34 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-739525d4e12so6603374b3a.3;
        Wed, 09 Apr 2025 12:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744226493; x=1744831293; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+fSnm+LAeRoIOsICdxC6XJUJVWVyIvXXXOFvA8oRabs=;
        b=CtjpgonQ4Nh6zxkIzsQUPchBnydy7QlYDJUO1Ura7yoT1NvuBD37zYUrODT3iXJAX4
         i4saXyz1J8YPFX/FeimKMBFo8rFvU0JiZOqErazrwISYmkfE+9GdANPVly6f4u8GutwI
         ETkneidsoo7x7ADTe7PeVgL9CY6IRRM5MsaYY3k/UhI33plLiigNBWi2b6YriHz8/erE
         YjWRNLMa260iZ2ZVEnuUeDO82IhbGmJ+9MTpubPIA4kDptRTeBB9h459q6Z+GrFHYkQV
         tpSz+G0zb8OMJwRyhUuZr4w0pWSAPp3+TZ1+yewh1zLz7XkmV+FV25T3ALhmD59Wic3c
         by7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226493; x=1744831293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fSnm+LAeRoIOsICdxC6XJUJVWVyIvXXXOFvA8oRabs=;
        b=foHowtQ0+6FwHepg1kd2M65mjLlYYj8VQ/NaI241unQwRoBgl3L0Kxbme1eiYbisug
         LNd/dDyX5nz7heIo0IwvfUeLrBJ2BJZtaqKnnPjYUTLPZSHELeMeRL1W+25OFQLaffUV
         lM3oSMykhWYrBukjxScfgBSQjqywkVFqvMO28SMrTu+xWbPm81X63KAhV4peX0LKz+IS
         0EiFfA3t+TgCNLKHpm8MA0KWNs4k/6COgaCLDlCwZpcKmztTctgGAVUQX4SNnnwUTP+t
         TUnIeITYQx/8JuTIhqdUUmGS7b1A5siOWrANNYH8cqDbuvh7j0vsd8XWsrnKbP+X/Ki2
         qjAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr9S5g9pTwjwgWSYPEm8ikJms0Vmrh3e6T6aMoNlSDkbZdfDQjGRuoNWHSksQcsI1Qw8+eJ0W/VrGd@lists.infradead.org, AJvYcCXLdspeYSyhJ817JkRioIl83QiFqXcXaidM68U9LjqbDAb46WzUhZo2yzGZBktIWk3uqNSeYUgucNc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLx09mlbsUW7vDhefwXe1P1rhyj83bixzfzlTv4+HXJQQQnIho
	7cdjTxGRfV4a7GKciKmRW3uuXGMu1piXXAiAMt9aQEkrl3cQFvZU
X-Gm-Gg: ASbGncst3W48sIbQAXW7OvC7doM0PkBU4CuNILfVlG9TgIA1ZzEkvMzFbFl05X+mkS0
	1qYW09ysxvjYCEzJZC+xsgPDB/yxsJjPl2wHjiCs1oLqbozbiBV1NyciG0TStJQ4j2admAvBMjo
	jpVM42eJPljRs+Um2xiE1/qEp0EQsfxq8wmuuoUoP4/GbXYuFy8xORtjZOos/7H+Aa61eEhLJMq
	STt0DMe8j5YxVKimH4J7SaZ5NBb4vrDn9rwsCWzCIXG7bQZoR5yYKwesEiVW1e655IHzmeL9wb4
	eqQeJonTdXQPt7szcMWm6hcRPQfTs4nbU06H0/VdvJlxJGI9F5SAVVu4jEl4L0gLOfNU
X-Google-Smtp-Source: AGHT+IHAXQm8yqDVRx3hUkKcG0uQQDMrqQOD2SeunqXbiHMcL37CayQuCVkU18t9V7SBUxyy5kmIoQ==
X-Received: by 2002:a05:6a20:9c89:b0:1f5:873b:3d32 with SMTP id adf61e73a8af0-201695fb36dmr272504637.39.1744226492588;
        Wed, 09 Apr 2025 12:21:32 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e69376sm1726443b3a.165.2025.04.09.12.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:21:32 -0700 (PDT)
Date: Thu, 10 Apr 2025 03:21:21 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Yury Norov <yury.norov@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	alexandre.belloni@bootlin.com, pgaj@cadence.com, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 01/13] bitops: Change parity8() to parity_odd() with
 u64 input and bool return type
Message-ID: <Z/bIsT7RT1C7rGYC@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-2-visitorckw@gmail.com>
 <Z_anYpZw_E8ehN21@yury>
 <Z/a7t1yATUXn11vD@visitorckw-System-Product-Name>
 <315b4c75-a596-4509-99f7-921ebda2fed9@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <315b4c75-a596-4509-99f7-921ebda2fed9@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_122133_637849_33EB334B 
X-CRM114-Status: GOOD (  26.31  )
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

On Wed, Apr 09, 2025 at 11:39:22AM -0700, Guenter Roeck wrote:
> On 4/9/25 11:25, Kuan-Wei Chiu wrote:
> > On Wed, Apr 09, 2025 at 12:59:14PM -0400, Yury Norov wrote:
> > > On Wed, Apr 09, 2025 at 11:43:44PM +0800, Kuan-Wei Chiu wrote:
> > > > Redesign the parity8() helper as parity_odd(), changing its input type
> > > > from u8 to u64 to support broader use cases and its return type from
> > > > int to bool to clearly reflect the function's binary output. The
> > > > function now returns true for odd parity and false for even parity,
> > > > making its behavior more intuitive based on the name.
> > > > 
> > > > Also mark the function with __attribute_const__ to enable better
> > > > compiler optimization, as the result depends solely on its input and
> > > > has no side effects.
> > > > 
> > > > While more efficient implementations may exist, further optimization is
> > > > postponed until a use case in performance-critical paths arises.
> > > > 
> > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > ---
> > > >   arch/x86/kernel/bootflag.c               |  4 ++--
> > > >   drivers/hwmon/spd5118.c                  |  2 +-
> > > >   drivers/i3c/master/dw-i3c-master.c       |  2 +-
> > > >   drivers/i3c/master/i3c-master-cdns.c     |  2 +-
> > > >   drivers/i3c/master/mipi-i3c-hci/dat_v1.c |  2 +-
> > > >   include/linux/bitops.h                   | 19 ++++++++++++-------
> > > >   6 files changed, 18 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
> > > > index 73274d76ce16..86aae4b2bfd5 100644
> > > > --- a/arch/x86/kernel/bootflag.c
> > > > +++ b/arch/x86/kernel/bootflag.c
> > > > @@ -26,7 +26,7 @@ static void __init sbf_write(u8 v)
> > > >   	unsigned long flags;
> > > >   	if (sbf_port != -1) {
> > > > -		if (!parity8(v))
> > > > +		if (!parity_odd(v))
> 
> What is the benefit of this change all over the place instead of
> adding parity_odd() as new API and keeping the old one (just letting
> it call the new API) ?
> 
> A simple
> 
> static inline int parity8(u8 val)
> {
> 	return parity_odd(val);
> }
> 
> would have done the trick and be much less invasive.
> 
Yury has previously mentioned that adding multiple fixed-type parity
functions increases his maintenance burden. IIUC, he prefers having a
single interface in bitops.h rather than multiple ones.

He were reluctant to add three more functions like:

static inline bool parity16(u16 val)
{
    return parity8(val ^ (val >> 8));
}

static inline bool parity32(u32 val)
{
    return parity16(val ^ (val >> 16));
}

static inline bool parity64(u64 val)
{
    return parity32(val ^ (val >> 32));
}

But instead, we ended up with:

static inline bool parity(u64 val)
{
    val ^= val >> 32;
	val ^= val >> 16;
	val ^= val >> 8;
	val ^= val >> 4;
	return (0x6996 >> (val & 0xf)) & 1;
}

static inline bool parity8(u8 val)
{
    return parity_odd(val);
}

But in the end, we introduced both parity(u64) and parity8(u8), which,
IMHO, might be even more confusing than having consistent fixed-type
helpers.

Regards,
Kuan-Wei


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
