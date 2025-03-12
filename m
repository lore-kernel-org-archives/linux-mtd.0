Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7260C28B28
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Mar 2025 15:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/c6sURpUTSXtjL8kNYK7IKJJH09oh634968O0PWe1E=; b=TzoXakgnDMqZPv
	lG1PUCvWsJhQ9SRzLKNfa4mBM4trNRpFG3XEhpqZEqw9bfwsR5GmJPEhmRjCQnlo0Cj1UEfJvsUfK
	D0ugRpsd6NQl9J25h19PGIPffzvV4IyIzkBOPvGL6r1M9/ZhirTrxgzR8eQTYWLggOBbJbQYe3Ig3
	L3JPPzFO4fCjPf4UHuEaUWkAHoaR1k1JZdP/0FJB9Tr2EV4m2jZXxX3Nav0JoNKF+qiYXb54zpY9Z
	3CPOLTky6J8NLa2JOuT2cDcX4sNNCjvSVLXTWWi4M3dHvPYSXudIx0nPYfoQfgmMnRVckPAN1El1N
	OGAteUYcGLk+c8euLfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOOG-00000008wRf-3HsT;
	Wed, 12 Mar 2025 15:53:04 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOMW-00000008w0P-1K1v
	for linux-mtd@lists.infradead.org;
	Wed, 12 Mar 2025 15:51:17 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2fef5c978ccso75638a91.1
        for <linux-mtd@lists.infradead.org>; Wed, 12 Mar 2025 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741794675; x=1742399475; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s6kcU/jqWnvmgUYRTSnCwjipLLOVfnhjvRKH7bJe2iA=;
        b=e1iAGB/pMUkzCrsQAJdNOjvlJiNa3Xu8Al3+XWEIiTjyjZYf4xN0GM14RrUdmxkbsG
         /yLFto+7KTrgxG7Z96uz1pdibVAZctgnbbDfgWfvWxpiUCVgJ5WP05KZJNiwjeTorPgr
         CoOySaQvqivRoPQaK7n6IxHu0UWI/cFgYpnbWMTX6GApOJPEtf2WyE1w20165cNuobvF
         jdXIxPRtGMbQ0ZOzYWPito51WYcHT/hmjdoAVfTEc+DAH83duoI9GF03hFsHnWfSrAH+
         MWGJWQY+s9TVuOLelzQw7k8u2LIS4qBhCw8sXj5zS1j0lJbGCBNtlCXxnyk1fgsphTrh
         WYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741794675; x=1742399475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6kcU/jqWnvmgUYRTSnCwjipLLOVfnhjvRKH7bJe2iA=;
        b=jYqDxUKE53UhaAc+AXMSs2h5FM9msAdbtsfnFEUCbSTPpdYRcqx4MvIolyfxDIzm5j
         noCQla4Abm8TGAAWV8HS/5JGszr12IWxQaYHxTFbSbdply3hdFdxNjL7KXa+TysIzJAV
         U/FyJvibEghOXyU8Jwkdke97arNXOYq/xyitjLbpx6k9d5UDEXjVIgYx0bxqYBnTTfAn
         NPMQ+GJbPN1XISjVgPf/rBi8qy0l9qKFLvGSAwHxmua7KRKTG9zsrEakQ/Eupc/5jbYm
         ohAnDDGLEgrH6B7TUGVtc8VPZZdFj8ZqXuvtcNbhC1OP9Dqi7nOv91ucxXsI84jz8OxM
         ypvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX3spaZk1ssRq8CWGMIzhCA8nW2MeQHCUB92bGoIUfbszrU8mGUEuiqWEe6U/3HYEdFBfBcYryFAw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzOoShHv1nzu4MFa2GEtBvgEdQBNFFFQeAQjalsODq05EGVj2U
	adQ+0CBoLw7k54x1ilNPEtfVJsy6rsMNJBrCXvOwoTTBBeLZz6RZ
X-Gm-Gg: ASbGnctFSdxx25KBasIp7FBp3XSrHwVx8hp3r2dHm0rM5unh2cSpXoZC7FqbYKxAoV1
	dBOrTZndG6uU2vgW/nUQx6V6WqGdgkG5ur3XXsjg39KlLWeAhv7l2CE6oW1ptyuZEPw7ofMT6Qv
	eOQdyfhlS1QXQBPfdo3HBSJtuqW10fmaKMcBlKEUbJiYcpTDHTBbFRTYR9beYiVfwgdLZ8fRdK6
	lo9bj4XBf9rKkk4aH9/OZxMEwuR2O2q8CwJ3Olp7sd/aRaowcfiRfGbL4fF0uWLdokuu6s620Pd
	ouIOGDjfE6+vnIlAALlRaY3fqLuXk1qj3o3pmjfsP6sL
X-Google-Smtp-Source: AGHT+IGK1wYMGzHFc5cibW/rOHObEUL/txoAjaO3YQm2mzlBBY39pOgAZq4ZVPE3dzf2E+KcMNlzyw==
X-Received: by 2002:a17:90a:a009:b0:301:1d03:93cd with SMTP id 98e67ed59e1d1-3011d039a52mr3747173a91.24.1741794675252;
        Wed, 12 Mar 2025 08:51:15 -0700 (PDT)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301182181c3sm1955502a91.5.2025.03.12.08.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 08:51:14 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:51:12 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
	akpm@linux-foundation.org, alistair@popple.id.au,
	andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
	arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
	bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
	davem@davemloft.net, dmitry.torokhov@gmail.com,
	dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
	edumazet@google.com, eleanor15x@gmail.com,
	gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
	jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
	jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux@rasmusvillemoes.dk, louis.peens@corigine.com,
	maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
	mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
	neil.armstrong@linaro.org, netdev@vger.kernel.org,
	oss-drivers@corigine.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, rfoss@kernel.org,
	richard@nod.at, simona@ffwll.ch, tglx@linutronix.de,
	tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z9GtcNJie8TRKywZ@thinkpad>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
 <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
 <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_085116_357165_C4A443B9 
X-CRM114-Status: GOOD (  37.77  )
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

On Tue, Mar 11, 2025 at 03:24:14PM -0700, H. Peter Anvin wrote:
> On March 11, 2025 3:01:30 PM PDT, Yury Norov <yury.norov@gmail.com> wrote:
> >On Sun, Mar 09, 2025 at 11:48:26PM +0800, Kuan-Wei Chiu wrote:
> >> On Fri, Mar 07, 2025 at 12:07:02PM -0800, H. Peter Anvin wrote:
> >> > On March 7, 2025 11:53:10 AM PST, David Laight <david.laight.linux@gmail.com> wrote:
> >> > >On Fri, 07 Mar 2025 11:30:35 -0800
> >> > >"H. Peter Anvin" <hpa@zytor.com> wrote:
> >> > >
> >> > >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> > >> >> (int)true most definitely is guaranteed to be 1.  
> >> > >> >
> >> > >> >That's not technically correct any more.
> >> > >> >
> >> > >> >GCC has introduced hardened bools that intentionally have bit patterns
> >> > >> >other than 0 and 1.
> >> > >> >
> >> > >> >https://gcc.gnu.org/gcc-14/changes.html
> >> > >> >
> >> > >> >~Andrew  
> >> > >> 
> >> > >> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
> >> > >> for compiler-generated conversations that's still a given, or the manager isn't C
> >> > >> or anything even remotely like it.
> >> > >> 
> >> > >
> >> > >The whole idea of 'bool' is pretty much broken by design.
> >> > >The underlying problem is that values other than 'true' and 'false' can
> >> > >always get into 'bool' variables.
> >> > >
> >> > >Once that has happened it is all fubar.
> >> > >
> >> > >Trying to sanitise a value with (say):
> >> > >int f(bool v)
> >> > >{
> >> > >	return (int)v & 1;
> >> > >}    
> >> > >just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)
> >> > >
> >> > >I really don't see how using (say) 0xaa and 0x55 helps.
> >> > >What happens if the value is wrong? a trap or exception?, good luck recovering
> >> > >from that.
> >> > >
> >> > >	David
> >> > 
> >> > Did you just discover GIGO?
> >> 
> >> Thanks for all the suggestions.
> >> 
> >> I don't have a strong opinion on the naming or return type. I'm still a
> >> bit confused about whether I can assume that casting bool to int always
> >> results in 0 or 1.
> >> 
> >> If that's the case, since most people prefer bool over int as the
> >> return type and some are against introducing u1, my current plan is to
> >> use the following in the next version:
> >> 
> >> bool parity_odd(u64 val);
> >> 
> >> This keeps the bool return type, renames the function for better
> >> clarity, and avoids extra maintenance burden by having just one
> >> function.
> >> 
> >> If I can't assume that casting bool to int always results in 0 or 1,
> >> would it be acceptable to keep the return type as int?
> >> 
> >> Would this work for everyone?
> >
> >Alright, it's clearly a split opinion. So what I would do myself in
> >such case is to look at existing code and see what people who really
> >need parity invent in their drivers:
> >
> >                                     bool      parity_odd
> >static inline int parity8(u8 val)       -               -
> >static u8 calc_parity(u8 val)           -               -
> >static int odd_parity(u8 c)             -               +
> >static int saa711x_odd_parity           -               +
> >static int max3100_do_parity            -               -
> >static inline int parity(unsigned x)    -               -
> >static int bit_parity(u32 pkt)          -               -
> >static int oa_tc6_get_parity(u32 p)     -               -
> >static u32 parity32(__le32 data)        -               -
> >static u32 parity(u32 sample)           -               -
> >static int get_parity(int number,       -               -
> >                      int size)
> >static bool i2cr_check_parity32(u32 v,  +               -
> >                        bool parity)
> >static bool i2cr_check_parity64(u64 v)  +               -
> >static int sw_parity(__u64 t)           -               -
> >static bool parity(u64 value)           +               -
> >
> >Now you can refer to that table say that int parity(uXX) is what
> >people want to see in their drivers.
> >
> >Whichever interface you choose, please discuss it's pros and cons.
> >What bloat-o-meter says for each option? What's maintenance burden?
> >Perf test? Look at generated code?
> >
> >I personally for a macro returning boolean, something like I
> >proposed at the very beginning.
> >
> >Thanks,
> >Yury
> 
> Also, please at least provide a way for an arch to opt in to using the builtins, which seem to produce as good results or better at least on some architectures like x86 and probably with CPU options that imply fast popcnt is available.

Yeah. And because linux/bitops.h already includes asm/bitops.h
the simplest way would be wrapping generic implementation with
the #ifndef parity, similarly to how we handle find_next_bit case.

So:
1. Kuan-Wei, please don't invent something like ARCH_HAS_PARITY;
2. This may, and probably should, be a separate follow-up series,
   likely created by corresponding arch experts.

Thanks,
Yury

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
