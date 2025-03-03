Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11642C282D1
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Mar 2025 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzZP7l37LKtsbU81Zp0MUm98vA0vhYDmTkme3+Jmu8E=; b=zeDVbNyo3xkvb2
	PyZiSVaFq1KFZNpnxIp2WxhSzsKMJvSoaphab6CMC0fqrViSlUjUgL7BYlXc4gHgCLVByeJXLgSZa
	3KO4pkZ+9dEcQJrJ5b23TkQdrIXZdkXpeFPa48Non/fv02guU/sBhLZKC+Pj+rc5xs46JKbXlCcSE
	ftL1koZMgB59efQ19dMZ86GmWnhRNRRHPr7lPOn2L63kk9wJTKPaxnimRixU8im2ffTzEhAIZuyvF
	fUhqkPI5xhL/YWDWFLJcKhUTTyWATXA1P839DChyux+LJEeeArAesDfr2BLSQlrcA3+FGBucFGJOK
	8SUb3HLMLYaLz1ENI7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8JI-00000001Qwk-3fKx;
	Mon, 03 Mar 2025 16:06:28 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7fX-00000001J02-44Eg
	for linux-mtd@lists.infradead.org;
	Mon, 03 Mar 2025 15:25:25 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e60b81c29c5so1981112276.1
        for <linux-mtd@lists.infradead.org>; Mon, 03 Mar 2025 07:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015522; x=1741620322; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PCKvwZ5J/h+SCwpYc01AHUjT/aP2XxgC1fqBQTrA6YI=;
        b=DnL9nKTp0yrTCG6uEw2QpHxwX8de/uA+nu25TldeIh/mw8aC5dieL2sP9j78osTCYi
         WLjs+M80slZK06Q6R2OTUvUrIHRH6rhHpr0BA20sL9/j9TSK4v1ex/K6kyBXXwUw8Ggz
         sZuaMdPeArdOfukaLKNIA8YsxXQuUdbjJ3kcefJ70Abz7aA8KxrPRW76Eh3shAX4ZzVw
         39NNT8Z2iDt1WNOJ1MrKk4qNowfyYUAJpV68uISYsNP+HpBkoPgfSaUO0t6O26zcD39H
         1foUO2OvDKpFjmjeT1fujKwks1NkGXMWeeMBQlQ8PzwGid144VkO7HxyrlaqrgEkvShW
         r3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015522; x=1741620322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCKvwZ5J/h+SCwpYc01AHUjT/aP2XxgC1fqBQTrA6YI=;
        b=DG2Qpf+BWk7sjMPMf/heB1nzXztPca4nuj+tVVC/bh9x3qhcwI9sk8tFjMz/RzjnJd
         mYdlyL05dRC4k3kn13mkCCbG6f5iL3AXjoroU32OfaBkA84KLSx1n+8emOQIRYThHUxF
         X6NTThIAM2vGf0+WYr8/nVsHfGOmSolEVrNMPNq1aacM9a2KOrtcrrwaGRmlDx6FO8AH
         SVT7yPGz2SAAzTqNexzFyt1aHI3+lazOxuuKHIjmsJrvWB/xGTW0CAGOWkYxujsiprAr
         KP6zIDqpO0OmJ2VoDF/o+rab3WM30oEDQZAFaePhVGCe3s6RiRLHspeJd2w1H99POO5C
         VsLA==
X-Forwarded-Encrypted: i=1; AJvYcCXZsxnPhjoCj3GAzD4CJqX3jcunW9r/fK2xX+R1la6q3Pkze2jKv+H1MIjVMZAnMHMYg0DlkM1dCGY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZsHCYXmvs7wWQL5JuJPe2a23dQ5w1yvnTJQco4iYvlYcmyfLE
	IU92f2SyYexYw+fvSITu7pCjKVfoT9Ha5ZS5w/wMkXkA5gLo0XGM
X-Gm-Gg: ASbGnculLlLXGD2LiLpQt67CPYDwENa9utugjieLA8drMiUgSD6JCyPQ/XnnZFkrt7N
	UI+557Y8j/A5k8j1ShkYeEwfj9BAZtwjZzIcldyACNFthDPP3DKs0yRqRMEjMPoP4AUL2VMxqFq
	faJ2bPOwyVqjGf8SEECdmHB3OuKjZkSsdsjSMcAz4pIwaXsI/aWr5IfE5gT3m+Q7xOUxPuMVQvr
	Rpjnd+RuTcJq9+FrSvQPF1qRHcyvLjGj+ENFI1LxOjxwaztf/nylDLiUhreQw4O9uxZSYH1CHkh
	yDt1mY9E6bdEOrKdnAUf+nVQhfEXrL3rcVoIpVpM4QwcmIO6CLIIyB3jxNOiKZBg1RYg7uf+uPI
	feMcU
X-Google-Smtp-Source: AGHT+IHSscIa3DfqfeKZ+gYLGMqXfo4aPZUveIfgdEWZZaokGaxFBKrjGL5p4Mklbl9y612Oe7mv4g==
X-Received: by 2002:a05:6902:2006:b0:e58:2a5:241a with SMTP id 3f1490d57ef6-e60b2377d4dmr14240074276.9.1741015522418;
        Mon, 03 Mar 2025 07:25:22 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e60a3aafebcsm3002012276.51.2025.03.03.07.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:25:21 -0800 (PST)
Date: Mon, 3 Mar 2025 10:25:21 -0500
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
	andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <Z8XJ4XCByXOx4ZwY@thinkpad>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
 <Z8SBBM_81wyHfvC0@thinkpad>
 <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
 <20250302190954.2d7e068f@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250302190954.2d7e068f@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072524_011333_138DCFAB 
X-CRM114-Status: GOOD (  15.37  )
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

On Sun, Mar 02, 2025 at 07:09:54PM +0000, David Laight wrote:
> > #define parity(val)					\
> > ({							\
> > 	__auto_type __v = (val);			\
> > 	bool __ret;					\
> > 	switch (BITS_PER_TYPE(val)) {			\
> > 	case 64:					\
> > 		__v ^= __v >> 16 >> 16;			\
> > 		fallthrough;				\
> > 	case 32:					\
> > 		__v ^= __v >> 16;			\
> > 		fallthrough;				\
> > 	case 16:					\
> > 		__v ^= __v >> 8;			\
> > 		fallthrough;				\
> > 	case 8:						\
> > 		__v ^= __v >> 4;			\
> > 		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > 		break;					\
> > 	default:					\
> > 		BUILD_BUG();				\
> > 	}						\
> > 	__ret;						\
> > })
> 
> I'm seeing double-register shifts for 64bit values on 32bit systems.
> And gcc is doing 64bit double-register maths all the way down.

If you don't like GCC code generation why don't you discuss it in GCC
maillist?
 
> That is fixed by changing the top of the define to
> #define parity(val)					\
> ({							\
> 	unsigned int __v = (val);			\
> 	bool __ret;					\
> 	switch (BITS_PER_TYPE(val)) {			\
> 	case 64:					\
> 		__v ^= val >> 16 >> 16;			\
> 		fallthrough;				\
> 
> But it's need changing to only expand 'val' once.
> Perhaps:
> 	auto_type _val = (val);
> 	u32 __ret = val;
> and (mostly) s/__v/__ret/g

You suggest another complication to mitigate a problem that most
likely doesn't exist. I looked through the series and found that
parity64() is used for I2C, joystick and a netronome ethernet card.

For I2C and joystick performance is definitely not a problem. For
ethernet - maybe. But I feel like you didn't compile that driver
for any 32-bit arch, and didn't test with a real hardware. So your
concern is a pure speculation.

NAK.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
