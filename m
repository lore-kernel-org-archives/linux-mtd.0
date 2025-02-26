Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C9DC021BC
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 18:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGqclgqBOxTEg5jLExGeqmU1q4fmuvCRLvYU5hI2DV4=; b=uufIXzfV8kppug
	5+dIF1ZXjF9pCiFmyS/pMYp0gDuP1mE6p9DtyIkjvyLt8mV+N104DEY1ahoVMwWSlM4yjk+Tx4Oy5
	SDN484+Pkm0yhkWJGHGcTUxYBoN8C3eivrpqp0v+/w1lmumEIkrX99Eo7obBSrmkCIbE+8wq5cEit
	tac635F1cgEHf/LhZOazH98i7xOYLYlSufMcXe1jEwevRMJn1pmv8XlSNT/trm13FCpr+AvitYKAU
	Gnukrue2s5wqoohs93ikaGDkFuejEZH5vmPrRkvFWjjwNu1vIRsIBHQjDInum7KQgwjkbcQP2rBm+
	yn7uL4kHpjLlW4VX0OuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMDl-00000004yIH-2v1g;
	Wed, 26 Feb 2025 18:33:25 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMDj-00000004yHr-0JyD
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 18:33:24 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2fc20e0f0ceso253509a91.3
        for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2025 10:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740594801; x=1741199601; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8NV8NW5Mq8hnlsfnK7VYLX7Lb9iIPf134td0bPOEzZY=;
        b=PBumNaw63o8C3tNAFSTsZ7NQxbgQcx7HqIX/kg6KND1SGDJ3HFC0gCT+FWsjCZ3PLT
         OgwgseSR6nOjgSqqnoSlFAZIHPbGKlqQDMdYUVhypeBM4eQbnOwp2COXFd9+5mWp7hkg
         3bJ2CyyYv9RQGEndK7BiPGtRKuaPlH0227Ta/wbislj5K8KmZw3TWuqDum5nxjDnYaih
         lcgA4ZQR1EUITXNOgrYESERAC+Lkr/+DnPocyEmVWdiR57N71OQY7hVpp+CFkPFhJL9T
         2w6RD0h5aZQ/OBIPgBggVaCcUFMmtjQrTFvAfcurpOYigruJmXvioh9DIPwS4N/nUaXo
         staw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740594801; x=1741199601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NV8NW5Mq8hnlsfnK7VYLX7Lb9iIPf134td0bPOEzZY=;
        b=eaGc0hd2nqK3TYAK35HRnnQ2kR97pjoin3nigencBet8kz0OLcd09pwDROsU3SdyVS
         FekrmBRS5Qbn4Z+ciVIc+R0+gGVHTRcLmnw3PjKHT8LHumZLPGfCIFe7GKq3+x7oQxkX
         /kS33eomVX3YooUDABUl4ra203XQOuLEY8MuiaLh6D8NnXTX3Tx3S7881grJS6gE0S6V
         RTZHPKNlWi54KdtrpFXe0iN/LVPn8hzRsJEECWBPbvZyJumwlvIJCGwqUhjES7CYQR9d
         TjTP3qU+ciAGJ+0sPot/HvjhF4iFYDv9hcX6piiqELYPClQgxux15zGzwiGPzapESLUc
         dorA==
X-Forwarded-Encrypted: i=1; AJvYcCVmNvjrZW7IAx/IiN+BX0k2yi7OZVXfIW+3iQPUFGfI/LGcEr1XYVDbPb0OrjsnaBwrOYEv1C1vsQs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcoNx2AXCahVCKs1+EIr1/YUo8VWQG645KJi564Et+TSb+IQwx
	FWCxwdzVTBRCgJw2IE87AI3rGugo0Zjh84s441NavpES04RFvGjn
X-Gm-Gg: ASbGncsasfRaOOwHJY9xHxOwizOxFsj05N3bJbDeMqgbC1kuoLGj7SaGySxMSxJZluf
	cgROP1O87mX1MWWOcO3XSjOVM/zfnKC/Kg5HjXaLHlQXKmnpaxMs1E1bk0mCAhjHqCOMtlvqNWi
	GPZT8PfsaO2ejoKxVrmKZ/k4ScRsso9OSvdxw3B1EX6TmBnBQXKgwrRO8/i74k0hJWXHNHhATBq
	JTUSHDAxThprRqisF+ipZNUmwDhj+shPQpyDWWnJhEAgmF3c+Xcr4trhG551iiGR/8eMtNxj0v/
	RkIqnK7fhhyzncqIXgK2V+j2QFkBSPMSts9gFblFMQpkOebPqw==
X-Google-Smtp-Source: AGHT+IEhO/8zynHAj/XQ8CfYcqOsDet7/XXIGYhA3zqO2mHTqzuioBsUax6Pz3NWu+JgRkwDnM6ajg==
X-Received: by 2002:a17:90b:2d88:b0:2ee:c918:cd60 with SMTP id 98e67ed59e1d1-2fe7e33d442mr6780868a91.20.1740594801403;
        Wed, 26 Feb 2025 10:33:21 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825eb82fsm1917776a91.32.2025.02.26.10.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 10:33:20 -0800 (PST)
Date: Wed, 26 Feb 2025 13:33:18 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
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
Message-ID: <Z79ebv630yuNOJKV@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
 <Z73FxIv353lbXO3A@visitorckw-System-Product-Name>
 <b5236ae4-7ebe-4a88-bbc9-3b9b3374de53@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5236ae4-7ebe-4a88-bbc9-3b9b3374de53@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_103323_114485_0C8F54CF 
X-CRM114-Status: GOOD (  18.83  )
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

The existing codebase has something like:

        int ret;

        ret = i3c_master_get_free_addr(m, last_addr + 1);
        ret |= parity8(ret) ? 0 : BIT(7)

So if we'll switch it to a macro like one above, it will become a
32-bit parity. It wouldn't be an error because i3c_master_get_free_addr()
returns an u8 or -ENOMEM, and the error code is checked explicitly. 

But if we decide to go with parity() only, some users will have to
call it like parity((u8)val) explicitly. Which is not bad actually.

> And if not, you can have all those parityXX() as inlines as you suggest, but
> also provide a macro such as the above to call (optimized) parityXX() as per
> datatype len.

Yes, if we need fixed-type parity's, they should all be one-liners
calling the same macro. Macros or inline functions - no preference for
me.

Thanks,
Yury

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
