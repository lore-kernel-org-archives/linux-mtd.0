Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B4BECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 23:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBiIYpmciPEDTNDPK4QCAN2KNLI2rywHI4CfAWcIBnw=; b=s7q4PlT3huDfgZ
	6lL5s8A0gVpobjGXNZz54goEM374fRXkr9fMPgYcNkAzYECLmYiDHG5nlFq7UfbcVBIChMYbN9iOa
	Ylntv+N1aUUO+6xeu0ztIwoSimQ/bUXYhmQd6LFkukyv3Hm6PlmlvVUKVwwEQL2AKKY3imyv62d4x
	UaxKbg5bf5RUQ2sap9DMtYKmyeiCijozlqetOBKc4EAPBppoiOgSc6WhEnnFGzBSW1J+JetVLmJM+
	zkZlKtdyk69Rz4w4c9tZgmLz47cLRyn7K7siTk1/Vhfyb3SeOBQvZMluts7byNMOnemSE1qwnIa7J
	n1QxM9cqAzEdEf8k9Tqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVLMk-000EX7-6v; Mon, 05 Sep 2022 23:18:54 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVLMh-000EVj-9F; Mon, 05 Sep 2022 23:18:52 +0000
Received: by mail-pj1-x1034.google.com with SMTP id o2-20020a17090a9f8200b0020025a22208so6031516pjp.2;
        Mon, 05 Sep 2022 16:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=/jqGrlOkEmBNjfkgs8nQW3ROS8ZrNR4/ALxdUn5IrPk=;
        b=ilcjNtA9e+sPl0lsYgQkDwLCllTb2CiNUB5lHZ6JeNqUXFPhLppke4bm+tXK6piFK1
         OXX3EAUgJSmDrfpfXWx/gxfIHEm2Ll5i3Co8kZmFkD+xJ+3h2g4/t3iiwcCHTb2nJzBQ
         lbOD/k+fLbzcC8HBgysilDjSnQ1ZbXkHWL+70V9Wt9ed7HVcmNaLtsVWn3S7QudoyNrm
         Tq2TeNuUosg71GwV6fxG+rz0aEcyELSi2RShJByRv/vyFIdszNuT6j8i8+cZEV+vX59E
         NXtPK9gzYwxXVVePAldhDwWgJuboRZn5lOgdBc1/dRtrt2Cv4uHi9z8kuWuYzv1zT79p
         tLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/jqGrlOkEmBNjfkgs8nQW3ROS8ZrNR4/ALxdUn5IrPk=;
        b=JkKvZsBHgLzk3T7IJE6ij2ZOx/BIiwEXp9OH8hc3wTwGCiRF51M84ggBu0G3G9sPAC
         CiCxyM8uJMlKU78GbuQAFPbszMVBUMO5Ch1hH9F3/hqlbatdRgMWjQqU1EDCSuKRrDlv
         hNxCWEUWYuY6UK3Z5RgdHn3xp9LpMXCW7wPmVHoxw2eiLSzSo7JCZ8CTW9yHMsDU9WE0
         9kF/7OvtVJ8CScb2IpADph+NSVAAtaLJ97k/HpNIrd091zV3ilTBdxXrH3uLteFQf8bJ
         vj0X2SZiU9hn58ShJt9Z1HLem+oUBvwipq9SZsBo9SZDcncJpcuw/RxH+r7IKGT6uz06
         WLGg==
X-Gm-Message-State: ACgBeo2OYxM1984P2XYC6Vo43peDeq1yG3bQ5D7X9D9Msmn9uoFSg4YM
	xteJbN1bfqK2V81Kashk3L0=
X-Google-Smtp-Source: AA6agR7SONkgr8pjyY4NZ8VXkSKoPY330/BgoAO00Ts+AQQkwdonx5V0WIHgyPBEPyBYuNfJLCJm0Q==
X-Received: by 2002:a17:903:186:b0:176:6615:cb8d with SMTP id z6-20020a170903018600b001766615cb8dmr19721305plg.135.1662419929430;
        Mon, 05 Sep 2022 16:18:49 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
        by smtp.gmail.com with ESMTPSA id 5-20020a17090a190500b001fe444b2245sm7375447pjg.25.2022.09.05.16.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 16:18:48 -0700 (PDT)
Date: Mon, 5 Sep 2022 16:18:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
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
Subject: Re: [PATCH v1 06/11] PCI: aardvark: switch to using
 devm_gpiod_get_optional()
Message-ID: <YxaD1Luja4T/osP5@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
 <20220905070046.46nlhczkck2ufr4x@pali>
 <YxZ+PSDRYZnVKfFO@google.com>
 <20220905231010.ojl4i4ph27qtebiy@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220905231010.ojl4i4ph27qtebiy@pali>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_161851_359615_1887FD1C 
X-CRM114-Status: GOOD (  26.02  )
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

On Tue, Sep 06, 2022 at 01:10:10AM +0200, Pali Roh=E1r wrote:
> On Monday 05 September 2022 15:54:53 Dmitry Torokhov wrote:
> > On Mon, Sep 05, 2022 at 09:00:46AM +0200, Pali Roh=E1r wrote:
> > > On Sunday 04 September 2022 23:30:58 Dmitry Torokhov wrote:
> > > > I would like to stop exporting OF-specific devm_gpiod_get_from_of_n=
ode()
> > > > so that gpiolib can be cleaned a bit, so let's switch to the generic
> > > > device property API.
> > > > =

> > > > I believe that the only reason the driver, instead of the standard
> > > > devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
> > > > because it wanted to set up a pretty consumer name for the GPIO,
> > > =

> > > IIRC consumer name is not used at all.
> > > =

> > > The reason was to specify full name of DTS property, for easier
> > > identification of the code. DTS property is "reset-gpios" but API
> > > specify only "reset".
> > =

> > I see. Do you want me to reset the patch with updated desctiption as to
> > the reason devm_gpiod_get_from_of_node() was used?
> =

> I think it is fine. So add my:
> =

> Acked-by: Pali Roh=E1r <pali@kernel.org>
> =

> Anyway as another improvement for future I would suggest some API
> function with _optional_ logic, so it could be used for more PCIe

I think we need to see how many are attaching reset lines to subnodes.
If there are multiple then I agree we could add _optional. So far I see:

dtor@dtor-ws:~/kernel/linux-next (gpiod_get_from_of_node-remove)$ git grep =
'"reset"' -- drivers/pci/controller/
drivers/pci/controller/cadence/pci-j721e.c:             gpiod =3D devm_gpio=
d_get_optional(dev, "reset", GPIOD_OUT_LOW);
drivers/pci/controller/dwc/pci-keystone.c:      gpiod =3D devm_gpiod_get_op=
tional(dev, "reset",
drivers/pci/controller/dwc/pci-meson.c: mp->reset_gpio =3D devm_gpiod_get(d=
ev, "reset", GPIOD_OUT_LOW);
drivers/pci/controller/dwc/pcie-dw-rockchip.c:  rockchip->rst_gpio =3D devm=
_gpiod_get_optional(&pdev->dev, "reset",
drivers/pci/controller/dwc/pcie-fu740.c:        afp->reset =3D devm_gpiod_g=
et_optional(dev, "reset", GPIOD_OUT_LOW);
drivers/pci/controller/dwc/pcie-intel-gw.c:     pcie->reset_gpio =3D devm_g=
piod_get(dev, "reset", GPIOD_OUT_LOW);
drivers/pci/controller/dwc/pcie-keembay.c:      pcie->reset =3D devm_gpiod_=
get(dev, "reset", GPIOD_OUT_HIGH);
drivers/pci/controller/dwc/pcie-qcom-ep.c:      pcie_ep->reset =3D devm_gpi=
od_get(dev, "reset", GPIOD_IN);
drivers/pci/controller/dwc/pcie-tegra194.c:     pcie->pex_rst_gpiod =3D dev=
m_gpiod_get(pcie->dev, "reset", GPIOD_IN);
drivers/pci/controller/pci-aardvark.c:  pcie->reset_gpio =3D devm_gpiod_get=
_optional(dev, "reset", GPIOD_OUT_LOW);
drivers/pci/controller/pci-tegra.c:                                        =
            "reset",
drivers/pci/controller/pcie-apple.c:                                   "res=
et", 0, GPIOD_OUT_LOW, "PERST#");
drivers/pci/controller/pcie-mt7621.c:   port->gpio_rst =3D devm_gpiod_get_i=
ndex_optional(dev, "reset", slot,

So majority have reset lines attached to the "main" node and thus can use
devm_gpiod_get_optional().

Thanks.

-- =

Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
