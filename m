Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65704C38142
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 02:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eiu6Hm3gkmanBD+hVFssMyuLCwtfEzQwAVrdjsv4D9w=; b=MU2+jbONC/bymb
	z7ALm7T3YiMozSfozPLXv2z80TzDyMXRe1Qe8o/qa6j7p6vH4Q2KAfVwraTSAv7/Vouo/unBcg14r
	9p9nelYanac4+TBIlXa3WldvgCBspy1trKmsTpqaiMrbPbUwGfZe7NaMQQuXoAGR56Aj898XXAqv6
	FWi/h74hAKTITPa3R0mihZPpxwVF/VjSyS1ZGQZ17vbbtAyBCszYGKs7xMxbrzShpl3NLiBvFZFTH
	pvSJugKwNmgA7s6R/09x7rxmuhv3/M3CK7mcHWc89jeRb8SCaZYoSeGS6m9/xe9dk06rGQCnzMAqo
	KKihNA5RbO/6fYUvPhhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKVVG-005sIC-3I; Wed, 25 Jan 2023 02:27:10 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKVUy-005sGm-Lp; Wed, 25 Jan 2023 02:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1674613551; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E+xYh7aN+WJ50nLCX9IXqoqjQ9BTAICszcUUlzbo8ZFrQVPB1FLxmjmWSbw3/0RPDTeRGr3tTqGTGGh5hyxcTGBBux3c0Xf9yDRfrB2ywPj7spisP1uicSAxQcLTwlDCYoTFrvEzSyMQnT2y1jqDgCtUfcqUKudIJi3M9k21rE0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1674613551; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=DZNmragVOJUhBRPrzQk82ZDl60d/FASqcXxXH6Ke4Xs=; 
	b=O/hxKkBHh0fKGvmvKs76U3+yO4BX/yo48f7DUzETHgEuTlMMt7HjDPJd/VGsERkAHWtHlNYdj01t8zYOjjAiHqUyVhCDCxvSw2pAsnbqmFBJyA+Rp29Jruz7E/LUDjkxpkZ1SRToAlreHWZQMY76ttUNYVywJnx3OzajVc8bRoA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674613551;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:Message-ID:From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:References:MIME-Version:Content-Type:Message-Id:Reply-To;
	bh=DZNmragVOJUhBRPrzQk82ZDl60d/FASqcXxXH6Ke4Xs=;
	b=eXhnYanIn3XCiProGS5/y0A4Vr3Q4TJmfFQ6sqSPD/e9O7Zmq6DWtVg2iAvxJsiX
	cTeTM7Tio/oqM9GZRn9zZtOV8h19hgh3zu28s3wSo8+IcOoejOrKfqtQqhb1D7VnIGI
	HldNV5NPtFwtfvmCK7e/b16ZkeqHUNxvu2DNsW0E=
Received: from lchen-xiaoxin.linux.beauty (221.225.241.248 [221.225.241.248]) by mx.zohomail.com
	with SMTPS id 1674613549411663.1851568467847; Tue, 24 Jan 2023 18:25:49 -0800 (PST)
Date: Wed, 25 Jan 2023 10:24:56 +0800
Message-ID: <87o7qnqrk7.wl-me@linux.beauty>
From: Li Chen <me@linux.beauty>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andreas =?ISO-8859-1?Q?B=F6hler?= <dev@aboehler.at>, Brian Norris
 <briannorris@chromium.org>, Chris Morgan <macromorgan@hotmail.com>,
 Christian Lamparter <chunkeey@gmail.com>, Chuanhong Guo
 <gch981213@gmail.com>, Conor.Dooley <conor.dooley@microchip.com>, Daniel
 Palmer <daniel@0x0f.com>,<devicetree@vger.kernel.org>, Florian Fainelli
 <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Heiko =?ISO-8859-1?Q?St=FCbner?=
 <heiko@sntech.de>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Jean
 Delvare <jdelvare@suse.de>, Jonathan Corbet <corbet@lwn.net>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Liang Yang
 <liang.yang@amlogic.com>, Li Chen <lchen@ambarella.org>, Linus Walleij
 <linus.walleij@linaro.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, lkml
 <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Rafael J . Wysocki <rafael@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>,
 Rickard x Andersson <rickaran@axis.com>, Rob Herring <robh@kernel.org>,
 Roger Quadros <rogerq@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Shawn Guo <shawnguo@kernel.org>, Sven Peter <sven@svenpeter.dev>, Yinbo Zhu
 <zhuyinbo@loongson.cn>
Subject: Re: [PATCH 00/15] Ambarella S6LM SoC bring-up
In-Reply-To: <a69a5ffc-0820-4adc-9ac4-f827ebf66cf0@app.fastmail.com>
References: <20230123073305.149940-1-lchen@ambarella.com>
	<a69a5ffc-0820-4adc-9ac4-f827ebf66cf0@app.fastmail.com>
	<PH7PR19MB55620816EAF7DB2CA3484EFBA0C99@PH7PR19MB5562.namprd19.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/28.2 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_182652_767489_709F40D4 
X-CRM114-Status: GOOD (  22.18  )
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


Hi Arnd,

I've been on vacation recently (January 17-January 31), so please forgive me if I'm sometimes late in responding.

My outlook email (lchen@ambarella) is not suitable for replying on lkml, so I use my personal email.
Please reply to my personal email (me@linux.beauty) instead of my outlook email, thanks in advance.

> From: Arnd Bergmann <arnd@arndb.de>
> Sent: Monday, January 23, 2023 4:39 PM
> On Mon, Jan 23, 2023, at 08:32, Li Chen wrote:
> > This series brings up initial support for the Ambarella S6LM
> > SoC.
> >
> > The following features are supported in this initial port:
> >
> > - UART with console support
> > - Pinctrl with GPIO controller
> > - Nand flash controller
> > - Devicetree
>
> I seem to only have part of the series, please add both me and
> the linux-arm-kernel mailing list to each part of the initial
> submission.
>
> It's possible that some patches were already Cc'd to
> linux-arm-kernel but did not make it through because the Cc list
> was too long (it has to fit within 1024 characters for many lists).
> I think you too the Cc list from get_maintainers.pl, but when
> sending new drivers this does not work well because it picks
> up everyone that recently touched the Makefile/Kconfig.

Sorry for inconvenience caused, I will double check since v2, thanks for
your kindness.

Regards,
Li

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
