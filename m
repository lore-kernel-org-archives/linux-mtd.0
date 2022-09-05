Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCF5ECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 08:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26C1iV+ZBiAeZ6foWZQ9j8RV8YDRgZAmW4Lz2icNDTI=; b=Sn0O0VQV7h17bI
	ASeGIqVEP+UC06fVcJrHzJYuvdlKvT2m9dUDAX8qk0NuGWUa1A6lf7b46DGrhze2AhlMbDx1KJ8s1
	xW5niebe0ekA+BZ9bNqgS2LW9qfRb3/gn3TJ79rk8hwPYEpGxOPY1g7qx4AyB+zr1RXw+SxN7nhK/
	d8WXdt11MgSgX08ZoCufs3AffU8CodGQJe3YajHP86O6WF2JqubP7N/mVC6PcplzHIr9FxS2Xs6dC
	gbYEeT3SVTgBTetoFN+urV1/qpEhWgq6vI9FxY8HslRBrNguKP+8S/pq5WEmMmPceUUCZ5TELP2zZ
	A3qcgC8cwiJ9NFsePS9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV780-00E5hp-MU; Mon, 05 Sep 2022 08:06:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV6Nu-00D9Op-9E; Mon, 05 Sep 2022 07:19:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E5BB61041;
	Mon,  5 Sep 2022 07:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A82C433C1;
	Mon,  5 Sep 2022 07:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662362344;
	bh=19nxD2OgHF2QVoth2PFq3CxZH5zVFIqpZyEzuI/YHbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5IVl+JOjFxfodqmnjA5/iplAcU9jdP05wWuvEqZCUxiPZuyoNor7xgxpbYXB6NVK
	 7DcajL5+Q4Jwv4XR1AvPOAXkUgrwSH/Ov7HM3KXUEl/b4BKQG5MdZ5GTO8igdjjVEV
	 HR2BrWQ7cSeUZcnhf0SNpLKhbJC0AEjYvFObLKGjaI4ohnPRXMXtOd+2eSUbXERAnn
	 Wt+aJ6+72CZQwxjMiKfr0QzSL2qh96wXclEVsX5h4ma+908Zyb6OVtZsD0AEGTokvq
	 Z4gsx2A9lpZW+2kJWomwEZtX41BXuoB9ZUs+w+vRDjrWEAYqK9IYV1wftZ4A4k/PEn
	 RnEC8ylDHE6IA==
Received: by pali.im (Postfix)
	id 32DB27D7; Mon,  5 Sep 2022 09:19:02 +0200 (CEST)
Date: Mon, 5 Sep 2022 09:19:02 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
	David Airlie <airlied@linux.ie>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-watchdog@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 01/11] PCI: tegra: switch to using
 devm_fwnode_gpiod_get
Message-ID: <20220905071902.fv4uozrsttk3mosu@pali>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_001906_486386_C7E1CC3D 
X-CRM114-Status: GOOD (  21.14  )
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

On Sunday 04 September 2022 23:30:53 Dmitry Torokhov wrote:
> I would like to limit (or maybe even remove) use of
> [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> a bit, so let's switch to the generic device property API. It may even
> help with handling secondary fwnodes when gpiolib is taught to handle
> gpios described by swnodes.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index 8e323e93be91..929f9363e94b 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2202,10 +2202,11 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
>  		 * and in this case fall back to using AFI per port register
>  		 * to toggle PERST# SFIO line.
>  		 */
> -		rp->reset_gpio = devm_gpiod_get_from_of_node(dev, port,
> -							     "reset-gpios", 0,
> -							     GPIOD_OUT_LOW,
> -							     label);
> +		rp->reset_gpio = devm_fwnode_gpiod_get(dev,
> +						       of_fwnode_handle(port),
> +						       "reset",
> +						       GPIOD_OUT_LOW,
> +						       label);

Why in pci-aardvark.c for PERST# reset-gpio you have used
devm_gpiod_get_optional() and here in pci-tegra.c you have used
devm_fwnode_gpiod_get()? I think that PERST# logic is same in both
drivers.

>  		if (IS_ERR(rp->reset_gpio)) {
>  			if (PTR_ERR(rp->reset_gpio) == -ENOENT) {
>  				rp->reset_gpio = NULL;
> 
> -- 
> b4 0.10.0-dev-fc921

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
