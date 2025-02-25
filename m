Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F6CC021BB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2025 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tS0ez3HbrQNgS2NOiJrcHTNVspFuUc54fpv1yn7498U=; b=LFTQMCBIaoYQZG
	pCG66e6Tq9hK9kEPaFRZ2sa/IPkIDBQcCNfyScUJ33xJpcpTZDASzkd/Q/viuAX9yLxWgRS+oyuM9
	ODozLbXPmSz2KZTDHVv9jsytG8O1lMRWNsgM9HZXRsY0xvHYeia4yIiibJfzVu/zta0tn8KyYK2ca
	vawSCBwcLE/XVjdK9lo5tvInx35agWrR+y0o1qvAi6Ajr/Moow2RDeXbMxzOiE5mHP5ur59snp6oE
	u5qN4D2AzNtYgYSJSjMsLnFlS8oeSLd1aNCdQiG8kgeBsZFabanQ7Gr3Wt3J6o/snHeMmuvt7T1G7
	z4NXb3CQC2aSgiYcBhDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxyS-00000000I2z-3C3d;
	Tue, 25 Feb 2025 16:40:00 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvnZ-0000000HVkX-4B1Y
	for linux-mtd@lists.infradead.org;
	Tue, 25 Feb 2025 14:20:39 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22100006bc8so100012525ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2025 06:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740493237; x=1741098037; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pH6kCz8lTpjp3q7JFqjKA+FgBtUVtLCpjnGefR5mF5k=;
        b=b1++iuqBdeD+aPiESw8HUaZMZFYNeIygmUhURO6CxHkb3u099ULOg2L4ls//Jxp1D/
         alyE/fHYUNFVjHW06aW4CN1hdXe+cLYIotD4VdzQrqv7Q/4CjgRA8N2U+w99RDBsBSsF
         wPUbq5MEe5ktBnzeKcu8UAoeapH+SZgkv4HdrpMJBIY/AMEf/i8WOW2e3KVhSV1l6wDi
         LgP+PH+EpHuC8G8FNignzHI/pC6qdOAtc1b8/r+2w0B85kFH0GEaaELyIUbQr11zkvDC
         1/ONRpC84SW8PKBCVlk9h0i3Auk/oHYpodgq5WJLWF6dxHB7hKuZ13KNuH/4sbw8WM25
         IoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493237; x=1741098037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pH6kCz8lTpjp3q7JFqjKA+FgBtUVtLCpjnGefR5mF5k=;
        b=uxd3N5tNZ6ZIVxFipZ/5lAlj4IJ8qq2223EP7yboudMHnAQl3Vi6Ndo1cdvDdCWT6x
         UXMx3umGng8VxC0pyrj3yXU6fnX2D3BrlMKKeLlN+ZZeCzBrZVy0OGa3wtaNeccKVpXD
         0Srj4ScFTYaNzvburWkg9bA8BMoUFw3Jm2BW2mhEcQPCr76DAigwDCLxqnNUqvxRvaLO
         RqM4pwZ7mpK1kDgONXk3sPVNE9luQW3yqKkmDONqWNPDjWsJlsQNRsPcNhaz6iOBP+5D
         Qpe0gY1jILCIEHyZromi/ERJcGuRC9W7nwTqBabV3nNo4GhzxsfxafqfSIBGVQNSOqp4
         y3DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPf48EJQuXFrkKkFReVTcVF7nCKqPgomC25q9mWFX0Kx4QnSkd+nNYp/ON+h1s+WJI3asFgGQIQBg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4OjoF3OpFXBaFh2DjJMsAWivZRBT5m+HFMEMm0oVFevA00P7J
	vEYlL9HBmC+9dMqEJ+0wUHF4vrUZsgdOCP6CtlkN9Pm1SsH85I9c
X-Gm-Gg: ASbGncsQl49on9Sq1nZGPhfyihoz49J2e3R0qwo4GSONPgNSc3hqJZ2iY9sD2M503mk
	oSrkxS04FjWKMwlTlTu4uKAk//LnO14+ZUoXx35DaGTAvCJzrwXOk0cgivK5EVGTJXA1X4lYFIB
	j1DC1Qk0PO7DeFgVJ/YyI9qkHPPNvYsase5publ0NoEPqOoJoefs9M21Hjwj1uOcmbTcmDFTXuy
	GqK4zkEYYA1SjEpmsucCPzjnQclw9BMm5o6P2gQ1Xnj8p4igB/d4BGiQVTRSFr235HlLH69XcUA
	9rFFC/ZZZ1ZwcpGWz9Vz32BjCpEx+LZ9qCc0bgPElevOPz8roYoGQA==
X-Google-Smtp-Source: AGHT+IF5xwcyMuEse5d6U24DTrm7La/i/EXLcWUjTbDTBaLHgklr2LYp0Shxn4PZ0SRkVV82FkT4WQ==
X-Received: by 2002:a05:6a00:3392:b0:730:9946:5973 with SMTP id d2e1a72fcca58-734790a2af5mr5118831b3a.5.1740493236834;
        Tue, 25 Feb 2025 06:20:36 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a72ef60sm1586035b3a.75.2025.02.25.06.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:20:36 -0800 (PST)
Date: Tue, 25 Feb 2025 22:20:26 +0800
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
Message-ID: <Z73RqnMRS+31wzrv@visitorckw-System-Product-Name>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
 <Z73FxIv353lbXO3A@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z73FxIv353lbXO3A@visitorckw-System-Product-Name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_062038_037275_E88AF4A2 
X-CRM114-Status: GOOD (  44.56  )
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

On Tue, Feb 25, 2025 at 09:29:51PM +0800, Kuan-Wei Chiu wrote:
> Hi Yury,
> 
> On Mon, Feb 24, 2025 at 02:27:03PM -0500, Yury Norov wrote:
> > On Mon, Feb 24, 2025 at 12:42:02AM +0800, Kuan-Wei Chiu wrote:
> > > Several parts of the kernel open-code parity calculations using
> > > different methods. Add a generic parity64() helper implemented with the
> > > same efficient approach as parity8().
> > 
> > No reason to add parity32() and parity64() in separate patches
> 
> Ack.
> 
> >  
> > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > ---
> > >  include/linux/bitops.h | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > > index fb13dedad7aa..67677057f5e2 100644
> > > --- a/include/linux/bitops.h
> > > +++ b/include/linux/bitops.h
> > > @@ -281,6 +281,28 @@ static inline int parity32(u32 val)
> > >  	return (0x6996 >> (val & 0xf)) & 1;
> > >  }
> > >  
> > > +/**
> > > + * parity64 - get the parity of an u64 value
> > > + * @value: the value to be examined
> > > + *
> > > + * Determine the parity of the u64 argument.
> > > + *
> > > + * Returns:
> > > + * 0 for even parity, 1 for odd parity
> > > + */
> > > +static inline int parity64(u64 val)
> > > +{
> > > +	/*
> > > +	 * One explanation of this algorithm:
> > > +	 * https://funloop.org/codex/problem/parity/README.html
> > 
> > This is already referenced in sources. No need to spread it for more.
> 
> Ack.
> 
> > 
> > > +	 */
> > > +	val ^= val >> 32;
> > > +	val ^= val >> 16;
> > > +	val ^= val >> 8;
> > > +	val ^= val >> 4;
> > > +	return (0x6996 >> (val & 0xf)) & 1;
> > 
> > It's better to avoid duplicating the same logic again and again.
> 
> Ack.
> 
> > 
> > > +}
> > > +
> > 
> > So maybe make it a macro?
> > 
> > 
> > From f17a28ae3429f49825d65ebc0f7717c6a191a3e2 Mon Sep 17 00:00:00 2001
> > From: Yury Norov <yury.norov@gmail.com>
> > Date: Mon, 24 Feb 2025 14:14:27 -0500
> > Subject: [PATCH] bitops: generalize parity8()
> > 
> > The generic parity calculation approach may be easily generalized for
> > other standard types. Do that and drop sub-optimal implementation of
> > parity calculation in x86 code.
> > 
> > Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > ---
> >  arch/x86/kernel/bootflag.c | 14 +-----------
> >  include/linux/bitops.h     | 47 +++++++++++++++++++++++++++-----------
> >  2 files changed, 35 insertions(+), 26 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
> > index 3fed7ae58b60..4a85c69a28f8 100644
> > --- a/arch/x86/kernel/bootflag.c
> > +++ b/arch/x86/kernel/bootflag.c
> > @@ -2,6 +2,7 @@
> >  /*
> >   *	Implement 'Simple Boot Flag Specification 2.0'
> >   */
> > +#include <linux/bitops.h>
> >  #include <linux/types.h>
> >  #include <linux/kernel.h>
> >  #include <linux/init.h>
> > @@ -20,19 +21,6 @@
> >  
> >  int sbf_port __initdata = -1;	/* set via acpi_boot_init() */
> >  
> > -static int __init parity(u8 v)
> > -{
> > -	int x = 0;
> > -	int i;
> > -
> > -	for (i = 0; i < 8; i++) {
> > -		x ^= (v & 1);
> > -		v >>= 1;
> > -	}
> > -
> > -	return x;
> > -}
> > -
> >  static void __init sbf_write(u8 v)
> >  {
> >  	unsigned long flags;
> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > index c1cb53cf2f0f..29601434f5f4 100644
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -230,10 +230,10 @@ static inline int get_count_order_long(unsigned long l)
> >  }
> >  
> >  /**
> > - * parity8 - get the parity of an u8 value
> > + * parity - get the parity of a value
> >   * @value: the value to be examined
> >   *
> > - * Determine the parity of the u8 argument.
> > + * Determine parity of the argument.
> >   *
> >   * Returns:
> >   * 0 for even parity, 1 for odd parity
> > @@ -241,24 +241,45 @@ static inline int get_count_order_long(unsigned long l)
> >   * Note: This function informs you about the current parity. Example to bail
> >   * out when parity is odd:
> >   *
> > - *	if (parity8(val) == 1)
> > + *	if (parity(val) == 1)
> >   *		return -EBADMSG;
> >   *
> >   * If you need to calculate a parity bit, you need to draw the conclusion from
> >   * this result yourself. Example to enforce odd parity, parity bit is bit 7:
> >   *
> > - *	if (parity8(val) == 0)
> > + *	if (parity(val) == 0)
> >   *		val ^= BIT(7);
> > + *
> > + * One explanation of this algorithm:
> > + * https://funloop.org/codex/problem/parity/README.html
> >   */
> > -static inline int parity8(u8 val)
> > -{
> > -	/*
> > -	 * One explanation of this algorithm:
> > -	 * https://funloop.org/codex/problem/parity/README.html
> > -	 */
> > -	val ^= val >> 4;
> > -	return (0x6996 >> (val & 0xf)) & 1;
> > -}
> > +#define parity(val)					\
> > +({							\
> > +	u64 __v = (val);				\
> > +	int __ret;					\
> > +	switch (BITS_PER_TYPE(val)) {			\
> > +	case 64:					\
> > +		__v ^= __v >> 32;			\
> > +		fallthrough;				\
> > +	case 32:					\
> > +		__v ^= __v >> 16;			\
> > +		fallthrough;				\
> > +	case 16:					\
> > +		__v ^= __v >> 8;			\
> > +		fallthrough;				\
> > +	case 8:						\
> > +		__v ^= __v >> 4;			\
> > +		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > +		break;					\
> > +	default:					\
> > +		BUILD_BUG();				\
> > +	}						\
> > +	__ret;						\
> > +})
> > +
> > +#define parity8(val)	parity((u8)(val))
> > +#define parity32(val)	parity((u32)(val))
> > +#define parity64(val)	parity((u64)(val))
> >  
> What do you think about using these inline functions instead of macros?
> Except for parity8(), each function is a single line and follows the
> same logic. I find inline functions more readable, and coding-style.rst
> also recommends them over macros.
> 
> Regards,
> Kuan-Wei
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index c1cb53cf2f0f..d518a382f1fe 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -260,6 +260,26 @@ static inline int parity8(u8 val)
>  	return (0x6996 >> (val & 0xf)) & 1;
>  }
>  
> +static inline parity16(u16 val)
> +{
> +	return parity8(val ^ (val >> 8));
> +}
> +
> +static inline parity16(u16 val)
> +{
> +	return parity8(val ^ (val >> 8));
> +}
> +
> +static inline parity32(u32)
> +{
> +	return parity16(val ^ (val >> 16));
> +}
> +
> +static inline parity64(u64)
> +{
> +	return parity32(val ^ (val >> 32));
> +}
> +
>  /**
>   * __ffs64 - find first set bit in a 64 bit word
>   * @word: The 64 bit word
> 
>
Oops... I made a lot of fat-finger mistakes. Here's the correct one.

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..427e4c06055e 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -260,6 +260,21 @@ static inline int parity8(u8 val)
 	return (0x6996 >> (val & 0xf)) & 1;
 }
 
+static inline int parity16(u16 val)
+{
+	return parity8(val ^ (val >> 8));
+}
+
+static inline int parity32(u32 val)
+{
+	return parity16(val ^ (val >> 16));
+}
+
+static inline int parity64(u64 val)
+{
+	return parity32(val ^ (val >> 32));
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word


> >  /**
> >   * __ffs64 - find first set bit in a 64 bit word
> > -- 
> > 2.43.0
> > 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
