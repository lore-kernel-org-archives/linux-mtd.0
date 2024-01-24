Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A320C47E49
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Datsxh3UXhzfrEqUqlsQIsyr2JG4AjGtO8GCBaocWI=; b=F0jNtq81Xaf/A7
	04Ne7nrr6inYR38uh26u9hnShr1PmDzNKfQNsIDEObSkvg/4YNh0pN1LB709VjPnv+hK5OPKAI+xh
	CgnmXyTOaXl+iYbCN9CIiG/azMXUSZJDxSAaSHS2Yko1EIv7YIpCPiHZrVr5mqbdlkLW+r1VzWD0C
	u766y7MW6/ER4VM8Rx+ONJ2jlrKbVHP/iYztjzrFzFZ9PW2RRKCHaN7C6GA0cyUD/pCShY+GcaL/I
	vZYKVOclM+3rcpdbIAIl+QqzzJ5No6+PmIoVfq9AOVk8NqAKruHwIRW0gUaExEpjFCTfLr3xm7MHN
	CtkRJLjmlXiUBag4xIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSgp7-004Ozp-1K;
	Wed, 24 Jan 2024 17:14:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSgp1-004Owe-09;
	Wed, 24 Jan 2024 17:13:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 28784CE314A;
	Wed, 24 Jan 2024 17:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B096C43390;
	Wed, 24 Jan 2024 17:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706116430;
	bh=jvo5IXYlQYdIU6VCmACeGNP4xo23ZIbLfeE2jvqqluI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v2pVfufLGd3lCfp0CeG2fpxzUUsvpwbElgNFofM1ZPehhJ3gSyI8DyqjujjS7qB28
	 HIx8X5ThDTkPR0Ay0PzOQVdIcq5n2pTAL/fkyg4/FCf2V3zKeABMVcc+DS8MIJ/Ztv
	 A8j4KVPuFkJX9pHjYFH5A/rDYDM6TICeR0rlV7yw=
Date: Wed, 24 Jan 2024 09:13:49 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
	linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Rayyan Ansari <rayyan@ansari.sh>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Sergey Kozlov <serjk@netup.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-mmc@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	linux-mtd@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Ronald Wahl <ronald.wahl@raritan.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, Max Filippov <jcmvbkbc@gmail.com>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>,
	libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 00/33] spi: get rid of some legacy macros
Message-ID: <2024012417-prissy-sworn-bc55@gregkh>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_091355_436328_749A74CB 
X-CRM114-Status: GOOD (  20.02  )
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

On Mon, Jan 22, 2024 at 07:06:55PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> this is v2 of this patch set.
> =

> Changes since (implicit) v1, sent with Message-Id:
> cover.1705348269.git.u.kleine-koenig@pengutronix.de:
> =

>  - Rebase to v6.8-rc1
>  - Fix a build failure on sh
>  - Added the tags received in (implicit) v1.
> =

> The slave-mt27xx driver needs some more work. The patch presented here
> is enough however to get rid of the defines handled in patch 32.
> Cleaning that up is out-of-scope for this series, so I'll delay that
> until later.
> =

> Note that Jonathan Cameron has already applied patch 3 to his tree, it
> didn't appear in a public tree though yet. I still included it here to
> make the kernel build bots happy.

Are we supposed to take the individual changes in our different
subsystem trees, or do you want them all to go through the spi tree?

Either is fine with me, just need to know.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
