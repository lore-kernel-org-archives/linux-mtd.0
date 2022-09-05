Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1D1ECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 22:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQkk4eCY9aRub6IZ/dAqIk+Tl4xtMtvMRrjhV08Icng=; b=PwkGIc1lJPbTZi
	TEoeNxoLlEL0wE8P1HHZsAOkmARrhM32zlRbTF/gzE+a4KkOC4PljQbMe7j1KySiSXLIrilAc1maB
	RQbtHKv4apBXzEB0lLNY/ZAbQTjg4HiRkJWyDdGFJrN3unVGzNB96k7sReMNs0KPYM/6gWADG5GR2
	oYJ5QFY/Dajr04LTQrcL1++ofc7ZiLnuAdva48j4F9cY5HD7Xu4ngFOmkxxpyO9JT5GX/hFDKIbY8
	lWhcTVjQTb5PumY5+pdQ/9CDgdTMXLA0pg1/i/2Pzbhq/9A7TOezsjFFIt/EkqdSwhHWKV+jeDduC
	Ww1gjd99CQsdRyo/1KeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVKud-00HRZ5-Dt; Mon, 05 Sep 2022 22:49:51 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVKub-00HRXg-5p; Mon, 05 Sep 2022 22:49:50 +0000
Received: by mail-pj1-x102e.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso13256120pjk.0;
        Mon, 05 Sep 2022 15:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=Nz+uqA7e4/P8W1+vztFIrzinPtJHEHUsBZrInKc0qlM=;
        b=QV/OF44k3joZDZETl0+ZlAcG808nTpQ+6yaZoVIx1EasnMTt4l9JtEqbk6ylV1sjPH
         CpsCnzKXD1yaRjJY8yjGFM/Rgnq9yiszyTc8TCHLEugHFhpgglTtFg/61iYR6lNKhfNX
         n+f8CJcsIFbu92wir0N7hH/bTYw1QemkS4mo8z9i7RazUS8WbaVUlDCuaya5GJBZu9IE
         QvA+bSBWFp0EO1XhWI8AaZpOPguSsXCXaTdXXwJTBB7rNsozxl6OvfDIM+wu5p0E19qV
         /OGRMYL6CRqyQ5aXHZUHHnxJTRmKFDJXhnoU6eq51SznMODXDCf9krZ5aKy7RCOTOjHC
         Ptlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Nz+uqA7e4/P8W1+vztFIrzinPtJHEHUsBZrInKc0qlM=;
        b=yvQrKTKOXvitaHfXPG9wsZdHx3HhYpzU6SUc0T1VC+fdW6VKGy3v2SymRsqP6tGC72
         0g1Ivz8NvAZNtb2OcJUU45EHoy2NHcfudWjZZq5Jb309zaT3cYbzWH6okyjpTTeauFTF
         yL6WGzrfxpG93pLbB+vyeIBoWfXxh5K+quwZ+swJU0AEL9JS5C8ahgLzS9aBzW3YpJW8
         tVCi+By++oUZ1OCyjNCOQLvBLSJhK9AhFfMD8/wqGXku+xemDP3Tn+C82tyYThaJsu8f
         HSkMJCyMuM3B+vLoVHSIpk/ul8vZSCminJHGt/xXoqHdmepGsFzLLFBVk66ESokoKK3Y
         WwTA==
X-Gm-Message-State: ACgBeo3fLL6reWj6wV5Cx7FjsjtNcjCUFS1SnhWgrxDHdiauzHSoPWS3
	jne+r4uSDDApUWo+YYvSxJw=
X-Google-Smtp-Source: AA6agR4K6lIuAxsSdVJ0oNphFJqoDM1Qz4a/ewauw+FqqlvVaYz09d/58GCWTrClE39lnwuTI3+EHg==
X-Received: by 2002:a17:902:d4c4:b0:172:f328:e474 with SMTP id o4-20020a170902d4c400b00172f328e474mr51321307plg.144.1662418187481;
        Mon, 05 Sep 2022 15:49:47 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
        by smtp.gmail.com with ESMTPSA id x10-20020a170902a38a00b0017300ec80b0sm8054511pla.308.2022.09.05.15.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 15:49:46 -0700 (PDT)
Date: Mon, 5 Sep 2022 15:49:42 -0700
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
Subject: Re: [PATCH v1 01/11] PCI: tegra: switch to using
 devm_fwnode_gpiod_get
Message-ID: <YxZ9BkBnQOUpXt/O@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
 <20220905071902.fv4uozrsttk3mosu@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220905071902.fv4uozrsttk3mosu@pali>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_154949_254745_58EE4ED0 
X-CRM114-Status: GOOD (  22.95  )
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

On Mon, Sep 05, 2022 at 09:19:02AM +0200, Pali Roh=E1r wrote:
> On Sunday 04 September 2022 23:30:53 Dmitry Torokhov wrote:
> > I would like to limit (or maybe even remove) use of
> > [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> > a bit, so let's switch to the generic device property API. It may even
> > help with handling secondary fwnodes when gpiolib is taught to handle
> > gpios described by swnodes.
> > =

> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > =

> > diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controlle=
r/pci-tegra.c
> > index 8e323e93be91..929f9363e94b 100644
> > --- a/drivers/pci/controller/pci-tegra.c
> > +++ b/drivers/pci/controller/pci-tegra.c
> > @@ -2202,10 +2202,11 @@ static int tegra_pcie_parse_dt(struct tegra_pci=
e *pcie)
> >  		 * and in this case fall back to using AFI per port register
> >  		 * to toggle PERST# SFIO line.
> >  		 */
> > -		rp->reset_gpio =3D devm_gpiod_get_from_of_node(dev, port,
> > -							     "reset-gpios", 0,
> > -							     GPIOD_OUT_LOW,
> > -							     label);
> > +		rp->reset_gpio =3D devm_fwnode_gpiod_get(dev,
> > +						       of_fwnode_handle(port),
> > +						       "reset",
> > +						       GPIOD_OUT_LOW,
> > +						       label);
> =

> Why in pci-aardvark.c for PERST# reset-gpio you have used
> devm_gpiod_get_optional() and here in pci-tegra.c you have used
> devm_fwnode_gpiod_get()? I think that PERST# logic is same in both
> drivers.

I believe Andy already answered that, but in this driver we can have
several root ports described via subnodes of dev->of_node, and reset
GPIOs are attached to those subnodes. We are forced to use
devm_fwnode_gpiod_get() instead of devm_gpiod_get_optional() as we need
to supply the exact fwnode we need to look up GPIO in, and can not infer
it from the 'dev' parameter of devm_gpiod_get().

Thanks.

-- =

Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
