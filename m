Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA723C282C5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Mar 2025 12:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbynRAZ/GwdLHZrZYrSDYmxG2kvAeZuBRK7Ip/qVb0w=; b=lS36itdSBpJHsz
	nmF83LXbfgDMWKdwpJnLK0wklvoA440EQUT5F31qKSvOlUE6qXATYzHSKfZ5pJv7LYNpd+4Nh1Gfh
	8XeZ25vVBaT8FIw1vLMDiNQhSvyRN8tcajaJJyW85IVwzFkoMpkzEwJnBk71OLf+gJt2qnFMK0Mxr
	v8v6ReOwIAiD0qIgfXtQX0PtNLNrK3SUyOaTdGMaDkn8vnJL+obn8eCOG/w7dIQCWdOSzQQTtAucz
	mmMvG2+CaKvevgDbra4ZIEoqqDf2NHf7WFhtkd9qyafYj40hKpm60+wBsbFGEufpoWkbHqgYWSnGH
	O3crjBGlK4IkF+BuMHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5Cl-00000000nkD-3mU2;
	Mon, 03 Mar 2025 12:47:31 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp56z-00000000mFd-0apb
	for linux-mtd@lists.infradead.org;
	Mon, 03 Mar 2025 12:41:34 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso6071136a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 03 Mar 2025 04:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741005691; x=1741610491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLW0AYaLwkO6JC1piDU5qS15yDYOQslsP1SvNrbEZfE=;
        b=amRNdkt7rpai58+vXAp0OatXguMXk0IU52KoQxGeUQK8VLOtF7UYQhbO4XUBHO8Af4
         NKdv9hQUMrJdaqxKFM1K/qwWnBE0EXMTTQd2G8lx1NdcrIwwoQXM8fHYItO281fILEEw
         gMlqt1unQlEW6Xaj/oY4n9icPqadDNGqXKv2WcVHIySm4PucKjP7Os6hnKN5SyClWzwi
         LBBI1F6REqDFgbnx/7tzz5SbZUYjSSce6o3P7ymFosp0+aXacNI1pwxmGmF1ZTKw9TiN
         cdABfuNR95zRAHLHNF55zRsVYa91kj7MxW5A1KqsSXSSj6QLdsfbGXrU8e9XRQYKOEdc
         cRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741005691; x=1741610491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLW0AYaLwkO6JC1piDU5qS15yDYOQslsP1SvNrbEZfE=;
        b=qd3+R28EUDfyA5zAxZjMhAr7uLUYTuhRvGwWadK2H7UEQ9g6bT/nZe4OblrpPPekkw
         G4Osrs0F3pw+7/AJT3PyI/XOyggquclyQ9sOJ4rkS82qke91/GmdZhYe7UKB2W1FMiG+
         sxOt6FRoOF0azSzTH++H4HN5V/aMNcRW22X9oAiTw5jdkkqTUEZpgi/u1hMSOB64Vr44
         F3YbnmG06dMX+kACUwXO95LVR7YDCOJlRYQJR2+PQRHRZUpRtOLi4gEHZ8ckSD0N1xu2
         2zjQ2pkQn+hUauD26NJaJuMuv1yxY8N6x0zQvWUftiWrmgBb7hKaeJwv3jU0fo2iHO9c
         eYnw==
X-Forwarded-Encrypted: i=1; AJvYcCXP0r8FWcFYumAJXbCafckqQ70KEL6Xj5ddlxNrSXANn2aUSFFOYnBl3J2uHyzS4IUUDiAIqdZAfhs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkeg06+m5Swh1ORRzikARgaq6/VEIGRKi3kw+wAY8zQqmBWuLO
	JuHq9MHmHXfb5k54xK+kiTnd4HeoMfJijWa4c8OR36lBQZLu8fUN
X-Gm-Gg: ASbGncvaobqLQOmbvF2T0V9v+0i+qm2xvFyewZyk/0Qa6xK3K0b6YxXyXHJZrF/DtAr
	G7HT69jLp/Ymo95UE4OHndh2Gve2p9S1TZdgvfa2PUjGxvdJIWQvXTj/sK+Oyl/tCnKSZSF3OJ8
	IU7UilE+qeuq0B81cDgCbnfNn5MP3uxKBclaH6m9hdJtNtGq8BEs9hGo+Uz8tzx91xN+eyF/hPg
	mlfgi2oNPhTFQn0llXCpMiS9gJWe/EEOmY/haqu9wSEwEXXsjQe970g7fbp//M2CPMZ0PJQ6888
	c+qzZbE1Imr2eKDDT7cfNN/EOYM7ttshmyklJBPg0AECL3v9D0mcBPhSZU0dP9qESdVjD9/4eLY
	cDOjZaVg=
X-Google-Smtp-Source: AGHT+IGmsdmZpDuU64/zBFVRQ3e/o9vGnleqAFoX6F+q7Lw2p71TWS5SPeiWtsRpxGv/SLlt+kfa+w==
X-Received: by 2002:a05:6402:2808:b0:5e4:d2d4:b4f3 with SMTP id 4fb4d7f45d1cf-5e4d6af1582mr13492784a12.14.1741005688031;
        Mon, 03 Mar 2025 04:41:28 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb4384sm6903702a12.49.2025.03.03.04.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 04:41:27 -0800 (PST)
Date: Mon, 3 Mar 2025 12:41:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
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
 andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <20250303124125.4975afdc@pumpkin>
In-Reply-To: <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
	<20250301142409.2513835-2-visitorckw@gmail.com>
	<Z8PMHLYHOkCZJpOh@thinkpad>
	<Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
	<Z8SBBM_81wyHfvC0@thinkpad>
	<Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
	<20250302190954.2d7e068f@pumpkin>
	<Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_044133_187228_CC5B90FF 
X-CRM114-Status: GOOD (  20.24  )
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

On Mon, 3 Mar 2025 10:47:20 +0800
Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> On Sun, Mar 02, 2025 at 07:09:54PM +0000, David Laight wrote:
> > On Mon, 3 Mar 2025 01:29:19 +0800
> > Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> >   
> > > Hi Yury,
> > > 
...
> > > #define parity(val)					\
> > > ({							\
> > > 	__auto_type __v = (val);			\
> > > 	bool __ret;					\
> > > 	switch (BITS_PER_TYPE(val)) {			\
> > > 	case 64:					\
> > > 		__v ^= __v >> 16 >> 16;			\
> > > 		fallthrough;				\
> > > 	case 32:					\
> > > 		__v ^= __v >> 16;			\
> > > 		fallthrough;				\
> > > 	case 16:					\
> > > 		__v ^= __v >> 8;			\
> > > 		fallthrough;				\
> > > 	case 8:						\
> > > 		__v ^= __v >> 4;			\
> > > 		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > > 		break;					\
> > > 	default:					\
> > > 		BUILD_BUG();				\
> > > 	}						\
> > > 	__ret;						\
> > > })  
> > 
> > I'm seeing double-register shifts for 64bit values on 32bit systems.
> > And gcc is doing 64bit double-register maths all the way down.
> > 
> > That is fixed by changing the top of the define to
> > #define parity(val)					\
> > ({							\
> > 	unsigned int __v = (val);			\
> > 	bool __ret;					\
> > 	switch (BITS_PER_TYPE(val)) {			\
> > 	case 64:					\
> > 		__v ^= val >> 16 >> 16;			\
> > 		fallthrough;				\
> > 
> > But it's need changing to only expand 'val' once.
> > Perhaps:
> > 	auto_type _val = (val);
> > 	u32 __ret = val;
> > and (mostly) s/__v/__ret/g
> >  
> I'm happy to make this change, though I'm a bit confused about how much
> we care about the code generated by gcc. So this is the macro expected
> in v3:

There is 'good', 'bad' and 'ugly' - it was in the 'bad' to 'ugly' area.

> 
> #define parity(val)					\
> ({							\
> 	__auto_type __v = (val);			\
> 	u32 __ret = val;				\
> 	switch (BITS_PER_TYPE(val)) {			\
> 	case 64:					\
>                 __ret ^= __v >> 16 >> 16;		\
> 		fallthrough;				\
> 	case 32:					\
> 		__ret ^= __ret >> 16;			\
> 		fallthrough;				\
> 	case 16:					\
> 		__ret ^= __ret >> 8;			\
> 		fallthrough;				\
> 	case 8:						\
> 		__ret ^= __ret >> 4;			\
> 		__ret = (0x6996 >> (__ret & 0xf)) & 1;	\
> 		break;					\
> 	default:					\
> 		BUILD_BUG();				\
> 	}						\
> 	__ret;						\
> })

That looks like it will avoid double-register shifts on 32bit archs.
arm64 can do slightly better (a couple of instructions) because of its
barrel shifter.
x86 can do a lot better because of the cpu 'parity' flag.
But maybe it is never used anywhere that really matters.

	David



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
