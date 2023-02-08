Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0958C05027
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 07:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vK8C7jWYlBRNCfYjWjAEMf0kbnzQdcqSa0ZU6PqOr2s=; b=t/KpPvO+8XIWH6
	ev2KaKjRELD9M5jczPim9sB8Vkws3kEqE+kBAJuoCZkOa9Fh1cQvDJrvoWKpmpNF5MbLxHAZKbeKz
	mVLo0epQxi13Sw+uHIUASXVRTaEPXfUUgxo7VzXysE3oRNm18FuNfJ48xHoHVP/pZE+B+7sTYh/cZ
	oY1eeMUIlUqMUoNKQ5LXqnnN13b1Mdy4Vd0mvAv34DyOg8080+2ZUiGfwoKOUWWC3FXaF2AP6RGFo
	LQQLWY3vyhiQQN4xxs89T4hpidK3Hc55ps6yHryP9VfcWcvPdhab4mB3fpfV+AZ0PI7g6mzZTP21j
	jXtkwjOnqnk7wG/gjQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPexo-00ERSL-FF; Wed, 08 Feb 2023 07:33:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPexa-00ERO2-LR; Wed, 08 Feb 2023 07:33:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF23761480;
	Wed,  8 Feb 2023 07:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5E7C433EF;
	Wed,  8 Feb 2023 07:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675841621;
	bh=ePtGmk1RerF2sqLoxfQP10NDWdRVifJxRH4/QXtN1W8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xN5dDVaP1ymbS6rw1sB6LScggDNvB9U4b67CMek9M6wvYICjlQII4dOwZ8itAtJhu
	 /eVDBboVTqth8liScHVpfCgd6tljQdTzoOlBbclvdh9hBClnnwFA5LO9fE9uhHXUzL
	 AO7IDumYiHIAZa9A3Va8CMjnO0YZzEFU5WEF7nH4=
Date: Wed, 8 Feb 2023 08:33:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Saravana Kannan <saravanak@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Abel Vesa <abel.vesa@linaro.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Tony Lindgren <tony@atomide.com>, John Stultz <jstultz@google.com>,
	Doug Anderson <dianders@chromium.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Colin Foster <colin.foster@in-advantage.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v3 09/12] of: property: Simplify of_link_to_phandle()
Message-ID: <Y+NQUVR9P3hmqFcL@kroah.com>
References: <20230207014207.1678715-1-saravanak@google.com>
 <20230207014207.1678715-10-saravanak@google.com>
 <CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_233342_799425_D96CE3EC 
X-CRM114-Status: GOOD (  26.24  )
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

On Tue, Feb 07, 2023 at 09:57:14PM +0100, Geert Uytterhoeven wrote:
> Hi Saravana,
> 
> On Tue, Feb 7, 2023 at 2:42 AM Saravana Kannan <saravanak@google.com> wrote:
> > The driver core now:
> > - Has the parent device of a supplier pick up the consumers if the
> >   supplier never has a device created for it.
> > - Ignores a supplier if the supplier has no parent device and will never
> >   be probed by a driver
> >
> > And already prevents creating a device link with the consumer as a
> > supplier of a parent.
> >
> > So, we no longer need to find the "compatible" node of the supplier or
> > do any other checks in of_link_to_phandle(). We simply need to make sure
> > that the supplier is available in DT.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> 
> Thanks for your patch!
> 
> This patch introduces a regression when dynamically loading DT overlays.
> Unfortunately this happens when using the out-of-tree OF configfs,
> which is not supported upstream.  Still, there may be (obscure)
> in-tree users.

As we can't do anything about out-of-tree code, why does this matter?

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
