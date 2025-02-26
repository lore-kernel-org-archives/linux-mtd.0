Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C128AC19F2E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 22:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3ADoi2mTxilUWX6waSCRPI2vQYbO+D2r3+Cn2bGZKQ=; b=FH2ucaMr9RYTXO
	jDyWRARIrNEQ8ObJw7IzF6f4Fj1kOSBMdJTf/n4ZiUnhdBC1vyLjcSczAiyEuuviE+0zRBUiHAEH9
	3XYpOtvnA3hsfWaf9TKqH2mPpVKI0xVdrJzJ8rb5lQjn2aqF6XOVW0N9sQiiXzPjETzPIPiakmeBT
	8pt1LCX+QZT1wpSX+7v8rXDN9iX98V120cH3qBdAGmGAtHD93NdbIBEpSamRtBeEMkgAYHZ9H/NTO
	2T2GX+M+KaKnVLXEH3N/ojHeIQ6tIqhBxfOnThdXRImhkm2ZmIHuTjm+QfmYKkQ9NZXQ5/XJp0vQA
	0SwSAwnYWMUPhstxXA+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPvW-00000005cBg-3avk;
	Wed, 26 Feb 2025 22:30:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPtz-00000005btr-3uhp
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 22:29:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43996e95114so2115815e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2025 14:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740608954; x=1741213754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfWwQBkEse5FRQekJZuNar17CRdvAyTkX7+fO0J+m/4=;
        b=IR1kJOLuyMlnFI3zTcyX5m4ef/e5cowzzwtoGzdMn+AU1o3sd/pjihOZQvqjE7o03/
         tKTD/+HefeczyhENIAinRFRTEGRknBrz5aKrvFqalcAqm2ER5/Cfq8jt8vkvDVcUEThZ
         Qn9Q8QUxRxnEJ8zQXgpp2i068eZcntVhTocmubTkbUBc4S00+49aW8sDHMsPoG+0ChWH
         p8WsxR8nskLqEZVLFGqvmyH7Dk4bzu7Aw3F5UugKY04gJNhG5LVB6VlzuskVSS5b7YaU
         Dk/USyT2ff1fPK7rnG9he8+XFIx0xBUts43MYCqZEbkbeA5YbcTznUY/xgVTZdMY+mm0
         3p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740608954; x=1741213754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfWwQBkEse5FRQekJZuNar17CRdvAyTkX7+fO0J+m/4=;
        b=kaMQsb/VAPKXq3pfqTf42hO52UzM3d2wIym6nkqbcPJ0Cf5r92hzRK3otKgBvCgvHr
         qsrk1L0QyhshTE5zsxWfwVTSEUCMDkPXtybKEeMaTp8ESes17VPdpkFXCSnT89alJY0v
         dVzZEb1aiDlSLZKfh/+BNeMP5c8WEoG/T/07LpqkDBVf09cDw0jEtE7Y3NOr4LturOBM
         MwF5NHFIAFtg8s/yBaB2b8RNGX0hmViI+/HHOJjofeuxesnZZ5XGCM6K+N9iJjxCVbgx
         Oo5AC7nCIopo+Lu90xGNJj46aNcVrdiANntkmvjN4p+y4cZGDt1iWQBz95k+sfuK1Ow4
         Fzgw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5Ez28fJLikCofVgC4awRuT66WbgoFNGTZaWFjtD2z1Kcn31nhCSEGIi6QaA9dI1BZtY/mWSQh3M=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFX02U4/8ABTShejxgouZCl4jDv0vfqCI++ARLwUAnkn+HCiKT
	p1Obr8TlKNOHD/9JAx+yP/QFkeegpXr4DPRsko07w/YRULaN2bHQ
X-Gm-Gg: ASbGncsPKbWldxcIl2DMZyvbaCphxgj3vvFrn/BXVWqywwV4YYHG7tQqpmtafEhmCII
	IEYsDpV0ahYEcE0qOWTVBqIZBtXgTlkooNckyoJw8e4kimfM9YOKI9IzgpzLKaQczFV6DDsX5gt
	xSSQhdWWCnHqtVsfuYcOPhkCawQXOW2/Gl+decgpQyVbg9YksQ94mg6Xh6BTOHsRfrI482yVGAq
	4dpdgBIOr223TYmfFlyoYFbtRqJW8qquWSv6UGclwT6jW8z2evgrg+gDiQwRNc/dwkeuIZc1weC
	qvDpyjX7TCZd/c55HKqny7eweao9b7E/+MWDK08XTw7rhDsuEXBJqKmths9wek4i
X-Google-Smtp-Source: AGHT+IGOLpw4Ro1gZlLbKLPuJeugBpGxKDyhpAzWxjxf7AIm0WuOoMev7XCdFdyak+Spbs3OpN2AOA==
X-Received: by 2002:a05:600c:4f47:b0:439:9828:c42c with SMTP id 5b1f17b1804b1-439aebc27cfmr188697005e9.23.1740608953906;
        Wed, 26 Feb 2025 14:29:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab37403cfsm55655745e9.1.2025.02.26.14.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:29:13 -0800 (PST)
Date: Wed, 26 Feb 2025 22:29:11 +0000
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
Message-ID: <20250226222911.22cb0c18@pumpkin>
In-Reply-To: <Z7zIBwH4aUA7G9MY@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
	<20250223164217.2139331-3-visitorckw@gmail.com>
	<Z7zIBwH4aUA7G9MY@thinkpad>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_142915_975785_7CEB097E 
X-CRM114-Status: GOOD (  10.01  )
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

On Mon, 24 Feb 2025 14:27:03 -0500
Yury Norov <yury.norov@gmail.com> wrote:
....
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

You really don't want to do that!
gcc makes a right hash of it for x86 (32bit).
See https://www.godbolt.org/z/jG8dv3cvs

You do better using a __v32 after the 64bit xor.

Even the 64bit version is probably sub-optimal (both gcc and clang).
The whole lot ends up being a bit single register dependency chain.
You want to do:
	mov %eax, %edx
	shrl $n, %eax
	xor %edx, %eax
so that the 'mov' and 'shrl' can happen in the same clock
(without relying on the register-register move being optimised out).

I dropped in the arm64 for an example of where the magic shift of 6996
just adds an extra instruction.

	David



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
