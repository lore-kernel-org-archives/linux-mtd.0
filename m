Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA21C05027
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 08:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yd9hwrmprS+xq7Jom86DbaQ/nD5SO9HbeAUqzE4Qdo=; b=AJY7fcNHu0fxen
	y+t7YSIqH0b4/qoXvTPrnZy0bqmsI1vZR3q+GGq6NkvLGTOWOFTdwPdKZj1otR+t8JqgQ9j4EmYNu
	ViTYrPHB43KCmkNv5DcokOg6FzqN1/lfvhuq8Ap2sLMlYtxs/SElgU+iX02G5JdWI8Szqsb5+PqJM
	dWq587oxRaTjF/HTehuEyurc/ROtHbELOhapszEpEKqU6QfAv/zjfsXAHu8mzhEXK3yrTZOzHU/bK
	fS9fmZdxQy+4aROeUDU3D53QU4ddAcW0yVHdL36L9i7vGDgElItH2J7LoYtTqOoxN6YiZaMv0rBml
	ZARyKVqauQNpFkw9vWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsND-00GO4F-B3; Mon, 23 Jan 2023 08:40:15 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsN0-00GNz9-Vv; Mon, 23 Jan 2023 08:40:04 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id F39765C00CD;
	Mon, 23 Jan 2023 03:40:01 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 23 Jan 2023 03:40:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674463201; x=1674549601; bh=w/xnBpY6hf
	cSJp7QsVobDnUei84Cu91kfG5Ty8mZVFk=; b=pYnvhcLmN8HvMMcp4+fmBdl0lO
	oZgrYlh4LAYA7ed0PDdouTryoJ3zzaBXossuzem6QeiJiskglPTxZjrCQQJMLtVv
	+RX1WCOfAq0VtwsQ2jbJ+3s/pd6wlwqKr6xWwNRzPo6zuHO4LZd6mp/AUQ4kgnfX
	QLpEbNe10D72PL1JJpO8KmMV/v3FSktvlRicW1gJT5QBwivjInWWXC0kSqVqiwiU
	h3VqTSAm5KjUKiyxcj5E2/fq7xcGo4hSttFaei3BpOHP/VnFVfbZo9qrqKVMux1a
	e7Bh4aRw0BUTvFJTovXvDqOhDe3t3xv5/WQqmPnMoDrmcu+D6LN0MtsjSb5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674463201; x=1674549601; bh=w/xnBpY6hfcSJp7QsVobDnUei84C
	u91kfG5Ty8mZVFk=; b=j9mjnf21Vz/iIhzR9VMDfOIM5XcpVcqxRzqtzw00sjq1
	4Cs6xzzTbSj3ltZCDBkNoV0lInqeXzN/hRdLbu2JrAhY5seMU6HEBWAsGmNZ/2sj
	Y4LzkC3v58ZsXeBSmRksFGtmLv6kLO3l1oubTEm67PaDvbu1zokH8LcWdfn1iqk2
	ldGXpxee5GvOCVxIlYxGe3EC7ycrPGP9FLym+OlwfCJwBGaJ0lnMJeclCgcG48P2
	/3Juzc6j43gjWMENoYdsZI4GDaBI5gPpx6n/a1k1NdvNE5tkYEAU2tANLAMs54Yx
	beKxrFW2c9ixIEq0gECuGVQ5VQzGMr5PTt6cBamDlg==
X-ME-Sender: <xms:4EfOY6vpTDlhmMjSriH5ttsPa5qTSBcPgi6f66LsCrn1yKJ-kUKXjQ>
    <xme:4EfOY_c7SXsGLPk2732pBYYqo5KtkLpKkx6hNUe56AfMFyOnocDShrOz3JDYhcwsD
    QaNTqPfehJrjAWVCLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddujedguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:4EfOY1zKIrt6HgC3WlCgi1VoLkspNUJwKtTCZ2JbADae91lS3z6cLA>
    <xmx:4EfOY1M9Uon-7Q3owh33nDPgVUvsW5JHhfYxbMoCqItEhaYZgJ1P6g>
    <xmx:4EfOY69y5BmZLndAqUH-hZLYDhwo9QVHsuf2M00GsMrFfH-g1spOLQ>
    <xmx:4UfOY49RJKSBbJhvhLTS5tzhjisCJi22pJdjgaXc05fhaTwQpRc9JQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5FCCCB60086; Mon, 23 Jan 2023 03:40:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <a69a5ffc-0820-4adc-9ac4-f827ebf66cf0@app.fastmail.com>
In-Reply-To: <20230123073305.149940-1-lchen@ambarella.com>
References: <20230123073305.149940-1-lchen@ambarella.com>
Date: Mon, 23 Jan 2023 09:39:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Li Chen" <lchen@ambarella.com>
Cc: =?UTF-8?Q?Andreas_B=C3=B6hler?= <dev@aboehler.at>,
 "Brian Norris" <briannorris@chromium.org>,
 "Chris Morgan" <macromorgan@hotmail.com>,
 "Christian Lamparter" <chunkeey@gmail.com>,
 "Chuanhong Guo" <gch981213@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Daniel Palmer" <daniel@0x0f.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "Florian Fainelli" <f.fainelli@gmail.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Guenter Roeck" <linux@roeck-us.net>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Hitomi Hasegawa" <hasegawa-hitomi@fujitsu.com>,
 "Jean Delvare" <jdelvare@suse.de>, "Jonathan Corbet" <corbet@lwn.net>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Liang Yang" <liang.yang@amlogic.com>, "Li Chen" <lchen@ambarella.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list" <linux-kernel@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY DEVICES (MTD)"
 <linux-mtd@lists.infradead.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Richard Weinberger" <richard@nod.at>,
 "Rickard x Andersson" <rickaran@axis.com>,
 "Rob Herring" <robh@kernel.org>, "Roger Quadros" <rogerq@kernel.org>,
 "Samuel Holland" <samuel@sholland.org>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sven Peter" <sven@svenpeter.dev>,
 "Yinbo Zhu" <zhuyinbo@loongson.cn>
Subject: Re: [PATCH 00/15] Ambarella S6LM SoC bring-up
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_004003_141123_9A772B85 
X-CRM114-Status: GOOD (  10.38  )
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

On Mon, Jan 23, 2023, at 08:32, Li Chen wrote:
> This series brings up initial support for the Ambarella S6LM
> SoC.
>
> The following features are supported in this initial port:
>
> - UART with console support
> - Pinctrl with GPIO controller
> - Nand flash controller
> - Devicetree

I seem to only have part of the series, please add both me and
the linux-arm-kernel mailing list to each part of the initial
submission.

It's possible that some patches were already Cc'd to
linux-arm-kernel but did not make it through because the Cc list
was too long (it has to fit within 1024 characters for many lists).
I think you too the Cc list from get_maintainers.pl, but when
sending new drivers this does not work well because it picks
up everyone that recently touched the Makefile/Kconfig.

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
