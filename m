Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F33FECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Il3OD23DopKhvw+vu4TIpLLxCqmIklJ3t+5f6fCOwT0=; b=tjubuVBh935hpW
	WpH/8dq+R4U955dhP1V2OYeVIrJ61QByu9qpHDKECjAPzea5htASEZDM4z6j3SxLAa1qJxndTEasB
	KMXd7YQKqLrjVpYuRuOGbqfsWvwXGXPUM0nuFTyPr5N8MwHEQCBxSom53JvrRZsZEgdvoTOsJAuEF
	kP56817oGvbuk5JOqptnP+LOIc7YTKZLo/d99u171odOM1eF8/C+nByEafFhQc86si/d+4Xw0k32V
	kRiKGqUTBE4asrk1lWAdXfjw8QNB5qq1rxzJE92QC9ljWrYZ1aqKCh/AwzpVNh2wTZceQ9kB68bW2
	853HzAzfcgBY20utuE6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFiO-007OO4-UE; Mon, 05 Sep 2022 17:16:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVDVE-0059e9-Ht; Mon, 05 Sep 2022 14:55:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DDF49B8119E;
	Mon,  5 Sep 2022 14:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55311C433D6;
	Mon,  5 Sep 2022 14:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662389702;
	bh=KP3EocuoUIX0AopCG1aLZXX8OYIQkU7XDQRdtjESgfQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FdxBqiI3p6ZeO4T+XjgQ9CZ/qt69KGDmMaAKKfHX9rJZ8Jk2TFPVgg1SqnsdqhkRa
	 WdDaWxcTHblfVGvoG78rdGhCY73SymRtwQ5E/O1+kJIRSFwSWC0iH+WVUYcuf4J/9I
	 kQ4DrYany8AlhFZ13jcgU8XtxHsAoxcrTSwCZVrc48ljSqB9o/UKBtoojYJQze+tiV
	 fvGYoDbk0jy7TuqUrjjHekuf1hzLJkMS/QgninQfO1rY7Se8Wee7G0k3IhatOzVCte
	 WkV36G3IYztJIvQ66OoflpORRaQbBmetX5gw4GgXfwKRTNy74S54TTBmoN34wl7/kT
	 uSzb6UrdEavlg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Daniel Vetter <daniel@ffwll.ch>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Marc Zyngier <maz@kernel.org>, Krzysztof Wilczyński <kw@linux.com>,
 Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@kernel.org>, Pali Rohár <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-watchdog@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mtd@lists.infradead.org, linux-gpio@vger.kernel.org
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
Subject: Re: (subset) [PATCH v1 00/11] Get rid of [devm_]gpiod_get_from_of_node() public APIs
Message-Id: <166238969501.661295.8416403465203041511.b4-ty@kernel.org>
Date: Mon, 05 Sep 2022 15:54:55 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_075520_509405_948EEC04 
X-CRM114-Status: GOOD (  18.16  )
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

On Sun, 4 Sep 2022 23:30:52 -0700, Dmitry Torokhov wrote:
> I would like to stop exporting OF-specific [devm_]gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit. We can do that by switching drivers
> to use generic fwnode API ([devm_]fwnode_gpiod_get()). By doing so we open
> the door to augmenting device tree and ACPI information through secondary
> software properties (once we teach gpiolib how to handle those).
> 
> I hope that relevant maintainers will take patches through their trees and
> then we could merge the last one some time after -rc1.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[08/11] regulator: bd71815: switch to using devm_fwnode_gpiod_get()
        commit: 97c9278ec624a0d5d7c56aa20e16afc8aaa96557
[09/11] regulator: bd9576: switch to using devm_fwnode_gpiod_get()
        commit: 587bfe3f7a270f0a4076e624d318292324bdead8

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
