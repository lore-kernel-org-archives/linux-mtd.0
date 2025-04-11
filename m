Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B872BC36010
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Apr 2025 16:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+iI/R+0q0BWItpFIDhtiFYby35CMLxBY2hNbFL8FSQ=; b=V8xZ+vw+kYdI3u
	lPallrDKu9WsiQh7olsQkvih/B/vBsSwLR6viY2YLx+IPmGUHbP1oZelYsmpBBMld7+DdDiHHK8W6
	WZxzxBDxNqfTuP+X9fRGbVsIsclyV4mfSkk61qCl7dy6gPMdK1An/5USMABzbvr3OpozJbhh7MGNo
	KH9HVuAKPBu6uujc0rwh2Xd2xN9W+bKpO4uea2Kn61C7bSSDansgvKIZfzBC+yyzgK32DvDRjpqSc
	2VySE41rMHsK3ZyAEnBL0yRjD3xKdU79vLCLhSro8m1kKdnQkEpuYysMXbDgCE1TyUSIA/0gJEgKB
	T5frRJqFNIV2N5SSDthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HKy-0000000ENcg-2Axz;
	Fri, 11 Apr 2025 16:34:40 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HKu-0000000ENbY-3vR0;
	Fri, 11 Apr 2025 16:34:38 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so1675757b3a.2;
        Fri, 11 Apr 2025 09:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744389275; x=1744994075; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i2OP7V+QE6E9gg3GbdLcYE8UHgSFfj9Jnjg73a7+53s=;
        b=bvFZ+QVcmIC3fc75UGK1pMmR2uJhKJuXF8tiWmSOR1LAoDoPpPhTNYM51XTJiEZqqp
         B8aB6bRwTCo3+gJ63SxZU6cZoBFTDunEnsKTsjuvxYaLuGza3I2FEUXzOttykLZxOTtK
         Z6q+f+xuzqW2GESddyFqhEoRRPHxekE+eFExbMH7sBIO+/gL3QUAorg62f+JqT4r5ptc
         aYyJFBdyptKrsFaNxrApkaGR2PJvFtqOv7JF7GzNEharnbnlLij860TxHmlm+FsB8LlV
         QAyr0dgZUsrBK1wdnqihYjuRF61zq5/XZTdHbs8g4Ui5IORKvDTWL0cSwwrsSVtFHME1
         qbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744389275; x=1744994075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2OP7V+QE6E9gg3GbdLcYE8UHgSFfj9Jnjg73a7+53s=;
        b=WuOpS2Sv2YP2Vt9Z3TuZkzgVV3tJcfDUCWHhN3/pkTtUPuePYZVwy7N+5lkBWClu6W
         zjiFJDnvwNuIElpij3Na/+HQLzfLhpO4SFDXLPJejuv0UTVPxvA8i5XoIY+CaQzHuLdP
         cd3qO9WP5IPuFoU/OOJhhlZOD97uJf2Y1UxgptSLKTlKEVFP7xMEe3XNmuHJxkooN7OU
         xRT66J9k0rBgEC4p79E6T2wVFnB5ejOSpAIIm41qz2OfFowJUcF+YwCfFuMvUzePFDJ0
         EMn1KjRecVk+5ItrcFxH3mnqrnV7Gbp9T86FJ8lCPM2uKz0UWKmn4r1z3TJIUh914ikd
         qn8g==
X-Forwarded-Encrypted: i=1; AJvYcCX1nWRzpUZ+titzvNg5ZRascXfsPcHlRqXGHuPdFkagQkc0M/BNWeGdMnYhTVPL5HNa4HHLX2hwSP0j@lists.infradead.org, AJvYcCXcPLmLj1wLf1ug7Dvpqm3TnQJAp2JY4JCikGR+SI1SwwIBqVD0Qekp93Ngb5Lp/0RcA/OP5Uzsr4I=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpIrbJYT0fljk7y25G/6FOJX3WAkjJ21Qa0fTQdR8G3CJIC+uG
	HaJrcEq+Lec5LQ8yuJpLPD3VTGLfsysd9u2blVj4ZzKN8ISKd7ZA
X-Gm-Gg: ASbGnctq5XZLcuRkM8zMtqFKFMZVXA+Vi+azrsk/3Wte787WH7NOYMWzeIEQ6pz2exC
	+irAK4OwsVv86sNgnx2Zd44NdJOD5XiVt9Mp2mDuk8tOo10lZjp5TFmJWJTCFbTWMtEafRVVyYf
	LXhWY5736UEMdBYEmOofPwwy1LWf5KxR8IpjhRD50+MHsxCM1MXvCL9fbQZV1bKkHkA2vZhOLIO
	dbj4LTamuWpatheU7fiY0vvQCtknVBObqB3UtGO1twBCWCSH5kHf6fI2xsY+TVfqnm7tGQp4aBi
	TPd76hwPbwZXkIX6tqa1t0Itqzom1Htgvg2nLQuP5nlmozFKLPyyk1l//RUC6pK/+cJAgwLJjoG
	p7CI=
X-Google-Smtp-Source: AGHT+IEYqWSvO9nmRhuvu9Nod5I62ZHK0q1nd8Adc2Nrxqu798p8njg5jLN2TKIb2S4uFWzFr2oiJA==
X-Received: by 2002:a05:6a20:d503:b0:1f5:902e:1e97 with SMTP id adf61e73a8af0-2017998c2d3mr6583017637.41.1744389275369;
        Fri, 11 Apr 2025 09:34:35 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b06161333a8sm258713a12.7.2025.04.11.09.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 09:34:34 -0700 (PDT)
Date: Sat, 12 Apr 2025 00:34:24 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
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
	linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
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
Subject: Re: [PATCH v4 00/13] Introduce parity_odd() and refactor redundant
 parity code
Message-ID: <Z/lEkDwefWvw4ZA3@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <Z_amQp3gK5Dm8Qz3@yury>
 <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>
 <Z_a9YpE46Xf8581l@yury>
 <e97a83a2-dabd-4dc3-b69a-840ca17d70b5@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e97a83a2-dabd-4dc3-b69a-840ca17d70b5@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_093436_976409_CF79E592 
X-CRM114-Status: GOOD (  47.03  )
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

On Wed, Apr 09, 2025 at 07:09:28PM -0700, H. Peter Anvin wrote:
> On 4/9/25 11:33, Yury Norov wrote:
> > > > 
> > > I don't have a strong preference for the name, but if I had to guess
> > > the return value from the function prototype, I would intuitively
> > > expect an int to return "0 for even and 1 for odd," and a bool to
> > > return "true for even, false for odd." I recall Jiri and Jacob shared
> > > similar thoughts, which is why I felt adding _odd could provide better
> > > clarity.
> > 
> > I think they said they are convinced that parity should return 1 for
> > odd because of folding and __builtin_parity() arguments.
> > 
> 
> And for bool, 0 == false, and 1 == true. In fact, the *definitions* for
> false and true in C (but not C++) is:
> 
> <stdbool.h>:
> typedef _Bool bool;
> #define false	0
> #define true	1
> 
> If someone wants to make more clear, it would be better to put "typedef bool
> bit_t" in a common header, but that personally seems ridiculous to me.
>   >>>> type from u8 to u64 for broader applicability, and updates its return
> > > > > type from int to bool to make its usage and return semantics more
> > > > > intuitive-returning true for odd parity and false for even parity. It
> > > > > also adds __attribute_const__ to enable compiler optimizations.
> > > > 
> > > > That's correct and nice, but can you support it with a bloat-o-meter's
> > > > before/after and/or asm snippets? I also think it worth to be a separate
> > > > patch, preferably the last patch in the series.
> > > > 
> > > I quickly tested it with the x86 defconfig, and it appears that the
> > > generated code doesn't change. I forgot who requested the addition
> > > during the review process, but I initially thought it would either
> > > improve the generated code or leave it unchanged without significantly
> > > increasing the source code size.
> > 
> > That's what I actually expected, but was shy to guess openly. :). It's
> > hard to imagine how compiler may improve code generation in this case...
> > 
> > This attribute is used when there's an asm block, or some non-trivial
> > function call. In this case, the function is self-consistent and makes
> > no calls. And you see, const annotation raises more questions than
> > solves problems. Let's drop it.
> 
> Ah yes; one of the quirks about gcc asm is that an asm is implicitly assumed
> "const" (with no memory operands) or "pure" (with memory operands) unless
> declared volatile or given an explicit "memory" clobber.
> 
> So yes, the compiler can most definitely derive the constness from the form
> of the function even in the variable case.
> 
> I would still like to see __builtin_parity() being used as an architecture
> opt-in; it can, of course, also be unconditionally used in the constant
> case.
> 
> So in the end one of these two become my preferred implementation, and I
> really don't think it is very complicated:
> 
> #ifndef use_builtin_parity
> #define use_builtin_parity(x) __builtin_constant_p(x)
> #endif
> 
> static inline bool parity8(u8 val)
> {
> 	if (use_builtin_parity(val))
> 		return __builtin_parity(val);
> 	val ^= val >> 4;
> 	return (0x6996 >> (val & 0xf)) & 1;
> }
> 
> static inline bool parity16(u16 val)
> {
> 	if (use_builtin_parity(val))
> 		return __builtin_parity(val);
> 	return parity8(val ^ (val >> 8));
> }
> 
> static inline bool parity32(u32 val)
> {
> 	if (use_builtin_parity(val))
> 		return __builtin_parity(val);
> 	return parity16(val ^ (val >> 16));
> }
> 
> static inline bool parity64(u64 val)
> {
> 	if (use_builtin_parity(val))
> 		return __builtin_parityll(val);
> 	return parity32(val ^ (val >> 32));
> }
> 
> This means that an architecture -- in particular, x86 -- can still ask to
> use __builtin_parity*() directly. It means that architectures on which
> __builtin_parity*() produces bad code should either complain to the
> gcc/clang team and have it fixed, or we can add additional mechanism for
> them to override the implementation at that time.
> 
> The alternative is to stop worrying about overengineering, and just do it
> once and for all:
> 
> #ifndef parity8
> static inline bool parity8(u8 val)
> {
> 	val ^= val >> 4;
> 	return (0x6996 >> (val & 0xf)) & 1;
> }
> #endif
> 
> #ifndef parity16
> static inline bool parity16(u16 val)
> {
> 	return parity8(val ^ (val >> 8));
> }
> #endif
> 
> #ifndef parity32
> static inline bool parity32(u32 val)
> {
> 	return parity16(val ^ (val >> 16));
> }
> #endif
> 
> #ifndef parity64
> static inline bool parity64(u64 val)
> {
> 	return parity32(val ^ (val >> 32));
> }
> #endif
> 
> In either case, instead of packing the cascade into one function, make good
> use of it.
> 
> In the latter case, __builtin_constant_p() isn't necessary as it puts the
> onus on the architecture to separate out const and non-const cases, if it
> matters -- which it doesn't if the architecture simply wants to use
> __builtin_parity:
> 
> #define parity8(x)  ((bool) __builtin_parity((u8)(x)))
> #define parity16(x) ((bool) __builtin_parity((u16)(x)))
> #define parity32(x) ((bool) __builtin_parity((u32)(x)))
> #define parity64(x) ((bool) __builtin_parityll((u64)(x)))
> 
> As stated before, I don't really see that the parity function itself would
> be very suitable for a generic helper, but if it were to, then using the
> "standard" macro construct for it would seem to be the better option.
> 
> (And I would be very much in favor of not open-coding the helper everywhere
> but to macroize it; effectively creating a C++ template equivalent. It is
> out of scope for this project, though.)
> 
IIUC, you prefer using the parity8/16/32/64() interface with
__builtin_parity(), regardless of whether there are users on the hot
path?

If the maintainer has no concerns about maintenance burden, I also lean
toward this interface. While I don't think the implementation is
particularly complex, I'm not the maintainer, so I'd rather not argue
about the maintenance aspect. Also, to be clear, I don't think I'm the
right person to provide evidence that performance or code generation
matters to any user.

OTOH, If we do end up going with one of the two approaches, since
bitops.h is included (directly or indirectly) by many files while
parity is only used in fewer than 20, perhaps we should move the
parity-related code to a separate parity.h. It doesn't necessarily have
to be maintained by Yury - it could be someone else, or me.

Regards,
Kuan-Wei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
