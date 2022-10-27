Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38C1ECAAA1
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Oct 2022 13:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzPFezeqNLaAcpltQJUEcKGVQ3e6bEsVHi0Uz1C+1MU=; b=oRWQyg3FU6hoo2
	u1XZdSjTfhQz/ZIwFlwjhPOpciL86GBpWXUPJHnA1qBajW+fiBelU1H/YTaXpbFg0UBXs2xht+4M0
	hqdmMRyLiRIE+0qED3Y1JfbyjiHhATb654bIcxVpcFrKaLbihAg44EPdkJed0z/w5TB6reqT3/MvB
	Rh6yt9KkbT2AVYHfNoidow/S7T/fIqg18fq76HcUVxLtbuLUoGRaQyx4NficdTDQT2keI9TzoOPaa
	8jRl18I8kMduCxuVBusI1M9JBqZFQFSPn02nyVoPM8mR0f/sXojTp+9L0XKeGr8o9RAhk+2SU8hzv
	fbvFKK06/d0VOLGuL5eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo3AA-00DdxF-Hz; Thu, 27 Oct 2022 13:43:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo35Y-00Dal7-R0; Thu, 27 Oct 2022 13:38:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A842662315;
	Thu, 27 Oct 2022 13:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722B2C433C1;
	Thu, 27 Oct 2022 13:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666877907;
	bh=pllUkLfz45ydi2Wi6jpPnGPo9M25t+6/Kw3UeVHzGdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XA5Ckkqd0MKG04G1je+NRuX1YlckWLju0xK3x3oUFbwBzEWP6CCfNDpPs4an9dpok
	 zTBWBixFCPVT6QiWgG06RRjmUVE+7QhKtLZW6B7yG60cj4z+DP30OQiyW+scbCLjhc
	 /E23kdKoDTQanhEvTGk+kVSkBlzowin0Wcf+oPMRuHMB4/tpgnkvmmiqqPZ4NF0Vcq
	 p942/XBiczoyTBgTKPBfe9CjdC6F5DbIXfIVQwcdzJ4ryHBrcqdU5Jp1Lva0Po2bTn
	 L/okQRXRP0jU38kGSHQZ8g9LmY5hxfULdWp2a9lD5utiwTnV0uXe3TVXFuRzmMBt6V
	 TjROlYhclurRw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	David Airlie <airlied@linux.ie>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Richard Weinberger <richard@nod.at>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Felipe Balbi <balbi@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: (subset) [PATCH v1 00/11] Get rid of [devm_]gpiod_get_from_of_node() public APIs
Date: Thu, 27 Oct 2022 15:38:11 +0200
Message-Id: <166687787352.847482.10005684512699510391.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_063828_976160_A97BD1A1 
X-CRM114-Status: GOOD (  13.92  )
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

Applied to pci/tegra, thanks!

[01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
        https://git.kernel.org/lpieralisi/pci/c/16e3f4077965

Thanks,
Lorenzo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
