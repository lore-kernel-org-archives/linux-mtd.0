Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E27C36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 17:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IhT84eYOGO1H280YUo85QeTOaSXz7f/8VETvhnz/Gg=; b=JVZBD4bMt8hNLf
	uLkG2Ewt4pr1v3k7uXSKkdmwAZwIMe/P6uKbQUMlt2fa3HtoubUS6a0X+tFtCp+nNLHtk5l2rWpvu
	sX//U7z2q5itqM5xELw7PQd3hyqQIMPEO91U3lVoBfdDkvURkJ5nGDjCMFMxfcTpgllQhyY5245UG
	HFW+zBz1/T5rfmx9EITcE6A1uAcA+peEikCZ6KBkuO7bdyfOMN2CeMV3x0X0r+j9QOjFVCMTMW+gL
	5RwUiSzdMDsemM7mOmeEktSb2jUL3Ma1WtpA5NsRKpw5XKqmuevTwnp0IPbRFKNzrXqq3PShfpBbb
	EqrrtsNPfbAn6FPEbz4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YvP-00000007zji-3eyx;
	Wed, 09 Apr 2025 17:09:19 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YhD-00000007x6E-1Az8;
	Wed, 09 Apr 2025 16:54:40 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2241053582dso91916385ad.1;
        Wed, 09 Apr 2025 09:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744217678; x=1744822478; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CKpfWxOAsmcqfHthdu26r7YWnYaeAaQXRASkSMsz97E=;
        b=fpZGrsFDtwRYC2+16DQCJAlHegkXbmi9BEaBcZTGGqblDbZLph96G9F/VuY0D5tPrm
         7Yn/JarEvZXzqbs3FmSvJKoanYQ/uo2D33kCdZ3d9YdvEKK2w++kwbIZ7l7qZ1etNcGt
         oVd355EKUtI9Y5QKz/rXRZ65pPi0K631sHB1AV/FaqQ8sGMt3lYl7BtJ0nowknYUregh
         65QpOZ8i3tKat27nJMhPmXTvM9l4F1dOIbjWa0Ate9kg5gnDppP1BagDXGrhgekRk01d
         3Mw4pakxq/v/MVV3XXW4C9BDwCciZHZ5en+0k1xIMSCGNPupjQpAtsgzhI0r0AwjdycY
         kC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744217678; x=1744822478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKpfWxOAsmcqfHthdu26r7YWnYaeAaQXRASkSMsz97E=;
        b=d2Oo1M4+CFfwNHgJMl0moT09KZDUb+8ZyuwT7Osbv7pGQX1KtAoQFgGHzt2yI2kHDh
         H968npv9O5ZEq8b9uFStTDLRrcqzBSeLOpY0Ss3qgxYwopbgG090zTcoaE+aPM3EzH6b
         HhsZbVXCza374t06iX1kBzuau9x79aUMIdBT6YXt4Dv+/oH6HFbZ+LdhO5s6Vvf509Uc
         lbhmUvoIf5CC+wnymnGjPv069ZRkgQdKxV/JQCZjrAsojXZ9QrIVNNro6b8gVgDorDAL
         81wySnrbdFnZBtfhehGyf84HgtlDIql2PecsdwS1wtuKdT0hnMIYREhhH+FUkBt1qH3U
         4Clw==
X-Forwarded-Encrypted: i=1; AJvYcCWQfcQlvauEpu/ilPkJ4+Qfj6NqnPbcZbLvGxgcFEKA14obxMh8K67M39d4cSvD55QQoQYkNFdnyjn5@lists.infradead.org, AJvYcCXgIh7WMTKmRYICdGCYzzFJ2A5aABV4WPCaqK9v0TG8Zsb+BEj/Wom11XSrofEXOfH8WDnxL6+iL0I=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdNBuWc0ucacxhpopSBv98SeDzozLzY490G6ien8udswLwSXtA
	Tk3MkJxjG+6uLYtlnoI7yGihuw+HYFIFxXGiUOm2Xyg9ROm4yiUT
X-Gm-Gg: ASbGncsVom191QyRLvvc1Cwu8ZIwWYI27S+BElL5u+1VlArQfSRDZK3NCgeRcKPpkQB
	I2F7DBSxO72IieVsLqgYFyHJt7qyto3d+RPqTzIhBnohYGoNER5vNud8yoRKbtQ2hm+1SPTGyCr
	B8qinzb7nFk8sTssFQ6/Ov9QiW5/23wwd3WMrZQrGguhHyjDqxpatLyKMqYRaFxumN1EbCWEI/u
	Nd+vKSRA0rn1FByRXghbUi2i2faCXBD36vA3P48DPU8bYq6JueKClXLeYZYoSrKxQTqDQGxHlNR
	1uTdedjb2O02yndIz5ZooLSJFxqMqXc5gEXJPOdW
X-Google-Smtp-Source: AGHT+IFxnZTQiwyLnCcrMyVoc4gjX/wlLeI10NLEVrusIoE84Mu0MqqI5oCBV9CkTcUXaP/nQxUz2g==
X-Received: by 2002:a17:903:240b:b0:224:1579:5e91 with SMTP id d9443c01a7336-22ac40026bbmr47037845ad.47.1744217677709;
        Wed, 09 Apr 2025 09:54:37 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df4011dbsm1856612a91.46.2025.04.09.09.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 09:54:36 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:54:35 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
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
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
	hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
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
Subject: Re: [PATCH v4 00/13] Introduce parity_odd() and refactor redundant
 parity code
Message-ID: <Z_amQp3gK5Dm8Qz3@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_095439_321474_07F678A0 
X-CRM114-Status: GOOD (  30.68  )
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

On Wed, Apr 09, 2025 at 11:43:43PM +0800, Kuan-Wei Chiu wrote:
> Several parts of the kernel contain open-coded and redundant
> implementations of parity calculation. This patch series introduces
> a unified helper, parity_odd(), to simplify and standardize these
> cases.
> 
> The first patch renames parity8() to parity_odd(), changes its argument

Alright, if it's an extension of the area of applicability, it should be
renamed to just parity(). I already shared a table that summarized the
drivers authors' view on that, and they clearly prefer not to add the
suffix - 13 vs 2. The __builtin_parity() doesn't care of suffix as well. 

https://lore.kernel.org/all/Z9GtcNJie8TRKywZ@thinkpad/

Yes, the argument that boolean function should explain itself sounds
correct, but in this case, comment on top of the function looks enough
to me.

The existing codebase doesn't care about the suffix as well. If no
strong preference, let's just pick a short and sweet name?

> type from u8 to u64 for broader applicability, and updates its return
> type from int to bool to make its usage and return semantics more
> intuitive-returning true for odd parity and false for even parity. It
> also adds __attribute_const__ to enable compiler optimizations.

That's correct and nice, but can you support it with a bloat-o-meter's
before/after and/or asm snippets? I also think it worth to be a separate
patch, preferably the last patch in the series.

> While more efficient implementations may exist, further optimization is
> postponed until a use case in performance-critical paths arises.
> 
> Subsequent patches refactor various kernel components to replace
> open-coded parity logic with the new helper, reducing code duplication
> and improving consistency.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> 
> To H. Peter:
> I understand your preference for a parity8/16/32/64() style interface,
> and I agree that such a design would better accommodate potential
> arch-specific implementations. However, I suspect there are very few,
> if any, users who care about the performance of parity calculations
> enough to warrant such optimizations. So my inclination is to defer any
> arch-specific or optimized implementations until we see parity_odd()
> being used in hot paths.
> 
> Changes in v4:
> - Rename parity8() to parity_odd().
> - Change the argument type from u8 to u64.
> - Use a single parity_odd() function.
> 
> Changes in v3:
> - Avoid using __builtin_parity.
> - Change return type to bool.
> - Drop parity() macro.
> - Change parityXX() << y to !!parityXX() << y.
> 
> Changes in v2:
> - Provide fallback functions for __builtin_parity() when the compiler
>   decides not to inline it
> - Use __builtin_parity() when no architecture-specific implementation
>   is available
> - Optimize for constant folding when val is a compile-time constant
> - Add a generic parity() macro
> - Drop the x86 bootflag conversion patch since it has been merged into
>   the tip tree
> 
> v3: https://lore.kernel.org/lkml/20250306162541.2633025-1-visitorckw@gmail.com/
> v1: https://lore.kernel.org/lkml/20250223164217.2139331-1-visitorckw@gmail.com/
> v2: https://lore.kernel.org/lkml/20250301142409.2513835-1-visitorckw@gmail.com/
> 
> Kuan-Wei Chiu (13):
>   bitops: Change parity8() to parity_odd() with u64 input and bool
>     return type
>   media: media/test_drivers: Replace open-coded parity calculation with
>     parity_odd()
>   media: pci: cx18-av-vbi: Replace open-coded parity calculation with
>     parity_odd()
>   media: saa7115: Replace open-coded parity calculation with
>     parity_odd()
>   serial: max3100: Replace open-coded parity calculation with
>     parity_odd()
>   lib/bch: Replace open-coded parity calculation with parity_odd()
>   Input: joystick - Replace open-coded parity calculation with
>     parity_odd()
>   net: ethernet: oa_tc6: Replace open-coded parity calculation with
>     parity_odd()
>   wifi: brcm80211: Replace open-coded parity calculation with
>     parity_odd()
>   drm/bridge: dw-hdmi: Replace open-coded parity calculation with
>     parity_odd()
>   mtd: ssfdc: Replace open-coded parity calculation with parity_odd()
>   fsi: i2cr: Replace open-coded parity calculation with parity_odd()
>   nfp: bpf: Replace open-coded parity calculation with parity_odd()
> 
>  arch/x86/kernel/bootflag.c                    |  4 +--
>  drivers/fsi/fsi-master-i2cr.c                 | 20 +++------------
>  .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 ++----
>  drivers/hwmon/spd5118.c                       |  2 +-
>  drivers/i3c/master/dw-i3c-master.c            |  2 +-
>  drivers/i3c/master/i3c-master-cdns.c          |  2 +-
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c      |  2 +-
>  drivers/input/joystick/grip_mp.c              | 17 ++-----------
>  drivers/input/joystick/sidewinder.c           | 25 ++++---------------
>  drivers/media/i2c/saa7115.c                   | 12 ++-------
>  drivers/media/pci/cx18/cx18-av-vbi.c          | 12 ++-------
>  .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 ++----
>  drivers/mtd/ssfdc.c                           | 20 +++------------
>  drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +-----
>  drivers/net/ethernet/oa_tc6.c                 | 19 +++-----------
>  .../broadcom/brcm80211/brcmsmac/dma.c         | 18 ++-----------
>  drivers/tty/serial/max3100.c                  |  3 ++-
>  include/linux/bitops.h                        | 19 ++++++++------
>  lib/bch.c                                     | 14 +----------
>  19 files changed, 49 insertions(+), 165 deletions(-)

OK, now it looks like a nice consolidation and simplification of code
base. Thanks for the work.

Thanks,
Yury

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
