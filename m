Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687ADC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Feb 2022 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rK2CfAJf524p2IFKXsnU2tFScIroMEn2ANeIBaA0UhE=; b=PwO3f43TeNnv0C
	lNFas0+rzHC6t3f4Kw29phNg7jTTye1J1Fb/hRxwbDFJKItiAWjUnrIm1f/QU4MijqwXWeSixZ+K9
	UnGG2lAgY/YdzwSMPJ3vLtbF22ecLOVR5QAF3+ZEg6PoeHk5XesEBezpTTU2LjYLCaFa+k3UXMb/f
	7n+uZerjAXE06QnAEM6XCQtxK5un/+eqP3ol9cmXlITXUrqY+E0I293YfEgUJee02LnzFWr8QWVp3
	9kMoKdRKig+OkWOMs4kcwL87fpIQVRj611WdaDlkUohFRDZUXi3pmHHqXSCic39jTVKUJ7zottMeE
	3pZu8+D91JyrYWut887Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFxfr-004H62-5I; Fri, 04 Feb 2022 12:26:47 +0000
Received: from relay3.hostedemail.com ([64.99.140.34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFxfm-004H4H-PR
 for linux-mtd@lists.infradead.org; Fri, 04 Feb 2022 12:26:44 +0000
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay06.hostedemail.com (Postfix) with ESMTP id CDA3723327;
 Fri,  4 Feb 2022 12:18:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf14.hostedemail.com (Postfix) with ESMTPA id 90F8A2D; 
 Fri,  4 Feb 2022 12:18:11 +0000 (UTC)
Message-ID: <ad56e88206a8d66b715035362abe16ece0bde7d3.camel@perches.com>
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
From: Joe Perches <joe@perches.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, nick.hawkins@hpe.com
Cc: verdun@hpe.com, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Corey
 Minyard <minyard@acm.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,  Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown
 <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Wim
 Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Shawn Guo <shawnguo@kernel.org>, Stanislav Jakubek
 <stano.jakubek@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Hao Fang
 <fanghao11@huawei.com>,  Mark Rutland <mark.rutland@arm.com>, Marc Zyngier
 <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,  Anshuman Khandual
 <anshuman.khandual@arm.com>, Wang Kefeng <wangkefeng.wang@huawei.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Masahiro Yamada
 <masahiroy@kernel.org>,  dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,  linux-i2c@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,  linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 04 Feb 2022 04:18:24 -0800
In-Reply-To: <Yf0Wm1kOV1Pss9HJ@shell.armlinux.org.uk>
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
 <Yf0Wm1kOV1Pss9HJ@shell.armlinux.org.uk>
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
X-Stat-Signature: sr19sijeo6q79z8ey9jcj9w15gn7bijc
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 90F8A2D
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/fXooa1LZuZOlkfFu/TpMmSAbR8ShcuZI=
X-HE-Tag: 1643977091-269336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_042642_917319_7FB8B6FA 
X-CRM114-Status: GOOD (  16.56  )
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

On Fri, 2022-02-04 at 12:05 +0000, Russell King (Oracle) wrote:
> On Wed, Feb 02, 2022 at 10:52:50AM -0600, nick.hawkins@hpe.com wrote:
[]
> > diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
[]
> > +static irqreturn_t gxp_time_interrupt(int irq, void *dev_id)
> > +{
> > +	struct gxp_timer *timer = dev_id;
> > +	void (*event_handler)(struct clock_event_device *timer);
> > +
> > +
> 
> One too many blank lines.
> 
> > +	if (readb_relaxed(timer->control) & MASK_TCS_TC) {
> > +		writeb_relaxed(MASK_TCS_TC, timer->control);
> > +
> > +		event_handler = READ_ONCE(timer->evt.event_handler);
> > +		if (event_handler)
> > +			event_handler(&timer->evt);
> > +		return IRQ_HANDLED;
> > +	} else {
> > +		return IRQ_NONE;
> > +	}
> > +}

It's also less indented code and perhaps clearer to reverse the test

	if (!readb_relaxed(timer->control) & MASK_TCS_TC)
		return IRQ_NONE;

	writeb_relaxed(MASK_TCS_TC, timer->control);

	event_handler = READ_ONCE(timer->evt.event_handler);
	if (event_handler)
		event_handler(&timer->evt);

	return IRQ_HANDLED;



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
