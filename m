Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCE6C1B087
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BA0TkTpL1bz7xsbn3PTF9edUNZMdxRwDOuOtWbgqF+8=; b=4ZVUrg8NEcXesU
	DbyY3UpFrUtkF0B10erQMl2qZNF2HR0w2wOcTe2bqfUFF6mXi7/6xsaUa/lfyt39kS/LKBvtHZ9r1
	2ub/AZ/gNep+LfctVttw25i1zEbAH9VwSwGOAb/KPNFkYoy1K5tqh0oRM2/f1/BEW+lfr2selC/gS
	2zEiD4fzTqLL4fYz05k6RgrNiRRB9ACKpeFCFXdXmOiCxKyOi6J4ORiugidk1YS/nV0yZJeGCH4Y4
	MUntWhV/VIhVFuoGW5kwnOpUas7K9GnjUktAy3QHu47Lo3enkEw3BRztbyQX1v9/+Yb8wBMosGd50
	KD8Q/kcP47oHSmDMNhMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjlc-00000008bzm-0FzK;
	Thu, 27 Feb 2025 19:41:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tniGL-00000008H0V-2hF1
	for linux-mtd@lists.infradead.org;
	Thu, 27 Feb 2025 18:05:34 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-220e83d65e5so24296695ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Feb 2025 10:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740679533; x=1741284333; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WlMEi7Una8TwxGaYzKJCUvFP5cGs/B6xguOFMjaN1Ww=;
        b=WPRTpceSEWFIbmUUJnWXaUmLfLgzAml0XLwmjEIxyx39vlqrNf1dkXkOz0dMg4ama+
         gMRVCTHGbQCxrM566lKYNJbgKQkoowWhAaeetGKEN4KbvNFj67VZ6fw+2yfYoRoupFxF
         ZNYyxhwo9GJdQ1PT4VMq8OoXnxvjlna74/CHHTF7FqovzVmUAKhpCa21QxMxI2o5EVbR
         kV8To5YYKm/p6rSrScdgPfRgmIAFhY9fLY4yZIJJ6tJ7bihNtulc4m/3vZk6HXsAJ0MO
         mWsDzvNT1N0KO4nAodOUuHhkglUYnK2dJ59DXSaXcmip1EyqqtIz9D15YTLT/NOujiZg
         JEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740679533; x=1741284333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlMEi7Una8TwxGaYzKJCUvFP5cGs/B6xguOFMjaN1Ww=;
        b=p6+YLQ1NE0b/ulHPadwqn1MuK8AfE8d8OIV2QG449Wb25SUY8S1ex+bs0D7sBAJ7P/
         V2YD4hD6kDZJUemofcowLR19qe+GbQ6LrNdA8ORS4DbBE736k1MsnI5j2N2JqiuljIjb
         /wj2q9J9UUvSbdBsQiXNe3B21uiwubgqRyoIs+bhfciba3JZvVFrT3Os6nYr5U3zWm6m
         UYNFEjG/ItlUmuYYUOOawGeRv/7tVgu/UA/xvKAw+4hkDAq0HStDENNPI7iaNuUYMBI+
         I9wTc/bC/JElKmC9WLaLyQQWnZgEGN45V52hUjkoV0xgMsxpOOz1uuqXQbfhQAlf3du9
         wyjg==
X-Forwarded-Encrypted: i=1; AJvYcCWkZ/SJgrZGI8PzfwYCA/PTiiW/M11YInpLPzfmHMQjBIpo+mWWiXfAQu44DzGQywQUvYRkBIQBvGw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw9Wk1FS6wGhVskWSSNagWwQC0WaD4OOLJObNbj3ZullvTL9Kk
	Ww+kPswa7myxmifizZ6Pd47GsK3kZH1KH8h4kditUjOpB/Wjh5nD
X-Gm-Gg: ASbGncvuHEiRqWATmPreqQz4nWidGYaSE+TnpKZg1qYWMFzk0lKoBZ3F5g1bv/v1HyQ
	8LpsYc/R1zVvY4RQUolqTbowx8mikyl3IW1h7l+SLJJ1wK4ZgqfmsQC6D3xopmwPFuUU5dcpIdj
	XaPcsDFJ3LbGuEqIcr5toRWBcMMJ1/qxBRf+5FNXc21Ts5xcyaJhqW93olgRbzaese8V9157ydG
	jjsIcg6j3JL1pX2OwJjtBmBDncm9rQz1IeD5wFLet3Vq9vS/cNMRJ7FRgPoBQPNHBv/nmrijgpT
	dXM432ebu6KcNZfloaEtW+/TGzMvUEow3gfutfo2TFdUWtDXBg==
X-Google-Smtp-Source: AGHT+IEnEhzc2owT1KH+D6qO8Y01zbjbSELOHxZjQy0YabJgdb+peb2Mulxfa+PI8nU5R7zu0Cxkog==
X-Received: by 2002:a05:6a00:806:b0:732:2170:b6a3 with SMTP id d2e1a72fcca58-734ac44b986mr473864b3a.21.1740679532704;
        Thu, 27 Feb 2025 10:05:32 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00600e1sm2015088b3a.171.2025.02.27.10.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 10:05:32 -0800 (PST)
Date: Thu, 27 Feb 2025 13:05:29 -0500
From: Yury Norov <yury.norov@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
	eajames@linux.ibm.com, andrzej.hajda@intel.com,
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
Message-ID: <Z8CpaaHv0ahHFVuK@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
 <20250226222911.22cb0c18@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226222911.22cb0c18@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_100533_679561_B9D17F5B 
X-CRM114-Status: GOOD (  19.06  )
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

On Wed, Feb 26, 2025 at 10:29:11PM +0000, David Laight wrote:
> On Mon, 24 Feb 2025 14:27:03 -0500
> Yury Norov <yury.norov@gmail.com> wrote:
> ....
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
> 
> You really don't want to do that!
> gcc makes a right hash of it for x86 (32bit).
> See https://www.godbolt.org/z/jG8dv3cvs

GCC fails to even understand this. Of course, the __v should be an
__auto_type. But that way GCC fails to understand that case 64 is
a dead code for all smaller type and throws a false-positive 
Wshift-count-overflow. This is a known issue, unfixed for 25 years!

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=4210
 
> You do better using a __v32 after the 64bit xor.

It should be an __auto_type. I already mentioned. So because of that,
we can either do something like this:

  #define parity(val)					\
  ({							\
  #ifdef CLANG                                          \
  	__auto_type __v = (val);			\
  #else /* GCC; because of this and that */             \
  	u64 __v = (val);			        \
  #endif                                                \
  	int __ret;					\

Or simply disable Wshift-count-overflow for GCC.

> Even the 64bit version is probably sub-optimal (both gcc and clang).
> The whole lot ends up being a bit single register dependency chain.
> You want to do:

No, I don't. I want to have a sane compiler that does it for me.

> 	mov %eax, %edx
> 	shrl $n, %eax
> 	xor %edx, %eax
> so that the 'mov' and 'shrl' can happen in the same clock
> (without relying on the register-register move being optimised out).
> 
> I dropped in the arm64 for an example of where the magic shift of 6996
> just adds an extra instruction.

It's still unclear to me that this parity thing is used in hot paths.
If that holds, it's unclear that your hand-made version is better than
what's generated by GCC.

Do you have any perf test?

Thanks,
Yury

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
