Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8943EC28B26
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 09:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suM2OGEg4dcvEG+B3wYH+dBqTFF4Vvuvf4P0BO3kGrs=; b=wiZZiEnFK1M7aQ
	WiTTGjG4pJeVmmNn71AXQ29k9H3LU6zVBbTIIzWe4Jfas19lJAckmjT7navWq8XM3ohc9M9LjtNtd
	8xPk3KhfY/xl025ajiP4cbiZaZnVV3vBXocBQaxybCJ2OHSnxAxg6zY443Nqq52g7IerJkub8YsOF
	B4iw/k212cn2QOzOBp7uSZbvVXmLtAGIil0whbdZPBT1q4RX53fCWLS9w0wXRC9hGTwqbvLAs4BR3
	WxyKTazWxadfMQwbyxv9E5qxIDeXugOoVVOsjhABXEi+DYUhVge0DDCMrGSiM+1HD6T1cCVJ7e7S7
	tkVzsL/vBfxtbnyG+A5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTtZ-0000000DgrR-3Clr;
	Fri, 07 Mar 2025 09:21:29 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTs1-0000000DgQw-2vaR
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 09:19:55 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22423adf751so19382905ad.2
        for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2025 01:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741339193; x=1741943993; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WtFm3fAnjeubhbuWCpwfNvD+r/QsDLeKl5ss4JFiMbs=;
        b=JTMUc9AaArtspa23DXaiSv8PWmJQykYzyELgJn1CVMKQl1KMsU3iOxw7t6VrQu5eqb
         n1b3p3RGb/dezN6OhEcC7YM8uxpf6Tm5EVRJkTSVhk43F6dG6YoKzGFq+cjb0Q9M2R1j
         8kW0YSiPo8Rngkc4YJsUDbwOWEQRR2INqsXzk+qCaBDJ3RBB61B1tG2fGZdR63hD2qAR
         k5sOuWZ5bl6+2vEZQvbottCKvF2cDFdS39tZc2Ahl5pufeqSUeI5hr+2jxeYOdgNvew8
         oT2xQF3d0AOAJP0PyIsOvN7i+/oXDUcBKsQRlK54X6dBRPM6L9xxJjqb68vI2nRZl4ZF
         1vRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339193; x=1741943993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtFm3fAnjeubhbuWCpwfNvD+r/QsDLeKl5ss4JFiMbs=;
        b=UZKMzMzd7IISVbwk960ZE22+XkTUSIVtuP8Pb1ZWMke7GjRPBBLMCFHCxMY1AY8fsu
         bju5PPrEP7xfeUaTYSIcYIEmthg/SmeYMrQpV9I44TY7OH00aWe65TqeIQAZPunAP/E6
         7rsR0b+scsVCTbYyM6NGVm9Hj8uXzwKqNNa08s1iNcLJI62EYE3XfkgpxARZWu/NgibC
         UQbKZ/TztyDsWgbEOiXY+VVktdDEVRJ4Fipo0Xu5ckaKjtDbfwdVU08Bfiv565HA7q4U
         ANrjUUsvhbA0bKcEJRnMfVHAlgXYCJZh9UZn6iq+v9EfBEembvjQeVYUiKjyYaOBhA4i
         9Kag==
X-Forwarded-Encrypted: i=1; AJvYcCV8HjfREjSh9VqnM62ftxP4C0g/GzdiD6bvT5K6L/Ho/a8CIUYzCLAnXKGnuD26Kx//vpEwLsMf96c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy5TOfHH7ab+wT6ygHdbQNfFmdS9SmYWqYzHMGGoB2Kaj92jlr
	jEhxC5KMMdKB1w56pK3YtAuEW1jUbTlNjo2uDxzCq0Bmexy35aHq
X-Gm-Gg: ASbGncvVDdAnrkb+PKvBoYmvNEuBbKaUPHtAVOxgk88OgURZylmRJ1+sC8FWnrUplBQ
	Y0zhQWIpVmCAns0WnvrIWMSHdS562+sgNi7e2+iDQIoK8AKBGIk0x+uPAx+jAMPXmVSk+58IEwf
	2b+e14X3VbnJl6NQVVceqnEYI9NLLTgIfEIjXop70b/eNAuVtJRN/p1yGIVVOl294a/5Csdm9sL
	EvmQSBjW8uwGPcJBDjV8xegiTtIe1WtxAuI0i/Y/7Lf4CxRywgbLFU+3D/N7i9WDM87s/SjOwUk
	cBhPel4HmMZKfiQyeSXliOOBRXw7sNFxAGQXc4IaHvzPHxD6VIkhHKrzK/9zO4+/nIACtqYF
X-Google-Smtp-Source: AGHT+IE3b9zkIaLC0mzOF8WD1s1QYwmhsrk+TIJsgXANJenF5GXtHRIhAmThoWOF8+4okLgNhjrCPg==
X-Received: by 2002:a05:6a20:9381:b0:1ee:cdda:b8f8 with SMTP id adf61e73a8af0-1f544acb430mr5633011637.7.1741339192556;
        Fri, 07 Mar 2025 01:19:52 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698243f21sm2854684b3a.52.2025.03.07.01.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:19:51 -0800 (PST)
Date: Fri, 7 Mar 2025 17:19:42 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>, longman@redhat.com, llong@redhat.com
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
	jirislaby@kernel.org, yury.norov@gmail.com,
	akpm@linux-foundation.org, alistair@popple.id.au,
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z8q6LlkQDG95Amgw@visitorckw-System-Product-Name>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <F134DC06-54DE-4B8E-8AE0-3740275835C1@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F134DC06-54DE-4B8E-8AE0-3740275835C1@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_011953_743188_A4F3DC33 
X-CRM114-Status: GOOD (  32.02  )
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

+Cc Waiman Long for bool cast to int discussion

Hi Peter,

On Thu, Mar 06, 2025 at 07:14:13PM -0800, H. Peter Anvin wrote:
> On March 6, 2025 8:25:25 AM PST, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> >Several parts of the kernel contain redundant implementations of parity
> >calculations for 16/32/64-bit values. Introduces generic
> >parity16/32/64() helpers in bitops.h, providing a standardized
> >and optimized implementation. 
> >
> >Subsequent patches refactor various kernel components to replace
> >open-coded parity calculations with the new helpers, reducing code
> >duplication and improving maintainability.
> >
> >Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> >---
> >In v3, I use parityXX() instead of the parity() macro since the
> >parity() macro may generate suboptimal code and requires special hacks
> >to make GCC happy. If anyone still prefers a single parity() macro,
> >please let me know.
> >
> >Additionally, I changed parityXX() << y users to !!parityXX() << y
> >because, unlike C++, C does not guarantee that true casts to int as 1.
> >
> >Changes in v3:
> >- Avoid using __builtin_parity.
> >- Change return type to bool.
> >- Drop parity() macro.
> >- Change parityXX() << y to !!parityXX() << y.
> >
> >
> >Changes in v2:
> >- Provide fallback functions for __builtin_parity() when the compiler
> >  decides not to inline it
> >- Use __builtin_parity() when no architecture-specific implementation
> >  is available
> >- Optimize for constant folding when val is a compile-time constant
> >- Add a generic parity() macro
> >- Drop the x86 bootflag conversion patch since it has been merged into
> >  the tip tree
> >
> >v1: https://lore.kernel.org/lkml/20250223164217.2139331-1-visitorckw@gmail.com/
> >v2: https://lore.kernel.org/lkml/20250301142409.2513835-1-visitorckw@gmail.com/
> >
> >Kuan-Wei Chiu (16):
> >  bitops: Change parity8() return type to bool
> >  bitops: Add parity16(), parity32(), and parity64() helpers
> >  media: media/test_drivers: Replace open-coded parity calculation with
> >    parity8()
> >  media: pci: cx18-av-vbi: Replace open-coded parity calculation with
> >    parity8()
> >  media: saa7115: Replace open-coded parity calculation with parity8()
> >  serial: max3100: Replace open-coded parity calculation with parity8()
> >  lib/bch: Replace open-coded parity calculation with parity32()
> >  Input: joystick - Replace open-coded parity calculation with
> >    parity32()
> >  net: ethernet: oa_tc6: Replace open-coded parity calculation with
> >    parity32()
> >  wifi: brcm80211: Replace open-coded parity calculation with parity32()
> >  drm/bridge: dw-hdmi: Replace open-coded parity calculation with
> >    parity32()
> >  mtd: ssfdc: Replace open-coded parity calculation with parity32()
> >  fsi: i2cr: Replace open-coded parity calculation with parity32()
> >  fsi: i2cr: Replace open-coded parity calculation with parity64()
> >  Input: joystick - Replace open-coded parity calculation with
> >    parity64()
> >  nfp: bpf: Replace open-coded parity calculation with parity64()
> >
> > drivers/fsi/fsi-master-i2cr.c                 | 18 ++-----
> > .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 +--
> > drivers/input/joystick/grip_mp.c              | 17 +-----
> > drivers/input/joystick/sidewinder.c           | 24 ++-------
> > drivers/media/i2c/saa7115.c                   | 12 +----
> > drivers/media/pci/cx18/cx18-av-vbi.c          | 12 +----
> > .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 +--
> > drivers/mtd/ssfdc.c                           | 20 ++-----
> > drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +--
> > drivers/net/ethernet/oa_tc6.c                 | 19 ++-----
> > .../broadcom/brcm80211/brcmsmac/dma.c         | 16 +-----
> > drivers/tty/serial/max3100.c                  |  3 +-
> > include/linux/bitops.h                        | 52 +++++++++++++++++--
> > lib/bch.c                                     | 14 +----
> > 14 files changed, 77 insertions(+), 153 deletions(-)
> >
> 
> !!x is used with a value that is not necessary booleanized already, and is exactly equivalent to (x ? true : false). It is totally redundant on a value known to be bool.
> 
I used to believe that casting a boolean variable to int would always
result in 0 or 1 until a few months ago when Waiman Long explicitly
pointed out during a review that C does not guarantee this.

So I revisited the C11 standard, which states that casting to _Bool
always results in 0 or 1 [1]. Another section specifies that bool,
true, and false are macros defined in <stdbool.h>, with true expanding
to 1 and false to 0. However, these macros can be #undef and redefined
to other values [2]. I'm not sure if this is sufficient to conclude
that casting bool to int will always result in 0 or 1, but if the
consensus is that it does, I'll remove the !! hack in the next version.

> If (int)true wasn't inherently 1, then !! wouldn't work either. 
> 
The C standard guarantees that the ! operator returns an int, either 0
or 1. So regardless of how true casts, using !! should work. Right?

> There was a time when some code would use as a temporary hack: 
> 
> typedef enum { false, true } bool;
> 
> ... when compiling on pre-C99 compilers; in that case a (bool) case wouldn't necessarily work as expected, whereas !! would. Furthermore, unlike (bool), !! works in the preprocessor.

I'm not entirely sure how !! works in the preprocessor. I always
thought it was handled by the compiler. Could you elaborate on this?

Regards,
Kuan-Wei

[1]: 6.3.1.2 Boolean type
1 When any scalar value is converted to _Bool, the result is 0 if the value compares equal
to 0; otherwise, the result is 1.59)

[2]: 7.18 Boolean type and values <stdbool.h>
1 The header <stdbool.h> defines four macros.
2 The macro
bool
expands to _Bool.
3 The remaining three macros are suitable for use in #if preprocessing directives. They
are
true
which expands to the integer constant 1,
false
which expands to the integer constant 0, and
_ _bool_true_false_are_defined
which expands to the integer constant 1.
4 Notwithstanding the provisions of 7.1.3, a program may undefine and perhaps then
redefine the macros bool, true, and false.
259)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
