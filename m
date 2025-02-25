Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937DEC021B2
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2025 22:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FIgaQV3cpYA+vuf1cTK1EFE6wUe3ox89eLXCiHBCT5Q=; b=gHyb6iJxgqLsit
	RqMic6DHvY6U85Hapm8UiVuLWyPtsC606pJeXFlNEAKX00LfYgkAqaEnOTb++m75btq+i0V2hC5eW
	HikRmPBAmWyU9CyvwdD+KgAKVmqCQVrKMd1uQOFnhiWNzFUPC6rCanDr9M7NfuB/XLrI7/VLDnFR8
	2Ayugp5brXlwReIZIVuuFWnoC8ExpzoZudcLB41QH0+IA6JtXCMINIdNK6TK4Q56ruDdy87P5dhpu
	8XAOY8D5njP1MP3UVV8hdyDqEqulwC5Ot0MxgCs+gtof+wuiv/WYfTO5Vf+a8v9218la/RlPXreSv
	MR7hzcda95i1B/xohWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3h8-00000001kUT-3mfY;
	Tue, 25 Feb 2025 22:46:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3h6-00000001kTx-1ZfK
	for linux-mtd@lists.infradead.org;
	Tue, 25 Feb 2025 22:46:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so1568015e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2025 14:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740523586; x=1741128386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xEzm5a7MvJg/wvZ+Z8+F/9tGDPPJZX+eI/HEgAntBA=;
        b=dWT8G0pRiRWSL3FqU+mQS4FhBj/eX5Zfuv6iVMvcUstelFem5EoMzQqYrK/mLTdp/o
         T2Lc5HzjiUpQoKaUH6Nc7U6AdP/JTQxuSFl+DzsZcYsV49qpYMKjxkGcW8X6kPUa64Ze
         YDUi3Oxt4G6HhZ6hMpTTP137LiEJWKWPtONDXb3FA8s655ub7A4TwU/rsF7nP+EX0euA
         6c5nhhvGf4s0ai4NMYnf8rUX+EeUCiioe0beRnhETL9UFeTYNOf7BDlpBEfOXU+KKBRs
         hlg6bmHXpzba5RTtcqm3Lw/nKZAFuN2r9F4NhRaz2YWYSBwUNO+fjxWUjeHAjSPMvgjo
         V1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740523586; x=1741128386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xEzm5a7MvJg/wvZ+Z8+F/9tGDPPJZX+eI/HEgAntBA=;
        b=q7U4usDYXPaiIR8XQb/jEbtThgk5Iagl80cTsZwYJhdlHojXtGCn0WcC3akCBaIrwh
         gnbIJU3F7xQ6EPaVoq17vl3M6AAUMfsembM+58Chdfh3/ppJS7Vg6BPXawZs3TrgvUrw
         D9F7aGeLMy4AK/sI7ThRQEPye4dy8794GI88oWa3ZDFS1VjaI6cszJ3tBYWkjG1Q5834
         JoC+T6n/L1CHHNNpB7LLLif+JDlrTMTdBT/eu/i5Eg7x2r9VyI4Sr9BZq/AT9extiCe6
         FWtVPu5Vx4N8KENqKAEGxJmr9ZocKYtTofmjuQ+bMczOUd+r6AzmAV39+UaRKK+ONAJ5
         ffcg==
X-Forwarded-Encrypted: i=1; AJvYcCUL/J94hFuMBwW/qEePzkcxpS9aGVmSK3eS0MLLbpTdTv2hyf9fcxQ4SrColbql9PocvLDGLlElaWU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIlAjdKlpwCVPlRs/e37iAToiulyL57vm9am2Y3QYVM2HpkvLj
	gBiYC8xFhofOsDli3Sq+IhMqF1WKUyVTfB781tjdZCJTqtT8NymD
X-Gm-Gg: ASbGncvSNYZ9ygBhzirfykGxSBwnoT3+78Ogu5G2NnUk9qXalSb7JvklFulFEz5Llav
	YwmrtmFUceVa8CDPm2IlB9Rvr02lo0N53eJPJLqqnqA6O1EvICyNuPKLtEVmOc0tFEAPc3jznIN
	R9V8vvm95Z8vYISeH5czlEUJKuUZalH8zc0l+fYU1xlRhBqwm7bv8bnYChIJp4Fldar79PpAH0E
	Pfx45cNkHUTYgSG+sPJTmj6GeYlG6dGJNYoO/b6iE/w+iwm3C6m65RDcJy6BkZB/qmRXYcuiGuB
	Cyo0yO5zzO4FP/EBmYY3AHGL7ty2bQpAg/ArUwYieUGqkICM24B1vxhZBuD0Q7xp
X-Google-Smtp-Source: AGHT+IFjrInluoqnbFjbjbGFkCsa4TCd0YMAhHctzgy+ODQ6ToD9u7urtlYhpUHFZQok7JnATsU7Wg==
X-Received: by 2002:a05:6000:144d:b0:38f:4f17:ee29 with SMTP id ffacd0b85a97d-38f6f3dca7amr14183257f8f.17.1740523586194;
        Tue, 25 Feb 2025 14:46:26 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd88295dsm3621054f8f.45.2025.02.25.14.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:46:25 -0800 (PST)
Date: Tue, 25 Feb 2025 22:46:23 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 tglx@linutronix.de, Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
 mingo@kernel.org, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
Message-ID: <20250225224623.6edaaaa9@pumpkin>
In-Reply-To: <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
	<20250223164217.2139331-4-visitorckw@gmail.com>
	<d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
	<e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_144628_421373_0F4E03F3 
X-CRM114-Status: GOOD (  18.13  )
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

On Mon, 24 Feb 2025 13:55:28 -0800
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On 2/24/25 07:24, Uros Bizjak wrote:
> > 
> > 
> > On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:  
> >> Refactor parity calculations to use the standard parity8() helper. This
> >> change eliminates redundant implementations and improves code
> >> efficiency.  
...
> Of course, on x86, parity8() and parity16() can be implemented very simply:
> 
> (Also, the parity functions really ought to return bool, and be flagged 
> __attribute_const__.)
> 
> static inline __attribute_const__ bool _arch_parity8(u8 val)
> {
> 	bool parity;
> 	asm("and %0,%0" : "=@ccnp" (parity) : "q" (val));
> 	return parity;
> }
> 
> static inline __attribute_const__ bool _arch_parity16(u16 val)
> {
> 	bool parity;
> 	asm("xor %h0,%b0" : "=@ccnp" (parity), "+Q" (val));
> 	return parity;
> }

The same (with fixes) can be done for parity64() on 32bit.

> 
> In the generic algorithm, you probably should implement parity16() in 
> terms of parity8(), parity32() in terms of parity16() and so on:
> 
> static inline __attribute_const__ bool parity16(u16 val)
> {
> #ifdef ARCH_HAS_PARITY16
> 	if (!__builtin_const_p(val))
> 		return _arch_parity16(val);
> #endif
> 	return parity8(val ^ (val >> 8));
> }
> 
> This picks up the architectural versions when available.

Not the best way to do that.
Make the name in the #ifdef the same as the function and define
a default one if the architecture doesn't define one.
So:

static inline parity16(u16 val)
{
	return __builtin_const_p(val) ? _parity_const(val) : _parity16(val);
}

#ifndef _parity16
static inline _parity16(u15 val)
{
	return _parity8(val ^ (val >> 8));
}
#endif

You only need one _parity_const().

> 
> Furthermore, if a popcnt instruction is known to exist, then the parity 
> is simply popcnt(x) & 1.

Beware that some popcnt instructions are slow.

	David

> 
> 	-hpa
> 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
