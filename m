Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4986BC761A6
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 13:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJqTVPH4PMlIUQbshRfuXSW4hU2hRb6E09lChxh/Ehk=; b=QNtnsGZBbn8Sjf
	oryGpN0OOY6anfgs7Z1hnyRsQAJdE2Oi83kK3xe0SYQ+o33WDJiQjzTHC0JKZVhGzeNG15o3lc+X0
	/T5PWU0WD/EjbZ6h+8hzojlsVhu6xnfh2nhkXZVsLIOZn+v+1SSqw1UY0RpQAcGMc6q21yus/EcEG
	WBsjrNJnJll/zjv6LkEfW6903wS1xuVzWPAkrHCAR/SJ4qpAdbt3zv9bTKVKttxTSnH+5tEOEaOSe
	TqjR7pDvDu8bQtk04TnO/VL/pMJ3XAGr4O3ntKrzGLjqPoR4EXzasDHNl1E9ll9jQPN8j20mWgQT3
	c37mHNpAIClflpaWJV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piFA0-007arN-06;
	Fri, 31 Mar 2023 13:51:20 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piF9v-007apk-2c;
	Fri, 31 Mar 2023 13:51:17 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1piF8o-00039R-1c;
	Fri, 31 Mar 2023 15:50:06 +0200
Date: Fri, 31 Mar 2023 14:50:02 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sebastian Reichel <sre@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-mtd@lists.infradead.org,
	Netdev <netdev@vger.kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH RFC 00/20] ARM: oxnas support removal
Message-ID: <ZCblCsKMHYDZI-H9@makrotopia.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <df218abb-fa83-49d2-baf5-557b83b33670@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df218abb-fa83-49d2-baf5-557b83b33670@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_065115_848206_3DF5C1FE 
X-CRM114-Status: GOOD (  36.82  )
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

On Fri, Mar 31, 2023 at 03:42:15PM +0200, Arnd Bergmann wrote:
> On Fri, Mar 31, 2023, at 10:34, Neil Armstrong wrote:
> > With [1] removing MPCore SMP support, this makes the OX820 barely usable,
> > associated with a clear lack of maintainance, development and migration to
> > dt-schema it's clear that Linux support for OX810 and OX820 should be removed.
> >
> > In addition, the OX810 hasn't been booted for years and isn't even present
> > in an ARM config file.
> >
> > For the OX820, lack of USB and SATA support makes the platform not usable
> > in the current Linux support and relies on off-tree drivers hacked from the
> > vendor (defunct for years) sources.
> >
> > The last users are in the OpenWRT distribution, and today's removal means
> > support will still be in stable 6.1 LTS kernel until end of 2026.
> >
> > If someone wants to take over the development even with lack of SMP, I'll
> > be happy to hand off maintainance.
> >
> > The plan is to apply the first 4 patches first, then the drivers
> > followed by bindings. Finally the MAINTAINANCE entry can be removed.
> >
> > I'm not sure about the process of bindings removal, but perhaps the bindings
> > should be marked as deprecated first then removed later on ?
> >
> > It has been a fun time adding support for this architecture, but it's time
> > to get over!
> >
> > Patch 2 obviously depends on [1].
> >
> > [1] https://lore.kernel.org/all/20230327121317.4081816-1-arnd@kernel.org/
> >
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Thanks a lot for going through this and preparing the patches!
> 
> I've discussed this with Daniel Golle on the OpenWRT channel as well,
> and he indicated that the timing is probably fine here, as there are
> already close to zero downloads for oxnas builds, and the 6.1 kernel
> will only be part of a release in 2024.
> 
> For the dependency on my other patch, I'd suggest you instead
> remove the SMP files here as well, which means we can merge either
> part independently based on just 6.3-rc. I can do that change
> myself by picking up patches 1-4 of your RFC series, or maybe you
> can send resend them after rebase to 6.3-rc1.
> 
> For the driver removals, I think we can merge those at the same
> time as the platform removal since there are no shared header files
> that would cause build time regressions and there are no runtime
> regressions other than breaking the platform itself. Maybe
> just send the driver removal separately to the subsystem
> maintainers with my
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Sounds reasonable, so also

Acked-by: Daniel Golle <daniel@makrotopia.org>

(but I am a bit sad about it anyway. without SMP it doesn't make sense
to keep ox820 though)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
