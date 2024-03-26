Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1419EC6FD1F
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2024 14:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jQVQjyF9s+L2SglVACXrPKS2hfIR2G6qOBP7HB03M0=; b=1j0oxMSpfq3Rt/
	WltXwCLIlwuR6JXUQbgP+cQyAqF6K4De43+dvu/W/6Py+FoFnf43gow+SqWglN1XzXecMRx6oc4mf
	89VZWHod0jQaJT3KNbCRP9QyGX7zq3ZANtBH1ib/MrIwz+zAp/hEKjXR3IoS9aK6gzRX8OZhnyGI4
	b7y3kFFSzut6FDfDXgaEDw7iLv0OHZm6gdmddGeUfv240rKXjbPWpmCjrGDBrysZIionhwGnf2Ta1
	83QAEmWjhijWlIBDcRe9VW0dXOt55aG5Vwsk99GNUBAQIxN+34Gmwh8e0F9T4Yu62kG7ilzKQvJFf
	yee4abHGN1teohCcELjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp87K-00000004zU2-0snW;
	Tue, 26 Mar 2024 14:49:34 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp87C-00000004zSE-3MXP;
	Tue, 26 Mar 2024 14:49:28 +0000
X-CSE-ConnectionGUID: yVuSTs2dRzWPNfCYOjCzOw==
X-CSE-MsgGUID: LtnELr+3RjyWTqETsjvX9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="28999051"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="28999051"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 07:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="914882408"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="914882408"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 07:49:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rp86t-0000000GKYj-43J8;
	Tue, 26 Mar 2024 16:49:07 +0200
Date: Tue, 26 Mar 2024 16:49:07 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: nikita.shubin@maquefel.me,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ralf Baechle <ralf@linux-mips.org>,
	"Wu, Aaron" <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>,
	Olof Johansson <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v9 00/38] ep93xx device tree conversion
Message-ID: <ZgLgY11N8dkpTZJB@smile.fi.intel.com>
References: <20240326-ep93xx-v9-0-156e2ae5dfc8@maquefel.me>
 <dc3e2cb4-f631-4611-8814-0dc04c5502f0@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc3e2cb4-f631-4611-8814-0dc04c5502f0@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_074926_902104_AB8D789C 
X-CRM114-Status: GOOD (  19.37  )
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

On Tue, Mar 26, 2024 at 11:19:54AM +0100, Krzysztof Kozlowski wrote:
> On 26/03/2024 10:18, Nikita Shubin via B4 Relay wrote:
> > The goal is to recieve ACKs for all patches in series to merge it via Arnd branch.
> > 
> > Some changes since last version (v8):
> > 
> > - Most important, fixed bug in Device Tree resulting in CS4271 not working by Alexander Sverdlin.
> > - added #interrupt-cells to gpio nodes with interrupts-controller
> > - fixed some EOF in dtsi files
> > - fixed identation and type in ep93xx-keypad thanks to Andy Shevchenko
> > 
> > Stephen Boyd, Vinod Koul PLEASE! give some comments on following, couse i hadn't one for a couple of iterations already:
> > 
> > Following patches require attention from Stephen Boyd, as they were converted to aux_dev as suggested:
> > 
> > - ARM: ep93xx: add regmap aux_dev
> > - clk: ep93xx: add DT support for Cirrus EP93xx
> > 
> > Following patches require attention from Vinod Koul:
> > 
> > - dma: cirrus: Convert to DT for Cirrus EP93xx
> > - dma: cirrus: remove platform code
> 
> A lot of this could have been already merged if you split it... Just
> saying...

But you able to apply DT schema patches if you wish.
Just doing? :-)

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
