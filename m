Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B487CC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Oct 2022 07:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPJi+OX8/Z7UQkybRH3dw3UMw6xY8vL/JpV05K+vZd4=; b=R4F+SguM78l9xS
	cRgucyCBX5jhZjl5apNzK+opIH5ddnp4Bo/u1N3s2KI7y4WtAtDxuKrA4JkwIoPBrud/FKkuqiOdt
	1A2FhgI5NQVXZg2kNnPoMiNv4W/XgRjX1zh6iZaJdMrfr9u5laDS7UjvE1JUouJCzxmGgs4nYqgYf
	MM4JNTAV8dR2OcJ33XkYec8l4QoU205XTMfKuTIhDVFRk2vj/2pKGGFrI3zcIIMsH5m/5xYUWkkeM
	SG+yjxod16c94qXoRW+Z4E7+BuRCCkIlQj20d+pCCFjxD9DfO49v3ZKSsW+WDTv8dceYsXR/Vn4ZR
	Gnw2D19y3dOcH6hEYGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQ0e-00Bi8u-Ru; Thu, 20 Oct 2022 07:30:33 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQ0Z-00Bi2I-S0; Thu, 20 Oct 2022 07:30:29 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id F31755808CC;
	Thu, 20 Oct 2022 03:30:24 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Thu, 20 Oct 2022 03:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1666251024; x=1666258224; bh=wOxLCzcVu+
	q+SEyBn/M4QllQRne63QwVrmt2BoYxq6o=; b=DB0KPjPqIj/nbnYmjgdk0kCApn
	aVNrHAQUjdw5QcGUS9R59jqK3joi2g74adqnI0MmeDADz+cBP8HjR3FjsgxGJszU
	p7fKM+Yv2Fz+EuiBub/9XJaJVi/9TirMoM1DjawknQWEzHchWNPsl6pnKdzdgKgm
	HvgBa7nfN6nWlTRqU05OkOZwHXJo+MwEcGdGgEHDxOMRBuGQISe87t4xOJKUHYra
	sMFrtpuBVPevYu2OkPxDX6bxJZ38fenQBKR+9kX4f+tCmeFFSHIYyDUmpKbjyRUq
	dpKGnV8CZUqRSZ6eN3b8CXbIKEZqyylRN+lsUr65byN/Hk1sl9+IVSko+5QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666251024; x=1666258224; bh=wOxLCzcVu+q+SEyBn/M4QllQRne6
	3QwVrmt2BoYxq6o=; b=URPrxE7B17bixo89Pz9gzBBvqySx2hF97gJCAd+ebL/7
	kcG0y4nvK22Qh9tt4OKq8DtlgClI/rhX96NTFg1Hngkyyq5qF6fXp845XARp65bt
	wEnkduta/m/nuPAEj+loUCHG0sm9CqNdEds3ZxbVU9y4oenFNSi4W6XHHipJHXUO
	irBXEM1d7oo/igL7tNEEJSt2M6tp3/nWO5tN55L05H//4mZp/c56nwyWm2lw0yMH
	MDMzLWwiJHCteWb4eOBQewYJMD1Z4V1vnr7UPgKMlFu3zR2kGeeCreGbh455udxg
	b8Qkvq7qOkGpMcj9NyxDlv4QsnBI1g5eMXza/DX8Dw==
X-ME-Sender: <xms:D_lQYygvGxTjHf-7p5AEBfEoGWLxaoZml1Ghe4k4sIKJh1G29--lKA>
    <xme:D_lQYzAgx2xFpAluHJrk2nStKSKbsAQePERlV5AvGpRiqb-6UzeDpk_st7nzQM51h
    _3f3FcBaIzaVRDRRiM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelhedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:D_lQY6EsVHvuMHlyrYFxtKd2TM17riXA_lB-LOCtNvcYWDk9ECOaeg>
    <xmx:D_lQY7QSPyrIK-Ty_HH4bEYVNvGxu8aLN2uaqM7pbC4r42nxZJu4fA>
    <xmx:D_lQY_xy3DkJac2uBHlBJpxk-Y898n1VkZA_GdhJU7XMutk1vmjRYw>
    <xmx:EPlQY3a_NzkYc7nklI6hLzts8juem--7fDfXf7QbahDBdQSaXaFrdg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 12D00B60086; Thu, 20 Oct 2022 03:30:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <7d9eebc8-39b6-4dc1-9ffc-f17ec584bee2@app.fastmail.com>
In-Reply-To: <m2r0z3h5yr.fsf@sopl295.home>
References: <20221019161831.3864786-1-arnd@kernel.org>
 <m2r0z3h5yr.fsf@sopl295.home>
Date: Thu, 20 Oct 2022 09:30:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Robert Jarzmik" <jarzmik.robert@orange.fr>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 linux-kernel@vger.kernel.org, "Alan Stern" <stern@rowland.harvard.edu>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Damien Le Moal" <damien.lemoal@opensource.wdc.com>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Dominik Brodowski" <linux@dominikbrodowski.net>,
 "Felipe Balbi" <balbi@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Helge Deller" <deller@gmx.de>, perex@perex.cz, jingoohan1@gmail.com,
 "Lee Jones" <lee@kernel.org>, kernel@wantstofly.org, lgirdwood@gmail.com,
 "Linus Walleij" <linus.walleij@linaro.org>, marek.vasut@gmail.com,
 "Mark Brown" <broonie@kernel.org>, mkpetch@internode.on.net,
 "Miquel Raynal" <miquel.raynal@bootlin.com>, lost.distance@yahoo.com,
 philipp.zabel@gmail.com, "Russell King" <linux@armlinux.org.uk>,
 sre@kernel.org, slapin@ossfans.org,
 "Sergey Shtylyov" <s.shtylyov@omp.ru>,
 "Sudip Mukherjee" <sudipm.mukherjee@gmail.com>, tiwai@suse.com,
 "Ulf Hansson" <ulf.hansson@linaro.org>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 linux-pm@vger.kernel.org, linux-ide@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-input@vger.kernel.org, patches@opensource.cirrus.com,
 linux-leds@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 00/30] ARM: pxa: remove all unused boards&drivers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_003028_000126_88E0A8C1 
X-CRM114-Status: GOOD (  21.79  )
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

On Wed, Oct 19, 2022, at 23:13, Robert Jarzmik wrote:
> Arnd Bergmann <arnd@kernel.org> writes:
>
>> From: Arnd Bergmann <arnd@arndb.de>
> ...zip...
>
>> A good number of drivers become impossible to select after this, so
>> each of these also get dropped. I'm including the driver patches in the
>> series here and can either merge them through the soc tree, or they
>> can get picked up by the individual subsystem maintainers. Since both
>> the platform and the drivers get removed, the order should not matter.
> This part is a bit ... bothering.
> I at least identified these :
>>  delete mode 100644 drivers/input/touchscreen/wm9705.c
>>  delete mode 100644 drivers/input/touchscreen/wm9712.c
>>  delete mode 100644 drivers/input/touchscreen/wm9713.c
>>  delete mode 100644 drivers/input/touchscreen/wm97xx-core.c
>>  delete mode 100644 drivers/mfd/wm97xx-core.c
>>  delete mode 100644 sound/ac97/bus.c
>>  delete mode 100644 sound/ac97/codec.c
>>  delete mode 100644 sound/ac97/snd_ac97_compat.c
>
> For the existing platforms working with devicetree support (mioa701 for
> example), the wm9713 was properly used, providing both sound support and input
> touchscreen.
> So was the a97 part, providing a framework to make the wm9713 work.
>
> So I'm wondering how the choice to chop these drivers was done, and it is
> necessary to remove them. If so, maybe pxa support in the kernel should be
> removed all together, as people playing with it loose part of the working DT
> platforms they had.

If the files are used for DT based machines, then they should
definitely stay, the intention of my series was to only remove
known dead code.

What I did was to remove CONFIG_UNUSED_BOARD_FILES and then
recursively trim out all code that could be compiled in
before but not after this change, assuming that this would
be safe.

What I see here is that AC97_BUS_NEW and SND_PXA2XX_SOC_AC97
are selected by eight legacy board files (tosa, e740, e750,
e800, em_x270, palm27x, zylonite and mioa701), but no
DT based machine, so without CONFIG_UNUSED_BOARD_FILES, the
entire AC97_BUS_NEW infrastructure and all drivers depending
on this became dead code.

Unfortunately I ran into problems sending out the rest of the
series after sending the cover letter, so the explanations
I put in the individual patches were not here. See [1] for the
actual series.

Since it looks like I'll have to redo half of the PXA patches
after leaving AC97_BUS_NEW in, I won't post the full version
first.

Any idea where I went wrong here? Did I make a mistake in
following the Kconfig dependencies, or are some parts of this
incorrectly annotated?

     Arnd

[1] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=boardfile-remove&id=73c4b7cfbc2b2

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
