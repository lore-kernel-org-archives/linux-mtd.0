Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84486C282CD
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Mar 2025 17:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ReUTH94jVI4jgya30/MLKWw2P9+dRH1kanIqz0PVmk=; b=41Dwl4JE1UZf1+
	2fUis3dmeU/63IllT8RVXLRGKEDuJGcT18bhDVuZDISpYJgZbBn+mH86lTpHtNsLevMf4cyJW5mVD
	tcORB0hLID/wIp2ua1RAHMLAu6GcRpHyx/JnuPcf1ODkyCopui8piUID8huJvo4oAEGdiTHpqgmZl
	Dfg++/PFkFtPOg/+ztBYvzOYzNlXLpcmrHjKbXz1iQV+05B0Lx6Lxgz2Q4suTIcADdGHJZzuW2iJt
	a7ZxRRV20kvmyO1tAHuiblJJkgXVSbc8XR40CrA+50BWZ7Rt5d/jBHHaZ/AJpTFWSNukensLPLO6V
	4MRtr6i7W1h5dR238nwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ton8C-0000000GQui-0Fz7;
	Sun, 02 Mar 2025 17:29:36 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ton88-0000000GQtX-3j29
	for linux-mtd@lists.infradead.org;
	Sun, 02 Mar 2025 17:29:34 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22113560c57so70129155ad.2
        for <linux-mtd@lists.infradead.org>; Sun, 02 Mar 2025 09:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740936571; x=1741541371; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F6ZCGe4y+NrZlyq86eJklBAPAtlKmsrb7/h5k5VN62A=;
        b=LpQOBNoSvZv0nB2sJ4mWrFBdNgD3shgJWrvUkx3uWZ8aLVIIzmYuxb1VF+c00ihtKH
         HQoIBjDn1pV+cXJ6u8/gXE64CXm3OhN45fXT9wN1zE0VEzQlDeq3vasEkJe+LrwopDk6
         xfcYzkUTF4sKwUNwr4A7OcLxfBLamCRCkKDhKajDfAlyKWUT7zxNitEtW291J3Fq9Kfq
         HLBO/IsMjARa45bINyXqy9QbRECiSyl8Q2FAQMYOCEBM/N5BeRW5fN2EV6uZRZL6lnWJ
         uj3x7nlVjmMDATn7ybhnTX174SiS+1FKbypydkrrCir1CnCUcVdhxg+gTwtU6gBR2DR3
         5S4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740936571; x=1741541371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6ZCGe4y+NrZlyq86eJklBAPAtlKmsrb7/h5k5VN62A=;
        b=mC+1o3UuqAmtvfVs2CxxOugG7VlF4Q4HT0M86J4uVvC9shDZdKcnKYIvkojufHbTiR
         Ge3rLOfBTrRDiQnnIcymhXME/zVcU/nXmBv10jHQct4DBtsHq74tygiLgkj0sRo56hNC
         fyxLlMcbfEdY7OpISbhVwusglWs2k83ydrYNzmkmmG0s5sVtiCq9MMGpXvIJappX4wpi
         xBSyjj7vQ5aKCxhp3IC2+ToN2V9VowIciEOoxDyn1w22/3E+rTp9GAvKkKa9ukoK4U0y
         4II0oTUwhaZHEOJpHSv49JLCbEwHMcZbHZg/UC81/6jIQfdm+k4xtaAKbwi9zlEl15yG
         Xfpg==
X-Forwarded-Encrypted: i=1; AJvYcCV5NsIwV/cBdTmiyLdEGBANPBUaNDKwVhs94Tmud+fXl0Q5xcPvSWL6+PuQogqwhxZNn8ikfXxEb64=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKWFSLMVmlvCQ49txZB1BcmHkZuFTofYeIRWPOYLqXKE4M2eH/
	/YHmaA1pCKpfZbNVrn8JP/n0nuqcVmwf8ElXNhTzp+qEuEsJVMEK
X-Gm-Gg: ASbGncs3QFJy1ACr+QfD/aUH5Kx9bmqen8XRCCsocB8Vu+uS7jZR21azGiD5Qp3iQw0
	zdbYu52c4JkFUJtXBY2BA35jAr7XwYemVrWHTGDSKiyyv24LDra8o9d4eHPUKRvdOWQ1VsxAGhn
	qKMgv3ie+iUSuTCRWsVnZ9WPW7G5JAg69X3TY6sp1BpDrQrejFGbrLAsyaiR6JPlFpHQMgLrXX1
	jxvUflnI4ambiNaMb+p6c2IyRjFSytGSigyZ+LodC+pxPDwDF4hzF3lK5Avm7Vwdyz3PfD1mpXL
	/NPrWy0DWsfnK3w4avWHUv0rP9N3cJ8iZpE8VVfnYUn/qR+q04sZOA0RCGxdWlLGeEGWfYBo
X-Google-Smtp-Source: AGHT+IFt6urRym4WR3nEgHXocQXsBPo8f95q1Tv9F4zN9t1ak3mwZH/5HEBVwX+gwh+7S1iAMAQaDw==
X-Received: by 2002:a17:902:ce8f:b0:21f:1bd:efd4 with SMTP id d9443c01a7336-22368fa8f91mr140115905ad.19.1740936571101;
        Sun, 02 Mar 2025 09:29:31 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc28esm62734585ad.166.2025.03.02.09.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 09:29:30 -0800 (PST)
Date: Mon, 3 Mar 2025 01:29:19 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
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
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
 <Z8SBBM_81wyHfvC0@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z8SBBM_81wyHfvC0@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_092932_949206_E204C0E6 
X-CRM114-Status: GOOD (  52.96  )
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

Hi Yury,

On Sun, Mar 02, 2025 at 11:02:12AM -0500, Yury Norov wrote:
> On Sun, Mar 02, 2025 at 04:20:02PM +0800, Kuan-Wei Chiu wrote:
> > Hi Yury,
> > 
> > On Sat, Mar 01, 2025 at 10:10:20PM -0500, Yury Norov wrote:
> > > On Sat, Mar 01, 2025 at 10:23:52PM +0800, Kuan-Wei Chiu wrote:
> > > > Add generic C implementations of __paritysi2(), __paritydi2(), and
> > > > __parityti2() as fallback functions in lib/parity.c. These functions
> > > > compute the parity of a given integer using a bitwise approach and are
> > > > marked with __weak, allowing architecture-specific implementations to
> > > > override them.
> > > > 
> > > > This patch serves as preparation for using __builtin_parity() by
> > > > ensuring a fallback mechanism is available when the compiler does not
> > > > inline the __builtin_parity().
> > > > 
> > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > ---
> > > >  lib/Makefile |  2 +-
> > > >  lib/parity.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 49 insertions(+), 1 deletion(-)
> > > >  create mode 100644 lib/parity.c
> > > > 
> > > > diff --git a/lib/Makefile b/lib/Makefile
> > > > index 7bab71e59019..45affad85ee4 100644
> > > > --- a/lib/Makefile
> > > > +++ b/lib/Makefile
> > > > @@ -51,7 +51,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
> > > >  	 bsearch.o find_bit.o llist.o lwq.o memweight.o kfifo.o \
> > > >  	 percpu-refcount.o rhashtable.o base64.o \
> > > >  	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
> > > > -	 generic-radix-tree.o bitmap-str.o
> > > > +	 generic-radix-tree.o bitmap-str.o parity.o
> > > >  obj-y += string_helpers.o
> > > >  obj-y += hexdump.o
> > > >  obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
> > > > diff --git a/lib/parity.c b/lib/parity.c
> > > > new file mode 100644
> > > > index 000000000000..a83ff8d96778
> > > > --- /dev/null
> > > > +++ b/lib/parity.c
> > > > @@ -0,0 +1,48 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * lib/parity.c
> > > > + *
> > > > + * Copyright (C) 2025 Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > + * Copyright (C) 2025 Yu-Chun Lin <eleanor15x@gmail.com>
> > > > + *
> > > > + * __parity[sdt]i2 can be overridden by linking arch-specific versions.
> > > > + */
> > > > +
> > > > +#include <linux/export.h>
> > > > +#include <linux/kernel.h>
> > > > +
> > > > +/*
> > > > + * One explanation of this algorithm:
> > > > + * https://funloop.org/codex/problem/parity/README.html
> > > 
> > > I already asked you not to spread this link. Is there any reason to
> > > ignore it?
> > > 
> > In v2, this algorithm was removed from bitops.h, so I moved the link
> > here instead. I'm sorry if it seemed like I ignored your comment.
> 
> Yes, it is.
>  
> > In v1, I used the same approach as parity8() because I couldn't justify
> > the performance impact in a specific driver or subsystem. However,
> > multiple people commented on using __builtin_parity or an x86 assembly
> > implementation. I'm not ignoring their feedback-I want to address these
> 
> Please ask those multiple people: are they ready to maintain all that
> zoo of macros, weak implementations, arch implementations and stubs
> for no clear benefit? Performance is always worth it, but again I see
> not even a hint that the drivers care about performance. You don't
> measure it, so don't care as well. Right?
> 
> > comments. Before submitting, I sent an email explaining my current
> > approach: using David's suggested method along with __builtin_parity,
> > but no one responded. So, I decided to submit v2 for discussion
> > instead.
> 
> For discussion use tag RFC.
> 
> > 
> > To avoid mistakes in v3, I want to confirm the following changes before
> > sending it:
> > 
> > (a) Change the return type from int to bool.
> > (b) Avoid __builtin_parity and use the same approach as parity8().
> > (c) Implement parity16/32/64() as single-line inline functions that
> >     call the next smaller variant after xor.
> > (d) Add a parity() macro that selects the appropriate parityXX() based
> >     on type size.
> > (e) Update users to use this parity() macro.
> > 
> > However, (d) may require a patch affecting multiple subsystems at once
> > since some places that already include bitops.h have functions named
> > parity(), causing conflicts. Unless we decide not to add this macro in
> > the end.
> > 
> > As for checkpatch.pl warnings, they are mostly pre-existing coding
> > style issues in this series. I've kept them as-is, but if preferred,
> > I'm fine with fixing them.
> 
> Checkpatch only complains on new lines. Particularly this patch should
> trigger checkpatch warning because it adds a new file but doesn't touch
> MAINTAINERS. 
> 
For example, the following warning:

ERROR: space required after that ',' (ctx:VxV)
#84: FILE: drivers/input/joystick/sidewinder.c:368:
+                       if (!parity64(GB(0,33)))
                                          ^

This issue already existed before this series, and I'm keeping its
style unchanged for now.

> > If anything is incorrect or if there are concerns, please let me know.
> > 
> > Regards,
> > Kuan-Wei
> > 
> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > index c1cb53cf2f0f..47b7eca8d3b7 100644
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -260,6 +260,43 @@ static inline int parity8(u8 val)
> >  	return (0x6996 >> (val & 0xf)) & 1;
> >  }
> > 
> > +static inline bool parity16(u16 val)
> > +{
> > +	return parity8(val ^ (val >> 8));
> > +}
> > +
> > +static inline bool parity32(u32 val)
> > +{
> > +	return parity16(val ^ (val >> 16));
> > +}
> > +
> > +static inline bool parity64(u64 val)
> > +{
> > +	return parity32(val ^ (val >> 32));
> > +}
> 
> That was discussed between Jiri and me in v2. Fixed types functions
> are needed only in a few very specific cases. With the exception of
> I3C driver (which doesn't look good for both Jiri and me), all the
> drivers have the type of variable passed to the parityXX() matching 
> the actual variable length. It means that fixed-type versions of the
> parity() are simply not needed. So if we don't need them, please don't
> introduce it.
>
So, I should add the following parity() macro in v3, remove parity8(),
and update all current parity8() users to use this macro, right?

I changed u64 to __auto_type and applied David's suggestion to replace
the >> 32 with >> 16 >> 16 to avoid compiler warnings.

Regards,
Kuan-Wei

#define parity(val)					\
({							\
	__auto_type __v = (val);			\
	bool __ret;					\
	switch (BITS_PER_TYPE(val)) {			\
	case 64:					\
		__v ^= __v >> 16 >> 16;			\
		fallthrough;				\
	case 32:					\
		__v ^= __v >> 16;			\
		fallthrough;				\
	case 16:					\
		__v ^= __v >> 8;			\
		fallthrough;				\
	case 8:						\
		__v ^= __v >> 4;			\
		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
		break;					\
	default:					\
		BUILD_BUG();				\
	}						\
	__ret;						\
})

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
