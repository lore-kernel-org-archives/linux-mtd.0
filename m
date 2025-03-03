Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0FAC282CD
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Mar 2025 16:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+DwIOWrg6WRn5pkjRdpfPyYI9bngTpvNTy0Mx3gkeM=; b=G2rEjEhmPHvNLv
	KcLqv+ZKtsadqtLP63zPVakFckzH9iq++BABvYg56/vkv9fA6Z8eC+zPnGr6gKBJAMrDdudLjPOLD
	9CSvGpl7yKiMg1NDyjyfDnV5fRz8OgXCL4c4ipNZGTk26kze84+Inj04VWU8D14pnST5r7O7/D7EN
	NanUAqpru6G4sdMu7O2kduJ8YmbvB90mIIqpfs3pgqVbBXhOZbUYJ3VHZGjlAK3WbN/0RLSpTxRW3
	UtGTRhTikjPUKSwB3XrxpoiPXN7mo4F++nQA7d8BB+RvScqNuFUCji9VUXo3Jit8Y7h+Mo+wyypAL
	WSp5hU9zSCHFWvjvLsNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp95R-00000001dhL-1pnM;
	Mon, 03 Mar 2025 16:56:13 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp93x-00000001dIL-1Nvq
	for linux-mtd@lists.infradead.org;
	Mon, 03 Mar 2025 16:54:42 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22349bb8605so90443925ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 03 Mar 2025 08:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741020880; x=1741625680; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=snQ/FfGFpVYJtbb054yayRa/GPJB9+XLRVNWjcRf72o=;
        b=Y/7HRj1Ym1SaaNTaw53sN4Le4p89CZIl7mCy2f740APsGgKUrYNTKbKPnE/0fSdW7H
         IZvznnpKbxMsKzS6l0bEgmho4RQHL5UkUUUQxdEoJ2LVlEqXPeG3EKcfE56ObpdBXVsA
         ELPwcAHXlecxDc8MPKFTy04peJoT+uNet31Alu2C+LZyCI4bphEbK4rqJiDmAvcLGm6v
         oJJhLTnOBr5dM421IVcI8uRrsNMk6zjA18UHXqq6/JfLu7r30pa5GKsOC4R+0cmL70Hl
         KaHHrsqxZSFaLQr48dtL+3+Tu211q7HgZ71yyFXFb1gKqD4ac4NQpnFN6jT8DnpxcT1D
         o+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741020880; x=1741625680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snQ/FfGFpVYJtbb054yayRa/GPJB9+XLRVNWjcRf72o=;
        b=W7dsJ7GR9+9kKgOVHc0ZE8dgyg5n7KSwjw5WQhs6nnc6TGTbfmpkBkiuh5RfPg/mdW
         6T9PGXC27VGJu22A8msuNX9d31ayVm8NSUBi0KNXWG+6YvExwLXVd7r95otx1jZxDJBr
         WprVGdl1j0OwFIL+REwi+B+oPaELmuKGpM5KJEn8R0dB2Pi8TceYzBQVs5f7+szZb5jB
         vuISETDxf70FyCFbw/XXhssglaIHE1tIGBe7Td2nkVU5ziweTmRLK+vL/xYLdmF96pSn
         ZZn57YpCIYqeB4MxW+Q67m0fTZgTCoTevH/PmCKTMmkxzHRqDKUIunDakzl+56tD0VD1
         lNTw==
X-Forwarded-Encrypted: i=1; AJvYcCXiSkAEOiWVUHF+2LpfRAzHzhCbg400rdUm17cR19ehEiPRYh4FLnFAR1wwGUhYDRfA64tpHP/GxOA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyupddCnHllPGcf3Z+9YnccBBYooh8CkOfpzP+nLX6jDg7QWQWN
	VV9fe2Vlt3egoyGBpDc5N/2TLUIuRnlvrpPpkOnyFfMoScUpU0Xj
X-Gm-Gg: ASbGncvs1byH1bVEwy4PyoXJZAq5LJ+THdHMgL2OukwABxqykqDVCgxiGABTPDVSFSx
	wCnomuySP0DG8bUHGJwqCw34CxE181VAPlQQ8XfZCTp/1Jx4McM36WFv5LQDPZ0LtbFUnXjkXIh
	T8JZ49FQKbjJYuCIJdaOdBYhX/jLNZwFsjTxGo9PPFR86LQeCWO+qNhtH9xYt9iscckzrZ745/6
	RWpbHJaU27XzTMle7tzO16TdNBpX/LMMyspjJ1pWKZMZsjLTmS0WpCPKX0tFWqv6e0E2NJ6WwEG
	NDRtDxVhxZqw2awEdAq3YvfA+UFF6CBs5GPAbqRcIERULjQhkSZHnY03yj8O66D+pQkzjxUp
X-Google-Smtp-Source: AGHT+IERzXXFV1wY4JOTqL7FEPHOnAzKcBtkbh1MW/f1V7zUkt/V5lVcottzvfcf37UkL0y23/7mVg==
X-Received: by 2002:a17:902:fc8d:b0:223:44dc:3f36 with SMTP id d9443c01a7336-2236925eef4mr232091065ad.43.1741020880198;
        Mon, 03 Mar 2025 08:54:40 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c59ecsm80088085ad.123.2025.03.03.08.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 08:54:39 -0800 (PST)
Date: Tue, 4 Mar 2025 00:54:30 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, tglx@linutronix.de,
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
	andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <Z8XexgomsveMWK2U@visitorckw-System-Product-Name>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
 <Z8SBBM_81wyHfvC0@thinkpad>
 <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
 <20250302190954.2d7e068f@pumpkin>
 <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
 <Z8XOF2DMMRKqam6R@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z8XOF2DMMRKqam6R@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_085441_370792_2FE5473D 
X-CRM114-Status: GOOD (  26.65  )
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

On Mon, Mar 03, 2025 at 10:43:28AM -0500, Yury Norov wrote:
> On Mon, Mar 03, 2025 at 10:47:20AM +0800, Kuan-Wei Chiu wrote:
> > > > #define parity(val)					\
> > > > ({							\
> > > > 	__auto_type __v = (val);			\
> > > > 	bool __ret;					\
> > > > 	switch (BITS_PER_TYPE(val)) {			\
> > > > 	case 64:					\
> > > > 		__v ^= __v >> 16 >> 16;			\
> > > > 		fallthrough;				\
> > > > 	case 32:					\
> > > > 		__v ^= __v >> 16;			\
> > > > 		fallthrough;				\
> > > > 	case 16:					\
> > > > 		__v ^= __v >> 8;			\
> > > > 		fallthrough;				\
> > > > 	case 8:						\
> > > > 		__v ^= __v >> 4;			\
> > > > 		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > > > 		break;					\
> > > > 	default:					\
> > > > 		BUILD_BUG();				\
> > > > 	}						\
> > > > 	__ret;						\
> > > > })
> > > 
> > > I'm seeing double-register shifts for 64bit values on 32bit systems.
> > > And gcc is doing 64bit double-register maths all the way down.
> > > 
> > > That is fixed by changing the top of the define to
> > > #define parity(val)					\
> > > ({							\
> > > 	unsigned int __v = (val);			\
> > > 	bool __ret;					\
> > > 	switch (BITS_PER_TYPE(val)) {			\
> > > 	case 64:					\
> > > 		__v ^= val >> 16 >> 16;			\
> > > 		fallthrough;				\
> > > 
> > > But it's need changing to only expand 'val' once.
> > > Perhaps:
> > > 	auto_type _val = (val);
> > > 	u32 __ret = val;
> > > and (mostly) s/__v/__ret/g
> > >
> > I'm happy to make this change, though I'm a bit confused about how much
> > we care about the code generated by gcc. So this is the macro expected
> > in v3:
> 
> We do care about code generated by any compiler. But we don't spread
> hacks here and there just to make GCC happy. This is entirely broken
> strategy. Things should work the other way: compiler people should
> collect real-life examples and learn from them.
> 
> I'm not happy even with this 'v >> 16 >> 16' hack, I just think that
> disabling Wshift-count-overflow is the worse option. Hacking the macro
> to optimize parity64() on 32-bit arch case doesn't worth it entirely.
> 
> In your patchset, you have only 3 drivers using parity64(). For each
> of them, please in the commit message refer that calling generic
> parity() with 64-bit argument may lead to sub-optimal code generation
> with a certain compiler against 32-bit arches. If you'll get a
> feedback that it's a real problem for somebody, we'll think about
> mitigating it. 
>
How about reconsidering using parity8/16/32/64() instead of adding a
parity() macro? They allow compiler to generate correct code without
any hacks, and each implementation is simple and just one line. Jiri
also agreed in the previous thread that we need parity8() in cases like
the i3c driver. I think this might be the easiest solution to satisfy
most people?

Regards,
Kuan-Wei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
