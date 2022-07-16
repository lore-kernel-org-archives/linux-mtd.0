Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30E0C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Jul 2022 02:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Tc4RxzXJcaoQ3aMWp/d52mnbMLjwn4I22vSXAvGx3F4=; b=QAvJOsS/pPT3mzCSwvaSMRIzH8
	WAV94+8YXoqU62gSB30lnbrte4SwcK7NZUSLmByfW+gm9fBTzDwm0PCa0zBmW1NqDw72nsqRLaOzi
	SwdTPdUFjWXYb+Rku2mskGJx1wTPTWoK9Xi4dbD3Hr9Nh3WqUPYbyTcVmlD5xUPoU4CbDiEuNkN+N
	JaT7TR/s5Qwr9CWLoOcnmlsVpToeohR3G9YTYcnDlhU58TP+ByLyWB2XgYS3xBvi9wXQmelcjFXnm
	Fq8VIy4+0HCBgjjwONJmcN4Ky8Zv4vbS16buC5avnVZ5MhmCgLqwTV+CAkj3LGGbFBoB1FvS7UOm1
	tmc3NZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCXYQ-00Bx8j-50; Sat, 16 Jul 2022 02:29:14 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCXYE-00Bx5L-UM; Sat, 16 Jul 2022 02:29:04 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id B01533200893;
	Fri, 15 Jul 2022 22:29:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 15 Jul 2022 22:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1657938540; x=
	1658024940; bh=5TcXxbyuLJbPJBG8uv34cCNJbJo0NJdkOGPzeyKQiYw=; b=r
	+fb9ajCFr5QtYpA/WV8H32XXHLOtFddXvDeHis5Z8rE5Cun4FaCZfuC9MfSXSwAp
	XacFanIVxR9PtV68QNrS1XMP1glnxSjrKy1HkdIG3a+fssPZPda3PaKgbU2ZqgAt
	yQKZnsMFdMQlaHteuEIXpCUO4zERwKc/TPn2hP+FPJPFQTGYURNE9gB3CObWRPi2
	t380YSwc0ot+UFfC22ooOUZ6zoZy2XuMVnokTHlInH4iuvPapSh6nbNovmjxJPNo
	G7Cf+1c0NDFObDtGXIwLGpr8hohxPTwGhlt8Jx9d3VY29T5dPYxN8gTUdzmoCTQN
	XsGq2nSpCQX5508NnC0Sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657938540; x=
	1658024940; bh=5TcXxbyuLJbPJBG8uv34cCNJbJo0NJdkOGPzeyKQiYw=; b=n
	KTZtcHb5lNlVFNGHpesYSTly5C1sa9PHvz6ghX4eajorA+X3XbaVE92Sqm7Z4dcm
	f1jsxa0NL1hM9UvHsW7xmoe011wW4um/LdrzafunsrztuXdaQnU+QwMBJuphqy3p
	a6m65lWuW8kahQYdCju/A+X6mvbbyzD7zIih5ESV2LGpaiVdZNCkrpK/51sQQwF7
	aGxnuSKXX+fMcCiyKibLBr21kJ8zJCAwuejugQk1w0K0631x5bDPpEtMAxvxAbiK
	WtfwHCg9YIN30at8Rk0rZs56YERX1frDM8AvJryTHHd8OC0/m4O0FSzBJQ/kx/fU
	imY/ZjHzXruH+A+KpPrIg==
X-ME-Sender: <xms:aiLSYomFxKVDMfCf-KxIn2b32nH8RGlTHBevVbiiT7JEqo79bXFepw>
    <xme:aiLSYn0N6FR_m2YCogj2i0xujs1-UJijwaHAWkGpWFYBK1BEZz5zXKXHJATCBi9Su
    lROc-vpwvuXEO8Bsg>
X-ME-Received: <xmr:aiLSYmpkiG-gbbq9bIcXwdCHGpODZTEVKyT-NLxwDaHA-zkBvrASZI5QZTZOH0rXZunOb-CpfrAj9r8c6wc_gX4918F6CtPwI7dyVEglRgBOAL3Of5OJrxh0UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekvddgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpefftdevkedvgeekueeutefgteffieelvedukeeuhfehledvhfei
    tdehudfhudehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:aiLSYklp5cmQDFmLm67Xbu_kjrDsDFq4ZXP4EFKINVImGkbzwF_6Fw>
    <xmx:aiLSYm0u1axRJvnJXmLRtOxCTuGPm4uNpzYJ8Oa1vJR8xk85ukufNA>
    <xmx:aiLSYrtO3fEjM-B4OuaMg4DIIvKoQFfjT2Yhcx--kDEEXJH20UuyYA>
    <xmx:bCLSYh3DF_b_Et7fJyZ1rCiCYNyjH9ka1lnqpL4oaHNh5ooXoM2v2w>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 22:28:58 -0400 (EDT)
Subject: Re: [PATCH 1/2] mtd: spi-nor: When a flash memory is missing do not
 report an error
To: Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
Cc: Michael Walle <michael@walle.cc>, linux-sunxi@lists.linux.dev,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
 <d8de86aa0331be697fbef33d5ab2c57a@walle.cc>
 <20220714205529.GE17705@kitsune.suse.cz>
 <33abf7b84860049c4a22605578303ff2@walle.cc>
 <20220714220744.GF17705@kitsune.suse.cz>
 <20220715132006.077c90f8@donnerap.cambridge.arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <2d4f200c-1ce3-19c6-179f-8d8e0545adfe@sholland.org>
Date: Fri, 15 Jul 2022 21:28:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220715132006.077c90f8@donnerap.cambridge.arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_192903_060909_58424F14 
X-CRM114-Status: GOOD (  23.57  )
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

On 7/15/22 7:20 AM, Andre Przywara wrote:
>>>> However, when the board is designed for a specific kind of device which
>>>> is not always present, and the kernel can detect the device, it is
>>>> perfectly fine to describe it.
>>>>
>>>> The alternative is to not use the device at all, even when present,
>>>> which is kind of useless.  
>>>
>>> Or let the bootloader update your device tree and disable the device
>>> if it's not there?  
> 
> Yes, this is what I was suggesting already: U-Boot can do the job, because
> a U-Boot build is device specific, and we can take certain risks that the
> generic and single-image kernel wants to avoid.
> In this case we know that there is a SPI flash footprint, and it does no
> harm in trying to check on CS0. So I was thinking about introducing a
> U-Boot Kconfig variable to probe for and potentially disable the SPI flash
> DT node. We would set this variable in defconfigs of boards with optional
> SPI flash.

To support the "does no harm" assertion: the Allwinner Boot ROM will probe for
NOR flash (and possibly SPI NAND) on SPI0 + CS0 if no bootable MMC device is
found. So the board designer must already assume that JEDEC Read ID commands
will be sent over that bus.

>> But then it must be in the device tree?
> 
> However this indeed means that the SPI flash DT node must be in and enabled
> in the DT, because we (try hard to) only use original Linux DT files, and
> DTs must have been reviewed through the kernel ML first. The U-Boot driver
> relies on the DT as well, so the official kernel DT copy would need to come
> with that node enabled. Ideally U-Boot would disable it, if needed, and
> the kernel error message would never appear.

I don't think this works for newer SoCs where the Boot ROM supports both NOR and
SPI NAND. If the board is sold with the flash chip unpopulated, the user could
install either kind of chip. So we cannot statically assume which binding will
be used. We would need to add a node with the right compatible string after
probing for both in the bootloader.

Regards,
Samuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
