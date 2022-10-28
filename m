Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27FEFA373D
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Oct 2022 01:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGFKwI/WVf9utJrnCyxNsxXNLBQyZDZ3rEl62WlkqQI=; b=hi3kLFoNs7bZSC
	o8iaf75xjrV0gt0kpoD63MRQiOlhm9lx7G+Y1oth86FheXmTgSVY/6/zO7blW0oXtc8L06xdhphi9
	1H8cjx/T1YihbTqbZZPVsmFoiwXNShd6jRiJMHFMFqeM+O94G2w6QEcMAme0umnO43Z1jPNZfAhKN
	3lAuNBeUCLLNJmABPcLEwatN+bY0lI1Xx9CaKi/emE+DM8g6dgT3BDa2ilnvf6ANjJfmPUtLEB/g1
	R0cxorVeuQHpF6AOaj6t2k4TALor5bM4IVOg9Xr++DcU9Ir/FwPdUqiiCsIopq1lQcuh94mIMWw3R
	bNFxE68sMEks8n/WiHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooDpi-00FM17-Kb; Fri, 28 Oct 2022 01:06:50 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooDpX-00FLza-Hv; Fri, 28 Oct 2022 01:06:41 +0000
Received: by mail-pf1-x429.google.com with SMTP id e4so3523106pfl.2;
        Thu, 27 Oct 2022 18:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eouvp87d3Uwj62ptbIwj2FltIDQrDKmm7rl+pdi32U0=;
        b=nQ7weogHhMIC9v9rAl3TVZ1zfLs3IGvA3QKHPCFBZ+KojUNUj5TChT+OvOY12ityd8
         VbE20EYGCMWZidXQ0mA4iREKWBtYaSnvAUNEf/MGSFONDmzlPI+MR4CrUM9ksmAsrDKt
         cj+aWdebIPLIeH6IbKuwGrCytZHTwYkz2OUKYh4KijicqkVXtFp7vt0bi0LKmFm6i4xU
         q4LDtjxwFqoNAonlD9dnY2gWjZ01CSB3ruJJV2hDr7cYI/uKy5RyQ+vTowUxUWeVa6zy
         zJdma15Tr6xjC12xRbPs+cXXQMqUWSrtgiCQqqToh1CNrevC/C1rFj6Z+ww6/oTseywE
         yduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eouvp87d3Uwj62ptbIwj2FltIDQrDKmm7rl+pdi32U0=;
        b=47L0KGPSzLaNu6ZriCHniBkfq0xaNHrA7KRpjKucMJ/IHeJ5R3gggYC1oR4BmGql0t
         5EvuQkQoc5gn4AOZSZWDYl00tpNizpPK8MgxVZIpUWAQj+1AGzq1MCy5n9D4FeXm203R
         Eq92la71wB2eAZyH4R/vFPoRa4GXTGexI6Ydi7QkoZviFYsZRM+tbOUSce/aWKGCK3sj
         YO20CC9S6p31dCwDwWpQDQXVqYSHe8mN9DhOsP/sHUyHwjyOJwpGutZERe9aaMYaEL/n
         uawoNxyXAEtG737MNAyfpVQeMhpslnNYSWdMZcBYm/p5DXA66jjjSAvapKcbLlX8sxTD
         P/jA==
X-Gm-Message-State: ACrzQf3P2PbGydCa4PKofwqLEAuxKJOkoSI/nKVdg1Kj1ODXyq28367S
	EGcCmmAkSfDPIm285dNroWI=
X-Google-Smtp-Source: AMsMyM71t2M2+k7329f4iPqjn+WDD27m67jwDQ968XupuMJUSxT0+/ISWLqKZwmQAQWuSE8GPvBuVA==
X-Received: by 2002:a63:1917:0:b0:43c:1471:52b7 with SMTP id z23-20020a631917000000b0043c147152b7mr43836410pgl.522.1666919195743;
        Thu, 27 Oct 2022 18:06:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:ea9a:801b:ed52:2db1])
        by smtp.gmail.com with ESMTPSA id u19-20020a170902e21300b0017f57787a4asm1747996plb.229.2022.10.27.18.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 18:06:35 -0700 (PDT)
Date: Thu, 27 Oct 2022 18:06:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	David Airlie <airlied@linux.ie>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Richard Weinberger <richard@nod.at>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Felipe Balbi <balbi@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: (subset) [PATCH v1 00/11] Get rid of
 [devm_]gpiod_get_from_of_node() public APIs
Message-ID: <Y1srFi6mJGl5/3gi@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <166687787352.847482.10005684512699510391.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <166687787352.847482.10005684512699510391.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_180639_634604_CCE8A4F5 
X-CRM114-Status: GOOD (  17.21  )
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

Hi Lorenzo,

On Thu, Oct 27, 2022 at 03:38:11PM +0200, Lorenzo Pieralisi wrote:
> On Sun, 4 Sep 2022 23:30:52 -0700, Dmitry Torokhov wrote:
> > I would like to stop exporting OF-specific [devm_]gpiod_get_from_of_nod=
e()
> > so that gpiolib can be cleaned a bit. We can do that by switching drive=
rs
> > to use generic fwnode API ([devm_]fwnode_gpiod_get()). By doing so we o=
pen
> > the door to augmenting device tree and ACPI information through seconda=
ry
> > software properties (once we teach gpiolib how to handle those).
> > =

> > I hope that relevant maintainers will take patches through their trees =
and
> > then we could merge the last one some time after -rc1.
> > =

> > [...]
> =

> Applied to pci/tegra, thanks!
> =

> [01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
>         https://git.kernel.org/lpieralisi/pci/c/16e3f4077965

Any chance you could also pick up

 [06/11] PCI: aardvark: switch to using devm_gpiod_get_optional()
 (20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com)

 - Pali Roh=E1r has acked it.

Thanks!

-- =

Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
