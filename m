Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33812C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 20:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaWHS+QN686kUdpi2oNrlM1hTSbBkA/CYswVfgvMtjA=; b=CLsG0/LCICIHbJ
	dx74AxXmZPWWn+r92+SdcLjJLrKdvobHEDbC4yN1s+AaJe5tw2th3CC26/ZbpC1cjecSRkLDGRBUj
	sfEuvEcqOzBL7o9ndK1uJ/GBhcGg3v5dnP2ardjjQKFKk1EF1nSQTJqsE6VAk9PAbpBAz2mcZmOgM
	IWO9zOZV8mzbIVYFmURAva/2mJFrfZz8cfGQXo+hLzxi4+PJZDeTEpJDuUlTD1ChkplfvFtkzpZUp
	dn5eQFShFUSbhxKYrC9VpbM1mx1Y8z5O4WkT6ovOGYymOl0JbJgDuz3BHU1fy4X3VNBH8warrxC5Q
	mSLeS5Q5nD4dYh6QvOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHDV-00Epww-8A; Mon, 06 Mar 2023 20:13:54 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZH10-00Ejp3-E7; Mon, 06 Mar 2023 20:01:11 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so14268005pjg.4;
        Mon, 06 Mar 2023 12:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678132856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uXR1hBuNmG/TwC91AeVvsW1UVH/MwkAfhUSEnuvNaoY=;
        b=o6hZefnQYEnFw3COvoTdyyoXo9Zv4P0LTShB301lkw0/gGr+x1ou0XeYCSdcXXLXoz
         Ie/lwSIsRhh9vBh4c56fFPeCbh1Mg/u0f+SLHuOsNnA01L3iQxuD6tKvCodPDyUeqcUA
         ipzyAtvRXWR1nR5U0W8m7xh6fPIYtpAYIZVYRkCJb0GTxixFtDSEeec8W6O4TIR9SFvb
         8TyLwk+heXtYmzhntJcZ54SphmylZPrikYFa1PRdJ8V5j+VefclzJKcG1hcN/EBRiJ2z
         A5LjdstbOHhVHAVRXA7o2dTcBNuVBc27QoVtU1tjX+Yepbtmilj428R4Os2Xd6WiLWnA
         Of4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678132856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXR1hBuNmG/TwC91AeVvsW1UVH/MwkAfhUSEnuvNaoY=;
        b=H5gT6SrH83dk84HDWz55nSvIa30b0VmGlZCrfLWOya85LSa0w8rY3wzkmnKsdmBC5H
         RuYpHDiHy4PgsFngp3bUvNA3AhsI2Zc2FqQ9HXKn2L1NW0ZCA4kwxaq5J/M2uGM/+kQb
         ZzUrEPOAO5FOyKsWWpt3alt9vEAV/CszXGvBklC5C0lLPqqsK6XAj8XmrbZ9oYW9G7Ye
         jZypaEOorifSY2ivn5dZwCeXNhYop6viP2kvasVRaR0DcqeTUcdoIGSSY3sKYPhZvT2L
         XVU0NPb+l+OlSm6eegHOejK+y3voOFa5v4WNlVZVQe8XuOkKfXljUTlcne+npkQRLq29
         oRjw==
X-Gm-Message-State: AO0yUKUCU+qf/V4C1spRQynG3kgfREjgg4YJeg6UQpBsDPdCACqei/Q5
	tV1H5WsqLXa8w4UCSiKztaf3VLq0WL1rrdTShqI=
X-Google-Smtp-Source: AK7set/DxZtiZhO+z+A0Is7yokDniYYkETavBEcleYa7IPSvIEQBIV7zty9Y+UWe1CWFM73JZ5CBgh34wQSFC4iK+eg=
X-Received: by 2002:a17:90a:5993:b0:233:b520:1544 with SMTP id
 l19-20020a17090a599300b00233b5201544mr6625621pji.0.1678132856231; Mon, 06 Mar
 2023 12:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com> <20230306172109.595464-10-amit.kumar-mahapatra@amd.com>
In-Reply-To: <20230306172109.595464-10-amit.kumar-mahapatra@amd.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 6 Mar 2023 21:00:44 +0100
Message-ID: <CAOiHx=nmsAh3ADL3s0eZKpEZJqCB_POi=8YjfxrHYLEbjRfwHg@mail.gmail.com>
Subject: Re: [PATCH V5 09/15] spi: Add stacked and parallel memories support
 in SPI core
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: broonie@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, jic23@kernel.org, tudor.ambarus@microchip.com, 
	pratyush@kernel.org, Sanju.Mehta@amd.com, chin-ting_kuo@aspeedtech.com, 
	clg@kaod.org, kdasu.kdev@gmail.com, f.fainelli@gmail.com, rjui@broadcom.com, 
	sbranden@broadcom.com, eajames@linux.ibm.com, olteanv@gmail.com, 
	han.xu@nxp.com, john.garry@huawei.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, narmstrong@baylibre.com, khilman@baylibre.com, 
	matthias.bgg@gmail.com, haibo.chen@nxp.com, linus.walleij@linaro.org, 
	daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, 
	agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de, 
	krzysztof.kozlowski@linaro.org, andi@etezian.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, masahisa.kojima@linaro.org, jaswinder.singh@linaro.org, 
	rostedt@goodmis.org, mingo@redhat.com, l.stelmach@samsung.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	alex.aring@gmail.com, stefan@datenfreihafen.org, kvalo@kernel.org, 
	james.schulman@cirrus.com, david.rhodes@cirrus.com, 
	tanureal@opensource.cirrus.com, rf@opensource.cirrus.com, perex@perex.cz, 
	tiwai@suse.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	mpe@ellerman.id.au, oss@buserror.net, windhl@126.com, 
	yangyingliang@huawei.com, william.zhang@broadcom.com, 
	kursad.oney@broadcom.com, anand.gore@broadcom.com, rafal@milecki.pl, 
	git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com, 
	fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org, 
	alim.akhtar@samsung.com, ldewangan@nvidia.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, michal.simek@amd.com, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org, 
	lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, 
	michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org, 
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
	linuxppc-dev@lists.ozlabs.org, amitrkcian2002@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_120059_561694_F652AB3C 
X-CRM114-Status: GOOD (  22.22  )
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

Hi,

On Mon, 6 Mar 2023 at 18:26, Amit Kumar Mahapatra
<amit.kumar-mahapatra@amd.com> wrote:
>
> For supporting multiple CS the SPI device need to be aware of all the CS
> values. So, the "chip_select" member in the spi_device structure is now an
> array that holds all the CS values.
>
> spi_device structure now has a "cs_index_mask" member. This acts as an
> index to the chip_select array. If nth bit of spi->cs_index_mask is set
> then the driver would assert spi->chip_select[n].
>
> In parallel mode all the chip selects are asserted/de-asserted
> simultaneously and each byte of data is stored in both devices, the even
> bits in one, the odd bits in the other. The split is automatically handled
> by the GQSPI controller. The GQSPI controller supports a maximum of two
> flashes connected in parallel mode. A "multi-cs-cap" flag is added in the
> spi controntroller data, through ctlr->multi-cs-cap the spi core will make
> sure that the controller is capable of handling multiple chip selects at
> once.
>
> For supporting multiple CS via GPIO the cs_gpiod member of the spi_device
> structure is now an array that holds the gpio descriptor for each
> chipselect.
>
> Multi CS support using GPIO is not tested due to unavailability of
> necessary hardware setup.
>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  drivers/spi/spi.c       | 213 +++++++++++++++++++++++++++-------------
>  include/linux/spi/spi.h |  34 +++++--
>  2 files changed, 173 insertions(+), 74 deletions(-)
>
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 5866bf5813a4..8ec7f58fa111 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -613,7 +613,8 @@ static int spi_dev_check(struct device *dev, void *data)
>         struct spi_device *new_spi = data;
>
>         if (spi->controller == new_spi->controller &&
> -           spi_get_chipselect(spi, 0) == spi_get_chipselect(new_spi, 0))
> +           spi_get_chipselect(spi, 0) == spi_get_chipselect(new_spi, 0) &&
> +           spi_get_chipselect(spi, 1) == spi_get_chipselect(new_spi, 1))
>                 return -EBUSY;

This will only reject new devices if both chip selects are identical,
but not if they only share one, e.g. CS 1 + 2 vs 1 + 3, or 1 + 2 vs
only 2, or if the order is different (1 + 2 vs 2 + 1 - haven't read
the code too close to know if this is allowed/possible).

Regards,
Jonas

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
