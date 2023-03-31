Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA4AC6FD18
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZei9KEFGK35hE49agxCVd7P0sXkoEKA/1CJOO1XF/Y=; b=1ttstrgRoWBqwj
	SH4gUr29k5ov15xgSWR+g3Cebow484wULeTKzzBb+TXgstsrZpjEQbGIl2bc6O8HX2jL4RaDLSliK
	1pOno0Yg2Oq1pYPK3NTnfTt0R9cnnXI2kSD/eiQsBTjNOenDlGh1/1LV6OJFA9ery7GNAOqHOjfSV
	zuZRjp7rwjhtwzF4tYrV05e2v36cs03A6sQ0vjxiAp1UyolU18QmXguKgJam16EbaiA9PxRychAX8
	2my6Qh5U+QsEQhi8Ujo+lrFD0jUYP4GvFCzAp6IMgucCvc82qneh7KuR6A0VfqOK0nP1qJAf/91AN
	e/6cncEnMPi2H7E4UDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piF1j-007Yw9-30;
	Fri, 31 Mar 2023 13:42:47 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piF1e-007Yuo-2x;
	Fri, 31 Mar 2023 13:42:44 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id B7A372B06431;
	Fri, 31 Mar 2023 09:42:38 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 31 Mar 2023 09:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680270158; x=1680277358; bh=g6
	aDwmQjQnWklILxvXl/woLrKoW/quWophX6bAkTCEo=; b=TTmtV29COQdi0bvTzb
	VEpOlT1o3jNnc2wW8GBlrOk7+9/MctBDjVr53zmvoRdTqDlOTHAZKSLyDysAlwte
	hEq/UpD9pogU3widuS5h8W8iB0wDYNfKdJJp6rppFP540f3Gy8tENgGeSHLJCOfs
	FsjqDoVn2xrJaPPe0yx+9YBr07Ytqv0+3MVEk6q4+goccGh7j+FOH1QrFJWc5+7l
	1um7QLnwaAqjNCRAXNsz5fdPsFQELPHYPzUxRDOKCmdeTFZf0diPkEsF1wbYL5IU
	o8eDmdF6Fg60Dieg3k/ZJuONUdXA4X4EOjmny+OgIeur77zl0ochP7FNQbxyH8DH
	Ax3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680270158; x=1680277358; bh=g6aDwmQjQnWkl
	ILxvXl/woLrKoW/quWophX6bAkTCEo=; b=SqeGvKfxDDPP6t6KWDRtwqd19OBwm
	jLeWZaJG9njNSDuwSGhOBBwv8v+SMBgELYq66iwF60uEt+dhet3hwp909xte/2SB
	tJyvlehj1z1m+g4xdV7w3tsirezdITNOLuB/NwH7T10WHDpsZJfpQ0/LHDrj7umk
	fRi4pv32y+KR954J2n3JdG8/s18d4gMzJHborWBy9dO5Sl1adMDS/B0zwa2zLu5z
	TQ0g1TsJZ+bTf3iFVHy36iQxP3hkSGdhQzuMbFsvj+V82QYHZ4eKfZqVISYgna4H
	WiADkMFo1mKNsaSN0hl1SCrWRD/l3lNhjJL47a8Zgqen0ZYRspYfU1qhw==
X-ME-Sender: <xms:TOMmZDEUxJuQhS9X_pVD4QAt3n0IwOnRgq2voG0ebtOIwNjFuFey4A>
    <xme:TOMmZAW7wt-5QbCblh5vM5luzY2SXMJn6tkrqQcmi5CSSNndmSwG0iJ6QZMaKjLjW
    QBa4jz0Ao3FL7ODJkE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:TeMmZFJ37O-uyaodkYU6iR0w8O5z6CFRwtCjNWfSvXGVNs2ReLvN4g>
    <xmx:TeMmZBHmXfvKlHe2yMi5gFmhlBU8f_-bZKLlj5dJSJfcjiulTMKJag>
    <xmx:TeMmZJX_nXXwVxDg-8mFHJiCHj8DZ6XoLAflwYYAMOJ1U0Kr66Otvg>
    <xmx:TuMmZBWNulWSSTdEsn3zCw_0hYIiZqCD6OKFcr7ytl8CB3fAQ3O89lNgRRM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E2D7BB60092; Fri, 31 Mar 2023 09:42:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <df218abb-fa83-49d2-baf5-557b83b33670@app.fastmail.com>
In-Reply-To:  <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
References:  <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
Date: Fri, 31 Mar 2023 15:42:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Olof Johansson" <olof@lixom.net>, soc@kernel.org,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Giuseppe Cavallaro" <peppe.cavallaro@st.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Jose Abreu" <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Sebastian Reichel" <sre@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Marc Zyngier" <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mtd@lists.infradead.org, Netdev <netdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-pm@vger.kernel.org, "Daniel Golle" <daniel@makrotopia.org>
Subject: Re: [PATCH RFC 00/20] ARM: oxnas support removal
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_064243_386936_ADD63AB6 
X-CRM114-Status: GOOD (  26.98  )
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

On Fri, Mar 31, 2023, at 10:34, Neil Armstrong wrote:
> With [1] removing MPCore SMP support, this makes the OX820 barely usable,
> associated with a clear lack of maintainance, development and migration to
> dt-schema it's clear that Linux support for OX810 and OX820 should be removed.
>
> In addition, the OX810 hasn't been booted for years and isn't even present
> in an ARM config file.
>
> For the OX820, lack of USB and SATA support makes the platform not usable
> in the current Linux support and relies on off-tree drivers hacked from the
> vendor (defunct for years) sources.
>
> The last users are in the OpenWRT distribution, and today's removal means
> support will still be in stable 6.1 LTS kernel until end of 2026.
>
> If someone wants to take over the development even with lack of SMP, I'll
> be happy to hand off maintainance.
>
> The plan is to apply the first 4 patches first, then the drivers
> followed by bindings. Finally the MAINTAINANCE entry can be removed.
>
> I'm not sure about the process of bindings removal, but perhaps the bindings
> should be marked as deprecated first then removed later on ?
>
> It has been a fun time adding support for this architecture, but it's time
> to get over!
>
> Patch 2 obviously depends on [1].
>
> [1] https://lore.kernel.org/all/20230327121317.4081816-1-arnd@kernel.org/
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks a lot for going through this and preparing the patches!

I've discussed this with Daniel Golle on the OpenWRT channel as well,
and he indicated that the timing is probably fine here, as there are
already close to zero downloads for oxnas builds, and the 6.1 kernel
will only be part of a release in 2024.

For the dependency on my other patch, I'd suggest you instead
remove the SMP files here as well, which means we can merge either
part independently based on just 6.3-rc. I can do that change
myself by picking up patches 1-4 of your RFC series, or maybe you
can send resend them after rebase to 6.3-rc1.

For the driver removals, I think we can merge those at the same
time as the platform removal since there are no shared header files
that would cause build time regressions and there are no runtime
regressions other than breaking the platform itself. Maybe
just send the driver removal separately to the subsystem
maintainers with my

Acked-by: Arnd Bergmann <arnd@arndb.de>

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
