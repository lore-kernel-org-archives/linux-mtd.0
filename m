Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C86C021BC
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 18:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRNyCfKK7J5DVC+loo/AD8Ml8qFxvf9GsNO5NAVwSfc=; b=rZmvjH08bk+6WV
	afDoWaPuIkWaXyhxscQnLvGQMslNOYHEi8Ziovt7PDGpEmuU9JP1vfV8dmXvRxYwL7VqHN9X42hHa
	i9prIDqimNxfgspQ6fXkSJG1ls2nXd0wLa6v45Mb/1xLigUssrEuBaAKEw1UIxfcWuZE9ssnmo9Ni
	a/LazYV/KAZmxemss+HbZ6WY8jQyKJtrkWGtG8y0pGpZcUvRYwDONjD3q4yVPCmaA9z3nug4qmbRK
	gPgJ9XfuaLhdrkuBdLVTi0b0RzRI3gttKYYXGSfpf6gLWPdOcNFKJ8rd67X5vKnTcVQIgm+BwZAcr
	w5F9EfTudlaLlC44KdlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLhP-00000004obp-0sYx;
	Wed, 26 Feb 2025 17:59:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLhN-00000004oaj-08Nz
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 17:59:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-220d132f16dso703775ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2025 09:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740592795; x=1741197595; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLZRzBzitap92yZk251lvU9DytAtAlhsYa/CQwhvV8Q=;
        b=kg54DIQGrN32DZosueGL5kqXUUlLxiJ0U/czM9SI29b36DrHElowN+DhH1WcKd+HCY
         PMD18OhyKTGcZzttrtGnfarLAi5UbfHLggjG3iBVhAgIw7uuk24KlQeoBFL0TGbE2hrs
         FcElLYlaLKc3PnmypOSJ/HeWSw4TrbFcpcgNTtrF7ptwM36tq8csUUhxNQzAB/ct57fU
         9KrlSIWq8iXWaTw45YRX7GYZVWPUbGhqsuT2qwLBlbibwI5m/GY+eGXXFfuHNwfeqfMe
         P2tZHhKZCpbxjpJSxF07WWuX4KwMrHec0ox0TgVVrW/AsSic2dxXNP3G/QW6YrKK+XuF
         gahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592795; x=1741197595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLZRzBzitap92yZk251lvU9DytAtAlhsYa/CQwhvV8Q=;
        b=KWmjcpgWUGb8m55fUOqVVzL4DwgjH3UADB/jNfAqfhlOwLg6iwrB8CzCz9GVGAV+Wx
         zirVFWv5FqZ+QI0nr/3EzEEhZYvzEJMOojJDSbqJvvWFHKZRn4m7vPoGyU6zLvZ5MQvv
         MiLWw+TAneYsB8p4mORzSKmd1NKHG1/1yuERXmPSgJ6vWPnUoigs6oINDzWajbGyw4gy
         RHLv9cuNl1USrKhBaQricJpd10TBZOp35Dg/pyMMzvQkdQqjjSjeVMapPkbdXrfcIgmA
         fnAWS2g5qU7DqqF0vitdzdxsHANWxkeAYqOPbuZE11PAFwx8aKw7lHIwUtyceUBeX5vr
         FJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYwF47GQSt3EFFSCx7GCiIU3vnuPBMtlXg0pUaVxDXdyJvLoegeuaYLLZ0XGGnKEsQBfH+KzUbQSQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yweqx9DOkPOIM2Z6NLPgelxvopot6J6GkWGpoET8Qi9L6kBFxXn
	eR+oSSIoMAhqtj5c2dp2epF09DBgDbwYQhGqH44+7Uy0Mx0F6UOX
X-Gm-Gg: ASbGncupWkJsFDB+arOqkFMp2NRKv6WX0rB/JeIQ/YlcrnTRSONBYTZaof/i/f6lgGL
	mwcBrFHH2VEDrAr1TtQvjtQC1KxlIYQRSbtdxo2MMqWUZ3Wl6VTSAYYsaEeaf6Omk4RIX/U0mgX
	l61Lg8pt7pSwytsiujLjBQDzBcXetvvriFv+tlpUGhq3GdD5iMKmYKIn0FlAq3yEpuE3B5bbaXo
	xtlsNb9+8q8bupRpHzcrUbzR7xwVIZmzNvivHsRePR6Prz6ennhO3Za6AA/Cdlb7hsCkfO59J+Y
	D4HPWUGjg5HkWCLpHviY5SUoqbN1i6sRVbqYvDlqKRjFVlWzHKR+Yg==
X-Google-Smtp-Source: AGHT+IFPX6/YemPi/DqumfrbMAfmVM+yJTxaN3xhdxU4AjgnAZPzxKGRLUd3gIiPdvk59fs7FScnAQ==
X-Received: by 2002:a05:6a21:600c:b0:1ee:c74c:2436 with SMTP id adf61e73a8af0-1f10ae2ec90mr8029040637.34.1740592795469;
        Wed, 26 Feb 2025 09:59:55 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aedaab2e8fbsm3541850a12.64.2025.02.26.09.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:59:54 -0800 (PST)
Date: Thu, 27 Feb 2025 01:59:44 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
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
	akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
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
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z79WkNp6p06fV/f9@visitorckw-System-Product-Name>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
 <Z73FxIv353lbXO3A@visitorckw-System-Product-Name>
 <b5236ae4-7ebe-4a88-bbc9-3b9b3374de53@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5236ae4-7ebe-4a88-bbc9-3b9b3374de53@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_095957_072010_857DAFD5 
X-CRM114-Status: GOOD (  19.37  )
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

On Wed, Feb 26, 2025 at 08:14:14AM +0100, Jiri Slaby wrote:
> On 25. 02. 25, 14:29, Kuan-Wei Chiu wrote:
> > > +#define parity(val)					\
> > > +({							\
> > > +	u64 __v = (val);				\
> > > +	int __ret;					\
> > > +	switch (BITS_PER_TYPE(val)) {			\
> > > +	case 64:					\
> > > +		__v ^= __v >> 32;			\
> > > +		fallthrough;				\
> > > +	case 32:					\
> > > +		__v ^= __v >> 16;			\
> > > +		fallthrough;				\
> > > +	case 16:					\
> > > +		__v ^= __v >> 8;			\
> > > +		fallthrough;				\
> > > +	case 8:						\
> > > +		__v ^= __v >> 4;			\
> > > +		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > > +		break;					\
> > > +	default:					\
> > > +		BUILD_BUG();				\
> > > +	}						\
> > > +	__ret;						\
> > > +})
> > > +
> > > +#define parity8(val)	parity((u8)(val))
> > > +#define parity32(val)	parity((u32)(val))
> > > +#define parity64(val)	parity((u64)(val))
> > What do you think about using these inline functions instead of macros?
> > Except for parity8(), each function is a single line and follows the
> > same logic. I find inline functions more readable, and coding-style.rst
> > also recommends them over macros.
> 
> Not in cases where macros are inevitable. I mean, do we need parityXX() for
> XX in (8, 16, 32, 64) at all? Isn't the parity() above enough for everybody?
> And if not, you can have all those parityXX() as inlines as you suggest, but
> also provide a macro such as the above to call (optimized) parityXX() as per
> datatype len.
> 
I agree that we can add a macro to call parity8/16/32/64 based on the
data type size. However, I think we should still keep parity8/16/32/64.
As Peter and David discussed, the x86-specific implementations of
parity8() and parity16() might use different instructions instead of
just XORing and calling another function, as in the generic version.

My current idea is to follow David's suggestion and use
__builtin_parity when there is no architecture-specific implementation.
In lib/, we can provide a generic weak function implementation of
__parity[sdt]i2.

Any comments or suggestions are welcome!

Regards,
Kuan-Wei

static inline parity32(u32 val)
{
    return __builtin_const_p(val) ? _parity_const(val) : _parity32(val);
}

#ifndef _parity32
static inline _parity32(u32 val)
{
    return __builtin_parity(val);
}
#endif

int __weak __paritysi2(u32 val);
int __weak __paritysi2(u32 val)
{
    val ^= val >> 16;
    val ^= val >> 8;
    val ^= val >> 4;
    return (0x6996 >> (val & 0xf)) & 1;
}
EXPORT_SYMBOL(__paritysi2);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
