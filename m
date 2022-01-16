Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FE4C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jan 2022 14:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZ9kHg/rPy5oh9hKl9VjFGOpQ4ukDUZvkDXiHGjCK+M=; b=SbhyMNESP1LWsi
	TytcABzW+s3c/8yMSj6xnY5yBtXox5PGLTkzmqAitsPwpr9jlELSAdRTYzrG26VVR6kPVyHMG+eIV
	arD3J/7VTTzfyH1Bd2fp6psoqpunF2LjmCUMmE6cKkejV680czmsTWoRPeEA7chXEmexDvHRsRwWu
	KhmwBCq+Bs5CevBZZ26hTiE3G0Ieu3DLx8qi3ChXkUPy3k9jU9knY+/kn0Q70fllz4Eg+DTgb3VzT
	uHHYTNNr3cYKjft4wATtF7hw9diefWT4JYYvYS4tz3qCpPzLw2/LBuF4T+JCtfdmLQfTEjbnNay7+
	d3FzwRcnpbS91Zv97w8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n96NO-00CX5K-MN; Sun, 16 Jan 2022 14:19:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n96NE-00CX4b-1U; Sun, 16 Jan 2022 14:19:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F7EB60F14;
 Sun, 16 Jan 2022 14:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D360C36AE7;
 Sun, 16 Jan 2022 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1642342750;
 bh=KujYZ44NbqHewC3hStYnBx16eqgxm1SsBiD7vgCzy1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sKsNPdg/t/aehm0kbBx0+iaMt7Vs15thP7mY+lgsvv2wpHp7hhFp/CL3s/+VFunx8
 VMGsJpG9T+206AG5qxqWiAVL+YwMP+lMdgO6G29sYG5yQOnXi5Wp9YcaTPGre6QZaH
 1Q5W85dO5PtMcGij5VwJ57avVdKo6t7UZumaWiEk=
Date: Sun, 16 Jan 2022 15:19:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jiri Slaby <jirislaby@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sebastian Reichel <sre@kernel.org>, linux-phy@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-gpio@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Guenter Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 openipmi-developer@lists.sourceforge.net,
 Saravanan Sekar <sravanhome@gmail.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 kvm@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 John Garry <john.garry@huawei.com>,
 Robert Richter <rric@kernel.org>, Zha Qipeng <qipeng.zha@intel.com>,
 Corey Minyard <minyard@acm.org>, linux-pm@vger.kernel.org,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Eric Auger <eric.auger@redhat.com>, netdev@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 Joakim Zhang <qiangqing.zhang@nxp.com>, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
 (summary)
Message-ID: <YeQpWu2sUVOSaT9I@kroah.com>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220115183643.6zxalxqxrhkfgdfq@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220115183643.6zxalxqxrhkfgdfq@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_061912_237198_54F17C78 
X-CRM114-Status: GOOD (  15.28  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Jan 15, 2022 at 07:36:43PM +0100, Uwe Kleine-K=F6nig wrote:
> A possible compromise: We can have both. We rename
> platform_get_irq_optional() to platform_get_irq_silent() (or
> platform_get_irq_silently() if this is preferred) and once all users are
> are changed (which can be done mechanically), we reintroduce a
> platform_get_irq_optional() with Sergey's suggested semantic (i.e.
> return 0 on not-found, no error message printking).

Please do not do that as anyone trying to forward-port an old driver
will miss the abi change of functionality and get confused.  Make
build-breaking changes, if the way a function currently works is
changed in order to give people a chance.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
