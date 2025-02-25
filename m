Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BEDC19777
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlwmmg5LvJLSU11hhPLWdpT/M+MJDGocB34HEuHjXVU=; b=iLorVkZoDaoLcU
	eOCQE0fisoJsCVbDpDTOhLaulTPza7c5Lx9kMpH6bZHcEniModpV2qDMG5WPjoOV29gCdGW13ZhbA
	AdcZ0ppqd1fCG8Sf/tfyp7jKim7LhbD/0M3Hdh9UidRXluZh7f9KOeQJ4x58vZuQ9fOzrZr/diJPE
	97+EAdPaN+ajFKcl17A/+3YJ6ieR2qBzSv/0925+UWhS0HNijPGbkZKykE8B8eGeeCCFKeVl06kh0
	cd2JIxdUGrs22rW3dUmMqZiFwuX3QVL5XGUw4hGKPn6mzBHBgxiIgJYq48ySTem5GbfZUF7IwA/7U
	AyM78ExSImyy6G4E+1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxx5-00000000Fh6-0nkM;
	Tue, 25 Feb 2025 16:38:35 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmv0S-0000000HNdC-49Id
	for linux-mtd@lists.infradead.org;
	Tue, 25 Feb 2025 13:29:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2fcf3a69c3cso5709274a91.1
        for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2025 05:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740490192; x=1741094992; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g+KT3KVpGLuA4u2NJNwnGzORc7aygCrbdYn7UVwmV+4=;
        b=IC13G1Zd9x8m++XlHhpZepCHEQoC9uvTbA2OT1EvuXyfACG/mAmQj52F+EuxqzFfre
         TJkxN65aeivv2ofRa6OUf1wV64gCIM9WyAqbKM21aU7WxGCIij8W1MLShnlJTpXufvOX
         f9C/9P/He1Vii7aqzs7mOUPnpTUmJQtLpNerga5N/7SaP/rJJDe51TTSrMoiQM+MPc0w
         27PcrGlURfpUtBAT49CoOoVf4IcZSnAct0PZPa/HfNrWUH+pri8oiRuu6LQN+UGXaPhC
         NjYZmf2AY4FgJXOG1Q+rYqFkZm1LD6vam2hyh3gqA3C/gYsZ6KQMbi5WYwMFzNgCfscw
         XR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490192; x=1741094992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+KT3KVpGLuA4u2NJNwnGzORc7aygCrbdYn7UVwmV+4=;
        b=tlLRBOb+9DAwuCZCGSoSSOAXeYLJtk7Dlh+2TKKO+65hDE3Ssd/d3qu0uBIEiuB5BO
         E6UBdMCT+G4kgk1HmljyjVkXjTRORBRh9HuYac6pECe0ZoHpfTELwSzRLQmdTg1YUh8f
         Jvfem8BjJNLs7E4OcIUPawDNxrHdNHbO7xdSLG1jFUbIqd6FFPlwpT2sDi2ljedF/7lf
         7/3L/bHN938FfEgFqym5aYfmyQxeD4ase+dfKjqLLsG8cKvye5nNdEN2HdnPt+hP5ZOa
         5c+/U1u03U16cmWG0tFU3dS9x2NFYM/9xAVj8obgSe+vzjp/hxLwZWIlEt6txaCQzrtR
         hXRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAn/2Y+6Bnv0H51Co/PDGVX4XWVIi8Riy03s1zPduNG4y00pCpJ7CbL4fAcYyqFtx9MO+SYrcK4do=@lists.infradead.org
X-Gm-Message-State: AOJu0YwircRHjtXbUiPM+BsdCZdkbKr8kG8Hsq40VfB2aEyzdPExdgfg
	d4zCo66fSDf5MjkBYLl8LZv2Am1m6g4AMhgmuGfCBrHd7RKNBaIg
X-Gm-Gg: ASbGnctOuCJulHtma2L3KdYr/2n775RHGifzZSa68GET9JDZtnCPVu1oWjrRpcfI7Qm
	pJcNLxfN5hOclcjyv2IiOqZnuF3Er59GFRDW2WjwIg/Vcee2+oMV69oxsMGCqqEkxTuHaWNmoXk
	gd8ql8Zu8ew9n2lp9OQHSwh6DnjK1aSXfgHbBSJcmBDRla1AGqbrZjB5G4Eo4s5UPxr+skzUDwG
	OQetitvUcuzl20/6FqTbPgfjE0slWYnWmd6GGM00AgIH8omowSuj3ZfnpMxX67rGh6sMm1Gf4OE
	GFzQ5PlfLNoPkgfgoBrDeuk0Vr8ixg/EbfbRFER7y5/5tSRfNRXOkA==
X-Google-Smtp-Source: AGHT+IHJCYV1yTKSOK6eGDyBnxKUrcQWKWx/K+mHz5nLdmHbZ4ukNdWQzUzjXs+WMIoPjs0tLGemNA==
X-Received: by 2002:a17:90b:3941:b0:2fa:e9b:33ab with SMTP id 98e67ed59e1d1-2fce78acd26mr32192478a91.16.1740490191556;
        Tue, 25 Feb 2025 05:29:51 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d51fsm8424850a91.2.2025.02.25.05.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 05:29:50 -0800 (PST)
Date: Tue, 25 Feb 2025 21:29:40 +0800
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
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z73FxIv353lbXO3A@visitorckw-System-Product-Name>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z7zIBwH4aUA7G9MY@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_052953_033523_573E6E08 
X-CRM114-Status: GOOD (  40.21  )
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

On Mon, Feb 24, 2025 at 02:27:03PM -0500, Yury Norov wrote:
> On Mon, Feb 24, 2025 at 12:42:02AM +0800, Kuan-Wei Chiu wrote:
> > Several parts of the kernel open-code parity calculations using
> > different methods. Add a generic parity64() helper implemented with the
> > same efficient approach as parity8().
> 
> No reason to add parity32() and parity64() in separate patches

Ack.

>  
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >  include/linux/bitops.h | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > index fb13dedad7aa..67677057f5e2 100644
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -281,6 +281,28 @@ static inline int parity32(u32 val)
> >  	return (0x6996 >> (val & 0xf)) & 1;
> >  }
> >  
> > +/**
> > + * parity64 - get the parity of an u64 value
> > + * @value: the value to be examined
> > + *
> > + * Determine the parity of the u64 argument.
> > + *
> > + * Returns:
> > + * 0 for even parity, 1 for odd parity
> > + */
> > +static inline int parity64(u64 val)
> > +{
> > +	/*
> > +	 * One explanation of this algorithm:
> > +	 * https://funloop.org/codex/problem/parity/README.html
> 
> This is already referenced in sources. No need to spread it for more.

Ack.

> 
> > +	 */
> > +	val ^= val >> 32;
> > +	val ^= val >> 16;
> > +	val ^= val >> 8;
> > +	val ^= val >> 4;
> > +	return (0x6996 >> (val & 0xf)) & 1;
> 
> It's better to avoid duplicating the same logic again and again.

Ack.

> 
> > +}
> > +
> 
> So maybe make it a macro?
> 
> 
> From f17a28ae3429f49825d65ebc0f7717c6a191a3e2 Mon Sep 17 00:00:00 2001
> From: Yury Norov <yury.norov@gmail.com>
> Date: Mon, 24 Feb 2025 14:14:27 -0500
> Subject: [PATCH] bitops: generalize parity8()
> 
> The generic parity calculation approach may be easily generalized for
> other standard types. Do that and drop sub-optimal implementation of
> parity calculation in x86 code.
> 
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> ---
>  arch/x86/kernel/bootflag.c | 14 +-----------
>  include/linux/bitops.h     | 47 +++++++++++++++++++++++++++-----------
>  2 files changed, 35 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
> index 3fed7ae58b60..4a85c69a28f8 100644
> --- a/arch/x86/kernel/bootflag.c
> +++ b/arch/x86/kernel/bootflag.c
> @@ -2,6 +2,7 @@
>  /*
>   *	Implement 'Simple Boot Flag Specification 2.0'
>   */
> +#include <linux/bitops.h>
>  #include <linux/types.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> @@ -20,19 +21,6 @@
>  
>  int sbf_port __initdata = -1;	/* set via acpi_boot_init() */
>  
> -static int __init parity(u8 v)
> -{
> -	int x = 0;
> -	int i;
> -
> -	for (i = 0; i < 8; i++) {
> -		x ^= (v & 1);
> -		v >>= 1;
> -	}
> -
> -	return x;
> -}
> -
>  static void __init sbf_write(u8 v)
>  {
>  	unsigned long flags;
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index c1cb53cf2f0f..29601434f5f4 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -230,10 +230,10 @@ static inline int get_count_order_long(unsigned long l)
>  }
>  
>  /**
> - * parity8 - get the parity of an u8 value
> + * parity - get the parity of a value
>   * @value: the value to be examined
>   *
> - * Determine the parity of the u8 argument.
> + * Determine parity of the argument.
>   *
>   * Returns:
>   * 0 for even parity, 1 for odd parity
> @@ -241,24 +241,45 @@ static inline int get_count_order_long(unsigned long l)
>   * Note: This function informs you about the current parity. Example to bail
>   * out when parity is odd:
>   *
> - *	if (parity8(val) == 1)
> + *	if (parity(val) == 1)
>   *		return -EBADMSG;
>   *
>   * If you need to calculate a parity bit, you need to draw the conclusion from
>   * this result yourself. Example to enforce odd parity, parity bit is bit 7:
>   *
> - *	if (parity8(val) == 0)
> + *	if (parity(val) == 0)
>   *		val ^= BIT(7);
> + *
> + * One explanation of this algorithm:
> + * https://funloop.org/codex/problem/parity/README.html
>   */
> -static inline int parity8(u8 val)
> -{
> -	/*
> -	 * One explanation of this algorithm:
> -	 * https://funloop.org/codex/problem/parity/README.html
> -	 */
> -	val ^= val >> 4;
> -	return (0x6996 >> (val & 0xf)) & 1;
> -}
> +#define parity(val)					\
> +({							\
> +	u64 __v = (val);				\
> +	int __ret;					\
> +	switch (BITS_PER_TYPE(val)) {			\
> +	case 64:					\
> +		__v ^= __v >> 32;			\
> +		fallthrough;				\
> +	case 32:					\
> +		__v ^= __v >> 16;			\
> +		fallthrough;				\
> +	case 16:					\
> +		__v ^= __v >> 8;			\
> +		fallthrough;				\
> +	case 8:						\
> +		__v ^= __v >> 4;			\
> +		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> +		break;					\
> +	default:					\
> +		BUILD_BUG();				\
> +	}						\
> +	__ret;						\
> +})
> +
> +#define parity8(val)	parity((u8)(val))
> +#define parity32(val)	parity((u32)(val))
> +#define parity64(val)	parity((u64)(val))
>  
What do you think about using these inline functions instead of macros?
Except for parity8(), each function is a single line and follows the
same logic. I find inline functions more readable, and coding-style.rst
also recommends them over macros.

Regards,
Kuan-Wei

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..d518a382f1fe 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -260,6 +260,26 @@ static inline int parity8(u8 val)
 	return (0x6996 >> (val & 0xf)) & 1;
 }
 
+static inline parity16(u16 val)
+{
+	return parity8(val ^ (val >> 8));
+}
+
+static inline parity16(u16 val)
+{
+	return parity8(val ^ (val >> 8));
+}
+
+static inline parity32(u32)
+{
+	return parity16(val ^ (val >> 16));
+}
+
+static inline parity64(u64)
+{
+	return parity32(val ^ (val >> 32));
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word


>  /**
>   * __ffs64 - find first set bit in a 64 bit word
> -- 
> 2.43.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
