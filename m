Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31EFC197BF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2025 21:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5TnHf/hna/6fHCzygwHv/gUM15RoXvwP9epfh2fSJY=; b=MoXFBOTmJa1QUd
	BdQx2BSRJZWEwu18i+hTEDCJKi61RWSKuRoVx4pQsmVgztOZCzQ/+CNC+HsvdrKgWfGuLSdRSQLi9
	VwzzBsXJYW4kqym2W+8Nf0lO9uOlPJUuKs5g9bvJEuQkgpysUAcufGTHOjaKaVCEgD9lrJ8B4qB+5
	og4pHgi2aatxIJ8kaKRVMIpSMMyvxOVp07RUICa9/1ryu4Eod6WKjkkdhZ7UHTPqENCRu4FJppjcI
	qVKoOFmGeZ8/35ifbR//Fkqld3xQqVsAdlGLbM7spSLXu+AcCx8OAhRf4aWEgro2ER+Yi94r6IyRr
	wzjiT4ddWmjYRmN4w9Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnlt7-00000008wnk-0TmZ;
	Thu, 27 Feb 2025 21:57:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnlt4-00000008wnG-1PR0
	for linux-mtd@lists.infradead.org;
	Thu, 27 Feb 2025 21:57:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43998deed24so14228265e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 27 Feb 2025 13:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740693465; x=1741298265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMuX81k7SiNTHz2+bDlgy5RWfBuIrQmuJh6Y3XOI5k0=;
        b=nexA3f0YquCE0im666nTTyddKp2x/aj5vUm7T35m55sVF8zWS/snzEZw0TFabigTd5
         9f8eP4K67rPN7y05bewOAAcARvV3/WdQycfwJKIfx4oE0beVgSVKk26mgYKrJ6vukfXP
         XU5d337rdMQtrHBNnYyNeh9pxU+6vQSPHpLog99gun1P6q6SuZ+z6dp0CukPGTXwlo/g
         C6nnDIBAi+SF+3zQaSuuKVXPtiYkaURgwRE9Kzdsk54fmbW/BbBazxAJ5zbZPqmblhNu
         Y82ws4ErJeuNxyl6TSzFItO2i45Tg0mBXRXjTHSTHBQBcM3I0BMUCgPMVqJf0yNUbK7h
         rlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740693465; x=1741298265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMuX81k7SiNTHz2+bDlgy5RWfBuIrQmuJh6Y3XOI5k0=;
        b=IaLY7x2UPYpdIYRHn0pKUWdV/VjvQfiqBMsUOibuRoGObfwKssivOzPRoZI0KWl75I
         tUKiYDJNAUqROgZOlP+F9fC7oSIacX+nvunyJ0kWOGxPbSDX7m8hZqhG0K/PtWkooP+q
         BpCq79tGBqyi/CleCE2eRzBjfu+torveXtMHeu/Z0Oofy6mwJgok4Ej9KfIOGK8XPkE2
         99cNCdN4fzNW3FaGdQ/DaQamBucvBQbwfln2hM0zLwWOCfjzR+F6Xqb1Jq/Ojalaa7pw
         qq4NIN8zygCFoXiVTYlhtW6q5NVrfVAsMpVHYBBl+xmeQ0fboH+Fp8M2fm4Vkj28Kjsv
         UXJw==
X-Forwarded-Encrypted: i=1; AJvYcCU4iBVoIqn7gx1QtllonOYMk68faEH7SbagqpFcZp028kgbtCBTiVRj1acdEXcwmExvUVoxckeQ7go=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZl6Hm/+PXKA44zILyMvX5zENATFN/qVgTD1xRAZdnkb0PWl3/
	Ev5dz9akJDBz2gE4Bv2OYB1z7c6hPn98ulaTH6ruF7fulQoMGdZr
X-Gm-Gg: ASbGnctZi3yT0QXZUYJe4RyxcSPsqx+f1vQ5GLO9XR9LWmW6oDEVnkMmn8WmYeBnhfQ
	XCxAATtfI3PCnoYt2fuCf4YCMH3UPwMPrGlFV98YlEyvzCeSaadp3ox60tn8kpB0N9cbV82CY0l
	xulz+3UNWSCXane251lJfXLetKssw8ct2N0oZ6A1ObK4oe6ieVcJ2Wj524Sg29E6d725z91Mf0Z
	GIzNM0yY/0bVRShnBOZ7LL64ozsCaHrqgJ1kRc3v/WVF8ZCA0jItduEZrV40gFXgE8FpcmEC2Jp
	dEvb5lumlftgIJ4CmXhUOIHu+eEJ3NQ7NAQWtWW+cf9uDAOejbV+12PHY6rjzUJG
X-Google-Smtp-Source: AGHT+IEhn6JpdK4VbGGBYqWA0Kpl3+orzugSC/uMKlJ9X/pPv2vI6Oa6V51Yx+DCCez80jfd4SeOMA==
X-Received: by 2002:a05:600c:1912:b0:439:a1b8:a246 with SMTP id 5b1f17b1804b1-43ba66f9643mr7425895e9.8.1740693464406;
        Thu, 27 Feb 2025 13:57:44 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7370372dsm35525085e9.11.2025.02.27.13.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 13:57:43 -0800 (PST)
Date: Thu, 27 Feb 2025 21:57:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <20250227215741.1c2e382f@pumpkin>
In-Reply-To: <Z8CpaaHv0ahHFVuK@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
	<20250223164217.2139331-3-visitorckw@gmail.com>
	<Z7zIBwH4aUA7G9MY@thinkpad>
	<20250226222911.22cb0c18@pumpkin>
	<Z8CpaaHv0ahHFVuK@thinkpad>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_135746_381856_AE3FBBCC 
X-CRM114-Status: GOOD (  29.30  )
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

On Thu, 27 Feb 2025 13:05:29 -0500
Yury Norov <yury.norov@gmail.com> wrote:

> On Wed, Feb 26, 2025 at 10:29:11PM +0000, David Laight wrote:
> > On Mon, 24 Feb 2025 14:27:03 -0500
> > Yury Norov <yury.norov@gmail.com> wrote:
> > ....  
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
> > 
> > You really don't want to do that!
> > gcc makes a right hash of it for x86 (32bit).
> > See https://www.godbolt.org/z/jG8dv3cvs  
> 
> GCC fails to even understand this. Of course, the __v should be an
> __auto_type. But that way GCC fails to understand that case 64 is
> a dead code for all smaller type and throws a false-positive 
> Wshift-count-overflow. This is a known issue, unfixed for 25 years!

Just do __v ^= __v >> 16 >> 16

> 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=4210
>  
> > You do better using a __v32 after the 64bit xor.  
> 
> It should be an __auto_type. I already mentioned. So because of that,
> we can either do something like this:
> 
>   #define parity(val)					\
>   ({							\
>   #ifdef CLANG                                          \
>   	__auto_type __v = (val);			\
>   #else /* GCC; because of this and that */             \
>   	u64 __v = (val);			        \
>   #endif                                                \
>   	int __ret;					\
> 
> Or simply disable Wshift-count-overflow for GCC.

For 64bit values on 32bit it is probably better to do:
int p32(unsigned long long x)
{
    unsigned int lo = x;
    lo ^= x >> 32;
    lo ^= lo >> 16;
    lo ^= lo >> 8;
    lo ^= lo >> 4;
    return (0x6996 >> (lo & 0xf)) & 1;
}
That stops the compiler doing 64bit shifts (ok on x86, but probably not elsewhere).
It is likely to be reasonably optimal for most 64bit cpu as well.
(For x86-64 it probably removes a load of REX prefix.)
(It adds an extra instruction to arm because if its barrel shifter.)


> 
> > Even the 64bit version is probably sub-optimal (both gcc and clang).
> > The whole lot ends up being a bit single register dependency chain.
> > You want to do:  
> 
> No, I don't. I want to have a sane compiler that does it for me.
> 
> > 	mov %eax, %edx
> > 	shrl $n, %eax
> > 	xor %edx, %eax
> > so that the 'mov' and 'shrl' can happen in the same clock
> > (without relying on the register-register move being optimised out).
> > 
> > I dropped in the arm64 for an example of where the magic shift of 6996
> > just adds an extra instruction.  
> 
> It's still unclear to me that this parity thing is used in hot paths.
> If that holds, it's unclear that your hand-made version is better than
> what's generated by GCC.

I wasn't seriously considering doing that optimisation.
Perhaps just hoping is might make a compiler person think :-)

	David

> 
> Do you have any perf test?
> 
> Thanks,
> Yury


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
