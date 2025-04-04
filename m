Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FCFC36010
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Apr 2025 08:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgLOZpR8qeYHWk2GPRa9+CLyqwR+lmdrw8+QprfrcM0=; b=dYGtez0gI3y48a
	uERc4AUSgJhx2njVKVR1xdUND8jYkGLGjeWhGh5yZ4GDL3p9rUhmfdvTWYMdkbUMPHS7HOh7ve/L7
	9Bk3PwIj1QgzJiHvOFR5MGll5WaP1n56dPAKcXKincXyE99d8YWr/z0iCDdWpJyM75h/gWRWw7nR4
	Dcm/+azRUZe0tTfnoEU63MQWjS4PA5qn+L6WsosDkzX3eRAdCgZDjnBRSgVrxWoDg7A1V6l+rwKjO
	WeWDWQ2CdPwRM/ong4y29b0e8Cr2pSk3y2kJ4IX5Pc9y0Ir/fmzmVDtt1jAKdcv1zWpRMN+mBUncK
	yPFQrDKg/hUiNvRNpUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0chO-0000000BBXN-3J5L;
	Fri, 04 Apr 2025 08:46:50 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0chM-0000000BBVk-1S0v
	for linux-mtd@lists.infradead.org;
	Fri, 04 Apr 2025 08:46:49 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736b34a71a1so2193331b3a.0
        for <linux-mtd@lists.infradead.org>; Fri, 04 Apr 2025 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743756407; x=1744361207; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XEr/lesTAhWcQcf7iA9OshZymqi1lesrw8RKfhNHVDw=;
        b=InYIC4atuyBdDbiD1qvS0CAK/SSmSWkovT/IRyQocX5uvfz5OJZe3RHwC3DgxCSr4u
         OCJUafcn7+ieySF50OuyZnw7m2Ae0Ttxq/j0MeWEnYgAOgFI0o52LML7sMj30T4Wo1pg
         DfzBWZLx4YH+WDVTIDFYVzEfR4mXgo4PJzI5bfRzXgs7et2z2g8Xv3YLGp589IoHY2QB
         ++op/E1Vxp43t7DFBOSKo4gMqaFpzCLffJTq6z4PLgG8IsCum9JznUQzQODHbb7zApKW
         x0siWhCK0/dYImjM8fAJIGuIynSGG2q0LMR0d55GEAxB75I/G6wl4Or6kAaipEslFHsP
         OqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743756407; x=1744361207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEr/lesTAhWcQcf7iA9OshZymqi1lesrw8RKfhNHVDw=;
        b=gFTkJXUeNzh+AziO0do+iZRbOp22dbRBHsMD+NAYIy6+2iA+j6Wxv5JQivM8AfUCpU
         Z4zYhDWvVZGfeoZGoPiPBvLSv6xNvRZu51jPA17Mp8L8VToOKSa+B5EG2VGWTcbUlNTD
         Xrunk3iD67Kkt3zC9X8NMbLhPM9Y7M/YqEjlMbtdH/CRGpr2p2ao7ZJU9tKC+t5btAtq
         srRItKbiNJRgoo2Jh9pUlwub1Ls++eGpBAFyrXF9IVKVue2F6CsT+5W8Gi/x39luAGI6
         4udJ7vKSZloBBq1KVg5ss/zWblB7/KXJJGZY/BIk5Nh+GyhwyRm1aoqnB+Hc14pBiadx
         FPdw==
X-Forwarded-Encrypted: i=1; AJvYcCUo0vYGZ7J2TAmob5TkRZZ4woaBoayO1nI1QkfQcESUjZaVqLX2lDh3mztl4MHlEeTnNztk/3+nK8I=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeHPVsUZBIecLCO56ezlsR9ndfbeNTpcWb4E+NR00oGlKVw8hP
	7J4nIHVjjZmOaNWM0lXHRfPCn75bged67I15PAKHWDBeIUxXvlTB
X-Gm-Gg: ASbGnct4xp2N75yjpiaQPyfXbLMY8oi5RdH89XhAnKmupk7keCEs9M8UdMVVDWBlNl3
	+i4bi9/rsfNnmiU9/bf11joWDX4PegLSyM/h7ws2yEbR8zw/fTPp/krplWHoIyzCFLq2mWIjxHE
	Un94rdlN6NJpnYo0RXP4QVWGS6Ks8B3loTjVAziNtknMUpHNt1Awxo+TZ/ZTWo+17oj7m8Hg1xK
	kFR6Mg7BsLlm4xp4KxCBzMDjjiuwnX/vSRWwhoiMsIBbiwlaqVJTlLaKVdkvxcvRzMwp0OduNA5
	7WFEQbLHtNtso/ilrGCB3XP0Ph79IE2KWmZ1le3muqyw1o0Qn0XAyFdqRae38Q/FQSvSC8gm
X-Google-Smtp-Source: AGHT+IGnBuGwhOqlkhsoqT0zhJln64liGpkRA7l3PCCq0BqnYRQF3lpkwuYz5g4xSoDa+vLjvXq3Yw==
X-Received: by 2002:a05:6a21:483:b0:1fe:61a4:71d8 with SMTP id adf61e73a8af0-20104666844mr3980332637.22.1743756407334;
        Fri, 04 Apr 2025 01:46:47 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc34ec32sm2448099a12.35.2025.04.04.01.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:46:46 -0700 (PDT)
Date: Fri, 4 Apr 2025 16:46:37 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Yury Norov <yury.norov@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
	David Laight <david.laight.linux@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
	akpm@linux-foundation.org, alistair@popple.id.au,
	andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
	arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
	bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
	davem@davemloft.net, dmitry.torokhov@gmail.com,
	dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
	edumazet@google.com, eleanor15x@gmail.com,
	gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
	jernej.skrabec@gmail.com, jirislaby@kernel.org, joel@jms.id.au,
	johannes@sipsolutions.net, jonas@kwiboo.se, jserv@ccns.ncku.edu.tw,
	kuba@kernel.org, linux-fsi@lists.ozlabs.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux@rasmusvillemoes.dk, louis.peens@corigine.com,
	maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
	mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
	neil.armstrong@linaro.org, netdev@vger.kernel.org,
	oss-drivers@corigine.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, rfoss@kernel.org,
	richard@nod.at, simona@ffwll.ch, tglx@linutronix.de,
	tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z++cbTTp8leOJ5O+@visitorckw-System-Product-Name>
References: <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
 <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
 <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
 <Z-6zzP2O-Q7zvTLt@thinkpad>
 <3ebd280e6697790da55f88a5e9e87b4cab407253.camel@ozlabs.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ebd280e6697790da55f88a5e9e87b4cab407253.camel@ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_014648_384531_E798CC8D 
X-CRM114-Status: GOOD (  15.38  )
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

Hi Jeremy,

On Fri, Apr 04, 2025 at 10:51:55AM +0800, Jeremy Kerr wrote:
> Hi Yuri & Kuan-Wei:
> 
> > Thank you for sharing your opinion on this fixed parity(). Your
> > arguments may or may not be important, depending on what existing
> > users actually need. Unfortunately, Kuan-Wei didn't collect
> > performance numbers and opinions from those proposed users.
> 
> For the fsi-i2c side: this isn't a performance-critical path, and any
> reasonable common approach would likely perform better that the current
> per-bit implementation.
> 
> Our common targets for this driver would be arm and powerpc64le. In case
> it's useful as a reference, using the kernel compilers I have to hand, a
> __builtin_parity() is a library call on the former, and a two-instruction
> sequence for the latter.
> 
Thanks for your feedback.

IIUC, from the fsi-i2c perspective, parity efficiency isn't a major
concern, but you still prefer optimizing with methods like
__builtin_parity(). I'm just unsure if this aligns with Yury's point
about needing "evidence that performance and/or code generation is
important here."

Regards,
Kuna-Wei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
