Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08473ECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 20:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilOvix/RyuArml6C1lbou5wymGkTkqSHVsc0OB3oUNY=; b=sd5XmMrqztexfL
	HecQfCA0VfA0AnaExHeiyzSu2x+wIzdz/BCWRgGaFdBEzeq+rgkUjvmenSLlNFqD5InRtwYixt3rj
	A856u4Wimfy91vqCWxf8ujkWAxy2rNq07ZGRkJYV7pXuhid4LInpfhi6WT3KiK3U33AV0iekwBNRj
	QYhMso9Ndk4SkSEr4wGbgxQViHpQBZyElhMMpnYamgfxquWwo6CV80unxgoUdn1x7TPdsTPN+akhD
	AoYzM0L5l30p01K6KKpNeNJLFF75O7CTkvQiRE+a2+yu2phP/idBlpTt+xXrcWjqiXQc9YhGyT2zr
	k/Grk+IWlZGF3QrFFV3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVIUv-00A8tS-Uc; Mon, 05 Sep 2022 20:15:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVIAv-009k5C-TJ; Mon, 05 Sep 2022 19:54:31 +0000
Received: by mail-pl1-x633.google.com with SMTP id jm11so9239053plb.13;
        Mon, 05 Sep 2022 12:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=zxa96jF7Tq2NFS5Z0f+Vbe6tPHaqlTK7+tACu1Wc1bY=;
        b=p+w40zBKb360cS3t/20RQ9fj87kNmL9+wV2DVi2rkEnZbxImbIJc7pte6gUegPMA8a
         sFBB5aUkvaOM6b3Kj9qmd2ut1NKgO+CDhyFT91dG8+KUVoVf0gInhE/UOnfhB92XkSNY
         u8qMra/sYBIyNm2Awyf4P1TWUIjbeQASP/d7P9T5CM2s7DH926t2/T3HcNVk1DoW+UGS
         v796lRquHF7Qmw7ptQ1DqA4ajtoKb1+hxfBI6rfUByvolTPU6//4uMw0nmTfqEuWbj/R
         2Evodr6uEdppBL0mwTkx6onhEejt0ETyPcrx+UWGe+X8/pqjNco8n2BX6gqU3Djw+OmE
         nbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zxa96jF7Tq2NFS5Z0f+Vbe6tPHaqlTK7+tACu1Wc1bY=;
        b=wTm5nSimZDZgepEi4NOT26VsCvccUt574fPnYrd5UMNGavYN+Lq7rJ0E1tY6nU6uXe
         8gqIwBHi5DoNabVatY7goTxFZDuteGlbhdaYTaUImENrf4aBxMVsdcSHLRZQ0AbXR4qc
         uONfZML9OzSBZVrU9JrxcbQLrYDtaG6JSXeqZou4aoq9rBVpuQpZkOqMqI5bFrGVXR+Z
         9FKxD8MC408NChGrq1+m809XXs2NUOwHUlfVlbQy+RtfAVXP6cErB7WLkLNGULNCHodM
         34IkL0Cmy1pMShoxGQALljl/wEdhMJSlDJXiCElsVxiwKX22F8OODnVtr+zEgeRfdChD
         /XEw==
X-Gm-Message-State: ACgBeo2vL0AWfonl2odhF3W55N66ydq3PBDCIf1fXXDv6CCVO1p2A80w
	h6Y+KgNuW629izHeECavMv8=
X-Google-Smtp-Source: AA6agR5Cv7sHKUo7MkZvN9NCQW+TEQYIAszXUVs54FMP1ugGloikm17da8wbNClAm9HOmIskUrqfng==
X-Received: by 2002:a17:903:248:b0:172:7520:db07 with SMTP id j8-20020a170903024800b001727520db07mr50029962plh.76.1662407666780;
        Mon, 05 Sep 2022 12:54:26 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902dace00b001754a3c5404sm7987874plx.212.2022.09.05.12.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 12:54:26 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:54:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
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
	Bjorn Helgaas <bhelgaas@google.com>,
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
	USB <linux-usb@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-tegra <linux-tegra@vger.kernel.org>,
	"open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 06/11] PCI: aardvark: switch to using
 devm_gpiod_get_optional()
Message-ID: <YxZT7tDhW/7T+Snl@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
 <20220905070046.46nlhczkck2ufr4x@pali>
 <CAHp75VcFv7ipLqXmOwbXpY-_ccYNA9PgF0h4T8RY1Z-UNNpaTg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VcFv7ipLqXmOwbXpY-_ccYNA9PgF0h4T8RY1Z-UNNpaTg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_125430_032455_48B8D4EC 
X-CRM114-Status: GOOD (  23.82  )
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

On Mon, Sep 05, 2022 at 01:47:41PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 10:02 AM Pali Roh=E1r <pali@kernel.org> wrote:
> > On Sunday 04 September 2022 23:30:58 Dmitry Torokhov wrote:
> > > I would like to stop exporting OF-specific devm_gpiod_get_from_of_nod=
e()
> > > so that gpiolib can be cleaned a bit, so let's switch to the generic
> > > device property API.
> > >
> > > I believe that the only reason the driver, instead of the standard
> > > devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
> > > because it wanted to set up a pretty consumer name for the GPIO,
> >
> > IIRC consumer name is not used at all.
> =

> It's. The user space tools use it as a label. So, GPIO line can have
> "name" (this is provider specific) and "label" (which is consumer
> specific, i.o.w. how we use this line).
> =

> ...
> =

> > > +             if (ret !=3D -EPROBE_DEFER)
> > > +                     dev_err(dev, "Failed to get reset-gpio: %i\n",
> > > +                             ret);
> > > +             return ret;
> =

> I understand that in the input subsystem maintainer's hat you don't
> like dev_err_probe(), but it's a good case to have it here.

The driver currently does not use this API, so I elected not to
introduce it in this series.

Thanks,

-- =

Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
