Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67D4C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Oct 2022 07:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbA1LPzMIGtWnXjbuYfSrFk7ulyrlY2HwCDREqxyH9Q=; b=YcUFVlU7Py+M3U
	+0Eh0W1oAMvE4lm3uQp/VMQ09ROaB8xSoF6xJAqxdxS5vH5WzhM292FgGryszqZ658wMg2CsWKlos
	HJ5IgyVP0op5c8QxHRnyPBNZlkRkO1cINGCQXnXA2wDxz0zanPwpuSbJ76/Wy8ERFvBq0e+QQF9gG
	v3+n1y5kQ2ZJDj8DjukhcqRoXv0M+ozzzGpItr9VKZ03vt/4RHuAdBlKTS/3LC3T8XyBjHdbqt260
	HjmKhYehvFVKSUbj1H2+62doJotck4etM2CdinQ3ORyWb9lNlWDgrVbBDdqBJqlUzCqcxiPI1ZPXb
	8oFszruLnCSXsFEEBNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQ2f-00BluU-JI; Thu, 20 Oct 2022 07:32:37 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQ2b-00BlsU-PT; Thu, 20 Oct 2022 07:32:35 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 0537D5808D2;
	Thu, 20 Oct 2022 03:32:33 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Thu, 20 Oct 2022 03:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1666251153; x=1666258353; bh=AV6tDFUKMO
	pEg3MRX4qWR5oX2aLW/thhAYpb2YqHogo=; b=LwBqYSaIPzEagD5t3VSAH3u8bC
	GOMlXQATN5NPYHGJFRyMCdNJ3bJrRoKDlIzXqSLAARVo0XAiVZTrHleEnER1/EDH
	OInqpIPnbivBMmUN75vwdEn9cJboi5Z1O0GhbXJY/ZQ/AgfgtfeH98a9YCaXXDYz
	k0SlfSZwM7sIY1aSnSr9dZPZh2dyWqatx9j5fwh45959VUD1CCocyiAi5SXGLGn6
	QBmIQDxJx+1LTanOxN+487ZkZiX0gzMPK41B611svX/zdsgtyx8zryp+roi8z+Y6
	kAQoRkW+9j6/JT1CxWRbc0eHDwYnWe6Fa3huhOGTL3J91VnneBSZorDOHVfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666251153; x=1666258353; bh=AV6tDFUKMOpEg3MRX4qWR5oX2aLW
	/thhAYpb2YqHogo=; b=VL3hwyWdbYa9ajHTB8LAad0OFgZoCydHOUKD/q/nRXJM
	La7526Kuk9mhD81n+xvH2WUzAZfB2SNlsZKeLEPdLFJs3TLYaqAMOT1uKOoVfH8K
	L/HAgMaXz62AxNzj/wJ1JD4ITtXCJqDUEoYhL3kqSK1x4fNPxL47VxhKZdBO1nbz
	t4qEhqH/42Yltf+1hlvgrpsM1De+bD6uXlxU+we4F2UAjUqesFo+HZEM9ATayU/a
	TJc30PBOmgy5fwrN/CIwfsx6z6tOnT57f6IEqy+m4Bc5fq6OEnpF4RLUw1Q84JKd
	1C1+a4x0f0dPk+sQn6oRcfGiFlKGMYMpk9Zn2xW02Q==
X-ME-Sender: <xms:kPlQY0COucP_JBuc3VO6ui00Aeod_vY6KX2eD5gQI9Yr1DkWG3a5mA>
    <xme:kPlQY2gtxfaxEF8E0nupOggf72VxqawQyxSR0L9pyZ_JV7qHtQn9M6vY36KXi61ZM
    KbMyjKA1pB-2a_oUQE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelhedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:kPlQY3kdADxAHh0mg9ZEyeDNoL9T7Br6cBC9Vw3B4UkHhpWz-Qje1w>
    <xmx:kPlQY6yu9gT9-n3kSmZ9BE9kk2TNEm3ealNf0llEEScW5_OS2XXJJg>
    <xmx:kPlQY5SryijVrEYyekFDxeVLDfbY5orH6ssBHORZUU5jX_BrZwLJSg>
    <xmx:kflQY6413sE1AInazuTgiKzob_WzdVkTnkNVvnojS32tD5OKxwgvSQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6001BB60086; Thu, 20 Oct 2022 03:32:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <c7366f60-aef0-463f-9bba-f14680d820ac@app.fastmail.com>
In-Reply-To: <Y1D08tpbdE52x7hN@google.com>
References: <20221019161831.3864786-1-arnd@kernel.org>
 <Y1D08tpbdE52x7hN@google.com>
Date: Thu, 20 Oct 2022 09:32:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>, linux-kernel@vger.kernel.org,
 "Alan Stern" <stern@rowland.harvard.edu>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Damien Le Moal" <damien.lemoal@opensource.wdc.com>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Dominik Brodowski" <linux@dominikbrodowski.net>,
 "Felipe Balbi" <balbi@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Helge Deller" <deller@gmx.de>, perex@perex.cz, jingoohan1@gmail.com,
 kernel@wantstofly.org, lgirdwood@gmail.com,
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
X-CRM114-CacheID: sfid-20221020_003233_929035_C654D8D4 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

On Thu, Oct 20, 2022, at 09:12, Lee Jones wrote:
> On Wed, 19 Oct 2022, Arnd Bergmann wrote:
>
> Are you sure these went out?
>
> They do not appear to be in my inbox, nor lore.

You are right, I was interrupted after sending out the
cover letter and didn't manage to finish sending the rest.

Since Robert Jarzmik already found a problem with the
series overall, I'll continue sending the other (mmp, sa1100,
s3c, omap2) patch sets for now and get back to PXA after
we've worked out the issue with the ac97 infrastructure.

    Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
