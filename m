Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F6EC636CC
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Feb 2023 15:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CzheU1JUn7IQXCLICJtc/aIUDS6gIDJdxbxH5uflv8=; b=GjBRdBhlKwRYOE
	QWgkQfwS5V5DwYHTJ3VTCfKKZqdk9gXaEco6vqt7y8tVK3zKQy+GKb1YCxVHVY9lD9k/f4BWimKv9
	Mbmha9jrh+U3j3+F41cmczsMufGDJ72ti7nX3UzSJV6UmLRTFOXIkrR8HawcgEQL86KD+kxhTUqGR
	CKItjNzPkSo+QmJb6H5r+1EAbP8k6WQU9QzlVCxoJcVijFZfB5QA0pOt36wppiAAiMu7RZStR2cR/
	b3Zf5BDAjnwViRPjVZmhOj+CFw5lLgkGaZJT7lmMguzg6jyxGrZpiMq6ww9cDLAPtteBjQMIBOloM
	CjA81G6fIpB5xnxkYcbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOKer-005K5H-OI; Sat, 04 Feb 2023 15:40:53 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOKeh-005K3L-4D; Sat, 04 Feb 2023 15:40:48 +0000
Received: by mail-lf1-x131.google.com with SMTP id br9so11875992lfb.4;
        Sat, 04 Feb 2023 07:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YydKHi7IKLRLjSZ7QmUQxGMalJDyjROGlDvXD94en0w=;
        b=IMIEJXYv0kq1mX+flnksjgW2ggOWk3cwhrdk0ICX0C5AjRGyqZ5zRJ5yCI+wVeqrOW
         A2hoBB4G+M7eR3Xsdxt7LU3Q9+zSgACIZ8JvTkpSueElho1dlf3zKYYSPdlFfw2ob4ns
         gCRLukxbwT9G7q+V79Ja6Sv+Aqx5XmBOShEBees787puOvjMARHxotEXLpXknR9H0gbG
         /8FDj6dKWCdjH8WoToKQEDGCrwgi/Gow29lJoDg2WxcNi0CnbCtTxEDgOsPzWlQVCh5D
         FWHlaxWE1Xe74UGNADwXr01RXezoO9Z8svcKSQSwqmgKiqWRId6/Po5Jz1UN2U39kiMw
         TEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YydKHi7IKLRLjSZ7QmUQxGMalJDyjROGlDvXD94en0w=;
        b=lyffgwYGaIaRsMo6R94xz1+47VZGmBzk76sMfYTlJjrJyiOM0NqWfazeXh415z1O1G
         xqw9l5Qwl9DaB4ePiH6qoMLCD917JEeMt2EDek1HUPsSERpK+ngpVO9Ma9jahN03+uaY
         vi4ikoGApSGrpcUL8BkgPg+Smx7J+u1aC4iGPTBNCKnIJDC2Yswbf8Dd60mLmJCTvpvL
         eFcWWTFY63nNjtZ1PMP5Vqj5z1IrpG+AGp+ALr8A4jrkplJxmkw8W6SDDwJC+6rrpBkR
         HF75MjDSMvyAcMXQg0ijmx8SpYEd4uZ2KszxQuKFQGl36q+B+HM7gdKZOrXMJhm3PCNk
         gG4w==
X-Gm-Message-State: AO0yUKVyh2+9dv/9PikmDqk6yhb5sSBD6o0DqTOZNHob4r5UDUS5mIac
	cSULO5REjQBZdGFFykuDXR8=
X-Google-Smtp-Source: AK7set8VeKzGy5i72HJlSGmMdc4eN9/jYyOZSOgKErYldOc0AeAP+OfWgKjhcdDJN+M0hVdBIrtw4Q==
X-Received: by 2002:a05:6512:4010:b0:4b6:f22c:7dc9 with SMTP id br16-20020a056512401000b004b6f22c7dc9mr4865925lfb.57.1675525236452;
        Sat, 04 Feb 2023 07:40:36 -0800 (PST)
Received: from mobilestation ([95.79.133.202])
        by smtp.gmail.com with ESMTPSA id u7-20020ac243c7000000b004d857788b23sm417629lfl.281.2023.02.04.07.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 07:40:35 -0800 (PST)
Date: Sat, 4 Feb 2023 18:40:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: broonie@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, jic23@kernel.org, tudor.ambarus@microchip.com,
	pratyush@kernel.org, sanju.mehta@amd.com,
	chin-ting_kuo@aspeedtech.com, clg@kaod.org, kdasu.kdev@gmail.com,
	f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
	eajames@linux.ibm.com, olteanv@gmail.com, han.xu@nxp.com,
	john.garry@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	narmstrong@baylibre.com, khilman@baylibre.com,
	matthias.bgg@gmail.com, haibo.chen@nxp.com,
	linus.walleij@linaro.org, daniel@zonque.org,
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr, agross@kernel.org,
	bjorn.andersson@linaro.org, heiko@sntech.de,
	krzysztof.kozlowski@linaro.org, andi@etezian.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	masahisa.kojima@linaro.org, jaswinder.singh@linaro.org,
	rostedt@goodmis.org, mingo@redhat.com, l.stelmach@samsung.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, git@amd.com, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	kernel@pengutronix.de, linux-imx@nxp.com, ldewangan@nvidia.com,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	michal.simek@amd.com, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	netdev@vger.kernel.org, linux-wpan@vger.kernel.org,
	libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-mtd@lists.infradead.org, Michael.Hennerich@analog.com,
	linux-iio@vger.kernel.org, michael@walle.cc, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, amitrkcian2002@gmail.com,
	Dhruva Gole <d-gole@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	William Zhang <william.zhang@broadcom.com>
Subject: Re: [PATCH v3 01/13] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Message-ID: <20230204153517.7d4jiqpgivktek6k@mobilestation>
References: <20230202152258.512973-1-amit.kumar-mahapatra@amd.com>
 <20230202152258.512973-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230202152258.512973-2-amit.kumar-mahapatra@amd.com>
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

On Thu, Feb 02, 2023 at 08:52:46PM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpi=
od
> members of struct spi_device to be an array. But changing the type of the=
se
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpi=
od
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.
> =


> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de> # Rockchip drivers
> Reviewed-by: Michal Simek <michal.simek@amd.com>
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org> # Aspeed driver
> Reviewed-by: Dhruva Gole <d-gole@ti.com> # SPI Cadence QSPI
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com> # spi-stm32-qs=
pi
> Acked-by: William Zhang <william.zhang@broadcom.com> # bcm63xx-hsspi driv=
er

How come my Rb-tag is missing here? You can find my message in
response to v2 of this patch.
https://lore.kernel.org/linux-spi/20230123145953.ytaaq3x4tetgepyf@mobilesta=
tion/
Please be more attentive.

One more time for the DW SSI part:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  drivers/spi/spi-altera-core.c     |  2 +-
>  drivers/spi/spi-amd.c             |  4 ++--
>  drivers/spi/spi-ar934x.c          |  2 +-
>  drivers/spi/spi-armada-3700.c     |  4 ++--
>  drivers/spi/spi-aspeed-smc.c      | 13 +++++++------
>  drivers/spi/spi-at91-usart.c      |  2 +-
>  drivers/spi/spi-ath79.c           |  4 ++--
>  drivers/spi/spi-atmel.c           | 26 +++++++++++++-------------
>  drivers/spi/spi-au1550.c          |  4 ++--
>  drivers/spi/spi-axi-spi-engine.c  |  2 +-
>  drivers/spi/spi-bcm-qspi.c        | 10 +++++-----
>  drivers/spi/spi-bcm2835.c         | 19 ++++++++++---------
>  drivers/spi/spi-bcm2835aux.c      |  4 ++--
>  drivers/spi/spi-bcm63xx-hsspi.c   | 22 +++++++++++-----------
>  drivers/spi/spi-bcm63xx.c         |  2 +-
>  drivers/spi/spi-cadence-quadspi.c |  5 +++--
>  drivers/spi/spi-cadence-xspi.c    |  4 ++--
>  drivers/spi/spi-cadence.c         |  4 ++--
>  drivers/spi/spi-cavium.c          |  8 ++++----
>  drivers/spi/spi-coldfire-qspi.c   |  8 ++++----
>  drivers/spi/spi-davinci.c         | 18 +++++++++---------
>  drivers/spi/spi-dln2.c            |  6 +++---
>  drivers/spi/spi-dw-core.c         |  2 +-
>  drivers/spi/spi-dw-mmio.c         |  4 ++--
>  drivers/spi/spi-falcon.c          |  2 +-
>  drivers/spi/spi-fsi.c             |  2 +-
>  drivers/spi/spi-fsl-dspi.c        | 16 ++++++++--------
>  drivers/spi/spi-fsl-espi.c        |  6 +++---
>  drivers/spi/spi-fsl-lpspi.c       |  2 +-
>  drivers/spi/spi-fsl-qspi.c        |  6 +++---
>  drivers/spi/spi-fsl-spi.c         |  2 +-
>  drivers/spi/spi-geni-qcom.c       |  6 +++---
>  drivers/spi/spi-gpio.c            |  4 ++--
>  drivers/spi/spi-gxp.c             |  4 ++--
>  drivers/spi/spi-hisi-sfc-v3xx.c   |  2 +-
>  drivers/spi/spi-img-spfi.c        | 14 +++++++-------
>  drivers/spi/spi-imx.c             | 30 +++++++++++++++---------------
>  drivers/spi/spi-ingenic.c         |  4 ++--
>  drivers/spi/spi-intel.c           |  2 +-
>  drivers/spi/spi-jcore.c           |  4 ++--
>  drivers/spi/spi-lantiq-ssc.c      |  6 +++---
>  drivers/spi/spi-mem.c             |  4 ++--
>  drivers/spi/spi-meson-spicc.c     |  2 +-
>  drivers/spi/spi-microchip-core.c  |  6 +++---
>  drivers/spi/spi-mpc512x-psc.c     |  8 ++++----
>  drivers/spi/spi-mpc52xx.c         |  2 +-
>  drivers/spi/spi-mt65xx.c          |  6 +++---
>  drivers/spi/spi-mt7621.c          |  2 +-
>  drivers/spi/spi-mux.c             |  8 ++++----
>  drivers/spi/spi-mxic.c            | 10 +++++-----
>  drivers/spi/spi-mxs.c             |  2 +-
>  drivers/spi/spi-npcm-fiu.c        | 20 ++++++++++----------
>  drivers/spi/spi-nxp-fspi.c        | 10 +++++-----
>  drivers/spi/spi-omap-100k.c       |  2 +-
>  drivers/spi/spi-omap-uwire.c      |  8 ++++----
>  drivers/spi/spi-omap2-mcspi.c     | 24 ++++++++++++------------
>  drivers/spi/spi-orion.c           |  4 ++--
>  drivers/spi/spi-pci1xxxx.c        |  4 ++--
>  drivers/spi/spi-pic32-sqi.c       |  2 +-
>  drivers/spi/spi-pic32.c           |  4 ++--
>  drivers/spi/spi-pl022.c           |  4 ++--
>  drivers/spi/spi-pxa2xx.c          |  6 +++---
>  drivers/spi/spi-qcom-qspi.c       |  2 +-
>  drivers/spi/spi-rb4xx.c           |  2 +-
>  drivers/spi/spi-rockchip-sfc.c    |  2 +-
>  drivers/spi/spi-rockchip.c        | 26 ++++++++++++++------------
>  drivers/spi/spi-rspi.c            | 10 +++++-----
>  drivers/spi/spi-s3c64xx.c         |  2 +-
>  drivers/spi/spi-sc18is602.c       |  4 ++--
>  drivers/spi/spi-sh-msiof.c        |  6 +++---
>  drivers/spi/spi-sh-sci.c          |  2 +-
>  drivers/spi/spi-sifive.c          |  6 +++---
>  drivers/spi/spi-sn-f-ospi.c       |  2 +-
>  drivers/spi/spi-st-ssc4.c         |  2 +-
>  drivers/spi/spi-stm32-qspi.c      | 12 ++++++------
>  drivers/spi/spi-sun4i.c           |  2 +-
>  drivers/spi/spi-sun6i.c           |  2 +-
>  drivers/spi/spi-synquacer.c       |  6 +++---
>  drivers/spi/spi-tegra114.c        | 28 ++++++++++++++--------------
>  drivers/spi/spi-tegra20-sflash.c  |  2 +-
>  drivers/spi/spi-tegra20-slink.c   |  6 +++---
>  drivers/spi/spi-tegra210-quad.c   |  8 ++++----
>  drivers/spi/spi-ti-qspi.c         | 16 ++++++++--------
>  drivers/spi/spi-topcliff-pch.c    |  4 ++--
>  drivers/spi/spi-wpcm-fiu.c        | 12 ++++++------
>  drivers/spi/spi-xcomm.c           |  2 +-
>  drivers/spi/spi-xilinx.c          |  6 +++---
>  drivers/spi/spi-xlp.c             |  4 ++--
>  drivers/spi/spi-zynq-qspi.c       |  2 +-
>  drivers/spi/spi-zynqmp-gqspi.c    |  2 +-
>  drivers/spi/spidev.c              |  6 +++---
>  include/trace/events/spi.h        | 10 +++++-----
>  92 files changed, 315 insertions(+), 310 deletions(-)
> =

> diff --git a/drivers/spi/spi-altera-core.c b/drivers/spi/spi-altera-core.c
> index 94fe6bf1b9a6..87e37f48f196 100644
> --- a/drivers/spi/spi-altera-core.c
> +++ b/drivers/spi/spi-altera-core.c
> @@ -80,7 +80,7 @@ static void altera_spi_set_cs(struct spi_device *spi, b=
ool is_high)
>  		altr_spi_writel(hw, ALTERA_SPI_TARGET_SEL, 0);
>  	} else {
>  		altr_spi_writel(hw, ALTERA_SPI_TARGET_SEL,
> -				BIT(spi->chip_select));
> +				BIT(spi_get_chipselect(spi, 0)));
>  		hw->imr |=3D ALTERA_SPI_CONTROL_SSO_MSK;
>  		altr_spi_writel(hw, ALTERA_SPI_CONTROL, hw->imr);
>  	}
> diff --git a/drivers/spi/spi-amd.c b/drivers/spi/spi-amd.c
> index bfc3ab5f39ea..fecead757a3c 100644
> --- a/drivers/spi/spi-amd.c
> +++ b/drivers/spi/spi-amd.c
> @@ -347,7 +347,7 @@ static inline int amd_spi_fifo_xfer(struct amd_spi *a=
md_spi,
>  	case AMD_SPI_V1:
>  		break;
>  	case AMD_SPI_V2:
> -		amd_spi_clear_chip(amd_spi, message->spi->chip_select);
> +		amd_spi_clear_chip(amd_spi, spi_get_chipselect(message->spi, 0));
>  		break;
>  	default:
>  		return -ENODEV;
> @@ -364,7 +364,7 @@ static int amd_spi_master_transfer(struct spi_master =
*master,
>  	struct amd_spi *amd_spi =3D spi_master_get_devdata(master);
>  	struct spi_device *spi =3D msg->spi;
>  =

> -	amd_spi_select_chip(amd_spi, spi->chip_select);
> +	amd_spi_select_chip(amd_spi, spi_get_chipselect(spi, 0));
>  =

>  	/*
>  	 * Extract spi_transfers from the spi message and
> diff --git a/drivers/spi/spi-ar934x.c b/drivers/spi/spi-ar934x.c
> index 4a6ecaa0a9c9..41ef6cf5c585 100644
> --- a/drivers/spi/spi-ar934x.c
> +++ b/drivers/spi/spi-ar934x.c
> @@ -125,7 +125,7 @@ static int ar934x_spi_transfer_one_message(struct spi=
_controller *ctlr,
>  				iowrite32(reg, sp->base + AR934X_SPI_DATAOUT);
>  			}
>  =

> -			reg =3D AR934X_SPI_SHIFT_VAL(spi->chip_select, term,
> +			reg =3D AR934X_SPI_SHIFT_VAL(spi_get_chipselect(spi, 0), term,
>  						   trx_cur * 8);
>  			iowrite32(reg, sp->base + AR934X_SPI_REG_SHIFT_CTRL);
>  			stat =3D readl_poll_timeout(
> diff --git a/drivers/spi/spi-armada-3700.c b/drivers/spi/spi-armada-3700.c
> index 4d554b948d71..8584045fc17b 100644
> --- a/drivers/spi/spi-armada-3700.c
> +++ b/drivers/spi/spi-armada-3700.c
> @@ -437,9 +437,9 @@ static void a3700_spi_set_cs(struct spi_device *spi, =
bool enable)
>  	struct a3700_spi *a3700_spi =3D spi_controller_get_devdata(spi->control=
ler);
>  =

>  	if (!enable)
> -		a3700_spi_activate_cs(a3700_spi, spi->chip_select);
> +		a3700_spi_activate_cs(a3700_spi, spi_get_chipselect(spi, 0));
>  	else
> -		a3700_spi_deactivate_cs(a3700_spi, spi->chip_select);
> +		a3700_spi_deactivate_cs(a3700_spi, spi_get_chipselect(spi, 0));
>  }
>  =

>  static void a3700_spi_header_set(struct a3700_spi *a3700_spi)
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 873ff2cf72c9..b7a9ec550ba1 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -296,7 +296,7 @@ static const struct aspeed_spi_data ast2400_spi_data;
>  static int do_aspeed_spi_exec_op(struct spi_mem *mem, const struct spi_m=
em_op *op)
>  {
>  	struct aspeed_spi *aspi =3D spi_controller_get_devdata(mem->spi->master=
);
> -	struct aspeed_spi_chip *chip =3D &aspi->chips[mem->spi->chip_select];
> +	struct aspeed_spi_chip *chip =3D &aspi->chips[spi_get_chipselect(mem->s=
pi, 0)];
>  	u32 addr_mode, addr_mode_backup;
>  	u32 ctl_val;
>  	int ret =3D 0;
> @@ -377,7 +377,8 @@ static const char *aspeed_spi_get_name(struct spi_mem=
 *mem)
>  	struct aspeed_spi *aspi =3D spi_controller_get_devdata(mem->spi->master=
);
>  	struct device *dev =3D aspi->dev;
>  =

> -	return devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev), mem->spi=
->chip_select);
> +	return devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev),
> +			      spi_get_chipselect(mem->spi, 0));
>  }
>  =

>  struct aspeed_spi_window {
> @@ -553,7 +554,7 @@ static int aspeed_spi_do_calibration(struct aspeed_sp=
i_chip *chip);
>  static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
>  {
>  	struct aspeed_spi *aspi =3D spi_controller_get_devdata(desc->mem->spi->=
master);
> -	struct aspeed_spi_chip *chip =3D &aspi->chips[desc->mem->spi->chip_sele=
ct];
> +	struct aspeed_spi_chip *chip =3D &aspi->chips[spi_get_chipselect(desc->=
mem->spi, 0)];
>  	struct spi_mem_op *op =3D &desc->info.op_tmpl;
>  	u32 ctl_val;
>  	int ret =3D 0;
> @@ -620,7 +621,7 @@ static ssize_t aspeed_spi_dirmap_read(struct spi_mem_=
dirmap_desc *desc,
>  				      u64 offset, size_t len, void *buf)
>  {
>  	struct aspeed_spi *aspi =3D spi_controller_get_devdata(desc->mem->spi->=
master);
> -	struct aspeed_spi_chip *chip =3D &aspi->chips[desc->mem->spi->chip_sele=
ct];
> +	struct aspeed_spi_chip *chip =3D &aspi->chips[spi_get_chipselect(desc->=
mem->spi, 0)];
>  =

>  	/* Switch to USER command mode if mapping window is too small */
>  	if (chip->ahb_window_size < offset + len) {
> @@ -670,7 +671,7 @@ static int aspeed_spi_setup(struct spi_device *spi)
>  {
>  	struct aspeed_spi *aspi =3D spi_controller_get_devdata(spi->master);
>  	const struct aspeed_spi_data *data =3D aspi->data;
> -	unsigned int cs =3D spi->chip_select;
> +	unsigned int cs =3D spi_get_chipselect(spi, 0);
>  	struct aspeed_spi_chip *chip =3D &aspi->chips[cs];
>  =

>  	chip->aspi =3D aspi;
> @@ -697,7 +698,7 @@ static int aspeed_spi_setup(struct spi_device *spi)
>  static void aspeed_spi_cleanup(struct spi_device *spi)
>  {
>  	struct aspeed_spi *aspi =3D spi_controller_get_devdata(spi->master);
> -	unsigned int cs =3D spi->chip_select;
> +	unsigned int cs =3D spi_get_chipselect(spi, 0);
>  =

>  	aspeed_spi_chip_enable(aspi, cs, false);
>  =

> diff --git a/drivers/spi/spi-at91-usart.c b/drivers/spi/spi-at91-usart.c
> index fab9d223e24a..ca05c42ae4a5 100644
> --- a/drivers/spi/spi-at91-usart.c
> +++ b/drivers/spi/spi-at91-usart.c
> @@ -390,7 +390,7 @@ static int at91_usart_spi_setup(struct spi_device *sp=
i)
>  =

>  	dev_dbg(&spi->dev,
>  		"setup: bpw %u mode 0x%x -> mr %d %08x\n",
> -		spi->bits_per_word, spi->mode, spi->chip_select, mr);
> +		spi->bits_per_word, spi->mode, spi_get_chipselect(spi, 0), mr);
>  =

>  	return 0;
>  }
> diff --git a/drivers/spi/spi-ath79.c b/drivers/spi/spi-ath79.c
> index 795e88dbef1b..6c2001cfa3d1 100644
> --- a/drivers/spi/spi-ath79.c
> +++ b/drivers/spi/spi-ath79.c
> @@ -71,7 +71,7 @@ static void ath79_spi_chipselect(struct spi_device *spi=
, int is_active)
>  {
>  	struct ath79_spi *sp =3D ath79_spidev_to_sp(spi);
>  	int cs_high =3D (spi->mode & SPI_CS_HIGH) ? is_active : !is_active;
> -	u32 cs_bit =3D AR71XX_SPI_IOC_CS(spi->chip_select);
> +	u32 cs_bit =3D AR71XX_SPI_IOC_CS(spi_get_chipselect(spi, 0));
>  =

>  	if (cs_high)
>  		sp->ioc_base |=3D cs_bit;
> @@ -140,7 +140,7 @@ static int ath79_exec_mem_op(struct spi_mem *mem,
>  	struct ath79_spi *sp =3D ath79_spidev_to_sp(mem->spi);
>  =

>  	/* Ensures that reading is performed on device connected to hardware cs=
0 */
> -	if (mem->spi->chip_select || mem->spi->cs_gpiod)
> +	if (spi_get_chipselect(mem->spi, 0) || spi_get_csgpiod(mem->spi, 0))
>  		return -ENOTSUPP;
>  =

>  	/* Only use for fast-read op. */
> diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
> index 5c5678f065f3..7b17604a7760 100644
> --- a/drivers/spi/spi-atmel.c
> +++ b/drivers/spi/spi-atmel.c
> @@ -327,10 +327,10 @@ static void cs_activate(struct atmel_spi *as, struc=
t spi_device *spi)
>  	int chip_select;
>  	u32 mr;
>  =

> -	if (spi->cs_gpiod)
> +	if (spi_get_csgpiod(spi, 0))
>  		chip_select =3D as->native_cs_for_gpio;
>  	else
> -		chip_select =3D spi->chip_select;
> +		chip_select =3D spi_get_chipselect(spi, 0);
>  =

>  	if (atmel_spi_is_v2(as)) {
>  		spi_writel(as, CSR0 + 4 * chip_select, asd->csr);
> @@ -378,10 +378,10 @@ static void cs_deactivate(struct atmel_spi *as, str=
uct spi_device *spi)
>  	int chip_select;
>  	u32 mr;
>  =

> -	if (spi->cs_gpiod)
> +	if (spi_get_csgpiod(spi, 0))
>  		chip_select =3D as->native_cs_for_gpio;
>  	else
> -		chip_select =3D spi->chip_select;
> +		chip_select =3D spi_get_chipselect(spi, 0);
>  =

>  	/* only deactivate *this* device; sometimes transfers to
>  	 * another device may be active when this routine is called.
> @@ -394,7 +394,7 @@ static void cs_deactivate(struct atmel_spi *as, struc=
t spi_device *spi)
>  =

>  	dev_dbg(&spi->dev, "DEactivate NPCS, mr %08x\n", mr);
>  =

> -	if (!spi->cs_gpiod)
> +	if (!spi_get_csgpiod(spi, 0))
>  		spi_writel(as, CR, SPI_BIT(LASTXFER));
>  }
>  =

> @@ -800,10 +800,10 @@ static int atmel_spi_set_xfer_speed(struct atmel_sp=
i *as,
>  	unsigned long		bus_hz;
>  	int chip_select;
>  =

> -	if (spi->cs_gpiod)
> +	if (spi_get_csgpiod(spi, 0))
>  		chip_select =3D as->native_cs_for_gpio;
>  	else
> -		chip_select =3D spi->chip_select;
> +		chip_select =3D spi_get_chipselect(spi, 0);
>  =

>  	/* v1 chips start out at half the peripheral bus speed. */
>  	bus_hz =3D as->spi_clk;
> @@ -1189,7 +1189,7 @@ static int atmel_spi_setup(struct spi_device *spi)
>  	as =3D spi_controller_get_devdata(spi->controller);
>  =

>  	/* see notes above re chipselect */
> -	if (!spi->cs_gpiod && (spi->mode & SPI_CS_HIGH)) {
> +	if (!spi_get_csgpiod(spi, 0) && (spi->mode & SPI_CS_HIGH)) {
>  		dev_warn(&spi->dev, "setup: non GPIO CS can't be active-high\n");
>  		return -EINVAL;
>  	}
> @@ -1201,16 +1201,16 @@ static int atmel_spi_setup(struct spi_device *spi)
>  	 */
>  	initialize_native_cs_for_gpio(as);
>  =

> -	if (spi->cs_gpiod && as->native_cs_free) {
> +	if (spi_get_csgpiod(spi, 0) && as->native_cs_free) {
>  		dev_err(&spi->dev,
>  			"No native CS available to support this GPIO CS\n");
>  		return -EBUSY;
>  	}
>  =

> -	if (spi->cs_gpiod)
> +	if (spi_get_csgpiod(spi, 0))
>  		chip_select =3D as->native_cs_for_gpio;
>  	else
> -		chip_select =3D spi->chip_select;
> +		chip_select =3D spi_get_chipselect(spi, 0);
>  =

>  	csr =3D SPI_BF(BITS, bits - 8);
>  	if (spi->mode & SPI_CPOL)
> @@ -1218,7 +1218,7 @@ static int atmel_spi_setup(struct spi_device *spi)
>  	if (!(spi->mode & SPI_CPHA))
>  		csr |=3D SPI_BIT(NCPHA);
>  =

> -	if (!spi->cs_gpiod)
> +	if (!spi_get_csgpiod(spi, 0))
>  		csr |=3D SPI_BIT(CSAAT);
>  	csr |=3D SPI_BF(DLYBS, 0);
>  =

> @@ -1244,7 +1244,7 @@ static int atmel_spi_setup(struct spi_device *spi)
>  =

>  	dev_dbg(&spi->dev,
>  		"setup: bpw %u mode 0x%x -> csr%d %08x\n",
> -		bits, spi->mode, spi->chip_select, csr);
> +		bits, spi->mode, spi_get_chipselect(spi, 0), csr);
>  =

>  	if (!atmel_spi_is_v2(as))
>  		spi_writel(as, CSR0 + 4 * chip_select, csr);
> diff --git a/drivers/spi/spi-au1550.c b/drivers/spi/spi-au1550.c
> index e008761298da..da713cdfe087 100644
> --- a/drivers/spi/spi-au1550.c
> +++ b/drivers/spi/spi-au1550.c
> @@ -166,7 +166,7 @@ static void au1550_spi_chipsel(struct spi_device *spi=
, int value)
>  	switch (value) {
>  	case BITBANG_CS_INACTIVE:
>  		if (hw->pdata->deactivate_cs)
> -			hw->pdata->deactivate_cs(hw->pdata, spi->chip_select,
> +			hw->pdata->deactivate_cs(hw->pdata, spi_get_chipselect(spi, 0),
>  					cspol);
>  		break;
>  =

> @@ -211,7 +211,7 @@ static void au1550_spi_chipsel(struct spi_device *spi=
, int value)
>  		} while ((stat & PSC_SPISTAT_DR) =3D=3D 0);
>  =

>  		if (hw->pdata->activate_cs)
> -			hw->pdata->activate_cs(hw->pdata, spi->chip_select,
> +			hw->pdata->activate_cs(hw->pdata, spi_get_chipselect(spi, 0),
>  					cspol);
>  		break;
>  	}
> diff --git a/drivers/spi/spi-axi-spi-engine.c b/drivers/spi/spi-axi-spi-e=
ngine.c
> index 80c3e38f5c1b..1ff28784cfbb 100644
> --- a/drivers/spi/spi-axi-spi-engine.c
> +++ b/drivers/spi/spi-axi-spi-engine.c
> @@ -193,7 +193,7 @@ static void spi_engine_gen_cs(struct spi_engine_progr=
am *p, bool dry,
>  	unsigned int mask =3D 0xff;
>  =

>  	if (assert)
> -		mask ^=3D BIT(spi->chip_select);
> +		mask ^=3D BIT(spi_get_chipselect(spi, 0));
>  =

>  	spi_engine_program_add_cmd(p, dry, SPI_ENGINE_CMD_ASSERT(1, mask));
>  }
> diff --git a/drivers/spi/spi-bcm-qspi.c b/drivers/spi/spi-bcm-qspi.c
> index 0eee574d3e1f..7c2f1d1fb3f7 100644
> --- a/drivers/spi/spi-bcm-qspi.c
> +++ b/drivers/spi/spi-bcm-qspi.c
> @@ -986,7 +986,7 @@ static int write_to_hw(struct bcm_qspi *qspi, struct =
spi_device *spi)
>  		if (has_bspi(qspi))
>  			mspi_cdram &=3D ~1;
>  		else
> -			mspi_cdram |=3D (~(1 << spi->chip_select) &
> +			mspi_cdram |=3D (~(1 << spi_get_chipselect(spi, 0)) &
>  				       MSPI_CDRAM_PCS);
>  =

>  		write_cdram_slot(qspi, slot, mspi_cdram);
> @@ -1046,8 +1046,8 @@ static int bcm_qspi_bspi_exec_mem_op(struct spi_dev=
ice *spi,
>  			return -EIO;
>  =

>  	from =3D op->addr.val;
> -	if (!spi->cs_gpiod)
> -		bcm_qspi_chip_select(qspi, spi->chip_select);
> +	if (!spi_get_csgpiod(spi, 0))
> +		bcm_qspi_chip_select(qspi, spi_get_chipselect(spi, 0));
>  	bcm_qspi_write(qspi, MSPI, MSPI_WRITE_LOCK, 0);
>  =

>  	/*
> @@ -1126,8 +1126,8 @@ static int bcm_qspi_transfer_one(struct spi_master =
*master,
>  	int slots;
>  	unsigned long timeo =3D msecs_to_jiffies(100);
>  =

> -	if (!spi->cs_gpiod)
> -		bcm_qspi_chip_select(qspi, spi->chip_select);
> +	if (!spi_get_csgpiod(spi, 0))
> +		bcm_qspi_chip_select(qspi, spi_get_chipselect(spi, 0));
>  	qspi->trans_pos.trans =3D trans;
>  	qspi->trans_pos.byte =3D 0;
>  =

> diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
> index 747e03228c48..6b7a3fa93fdf 100644
> --- a/drivers/spi/spi-bcm2835.c
> +++ b/drivers/spi/spi-bcm2835.c
> @@ -1274,9 +1274,9 @@ static int bcm2835_spi_setup(struct spi_device *spi)
>  	 * The SPI core has successfully requested the CS GPIO line from the
>  	 * device tree, so we are done.
>  	 */
> -	if (spi->cs_gpiod)
> +	if (spi_get_csgpiod(spi, 0))
>  		return 0;
> -	if (spi->chip_select > 1) {
> +	if (spi_get_chipselect(spi, 0) > 1) {
>  		/* error in the case of native CS requested with CS > 1
>  		 * officially there is a CS2, but it is not documented
>  		 * which GPIO is connected with that...
> @@ -1301,18 +1301,19 @@ static int bcm2835_spi_setup(struct spi_device *s=
pi)
>  	if (!chip)
>  		return 0;
>  =

> -	spi->cs_gpiod =3D gpiochip_request_own_desc(chip, 8 - spi->chip_select,
> -						  DRV_NAME,
> -						  GPIO_LOOKUP_FLAGS_DEFAULT,
> -						  GPIOD_OUT_LOW);
> -	if (IS_ERR(spi->cs_gpiod)) {
> -		ret =3D PTR_ERR(spi->cs_gpiod);
> +	spi_set_csgpiod(spi, 0, gpiochip_request_own_desc(chip,
> +							  8 - (spi_get_chipselect(spi, 0)),
> +							  DRV_NAME,
> +							  GPIO_LOOKUP_FLAGS_DEFAULT,
> +							  GPIOD_OUT_LOW));
> +	if (IS_ERR(spi_get_csgpiod(spi, 0))) {
> +		ret =3D PTR_ERR(spi_get_csgpiod(spi, 0));
>  		goto err_cleanup;
>  	}
>  =

>  	/* and set up the "mode" and level */
>  	dev_info(&spi->dev, "setting up native-CS%i to use GPIO\n",
> -		 spi->chip_select);
> +		 spi_get_chipselect(spi, 0));
>  =

>  	return 0;
>  =

> diff --git a/drivers/spi/spi-bcm2835aux.c b/drivers/spi/spi-bcm2835aux.c
> index e28521922330..a3d8f6108477 100644
> --- a/drivers/spi/spi-bcm2835aux.c
> +++ b/drivers/spi/spi-bcm2835aux.c
> @@ -448,7 +448,7 @@ static int bcm2835aux_spi_setup(struct spi_device *sp=
i)
>  	if (spi->mode & SPI_NO_CS)
>  		return 0;
>  =

> -	if (spi->cs_gpiod)
> +	if (spi_get_csgpiod(spi, 0))
>  		return 0;
>  =

>  	/* for dt-backwards compatibility: only support native on CS0
> @@ -465,7 +465,7 @@ static int bcm2835aux_spi_setup(struct spi_device *sp=
i)
>  	dev_warn(&spi->dev,
>  		 "Native CS is not supported - please configure cs-gpio in device-tree=
\n");
>  =

> -	if (spi->chip_select =3D=3D 0)
> +	if (spi_get_chipselect(spi, 0) =3D=3D 0)
>  		return 0;
>  =

>  	dev_warn(&spi->dev, "Native CS is not working for cs > 0\n");
> diff --git a/drivers/spi/spi-bcm63xx-hsspi.c b/drivers/spi/spi-bcm63xx-hs=
spi.c
> index b871fd810d80..dc179c4677d4 100644
> --- a/drivers/spi/spi-bcm63xx-hsspi.c
> +++ b/drivers/spi/spi-bcm63xx-hsspi.c
> @@ -130,7 +130,7 @@ static void bcm63xx_hsspi_set_cs(struct bcm63xx_hsspi=
 *bs, unsigned int cs,
>  static void bcm63xx_hsspi_set_clk(struct bcm63xx_hsspi *bs,
>  				  struct spi_device *spi, int hz)
>  {
> -	unsigned int profile =3D spi->chip_select;
> +	unsigned int profile =3D spi_get_chipselect(spi, 0);
>  	u32 reg;
>  =

>  	reg =3D DIV_ROUND_UP(2048, DIV_ROUND_UP(bs->speed_hz, hz));
> @@ -157,7 +157,7 @@ static void bcm63xx_hsspi_set_clk(struct bcm63xx_hssp=
i *bs,
>  static int bcm63xx_hsspi_do_txrx(struct spi_device *spi, struct spi_tran=
sfer *t)
>  {
>  	struct bcm63xx_hsspi *bs =3D spi_master_get_devdata(spi->master);
> -	unsigned int chip_select =3D spi->chip_select;
> +	unsigned int chip_select =3D spi_get_chipselect(spi, 0);
>  	u16 opcode =3D 0;
>  	int pending =3D t->len;
>  	int step_size =3D HSSPI_BUFFER_LEN;
> @@ -165,7 +165,7 @@ static int bcm63xx_hsspi_do_txrx(struct spi_device *s=
pi, struct spi_transfer *t)
>  	u8 *rx =3D t->rx_buf;
>  =

>  	bcm63xx_hsspi_set_clk(bs, spi, t->speed_hz);
> -	bcm63xx_hsspi_set_cs(bs, spi->chip_select, true);
> +	bcm63xx_hsspi_set_cs(bs, spi_get_chipselect(spi, 0), true);
>  =

>  	if (tx && rx)
>  		opcode =3D HSSPI_OP_READ_WRITE;
> @@ -228,14 +228,14 @@ static int bcm63xx_hsspi_setup(struct spi_device *s=
pi)
>  	u32 reg;
>  =

>  	reg =3D __raw_readl(bs->regs +
> -			  HSSPI_PROFILE_SIGNAL_CTRL_REG(spi->chip_select));
> +			  HSSPI_PROFILE_SIGNAL_CTRL_REG(spi_get_chipselect(spi, 0)));
>  	reg &=3D ~(SIGNAL_CTRL_LAUNCH_RISING | SIGNAL_CTRL_LATCH_RISING);
>  	if (spi->mode & SPI_CPHA)
>  		reg |=3D SIGNAL_CTRL_LAUNCH_RISING;
>  	else
>  		reg |=3D SIGNAL_CTRL_LATCH_RISING;
>  	__raw_writel(reg, bs->regs +
> -		     HSSPI_PROFILE_SIGNAL_CTRL_REG(spi->chip_select));
> +		     HSSPI_PROFILE_SIGNAL_CTRL_REG(spi_get_chipselect(spi, 0)));
>  =

>  	mutex_lock(&bs->bus_mutex);
>  	reg =3D __raw_readl(bs->regs + HSSPI_GLOBAL_CTRL_REG);
> @@ -243,16 +243,16 @@ static int bcm63xx_hsspi_setup(struct spi_device *s=
pi)
>  	/* only change actual polarities if there is no transfer */
>  	if ((reg & GLOBAL_CTRL_CS_POLARITY_MASK) =3D=3D bs->cs_polarity) {
>  		if (spi->mode & SPI_CS_HIGH)
> -			reg |=3D BIT(spi->chip_select);
> +			reg |=3D BIT(spi_get_chipselect(spi, 0));
>  		else
> -			reg &=3D ~BIT(spi->chip_select);
> +			reg &=3D ~BIT(spi_get_chipselect(spi, 0));
>  		__raw_writel(reg, bs->regs + HSSPI_GLOBAL_CTRL_REG);
>  	}
>  =

>  	if (spi->mode & SPI_CS_HIGH)
> -		bs->cs_polarity |=3D BIT(spi->chip_select);
> +		bs->cs_polarity |=3D BIT(spi_get_chipselect(spi, 0));
>  	else
> -		bs->cs_polarity &=3D ~BIT(spi->chip_select);
> +		bs->cs_polarity &=3D ~BIT(spi_get_chipselect(spi, 0));
>  =

>  	mutex_unlock(&bs->bus_mutex);
>  =

> @@ -283,7 +283,7 @@ static int bcm63xx_hsspi_transfer_one(struct spi_mast=
er *master,
>  	 * e. At the end restore the polarities again to their default values.
>  	 */
>  =

> -	dummy_cs =3D !spi->chip_select;
> +	dummy_cs =3D !spi_get_chipselect(spi, 0);
>  	bcm63xx_hsspi_set_cs(bs, dummy_cs, true);
>  =

>  	list_for_each_entry(t, &msg->transfers, transfer_list) {
> @@ -296,7 +296,7 @@ static int bcm63xx_hsspi_transfer_one(struct spi_mast=
er *master,
>  		spi_transfer_delay_exec(t);
>  =

>  		if (t->cs_change)
> -			bcm63xx_hsspi_set_cs(bs, spi->chip_select, false);
> +			bcm63xx_hsspi_set_cs(bs, spi_get_chipselect(spi, 0), false);
>  	}
>  =

>  	mutex_lock(&bs->bus_mutex);
> diff --git a/drivers/spi/spi-bcm63xx.c b/drivers/spi/spi-bcm63xx.c
> index 3686d78c44a6..787625ce700c 100644
> --- a/drivers/spi/spi-bcm63xx.c
> +++ b/drivers/spi/spi-bcm63xx.c
> @@ -292,7 +292,7 @@ static int bcm63xx_txrx_bufs(struct spi_device *spi, =
struct spi_transfer *first,
>  	/* Issue the transfer */
>  	cmd =3D SPI_CMD_START_IMMEDIATE;
>  	cmd |=3D (prepend_len << SPI_CMD_PREPEND_BYTE_CNT_SHIFT);
> -	cmd |=3D (spi->chip_select << SPI_CMD_DEVICE_ID_SHIFT);
> +	cmd |=3D (spi_get_chipselect(spi, 0) << SPI_CMD_DEVICE_ID_SHIFT);
>  	bcm_spi_writew(bs, cmd, SPI_CMD);
>  =

>  	/* Enable the CMD_DONE interrupt */
> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 676313e1bdad..b4a1201f7e1b 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -1329,7 +1329,7 @@ static int cqspi_mem_process(struct spi_mem *mem, c=
onst struct spi_mem_op *op)
>  	struct cqspi_st *cqspi =3D spi_master_get_devdata(mem->spi->master);
>  	struct cqspi_flash_pdata *f_pdata;
>  =

> -	f_pdata =3D &cqspi->f_pdata[mem->spi->chip_select];
> +	f_pdata =3D &cqspi->f_pdata[spi_get_chipselect(mem->spi, 0)];
>  	cqspi_configure(f_pdata, mem->spi->max_speed_hz);
>  =

>  	if (op->data.dir =3D=3D SPI_MEM_DATA_IN && op->data.buf.in) {
> @@ -1529,7 +1529,8 @@ static const char *cqspi_get_name(struct spi_mem *m=
em)
>  	struct cqspi_st *cqspi =3D spi_master_get_devdata(mem->spi->master);
>  	struct device *dev =3D &cqspi->pdev->dev;
>  =

> -	return devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev), mem->spi=
->chip_select);
> +	return devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev),
> +			      spi_get_chipselect(mem->spi, 0));
>  }
>  =

>  static const struct spi_controller_mem_ops cqspi_mem_ops =3D {
> diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xsp=
i.c
> index 91db3c973167..ce4a3145f065 100644
> --- a/drivers/spi/spi-cadence-xspi.c
> +++ b/drivers/spi/spi-cadence-xspi.c
> @@ -409,8 +409,8 @@ static int cdns_xspi_mem_op(struct cdns_xspi_dev *cdn=
s_xspi,
>  {
>  	enum spi_mem_data_dir dir =3D op->data.dir;
>  =

> -	if (cdns_xspi->cur_cs !=3D mem->spi->chip_select)
> -		cdns_xspi->cur_cs =3D mem->spi->chip_select;
> +	if (cdns_xspi->cur_cs !=3D spi_get_chipselect(mem->spi, 0))
> +		cdns_xspi->cur_cs =3D spi_get_chipselect(mem->spi, 0);
>  =

>  	return cdns_xspi_send_stig_command(cdns_xspi, op,
>  					   (dir !=3D SPI_MEM_NO_DATA));
> diff --git a/drivers/spi/spi-cadence.c b/drivers/spi/spi-cadence.c
> index 6a7f7df1e776..4ec778de5baf 100644
> --- a/drivers/spi/spi-cadence.c
> +++ b/drivers/spi/spi-cadence.c
> @@ -185,11 +185,11 @@ static void cdns_spi_chipselect(struct spi_device *=
spi, bool is_high)
>  		/* Select the slave */
>  		ctrl_reg &=3D ~CDNS_SPI_CR_SSCTRL;
>  		if (!(xspi->is_decoded_cs))
> -			ctrl_reg |=3D ((~(CDNS_SPI_SS0 << spi->chip_select)) <<
> +			ctrl_reg |=3D ((~(CDNS_SPI_SS0 << spi_get_chipselect(spi, 0))) <<
>  				     CDNS_SPI_SS_SHIFT) &
>  				     CDNS_SPI_CR_SSCTRL;
>  		else
> -			ctrl_reg |=3D (spi->chip_select << CDNS_SPI_SS_SHIFT) &
> +			ctrl_reg |=3D (spi_get_chipselect(spi, 0) << CDNS_SPI_SS_SHIFT) &
>  				     CDNS_SPI_CR_SSCTRL;
>  	}
>  =

> diff --git a/drivers/spi/spi-cavium.c b/drivers/spi/spi-cavium.c
> index 6854c3ce423b..dfe224defd6e 100644
> --- a/drivers/spi/spi-cavium.c
> +++ b/drivers/spi/spi-cavium.c
> @@ -57,8 +57,8 @@ static int octeon_spi_do_transfer(struct octeon_spi *p,
>  	mpi_cfg.s.cslate =3D cpha ? 1 : 0;
>  	mpi_cfg.s.enable =3D 1;
>  =

> -	if (spi->chip_select < 4)
> -		p->cs_enax |=3D 1ull << (12 + spi->chip_select);
> +	if (spi_get_chipselect(spi, 0) < 4)
> +		p->cs_enax |=3D 1ull << (12 + spi_get_chipselect(spi, 0));
>  	mpi_cfg.u64 |=3D p->cs_enax;
>  =

>  	if (mpi_cfg.u64 !=3D p->last_cfg) {
> @@ -78,7 +78,7 @@ static int octeon_spi_do_transfer(struct octeon_spi *p,
>  			writeq(d, p->register_base + OCTEON_SPI_DAT0(p) + (8 * i));
>  		}
>  		mpi_tx.u64 =3D 0;
> -		mpi_tx.s.csid =3D spi->chip_select;
> +		mpi_tx.s.csid =3D spi_get_chipselect(spi, 0);
>  		mpi_tx.s.leavecs =3D 1;
>  		mpi_tx.s.txnum =3D tx_buf ? OCTEON_SPI_MAX_BYTES : 0;
>  		mpi_tx.s.totnum =3D OCTEON_SPI_MAX_BYTES;
> @@ -103,7 +103,7 @@ static int octeon_spi_do_transfer(struct octeon_spi *=
p,
>  	}
>  =

>  	mpi_tx.u64 =3D 0;
> -	mpi_tx.s.csid =3D spi->chip_select;
> +	mpi_tx.s.csid =3D spi_get_chipselect(spi, 0);
>  	if (last_xfer)
>  		mpi_tx.s.leavecs =3D xfer->cs_change;
>  	else
> diff --git a/drivers/spi/spi-coldfire-qspi.c b/drivers/spi/spi-coldfire-q=
spi.c
> index 263ce9047327..18e4fd86b2f2 100644
> --- a/drivers/spi/spi-coldfire-qspi.c
> +++ b/drivers/spi/spi-coldfire-qspi.c
> @@ -290,9 +290,9 @@ static void mcfqspi_set_cs(struct spi_device *spi, bo=
ol enable)
>  	bool cs_high =3D spi->mode & SPI_CS_HIGH;
>  =

>  	if (enable)
> -		mcfqspi_cs_select(mcfqspi, spi->chip_select, cs_high);
> +		mcfqspi_cs_select(mcfqspi, spi_get_chipselect(spi, 0), cs_high);
>  	else
> -		mcfqspi_cs_deselect(mcfqspi, spi->chip_select, cs_high);
> +		mcfqspi_cs_deselect(mcfqspi, spi_get_chipselect(spi, 0), cs_high);
>  }
>  =

>  static int mcfqspi_transfer_one(struct spi_master *master,
> @@ -324,11 +324,11 @@ static int mcfqspi_transfer_one(struct spi_master *=
master,
>  static int mcfqspi_setup(struct spi_device *spi)
>  {
>  	mcfqspi_cs_deselect(spi_master_get_devdata(spi->master),
> -			    spi->chip_select, spi->mode & SPI_CS_HIGH);
> +			    spi_get_chipselect(spi, 0), spi->mode & SPI_CS_HIGH);
>  =

>  	dev_dbg(&spi->dev,
>  			"bits per word %d, chip select %d, speed %d KHz\n",
> -			spi->bits_per_word, spi->chip_select,
> +			spi->bits_per_word, spi_get_chipselect(spi, 0),
>  			(MCFQSPI_BUSCLK / mcfqspi_qmr_baud(spi->max_speed_hz))
>  			/ 1000);
>  =

> diff --git a/drivers/spi/spi-davinci.c b/drivers/spi/spi-davinci.c
> index d112c2cac042..55c9abcb8e3b 100644
> --- a/drivers/spi/spi-davinci.c
> +++ b/drivers/spi/spi-davinci.c
> @@ -199,7 +199,7 @@ static void davinci_spi_chipselect(struct spi_device =
*spi, int value)
>  {
>  	struct davinci_spi *dspi;
>  	struct davinci_spi_config *spicfg =3D spi->controller_data;
> -	u8 chip_sel =3D spi->chip_select;
> +	u8 chip_sel =3D spi_get_chipselect(spi, 0);
>  	u16 spidat1 =3D CS_DEFAULT;
>  =

>  	dspi =3D spi_master_get_devdata(spi->master);
> @@ -212,11 +212,11 @@ static void davinci_spi_chipselect(struct spi_devic=
e *spi, int value)
>  	 * Board specific chip select logic decides the polarity and cs
>  	 * line for the controller
>  	 */
> -	if (spi->cs_gpiod) {
> +	if (spi_get_csgpiod(spi, 0)) {
>  		if (value =3D=3D BITBANG_CS_ACTIVE)
> -			gpiod_set_value(spi->cs_gpiod, 1);
> +			gpiod_set_value(spi_get_csgpiod(spi, 0), 1);
>  		else
> -			gpiod_set_value(spi->cs_gpiod, 0);
> +			gpiod_set_value(spi_get_csgpiod(spi, 0), 0);
>  	} else {
>  		if (value =3D=3D BITBANG_CS_ACTIVE) {
>  			if (!(spi->mode & SPI_CS_WORD))
> @@ -293,11 +293,11 @@ static int davinci_spi_setup_transfer(struct spi_de=
vice *spi,
>  	if (bits_per_word <=3D 8) {
>  		dspi->get_rx =3D davinci_spi_rx_buf_u8;
>  		dspi->get_tx =3D davinci_spi_tx_buf_u8;
> -		dspi->bytes_per_word[spi->chip_select] =3D 1;
> +		dspi->bytes_per_word[spi_get_chipselect(spi, 0)] =3D 1;
>  	} else {
>  		dspi->get_rx =3D davinci_spi_rx_buf_u16;
>  		dspi->get_tx =3D davinci_spi_tx_buf_u16;
> -		dspi->bytes_per_word[spi->chip_select] =3D 2;
> +		dspi->bytes_per_word[spi_get_chipselect(spi, 0)] =3D 2;
>  	}
>  =

>  	if (!hz)
> @@ -415,11 +415,11 @@ static int davinci_spi_setup(struct spi_device *spi)
>  	dspi =3D spi_master_get_devdata(spi->master);
>  =

>  	if (!(spi->mode & SPI_NO_CS)) {
> -		if (np && spi->cs_gpiod)
> +		if (np && spi_get_csgpiod(spi, 0))
>  			internal_cs =3D false;
>  =

>  		if (internal_cs)
> -			set_io_bits(dspi->base + SPIPC0, 1 << spi->chip_select);
> +			set_io_bits(dspi->base + SPIPC0, 1 << spi_get_chipselect(spi, 0));
>  	}
>  =

>  	if (spi->mode & SPI_READY)
> @@ -579,7 +579,7 @@ static int davinci_spi_bufs(struct spi_device *spi, s=
truct spi_transfer *t)
>  		spicfg =3D &davinci_spi_default_cfg;
>  =

>  	/* convert len to words based on bits_per_word */
> -	data_type =3D dspi->bytes_per_word[spi->chip_select];
> +	data_type =3D dspi->bytes_per_word[spi_get_chipselect(spi, 0)];
>  =

>  	dspi->tx =3D t->tx_buf;
>  	dspi->rx =3D t->rx_buf;
> diff --git a/drivers/spi/spi-dln2.c b/drivers/spi/spi-dln2.c
> index 0a1fb2bc9e54..5e60e3d5822e 100644
> --- a/drivers/spi/spi-dln2.c
> +++ b/drivers/spi/spi-dln2.c
> @@ -596,12 +596,12 @@ static int dln2_spi_prepare_message(struct spi_mast=
er *master,
>  	struct dln2_spi *dln2 =3D spi_master_get_devdata(master);
>  	struct spi_device *spi =3D message->spi;
>  =

> -	if (dln2->cs !=3D spi->chip_select) {
> -		ret =3D dln2_spi_cs_set_one(dln2, spi->chip_select);
> +	if (dln2->cs !=3D spi_get_chipselect(spi, 0)) {
> +		ret =3D dln2_spi_cs_set_one(dln2, spi_get_chipselect(spi, 0));
>  		if (ret < 0)
>  			return ret;
>  =

> -		dln2->cs =3D spi->chip_select;
> +		dln2->cs =3D spi_get_chipselect(spi, 0);
>  	}
>  =

>  	return 0;
> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index c3bfb6c84cab..ae3108c70f50 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -103,7 +103,7 @@ void dw_spi_set_cs(struct spi_device *spi, bool enabl=
e)
>  	 * support active-high or active-low CS level.
>  	 */
>  	if (cs_high =3D=3D enable)
> -		dw_writel(dws, DW_SPI_SER, BIT(spi->chip_select));
> +		dw_writel(dws, DW_SPI_SER, BIT(spi_get_chipselect(spi, 0)));
>  	else
>  		dw_writel(dws, DW_SPI_SER, 0);
>  }
> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> index 26c40ea6dd12..d511da766ce8 100644
> --- a/drivers/spi/spi-dw-mmio.c
> +++ b/drivers/spi/spi-dw-mmio.c
> @@ -65,7 +65,7 @@ static void dw_spi_mscc_set_cs(struct spi_device *spi, =
bool enable)
>  	struct dw_spi *dws =3D spi_master_get_devdata(spi->master);
>  	struct dw_spi_mmio *dwsmmio =3D container_of(dws, struct dw_spi_mmio, d=
ws);
>  	struct dw_spi_mscc *dwsmscc =3D dwsmmio->priv;
> -	u32 cs =3D spi->chip_select;
> +	u32 cs =3D spi_get_chipselect(spi, 0);
>  =

>  	if (cs < 4) {
>  		u32 sw_mode =3D MSCC_SPI_MST_SW_MODE_SW_PIN_CTRL_MODE;
> @@ -138,7 +138,7 @@ static void dw_spi_sparx5_set_cs(struct spi_device *s=
pi, bool enable)
>  	struct dw_spi *dws =3D spi_master_get_devdata(spi->master);
>  	struct dw_spi_mmio *dwsmmio =3D container_of(dws, struct dw_spi_mmio, d=
ws);
>  	struct dw_spi_mscc *dwsmscc =3D dwsmmio->priv;
> -	u8 cs =3D spi->chip_select;
> +	u8 cs =3D spi_get_chipselect(spi, 0);
>  =

>  	if (!enable) {
>  		/* CS override drive enable */
> diff --git a/drivers/spi/spi-falcon.c b/drivers/spi/spi-falcon.c
> index a7d4dffac66b..4c103dff0d44 100644
> --- a/drivers/spi/spi-falcon.c
> +++ b/drivers/spi/spi-falcon.c
> @@ -131,7 +131,7 @@ int falcon_sflash_xfer(struct spi_device *spi, struct=
 spi_transfer *t,
>  				 * especially alen and dumlen.
>  				 */
>  =

> -				priv->sfcmd =3D ((spi->chip_select
> +				priv->sfcmd =3D ((spi_get_chipselect(spi, 0)
>  						<< SFCMD_CS_OFFSET)
>  					       & SFCMD_CS_MASK);
>  				priv->sfcmd |=3D SFCMD_KEEP_CS_KEEP_SELECTED;
> diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
> index cf1e4f9ebd72..ba3b17d7c9ec 100644
> --- a/drivers/spi/spi-fsi.c
> +++ b/drivers/spi/spi-fsi.c
> @@ -425,7 +425,7 @@ static int fsi_spi_transfer_one_message(struct spi_co=
ntroller *ctlr,
>  					struct spi_message *mesg)
>  {
>  	int rc;
> -	u8 seq_slave =3D SPI_FSI_SEQUENCE_SEL_SLAVE(mesg->spi->chip_select + 1);
> +	u8 seq_slave =3D SPI_FSI_SEQUENCE_SEL_SLAVE(spi_get_chipselect(mesg->sp=
i, 0) + 1);
>  	unsigned int len;
>  	struct spi_transfer *transfer;
>  	struct fsi_spi *ctx =3D spi_controller_get_devdata(ctlr);
> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
> index e419642eb10e..0f9a97ee2e77 100644
> --- a/drivers/spi/spi-fsl-dspi.c
> +++ b/drivers/spi/spi-fsl-dspi.c
> @@ -902,19 +902,19 @@ static irqreturn_t dspi_interrupt(int irq, void *de=
v_id)
>  =

>  static void dspi_assert_cs(struct spi_device *spi, bool *cs)
>  {
> -	if (!spi->cs_gpiod || *cs)
> +	if (!spi_get_csgpiod(spi, 0) || *cs)
>  		return;
>  =

> -	gpiod_set_value_cansleep(spi->cs_gpiod, true);
> +	gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), true);
>  	*cs =3D true;
>  }
>  =

>  static void dspi_deassert_cs(struct spi_device *spi, bool *cs)
>  {
> -	if (!spi->cs_gpiod || !*cs)
> +	if (!spi_get_csgpiod(spi, 0) || !*cs)
>  		return;
>  =

> -	gpiod_set_value_cansleep(spi->cs_gpiod, false);
> +	gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), false);
>  	*cs =3D false;
>  }
>  =

> @@ -938,8 +938,8 @@ static int dspi_transfer_one_message(struct spi_contr=
oller *ctlr,
>  =

>  		/* Prepare command word for CMD FIFO */
>  		dspi->tx_cmd =3D SPI_PUSHR_CMD_CTAS(0);
> -		if (!spi->cs_gpiod)
> -			dspi->tx_cmd |=3D SPI_PUSHR_CMD_PCS(spi->chip_select);
> +		if (!spi_get_csgpiod(spi, 0))
> +			dspi->tx_cmd |=3D SPI_PUSHR_CMD_PCS(spi_get_chipselect(spi, 0));
>  =

>  		if (list_is_last(&dspi->cur_transfer->transfer_list,
>  				 &dspi->cur_msg->transfers)) {
> @@ -1058,7 +1058,7 @@ static int dspi_setup(struct spi_device *spi)
>  			chip->ctar_val |=3D SPI_CTAR_LSBFE;
>  	}
>  =

> -	gpiod_direction_output(spi->cs_gpiod, false);
> +	gpiod_direction_output(spi_get_csgpiod(spi, 0), false);
>  	dspi_deassert_cs(spi, &cs);
>  =

>  	spi_set_ctldata(spi, chip);
> @@ -1071,7 +1071,7 @@ static void dspi_cleanup(struct spi_device *spi)
>  	struct chip_data *chip =3D spi_get_ctldata((struct spi_device *)spi);
>  =

>  	dev_dbg(&spi->dev, "spi_device %u.%u cleanup\n",
> -		spi->controller->bus_num, spi->chip_select);
> +		spi->controller->bus_num, spi_get_chipselect(spi, 0));
>  =

>  	kfree(chip);
>  }
> diff --git a/drivers/spi/spi-fsl-espi.c b/drivers/spi/spi-fsl-espi.c
> index f7066bef7b06..b593055e3d6d 100644
> --- a/drivers/spi/spi-fsl-espi.c
> +++ b/drivers/spi/spi-fsl-espi.c
> @@ -345,7 +345,7 @@ static void fsl_espi_setup_transfer(struct spi_device=
 *spi,
>  =

>  	/* don't write the mode register if the mode doesn't change */
>  	if (cs->hw_mode !=3D hw_mode_old)
> -		fsl_espi_write_reg(espi, ESPI_SPMODEx(spi->chip_select),
> +		fsl_espi_write_reg(espi, ESPI_SPMODEx(spi_get_chipselect(spi, 0)),
>  				   cs->hw_mode);
>  }
>  =

> @@ -359,7 +359,7 @@ static int fsl_espi_bufs(struct spi_device *spi, stru=
ct spi_transfer *t)
>  	reinit_completion(&espi->done);
>  =

>  	/* Set SPCOM[CS] and SPCOM[TRANLEN] field */
> -	spcom =3D SPCOM_CS(spi->chip_select);
> +	spcom =3D SPCOM_CS(spi_get_chipselect(spi, 0));
>  	spcom |=3D SPCOM_TRANLEN(t->len - 1);
>  =

>  	/* configure RXSKIP mode */
> @@ -492,7 +492,7 @@ static int fsl_espi_setup(struct spi_device *spi)
>  =

>  	pm_runtime_get_sync(espi->dev);
>  =

> -	cs->hw_mode =3D fsl_espi_read_reg(espi, ESPI_SPMODEx(spi->chip_select));
> +	cs->hw_mode =3D fsl_espi_read_reg(espi, ESPI_SPMODEx(spi_get_chipselect=
(spi, 0)));
>  	/* mask out bits we are going to set */
>  	cs->hw_mode &=3D ~(CSMODE_CP_BEGIN_EDGECLK | CSMODE_CI_INACTIVEHIGH
>  			 | CSMODE_REV);
> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
> index 34488de55587..fe69ec8c9d68 100644
> --- a/drivers/spi/spi-fsl-lpspi.c
> +++ b/drivers/spi/spi-fsl-lpspi.c
> @@ -425,7 +425,7 @@ static int fsl_lpspi_setup_transfer(struct spi_contro=
ller *controller,
>  	if (fsl_lpspi->is_only_cs1)
>  		fsl_lpspi->config.chip_select =3D 1;
>  	else
> -		fsl_lpspi->config.chip_select =3D spi->chip_select;
> +		fsl_lpspi->config.chip_select =3D spi_get_chipselect(spi, 0);
>  =

>  	if (!fsl_lpspi->config.speed_hz)
>  		fsl_lpspi->config.speed_hz =3D spi->max_speed_hz;
> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
> index 85cc71ba624a..4f16d4676650 100644
> --- a/drivers/spi/spi-fsl-qspi.c
> +++ b/drivers/spi/spi-fsl-qspi.c
> @@ -528,7 +528,7 @@ static void fsl_qspi_select_mem(struct fsl_qspi *q, s=
truct spi_device *spi)
>  	unsigned long rate =3D spi->max_speed_hz;
>  	int ret;
>  =

> -	if (q->selected =3D=3D spi->chip_select)
> +	if (q->selected =3D=3D spi_get_chipselect(spi, 0))
>  		return;
>  =

>  	if (needs_4x_clock(q))
> @@ -544,7 +544,7 @@ static void fsl_qspi_select_mem(struct fsl_qspi *q, s=
truct spi_device *spi)
>  	if (ret)
>  		return;
>  =

> -	q->selected =3D spi->chip_select;
> +	q->selected =3D spi_get_chipselect(spi, 0);
>  =

>  	fsl_qspi_invalidate(q);
>  }
> @@ -823,7 +823,7 @@ static const char *fsl_qspi_get_name(struct spi_mem *=
mem)
>  =

>  	name =3D devm_kasprintf(dev, GFP_KERNEL,
>  			      "%s-%d", dev_name(q->dev),
> -			      mem->spi->chip_select);
> +			      spi_get_chipselect(mem->spi, 0));
>  =

>  	if (!name) {
>  		dev_err(dev, "failed to get memory for custom flash name\n");
> diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
> index 93152144fd2e..08fa6e38f4eb 100644
> --- a/drivers/spi/spi-fsl-spi.c
> +++ b/drivers/spi/spi-fsl-spi.c
> @@ -503,7 +503,7 @@ static void fsl_spi_grlib_cs_control(struct spi_devic=
e *spi, bool on)
>  	struct mpc8xxx_spi *mpc8xxx_spi =3D spi_master_get_devdata(spi->master);
>  	struct fsl_spi_reg __iomem *reg_base =3D mpc8xxx_spi->reg_base;
>  	u32 slvsel;
> -	u16 cs =3D spi->chip_select;
> +	u16 cs =3D spi_get_chipselect(spi, 0);
>  =

>  	if (cs < mpc8xxx_spi->native_chipselects) {
>  		slvsel =3D mpc8xxx_spi_read_reg(&reg_base->slvsel);
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index e1b2e0b65779..a99bdab00ed2 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -391,9 +391,9 @@ static int setup_fifo_params(struct spi_device *spi_s=
lv,
>  			cpha =3D CPHA;
>  =

>  		if (spi_slv->mode & SPI_CS_HIGH)
> -			demux_output_inv =3D BIT(spi_slv->chip_select);
> +			demux_output_inv =3D BIT(spi_get_chipselect(spi_slv, 0));
>  =

> -		demux_sel =3D spi_slv->chip_select;
> +		demux_sel =3D spi_get_chipselect(spi_slv, 0);
>  		mas->cur_bits_per_word =3D spi_slv->bits_per_word;
>  =

>  		spi_setup_word_len(mas, spi_slv->mode, spi_slv->bits_per_word);
> @@ -469,7 +469,7 @@ static int setup_gsi_xfer(struct spi_transfer *xfer, =
struct spi_geni_master *mas
>  	peripheral.loopback_en =3D !!(spi_slv->mode & SPI_LOOP);
>  	peripheral.clock_pol_high =3D !!(spi_slv->mode & SPI_CPOL);
>  	peripheral.data_pol_high =3D !!(spi_slv->mode & SPI_CPHA);
> -	peripheral.cs =3D spi_slv->chip_select;
> +	peripheral.cs =3D spi_get_chipselect(spi_slv, 0);
>  	peripheral.pack_en =3D true;
>  	peripheral.word_len =3D xfer->bits_per_word - MIN_WORD_LEN;
>  =

> diff --git a/drivers/spi/spi-gpio.c b/drivers/spi/spi-gpio.c
> index 9c8c7948044e..092afc7679d4 100644
> --- a/drivers/spi/spi-gpio.c
> +++ b/drivers/spi/spi-gpio.c
> @@ -230,7 +230,7 @@ static void spi_gpio_chipselect(struct spi_device *sp=
i, int is_active)
>  =

>  	/* Drive chip select line, if we have one */
>  	if (spi_gpio->cs_gpios) {
> -		struct gpio_desc *cs =3D spi_gpio->cs_gpios[spi->chip_select];
> +		struct gpio_desc *cs =3D spi_gpio->cs_gpios[spi_get_chipselect(spi, 0)=
];
>  =

>  		/* SPI chip selects are normally active-low */
>  		gpiod_set_value_cansleep(cs, (spi->mode & SPI_CS_HIGH) ? is_active : !=
is_active);
> @@ -248,7 +248,7 @@ static int spi_gpio_setup(struct spi_device *spi)
>  	 * initialized from the descriptor lookup.
>  	 */
>  	if (spi_gpio->cs_gpios) {
> -		cs =3D spi_gpio->cs_gpios[spi->chip_select];
> +		cs =3D spi_gpio->cs_gpios[spi_get_chipselect(spi, 0)];
>  		if (!spi->controller_state && cs)
>  			status =3D gpiod_direction_output(cs,
>  						  !(spi->mode & SPI_CS_HIGH));
> diff --git a/drivers/spi/spi-gxp.c b/drivers/spi/spi-gxp.c
> index c900c2f39b57..684d63f402f3 100644
> --- a/drivers/spi/spi-gxp.c
> +++ b/drivers/spi/spi-gxp.c
> @@ -201,7 +201,7 @@ static ssize_t gxp_spi_write(struct gxp_spi_chip *chi=
p, const struct spi_mem_op
>  static int do_gxp_exec_mem_op(struct spi_mem *mem, const struct spi_mem_=
op *op)
>  {
>  	struct gxp_spi *spifi =3D spi_controller_get_devdata(mem->spi->master);
> -	struct gxp_spi_chip *chip =3D &spifi->chips[mem->spi->chip_select];
> +	struct gxp_spi_chip *chip =3D &spifi->chips[spi_get_chipselect(mem->spi=
, 0)];
>  	int ret;
>  =

>  	if (op->data.dir =3D=3D SPI_MEM_DATA_IN) {
> @@ -237,7 +237,7 @@ static const struct spi_controller_mem_ops gxp_spi_me=
m_ops =3D {
>  static int gxp_spi_setup(struct spi_device *spi)
>  {
>  	struct gxp_spi *spifi =3D spi_controller_get_devdata(spi->master);
> -	unsigned int cs =3D spi->chip_select;
> +	unsigned int cs =3D spi_get_chipselect(spi, 0);
>  	struct gxp_spi_chip *chip =3D &spifi->chips[cs];
>  =

>  	chip->spifi =3D spifi;
> diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v=
3xx.c
> index f07d1045a30a..7cbcb065bb44 100644
> --- a/drivers/spi/spi-hisi-sfc-v3xx.c
> +++ b/drivers/spi/spi-hisi-sfc-v3xx.c
> @@ -361,7 +361,7 @@ static int hisi_sfc_v3xx_exec_op(struct spi_mem *mem,
>  {
>  	struct hisi_sfc_v3xx_host *host;
>  	struct spi_device *spi =3D mem->spi;
> -	u8 chip_select =3D spi->chip_select;
> +	u8 chip_select =3D spi_get_chipselect(spi, 0);
>  =

>  	host =3D spi_controller_get_devdata(spi->master);
>  =

> diff --git a/drivers/spi/spi-img-spfi.c b/drivers/spi/spi-img-spfi.c
> index 257046f843ff..1575e78f8b09 100644
> --- a/drivers/spi/spi-img-spfi.c
> +++ b/drivers/spi/spi-img-spfi.c
> @@ -413,15 +413,15 @@ static int img_spfi_prepare(struct spi_master *mast=
er, struct spi_message *msg)
>  	val =3D spfi_readl(spfi, SPFI_PORT_STATE);
>  	val &=3D ~(SPFI_PORT_STATE_DEV_SEL_MASK <<
>  		 SPFI_PORT_STATE_DEV_SEL_SHIFT);
> -	val |=3D msg->spi->chip_select << SPFI_PORT_STATE_DEV_SEL_SHIFT;
> +	val |=3D spi_get_chipselect(msg->spi, 0) << SPFI_PORT_STATE_DEV_SEL_SHI=
FT;
>  	if (msg->spi->mode & SPI_CPHA)
> -		val |=3D SPFI_PORT_STATE_CK_PHASE(msg->spi->chip_select);
> +		val |=3D SPFI_PORT_STATE_CK_PHASE(spi_get_chipselect(msg->spi, 0));
>  	else
> -		val &=3D ~SPFI_PORT_STATE_CK_PHASE(msg->spi->chip_select);
> +		val &=3D ~SPFI_PORT_STATE_CK_PHASE(spi_get_chipselect(msg->spi, 0));
>  	if (msg->spi->mode & SPI_CPOL)
> -		val |=3D SPFI_PORT_STATE_CK_POL(msg->spi->chip_select);
> +		val |=3D SPFI_PORT_STATE_CK_POL(spi_get_chipselect(msg->spi, 0));
>  	else
> -		val &=3D ~SPFI_PORT_STATE_CK_POL(msg->spi->chip_select);
> +		val &=3D ~SPFI_PORT_STATE_CK_POL(spi_get_chipselect(msg->spi, 0));
>  	spfi_writel(spfi, val, SPFI_PORT_STATE);
>  =

>  	return 0;
> @@ -450,11 +450,11 @@ static void img_spfi_config(struct spi_master *mast=
er, struct spi_device *spi,
>  	div =3D DIV_ROUND_UP(clk_get_rate(spfi->spfi_clk), xfer->speed_hz);
>  	div =3D clamp(512 / (1 << get_count_order(div)), 1, 128);
>  =

> -	val =3D spfi_readl(spfi, SPFI_DEVICE_PARAMETER(spi->chip_select));
> +	val =3D spfi_readl(spfi, SPFI_DEVICE_PARAMETER(spi_get_chipselect(spi, =
0)));
>  	val &=3D ~(SPFI_DEVICE_PARAMETER_BITCLK_MASK <<
>  		 SPFI_DEVICE_PARAMETER_BITCLK_SHIFT);
>  	val |=3D div << SPFI_DEVICE_PARAMETER_BITCLK_SHIFT;
> -	spfi_writel(spfi, val, SPFI_DEVICE_PARAMETER(spi->chip_select));
> +	spfi_writel(spfi, val, SPFI_DEVICE_PARAMETER(spi_get_chipselect(spi, 0)=
));
>  =

>  	spfi_writel(spfi, xfer->len << SPFI_TRANSACTION_TSIZE_SHIFT,
>  		    SPFI_TRANSACTION);
> diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
> index e4ccd0c329d0..620bce96b1f9 100644
> --- a/drivers/spi/spi-imx.c
> +++ b/drivers/spi/spi-imx.c
> @@ -528,7 +528,7 @@ static int mx51_ecspi_prepare_message(struct spi_imx_=
data *spi_imx,
>  		ctrl |=3D MX51_ECSPI_CTRL_DRCTL(spi_imx->spi_drctl);
>  =

>  	/* set chip select to use */
> -	ctrl |=3D MX51_ECSPI_CTRL_CS(spi->chip_select);
> +	ctrl |=3D MX51_ECSPI_CTRL_CS(spi_get_chipselect(spi, 0));
>  =

>  	/*
>  	 * The ctrl register must be written first, with the EN bit set other
> @@ -549,22 +549,22 @@ static int mx51_ecspi_prepare_message(struct spi_im=
x_data *spi_imx,
>  	 * BURST_LENGTH + 1 bits are received
>  	 */
>  	if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
> -		cfg &=3D ~MX51_ECSPI_CONFIG_SBBCTRL(spi->chip_select);
> +		cfg &=3D ~MX51_ECSPI_CONFIG_SBBCTRL(spi_get_chipselect(spi, 0));
>  	else
> -		cfg |=3D MX51_ECSPI_CONFIG_SBBCTRL(spi->chip_select);
> +		cfg |=3D MX51_ECSPI_CONFIG_SBBCTRL(spi_get_chipselect(spi, 0));
>  =

>  	if (spi->mode & SPI_CPOL) {
> -		cfg |=3D MX51_ECSPI_CONFIG_SCLKPOL(spi->chip_select);
> -		cfg |=3D MX51_ECSPI_CONFIG_SCLKCTL(spi->chip_select);
> +		cfg |=3D MX51_ECSPI_CONFIG_SCLKPOL(spi_get_chipselect(spi, 0));
> +		cfg |=3D MX51_ECSPI_CONFIG_SCLKCTL(spi_get_chipselect(spi, 0));
>  	} else {
> -		cfg &=3D ~MX51_ECSPI_CONFIG_SCLKPOL(spi->chip_select);
> -		cfg &=3D ~MX51_ECSPI_CONFIG_SCLKCTL(spi->chip_select);
> +		cfg &=3D ~MX51_ECSPI_CONFIG_SCLKPOL(spi_get_chipselect(spi, 0));
> +		cfg &=3D ~MX51_ECSPI_CONFIG_SCLKCTL(spi_get_chipselect(spi, 0));
>  	}
>  =

>  	if (spi->mode & SPI_CS_HIGH)
> -		cfg |=3D MX51_ECSPI_CONFIG_SSBPOL(spi->chip_select);
> +		cfg |=3D MX51_ECSPI_CONFIG_SSBPOL(spi_get_chipselect(spi, 0));
>  	else
> -		cfg &=3D ~MX51_ECSPI_CONFIG_SSBPOL(spi->chip_select);
> +		cfg &=3D ~MX51_ECSPI_CONFIG_SSBPOL(spi_get_chipselect(spi, 0));
>  =

>  	if (cfg =3D=3D current_cfg)
>  		return 0;
> @@ -614,9 +614,9 @@ static void mx51_configure_cpha(struct spi_imx_data *=
spi_imx,
>  	cpha ^=3D flip_cpha;
>  =

>  	if (cpha)
> -		cfg |=3D MX51_ECSPI_CONFIG_SCLKPHA(spi->chip_select);
> +		cfg |=3D MX51_ECSPI_CONFIG_SCLKPHA(spi_get_chipselect(spi, 0));
>  	else
> -		cfg &=3D ~MX51_ECSPI_CONFIG_SCLKPHA(spi->chip_select);
> +		cfg &=3D ~MX51_ECSPI_CONFIG_SCLKPHA(spi_get_chipselect(spi, 0));
>  =

>  	writel(cfg, spi_imx->base + MX51_ECSPI_CONFIG);
>  }
> @@ -768,8 +768,8 @@ static int mx31_prepare_transfer(struct spi_imx_data =
*spi_imx,
>  		reg |=3D MX31_CSPICTRL_POL;
>  	if (spi->mode & SPI_CS_HIGH)
>  		reg |=3D MX31_CSPICTRL_SSPOL;
> -	if (!spi->cs_gpiod)
> -		reg |=3D (spi->chip_select) <<
> +	if (!spi_get_csgpiod(spi, 0))
> +		reg |=3D (spi_get_chipselect(spi, 0)) <<
>  			(is_imx35_cspi(spi_imx) ? MX35_CSPICTRL_CS_SHIFT :
>  						  MX31_CSPICTRL_CS_SHIFT);
>  =

> @@ -868,8 +868,8 @@ static int mx21_prepare_transfer(struct spi_imx_data =
*spi_imx,
>  		reg |=3D MX21_CSPICTRL_POL;
>  	if (spi->mode & SPI_CS_HIGH)
>  		reg |=3D MX21_CSPICTRL_SSPOL;
> -	if (!spi->cs_gpiod)
> -		reg |=3D spi->chip_select << MX21_CSPICTRL_CS_SHIFT;
> +	if (!spi_get_csgpiod(spi, 0))
> +		reg |=3D spi_get_chipselect(spi, 0) << MX21_CSPICTRL_CS_SHIFT;
>  =

>  	writel(reg, spi_imx->base + MXC_CSPICTRL);
>  =

> diff --git a/drivers/spi/spi-ingenic.c b/drivers/spi/spi-ingenic.c
> index 713a238bee63..7d4b515a160d 100644
> --- a/drivers/spi/spi-ingenic.c
> +++ b/drivers/spi/spi-ingenic.c
> @@ -263,7 +263,7 @@ static int spi_ingenic_prepare_message(struct spi_con=
troller *ctlr,
>  {
>  	struct ingenic_spi *priv =3D spi_controller_get_devdata(ctlr);
>  	struct spi_device *spi =3D message->spi;
> -	unsigned int cs =3D REG_SSICR1_FRMHL << spi->chip_select;
> +	unsigned int cs =3D REG_SSICR1_FRMHL << spi_get_chipselect(spi, 0);
>  	unsigned int ssicr0_mask =3D REG_SSICR0_LOOP | REG_SSICR0_FSEL;
>  	unsigned int ssicr1_mask =3D REG_SSICR1_PHA | REG_SSICR1_POL | cs;
>  	unsigned int ssicr0 =3D 0, ssicr1 =3D 0;
> @@ -282,7 +282,7 @@ static int spi_ingenic_prepare_message(struct spi_con=
troller *ctlr,
>  =

>  	if (spi->mode & SPI_LOOP)
>  		ssicr0 |=3D REG_SSICR0_LOOP;
> -	if (spi->chip_select)
> +	if (spi_get_chipselect(spi, 0))
>  		ssicr0 |=3D REG_SSICR0_FSEL;
>  =

>  	if (spi->mode & SPI_CPHA)
> diff --git a/drivers/spi/spi-intel.c b/drivers/spi/spi-intel.c
> index f619212b0d5c..751ba6c09958 100644
> --- a/drivers/spi/spi-intel.c
> +++ b/drivers/spi/spi-intel.c
> @@ -451,7 +451,7 @@ static u32 intel_spi_chip_addr(const struct intel_spi=
 *ispi,
>  	/* Pick up the correct start address */
>  	if (!mem)
>  		return 0;
> -	return mem->spi->chip_select =3D=3D 1 ? ispi->chip0_size : 0;
> +	return (spi_get_chipselect(mem->spi, 0) =3D=3D 1) ? ispi->chip0_size : =
0;
>  }
>  =

>  static int intel_spi_read_reg(struct intel_spi *ispi, const struct spi_m=
em *mem,
> diff --git a/drivers/spi/spi-jcore.c b/drivers/spi/spi-jcore.c
> index 74c8319c29f1..c42a3358e8c9 100644
> --- a/drivers/spi/spi-jcore.c
> +++ b/drivers/spi/spi-jcore.c
> @@ -68,9 +68,9 @@ static void jcore_spi_program(struct jcore_spi *hw)
>  static void jcore_spi_chipsel(struct spi_device *spi, bool value)
>  {
>  	struct jcore_spi *hw =3D spi_master_get_devdata(spi->master);
> -	u32 csbit =3D 1U << (2 * spi->chip_select);
> +	u32 csbit =3D 1U << (2 * spi_get_chipselect(spi, 0));
>  =

> -	dev_dbg(hw->master->dev.parent, "chipselect %d\n", spi->chip_select);
> +	dev_dbg(hw->master->dev.parent, "chipselect %d\n", spi_get_chipselect(s=
pi, 0));
>  =

>  	if (value)
>  		hw->cs_reg |=3D csbit;
> diff --git a/drivers/spi/spi-lantiq-ssc.c b/drivers/spi/spi-lantiq-ssc.c
> index aae26f62ea87..6b191cefb0d4 100644
> --- a/drivers/spi/spi-lantiq-ssc.c
> +++ b/drivers/spi/spi-lantiq-ssc.c
> @@ -388,11 +388,11 @@ static int lantiq_ssc_setup(struct spi_device *spid=
ev)
>  {
>  	struct spi_master *master =3D spidev->master;
>  	struct lantiq_ssc_spi *spi =3D spi_master_get_devdata(master);
> -	unsigned int cs =3D spidev->chip_select;
> +	unsigned int cs =3D spi_get_chipselect(spidev, 0);
>  	u32 gpocon;
>  =

>  	/* GPIOs are used for CS */
> -	if (spidev->cs_gpiod)
> +	if (spi_get_csgpiod(spidev, 0))
>  		return 0;
>  =

>  	dev_dbg(spi->dev, "using internal chipselect %u\n", cs);
> @@ -796,7 +796,7 @@ static void lantiq_ssc_handle_err(struct spi_master *=
master,
>  static void lantiq_ssc_set_cs(struct spi_device *spidev, bool enable)
>  {
>  	struct lantiq_ssc_spi *spi =3D spi_master_get_devdata(spidev->master);
> -	unsigned int cs =3D spidev->chip_select;
> +	unsigned int cs =3D spi_get_chipselect(spidev, 0);
>  	u32 fgpo;
>  =

>  	if (!!(spidev->mode & SPI_CS_HIGH) =3D=3D enable)
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 0c79193d9697..f85bb4662599 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -325,7 +325,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct=
 spi_mem_op *op)
>  	if (!spi_mem_internal_supports_op(mem, op))
>  		return -ENOTSUPP;
>  =

> -	if (ctlr->mem_ops && !mem->spi->cs_gpiod) {
> +	if (ctlr->mem_ops && !spi_get_csgpiod(mem->spi, 0)) {
>  		ret =3D spi_mem_access_start(mem);
>  		if (ret)
>  			return ret;
> @@ -808,7 +808,7 @@ int spi_mem_poll_status(struct spi_mem *mem,
>  	    op->data.dir !=3D SPI_MEM_DATA_IN)
>  		return -EINVAL;
>  =

> -	if (ctlr->mem_ops && ctlr->mem_ops->poll_status && !mem->spi->cs_gpiod)=
 {
> +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status && !spi_get_csgpiod(mem=
->spi, 0)) {
>  		ret =3D spi_mem_access_start(mem);
>  		if (ret)
>  			return ret;
> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
> index d47f2623a60f..0d45cf8a2e72 100644
> --- a/drivers/spi/spi-meson-spicc.c
> +++ b/drivers/spi/spi-meson-spicc.c
> @@ -505,7 +505,7 @@ static int meson_spicc_prepare_message(struct spi_mas=
ter *master,
>  		conf |=3D FIELD_PREP(SPICC_DRCTL_MASK, SPICC_DRCTL_IGNORE);
>  =

>  	/* Select CS */
> -	conf |=3D FIELD_PREP(SPICC_CS_MASK, spi->chip_select);
> +	conf |=3D FIELD_PREP(SPICC_CS_MASK, spi_get_chipselect(spi, 0));
>  =

>  	/* Default 8bit word */
>  	conf |=3D FIELD_PREP(SPICC_BITLENGTH_MASK, 8 - 1);
> diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip=
-core.c
> index aeaa1da88f39..1a90fcfe6015 100644
> --- a/drivers/spi/spi-microchip-core.c
> +++ b/drivers/spi/spi-microchip-core.c
> @@ -247,8 +247,8 @@ static void mchp_corespi_set_cs(struct spi_device *sp=
i, bool disable)
>  	struct mchp_corespi *corespi =3D spi_master_get_devdata(spi->master);
>  =

>  	reg =3D mchp_corespi_read(corespi, REG_SLAVE_SELECT);
> -	reg &=3D ~BIT(spi->chip_select);
> -	reg |=3D !disable << spi->chip_select;
> +	reg &=3D ~BIT(spi_get_chipselect(spi, 0));
> +	reg |=3D !disable << spi_get_chipselect(spi, 0);
>  =

>  	mchp_corespi_write(corespi, REG_SLAVE_SELECT, reg);
>  }
> @@ -265,7 +265,7 @@ static int mchp_corespi_setup(struct spi_device *spi)
>  	 */
>  	if (spi->mode & SPI_CS_HIGH) {
>  		reg =3D mchp_corespi_read(corespi, REG_SLAVE_SELECT);
> -		reg |=3D BIT(spi->chip_select);
> +		reg |=3D BIT(spi_get_chipselect(spi, 0));
>  		mchp_corespi_write(corespi, REG_SLAVE_SELECT, reg);
>  	}
>  	return 0;
> diff --git a/drivers/spi/spi-mpc512x-psc.c b/drivers/spi/spi-mpc512x-psc.c
> index 03630359ce70..dc72f4c5b816 100644
> --- a/drivers/spi/spi-mpc512x-psc.c
> +++ b/drivers/spi/spi-mpc512x-psc.c
> @@ -127,13 +127,13 @@ static void mpc512x_psc_spi_activate_cs(struct spi_=
device *spi)
>  	out_be32(psc_addr(mps, ccr), ccr);
>  	mps->bits_per_word =3D cs->bits_per_word;
>  =

> -	if (spi->cs_gpiod) {
> +	if (spi_get_csgpiod(spi, 0)) {
>  		if (mps->cs_control)
>  			/* boardfile override */
>  			mps->cs_control(spi, (spi->mode & SPI_CS_HIGH) ? 1 : 0);
>  		else
>  			/* gpiolib will deal with the inversion */
> -			gpiod_set_value(spi->cs_gpiod, 1);
> +			gpiod_set_value(spi_get_csgpiod(spi, 0), 1);
>  	}
>  }
>  =

> @@ -141,13 +141,13 @@ static void mpc512x_psc_spi_deactivate_cs(struct sp=
i_device *spi)
>  {
>  	struct mpc512x_psc_spi *mps =3D spi_master_get_devdata(spi->master);
>  =

> -	if (spi->cs_gpiod) {
> +	if (spi_get_csgpiod(spi, 0)) {
>  		if (mps->cs_control)
>  			/* boardfile override */
>  			mps->cs_control(spi, (spi->mode & SPI_CS_HIGH) ? 0 : 1);
>  		else
>  			/* gpiolib will deal with the inversion */
> -			gpiod_set_value(spi->cs_gpiod, 0);
> +			gpiod_set_value(spi_get_csgpiod(spi, 0), 0);
>  	}
>  }
>  =

> diff --git a/drivers/spi/spi-mpc52xx.c b/drivers/spi/spi-mpc52xx.c
> index 7b64e64c65cf..c474a767fc48 100644
> --- a/drivers/spi/spi-mpc52xx.c
> +++ b/drivers/spi/spi-mpc52xx.c
> @@ -101,7 +101,7 @@ static void mpc52xx_spi_chipsel(struct mpc52xx_spi *m=
s, int value)
>  	int cs;
>  =

>  	if (ms->gpio_cs_count > 0) {
> -		cs =3D ms->message->spi->chip_select;
> +		cs =3D spi_get_chipselect(ms->message->spi, 0);
>  		gpiod_set_value(ms->gpio_cs[cs], value);
>  	} else {
>  		out_8(ms->regs + SPI_PORTDATA, value ? 0 : 0x08);
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index 9eab6c20dbc5..21c321f43766 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c
> @@ -421,7 +421,7 @@ static int mtk_spi_hw_init(struct spi_master *master,
>  =

>  	/* pad select */
>  	if (mdata->dev_comp->need_pad_sel)
> -		writel(mdata->pad_sel[spi->chip_select],
> +		writel(mdata->pad_sel[spi_get_chipselect(spi, 0)],
>  		       mdata->base + SPI_PAD_SEL_REG);
>  =

>  	/* tick delay */
> @@ -735,9 +735,9 @@ static int mtk_spi_setup(struct spi_device *spi)
>  	if (!spi->controller_data)
>  		spi->controller_data =3D (void *)&mtk_default_chip_info;
>  =

> -	if (mdata->dev_comp->need_pad_sel && spi->cs_gpiod)
> +	if (mdata->dev_comp->need_pad_sel && spi_get_csgpiod(spi, 0))
>  		/* CS de-asserted, gpiolib will handle inversion */
> -		gpiod_direction_output(spi->cs_gpiod, 0);
> +		gpiod_direction_output(spi_get_csgpiod(spi, 0), 0);
>  =

>  	return 0;
>  }
> diff --git a/drivers/spi/spi-mt7621.c b/drivers/spi/spi-mt7621.c
> index c4cc8e2f85e2..3e9d396b33bd 100644
> --- a/drivers/spi/spi-mt7621.c
> +++ b/drivers/spi/spi-mt7621.c
> @@ -76,7 +76,7 @@ static inline void mt7621_spi_write(struct mt7621_spi *=
rs, u32 reg, u32 val)
>  static void mt7621_spi_set_cs(struct spi_device *spi, int enable)
>  {
>  	struct mt7621_spi *rs =3D spidev_to_mt7621_spi(spi);
> -	int cs =3D spi->chip_select;
> +	int cs =3D spi_get_chipselect(spi, 0);
>  	u32 polar =3D 0;
>  	u32 master;
>  =

> diff --git a/drivers/spi/spi-mux.c b/drivers/spi/spi-mux.c
> index 0709e987bd5a..fa8c1f740c70 100644
> --- a/drivers/spi/spi-mux.c
> +++ b/drivers/spi/spi-mux.c
> @@ -51,22 +51,22 @@ static int spi_mux_select(struct spi_device *spi)
>  	struct spi_mux_priv *priv =3D spi_controller_get_devdata(spi->controlle=
r);
>  	int ret;
>  =

> -	ret =3D mux_control_select(priv->mux, spi->chip_select);
> +	ret =3D mux_control_select(priv->mux, spi_get_chipselect(spi, 0));
>  	if (ret)
>  		return ret;
>  =

> -	if (priv->current_cs =3D=3D spi->chip_select)
> +	if (priv->current_cs =3D=3D spi_get_chipselect(spi, 0))
>  		return 0;
>  =

>  	dev_dbg(&priv->spi->dev, "setting up the mux for cs %d\n",
> -		spi->chip_select);
> +		spi_get_chipselect(spi, 0));
>  =

>  	/* copy the child device's settings except for the cs */
>  	priv->spi->max_speed_hz =3D spi->max_speed_hz;
>  	priv->spi->mode =3D spi->mode;
>  	priv->spi->bits_per_word =3D spi->bits_per_word;
>  =

> -	priv->current_cs =3D spi->chip_select;
> +	priv->current_cs =3D spi_get_chipselect(spi, 0);
>  =

>  	return 0;
>  }
> diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> index a3dba17390eb..52bd2c49c34e 100644
> --- a/drivers/spi/spi-mxic.c
> +++ b/drivers/spi/spi-mxic.c
> @@ -306,8 +306,8 @@ static u32 mxic_spi_prep_hc_cfg(struct spi_device *sp=
i, u32 flags)
>  		nio =3D 2;
>  =

>  	return flags | HC_CFG_NIO(nio) |
> -	       HC_CFG_TYPE(spi->chip_select, HC_CFG_TYPE_SPI_NOR) |
> -	       HC_CFG_SLV_ACT(spi->chip_select) | HC_CFG_IDLE_SIO_LVL(1);
> +	       HC_CFG_TYPE(spi_get_chipselect(spi, 0), HC_CFG_TYPE_SPI_NOR) |
> +	       HC_CFG_SLV_ACT(spi_get_chipselect(spi, 0)) | HC_CFG_IDLE_SIO_LVL=
(1);
>  }
>  =

>  static u32 mxic_spi_mem_prep_op_cfg(const struct spi_mem_op *op,
> @@ -405,7 +405,7 @@ static ssize_t mxic_spi_mem_dirmap_read(struct spi_me=
m_dirmap_desc *desc,
>  	len =3D min_t(size_t, len, mxic->linear.size);
>  	writel(len, mxic->regs + LRD_RANGE);
>  	writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode) |
> -	       LMODE_SLV_ACT(desc->mem->spi->chip_select) |
> +	       LMODE_SLV_ACT(spi_get_chipselect(desc->mem->spi, 0)) |
>  	       LMODE_EN,
>  	       mxic->regs + LRD_CTRL);
>  =

> @@ -449,7 +449,7 @@ static ssize_t mxic_spi_mem_dirmap_write(struct spi_m=
em_dirmap_desc *desc,
>  	len =3D min_t(size_t, len, mxic->linear.size);
>  	writel(len, mxic->regs + LWR_RANGE);
>  	writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode) |
> -	       LMODE_SLV_ACT(desc->mem->spi->chip_select) |
> +	       LMODE_SLV_ACT(spi_get_chipselect(desc->mem->spi, 0)) |
>  	       LMODE_EN,
>  	       mxic->regs + LWR_CTRL);
>  =

> @@ -524,7 +524,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
>  	writel(HC_EN_BIT, mxic->regs + HC_EN);
>  =

>  	writel(mxic_spi_mem_prep_op_cfg(op, op->data.nbytes),
> -	       mxic->regs + SS_CTRL(mem->spi->chip_select));
> +	       mxic->regs + SS_CTRL(spi_get_chipselect(mem->spi, 0)));
>  =

>  	writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
>  	       mxic->regs + HC_CFG);
> diff --git a/drivers/spi/spi-mxs.c b/drivers/spi/spi-mxs.c
> index 55178579f3c6..98076aa4b1c7 100644
> --- a/drivers/spi/spi-mxs.c
> +++ b/drivers/spi/spi-mxs.c
> @@ -369,7 +369,7 @@ static int mxs_spi_transfer_one(struct spi_master *ma=
ster,
>  	/* Program CS register bits here, it will be used for all transfers. */
>  	writel(BM_SSP_CTRL0_WAIT_FOR_CMD | BM_SSP_CTRL0_WAIT_FOR_IRQ,
>  	       ssp->base + HW_SSP_CTRL0 + STMP_OFFSET_REG_CLR);
> -	writel(mxs_spi_cs_to_reg(m->spi->chip_select),
> +	writel(mxs_spi_cs_to_reg(spi_get_chipselect(m->spi, 0)),
>  	       ssp->base + HW_SSP_CTRL0 + STMP_OFFSET_REG_SET);
>  =

>  	list_for_each_entry(t, &m->transfers, transfer_list) {
> diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
> index 559d3a5b4062..86e3978883fe 100644
> --- a/drivers/spi/spi-npcm-fiu.c
> +++ b/drivers/spi/spi-npcm-fiu.c
> @@ -288,7 +288,7 @@ static ssize_t npcm_fiu_direct_read(struct spi_mem_di=
rmap_desc *desc,
>  {
>  	struct npcm_fiu_spi *fiu =3D
>  		spi_controller_get_devdata(desc->mem->spi->master);
> -	struct npcm_fiu_chip *chip =3D &fiu->chip[desc->mem->spi->chip_select];
> +	struct npcm_fiu_chip *chip =3D &fiu->chip[spi_get_chipselect(desc->mem-=
>spi, 0)];
>  	void __iomem *src =3D (void __iomem *)(chip->flash_region_mapped_ptr +
>  					     offs);
>  	u8 *buf_rx =3D buf;
> @@ -315,7 +315,7 @@ static ssize_t npcm_fiu_direct_write(struct spi_mem_d=
irmap_desc *desc,
>  {
>  	struct npcm_fiu_spi *fiu =3D
>  		spi_controller_get_devdata(desc->mem->spi->master);
> -	struct npcm_fiu_chip *chip =3D &fiu->chip[desc->mem->spi->chip_select];
> +	struct npcm_fiu_chip *chip =3D &fiu->chip[spi_get_chipselect(desc->mem-=
>spi, 0)];
>  	void __iomem *dst =3D (void __iomem *)(chip->flash_region_mapped_ptr +
>  					     offs);
>  	const u8 *buf_tx =3D buf;
> @@ -344,7 +344,7 @@ static int npcm_fiu_uma_read(struct spi_mem *mem,
>  =

>  	regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
>  			   NPCM_FIU_UMA_CTS_DEV_NUM,
> -			   (mem->spi->chip_select <<
> +			   (spi_get_chipselect(mem->spi, 0) <<
>  			    NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));
>  	regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CMD,
>  			   NPCM_FIU_UMA_CMD_CMD, op->cmd.opcode);
> @@ -398,7 +398,7 @@ static int npcm_fiu_uma_write(struct spi_mem *mem,
>  =

>  	regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
>  			   NPCM_FIU_UMA_CTS_DEV_NUM,
> -			   (mem->spi->chip_select <<
> +			   (spi_get_chipselect(mem->spi, 0) <<
>  			    NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));
>  =

>  	regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CMD,
> @@ -451,7 +451,7 @@ static int npcm_fiu_manualwrite(struct spi_mem *mem,
>  =

>  	regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
>  			   NPCM_FIU_UMA_CTS_DEV_NUM,
> -			   (mem->spi->chip_select <<
> +			   (spi_get_chipselect(mem->spi, 0) <<
>  			    NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));
>  	regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
>  			   NPCM_FIU_UMA_CTS_SW_CS, 0);
> @@ -545,7 +545,7 @@ static int npcm_fiu_exec_op(struct spi_mem *mem, cons=
t struct spi_mem_op *op)
>  {
>  	struct npcm_fiu_spi *fiu =3D
>  		spi_controller_get_devdata(mem->spi->master);
> -	struct npcm_fiu_chip *chip =3D &fiu->chip[mem->spi->chip_select];
> +	struct npcm_fiu_chip *chip =3D &fiu->chip[spi_get_chipselect(mem->spi, =
0)];
>  	int ret =3D 0;
>  	u8 *buf;
>  =

> @@ -605,7 +605,7 @@ static int npcm_fiu_dirmap_create(struct spi_mem_dirm=
ap_desc *desc)
>  {
>  	struct npcm_fiu_spi *fiu =3D
>  		spi_controller_get_devdata(desc->mem->spi->master);
> -	struct npcm_fiu_chip *chip =3D &fiu->chip[desc->mem->spi->chip_select];
> +	struct npcm_fiu_chip *chip =3D &fiu->chip[spi_get_chipselect(desc->mem-=
>spi, 0)];
>  	struct regmap *gcr_regmap;
>  =

>  	if (!fiu->res_mem) {
> @@ -624,7 +624,7 @@ static int npcm_fiu_dirmap_create(struct spi_mem_dirm=
ap_desc *desc)
>  		chip->flash_region_mapped_ptr =3D
>  			devm_ioremap(fiu->dev, (fiu->res_mem->start +
>  							(fiu->info->max_map_size *
> -						    desc->mem->spi->chip_select)),
> +						    spi_get_chipselect(desc->mem->spi, 0))),
>  					     (u32)desc->info.length);
>  		if (!chip->flash_region_mapped_ptr) {
>  			dev_warn(fiu->dev, "Error mapping memory region, direct read disabled=
\n");
> @@ -669,9 +669,9 @@ static int npcm_fiu_setup(struct spi_device *spi)
>  	struct npcm_fiu_spi *fiu =3D spi_controller_get_devdata(ctrl);
>  	struct npcm_fiu_chip *chip;
>  =

> -	chip =3D &fiu->chip[spi->chip_select];
> +	chip =3D &fiu->chip[spi_get_chipselect(spi, 0)];
>  	chip->fiu =3D fiu;
> -	chip->chipselect =3D spi->chip_select;
> +	chip->chipselect =3D spi_get_chipselect(spi, 0);
>  	chip->clkrate =3D spi->max_speed_hz;
>  =

>  	fiu->clkrate =3D clk_get_rate(fiu->clk);
> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index 1c1991a26c15..e9baf93aef7e 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
> @@ -663,7 +663,7 @@ static void nxp_fspi_select_mem(struct nxp_fspi *f, s=
truct spi_device *spi)
>  	 * Return, if previously selected slave device is same as current
>  	 * requested slave device.
>  	 */
> -	if (f->selected =3D=3D spi->chip_select)
> +	if (f->selected =3D=3D spi_get_chipselect(spi, 0))
>  		return;
>  =

>  	/* Reset FLSHxxCR0 registers */
> @@ -676,9 +676,9 @@ static void nxp_fspi_select_mem(struct nxp_fspi *f, s=
truct spi_device *spi)
>  	size_kb =3D FSPI_FLSHXCR0_SZ(f->memmap_phy_size);
>  =

>  	fspi_writel(f, size_kb, f->iobase + FSPI_FLSHA1CR0 +
> -		    4 * spi->chip_select);
> +		    4 * spi_get_chipselect(spi, 0));
>  =

> -	dev_dbg(f->dev, "Slave device [CS:%x] selected\n", spi->chip_select);
> +	dev_dbg(f->dev, "Slave device [CS:%x] selected\n", spi_get_chipselect(s=
pi, 0));
>  =

>  	nxp_fspi_clk_disable_unprep(f);
>  =

> @@ -690,7 +690,7 @@ static void nxp_fspi_select_mem(struct nxp_fspi *f, s=
truct spi_device *spi)
>  	if (ret)
>  		return;
>  =

> -	f->selected =3D spi->chip_select;
> +	f->selected =3D spi_get_chipselect(spi, 0);
>  }
>  =

>  static int nxp_fspi_read_ahb(struct nxp_fspi *f, const struct spi_mem_op=
 *op)
> @@ -1055,7 +1055,7 @@ static const char *nxp_fspi_get_name(struct spi_mem=
 *mem)
>  =

>  	name =3D devm_kasprintf(dev, GFP_KERNEL,
>  			      "%s-%d", dev_name(f->dev),
> -			      mem->spi->chip_select);
> +			      spi_get_chipselect(mem->spi, 0));
>  =

>  	if (!name) {
>  		dev_err(dev, "failed to get memory for custom flash name\n");
> diff --git a/drivers/spi/spi-omap-100k.c b/drivers/spi/spi-omap-100k.c
> index 061f7394e5b9..ec05778216a1 100644
> --- a/drivers/spi/spi-omap-100k.c
> +++ b/drivers/spi/spi-omap-100k.c
> @@ -268,7 +268,7 @@ static int omap1_spi100k_setup(struct spi_device *spi)
>  		cs =3D devm_kzalloc(&spi->dev, sizeof(*cs), GFP_KERNEL);
>  		if (!cs)
>  			return -ENOMEM;
> -		cs->base =3D spi100k->base + spi->chip_select * 0x14;
> +		cs->base =3D spi100k->base + spi_get_chipselect(spi, 0) * 0x14;
>  		spi->controller_state =3D cs;
>  	}
>  =

> diff --git a/drivers/spi/spi-omap-uwire.c b/drivers/spi/spi-omap-uwire.c
> index 29198e6815b2..7f9fe9147e61 100644
> --- a/drivers/spi/spi-omap-uwire.c
> +++ b/drivers/spi/spi-omap-uwire.c
> @@ -179,7 +179,7 @@ static void uwire_chipselect(struct spi_device *spi, =
int value)
>  =

>  	w =3D uwire_read_reg(UWIRE_CSR);
>  	old_cs =3D (w >> 10) & 0x03;
> -	if (value =3D=3D BITBANG_CS_INACTIVE || old_cs !=3D spi->chip_select) {
> +	if (value =3D=3D BITBANG_CS_INACTIVE || old_cs !=3D spi_get_chipselect(=
spi, 0)) {
>  		/* Deselect this CS, or the previous CS */
>  		w &=3D ~CS_CMD;
>  		uwire_write_reg(UWIRE_CSR, w);
> @@ -193,7 +193,7 @@ static void uwire_chipselect(struct spi_device *spi, =
int value)
>  		else
>  			uwire_write_reg(UWIRE_SR4, 0);
>  =

> -		w =3D spi->chip_select << 10;
> +		w =3D spi_get_chipselect(spi, 0) << 10;
>  		w |=3D CS_CMD;
>  		uwire_write_reg(UWIRE_CSR, w);
>  	}
> @@ -210,7 +210,7 @@ static int uwire_txrx(struct spi_device *spi, struct =
spi_transfer *t)
>  	if (!t->tx_buf && !t->rx_buf)
>  		return 0;
>  =

> -	w =3D spi->chip_select << 10;
> +	w =3D spi_get_chipselect(spi, 0) << 10;
>  	w |=3D CS_CMD;
>  =

>  	if (t->tx_buf) {
> @@ -408,7 +408,7 @@ static int uwire_setup_transfer(struct spi_device *sp=
i, struct spi_transfer *t)
>  		rate /=3D 8;
>  		break;
>  	}
> -	omap_uwire_configure_mode(spi->chip_select, flags);
> +	omap_uwire_configure_mode(spi_get_chipselect(spi, 0), flags);
>  	pr_debug("%s: uwire flags %02x, armxor %lu KHz, SCK %lu KHz\n",
>  			__func__, flags,
>  			clk_get_rate(uwire->ck) / 1000,
> diff --git a/drivers/spi/spi-omap2-mcspi.c b/drivers/spi/spi-omap2-mcspi.c
> index 6ba9b0d7710b..5e404da112a2 100644
> --- a/drivers/spi/spi-omap2-mcspi.c
> +++ b/drivers/spi/spi-omap2-mcspi.c
> @@ -379,7 +379,7 @@ static void omap2_mcspi_rx_callback(void *data)
>  {
>  	struct spi_device *spi =3D data;
>  	struct omap2_mcspi *mcspi =3D spi_master_get_devdata(spi->master);
> -	struct omap2_mcspi_dma *mcspi_dma =3D &mcspi->dma_channels[spi->chip_se=
lect];
> +	struct omap2_mcspi_dma *mcspi_dma =3D &mcspi->dma_channels[spi_get_chip=
select(spi, 0)];
>  =

>  	/* We must disable the DMA RX request */
>  	omap2_mcspi_set_dma_req(spi, 1, 0);
> @@ -391,7 +391,7 @@ static void omap2_mcspi_tx_callback(void *data)
>  {
>  	struct spi_device *spi =3D data;
>  	struct omap2_mcspi *mcspi =3D spi_master_get_devdata(spi->master);
> -	struct omap2_mcspi_dma *mcspi_dma =3D &mcspi->dma_channels[spi->chip_se=
lect];
> +	struct omap2_mcspi_dma *mcspi_dma =3D &mcspi->dma_channels[spi_get_chip=
select(spi, 0)];
>  =

>  	/* We must disable the DMA TX request */
>  	omap2_mcspi_set_dma_req(spi, 0, 0);
> @@ -408,7 +408,7 @@ static void omap2_mcspi_tx_dma(struct spi_device *spi,
>  	struct dma_async_tx_descriptor *tx;
>  =

>  	mcspi =3D spi_master_get_devdata(spi->master);
> -	mcspi_dma =3D &mcspi->dma_channels[spi->chip_select];
> +	mcspi_dma =3D &mcspi->dma_channels[spi_get_chipselect(spi, 0)];
>  =

>  	dmaengine_slave_config(mcspi_dma->dma_tx, &cfg);
>  =

> @@ -446,7 +446,7 @@ omap2_mcspi_rx_dma(struct spi_device *spi, struct spi=
_transfer *xfer,
>  	struct dma_async_tx_descriptor *tx;
>  =

>  	mcspi =3D spi_master_get_devdata(spi->master);
> -	mcspi_dma =3D &mcspi->dma_channels[spi->chip_select];
> +	mcspi_dma =3D &mcspi->dma_channels[spi_get_chipselect(spi, 0)];
>  	count =3D xfer->len;
>  =

>  	/*
> @@ -591,7 +591,7 @@ omap2_mcspi_txrx_dma(struct spi_device *spi, struct s=
pi_transfer *xfer)
>  	int			wait_res;
>  =

>  	mcspi =3D spi_master_get_devdata(spi->master);
> -	mcspi_dma =3D &mcspi->dma_channels[spi->chip_select];
> +	mcspi_dma =3D &mcspi->dma_channels[spi_get_chipselect(spi, 0)];
>  =

>  	if (cs->word_len <=3D 8) {
>  		width =3D DMA_SLAVE_BUSWIDTH_1_BYTE;
> @@ -1062,8 +1062,8 @@ static int omap2_mcspi_setup(struct spi_device *spi)
>  		cs =3D kzalloc(sizeof(*cs), GFP_KERNEL);
>  		if (!cs)
>  			return -ENOMEM;
> -		cs->base =3D mcspi->base + spi->chip_select * 0x14;
> -		cs->phys =3D mcspi->phys + spi->chip_select * 0x14;
> +		cs->base =3D mcspi->base + spi_get_chipselect(spi, 0) * 0x14;
> +		cs->phys =3D mcspi->phys + spi_get_chipselect(spi, 0) * 0x14;
>  		cs->mode =3D 0;
>  		cs->chconf0 =3D 0;
>  		cs->chctrl0 =3D 0;
> @@ -1142,7 +1142,7 @@ static int omap2_mcspi_transfer_one(struct spi_mast=
er *master,
>  	u32				chconf;
>  =

>  	mcspi =3D spi_master_get_devdata(master);
> -	mcspi_dma =3D mcspi->dma_channels + spi->chip_select;
> +	mcspi_dma =3D mcspi->dma_channels + spi_get_chipselect(spi, 0);
>  	cs =3D spi->controller_state;
>  	cd =3D spi->controller_data;
>  =

> @@ -1158,7 +1158,7 @@ static int omap2_mcspi_transfer_one(struct spi_mast=
er *master,
>  =

>  	omap2_mcspi_set_enable(spi, 0);
>  =

> -	if (spi->cs_gpiod)
> +	if (spi_get_csgpiod(spi, 0))
>  		omap2_mcspi_set_cs(spi, spi->mode & SPI_CS_HIGH);
>  =

>  	if (par_override ||
> @@ -1247,7 +1247,7 @@ static int omap2_mcspi_transfer_one(struct spi_mast=
er *master,
>  =

>  	omap2_mcspi_set_enable(spi, 0);
>  =

> -	if (spi->cs_gpiod)
> +	if (spi_get_csgpiod(spi, 0))
>  		omap2_mcspi_set_cs(spi, !(spi->mode & SPI_CS_HIGH));
>  =

>  	if (mcspi->fifo_depth > 0 && t)
> @@ -1289,7 +1289,7 @@ static bool omap2_mcspi_can_dma(struct spi_master *=
master,
>  {
>  	struct omap2_mcspi *mcspi =3D spi_master_get_devdata(spi->master);
>  	struct omap2_mcspi_dma *mcspi_dma =3D
> -		&mcspi->dma_channels[spi->chip_select];
> +		&mcspi->dma_channels[spi_get_chipselect(spi, 0)];
>  =

>  	if (!mcspi_dma->dma_rx || !mcspi_dma->dma_tx)
>  		return false;
> @@ -1307,7 +1307,7 @@ static size_t omap2_mcspi_max_xfer_size(struct spi_=
device *spi)
>  {
>  	struct omap2_mcspi *mcspi =3D spi_master_get_devdata(spi->master);
>  	struct omap2_mcspi_dma *mcspi_dma =3D
> -		&mcspi->dma_channels[spi->chip_select];
> +		&mcspi->dma_channels[spi_get_chipselect(spi, 0)];
>  =

>  	if (mcspi->max_xfer_len && mcspi_dma->dma_rx)
>  		return mcspi->max_xfer_len;
> diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
> index 565cd4c48d7b..13e60976692c 100644
> --- a/drivers/spi/spi-orion.c
> +++ b/drivers/spi/spi-orion.c
> @@ -346,7 +346,7 @@ static void orion_spi_set_cs(struct spi_device *spi, =
bool enable)
>  	 * as it is handled by a GPIO, but that doesn't matter. What we need
>  	 * is to deassert the old chip select and assert some other chip select.
>  	 */
> -	val |=3D ORION_SPI_CS(spi->chip_select);
> +	val |=3D ORION_SPI_CS(spi_get_chipselect(spi, 0));
>  =

>  	/*
>  	 * Chip select logic is inverted from spi_set_cs(). For lines using a
> @@ -470,7 +470,7 @@ orion_spi_write_read(struct spi_device *spi, struct s=
pi_transfer *xfer)
>  	unsigned int count;
>  	int word_len;
>  	struct orion_spi *orion_spi;
> -	int cs =3D spi->chip_select;
> +	int cs =3D spi_get_chipselect(spi, 0);
>  	void __iomem *vaddr;
>  =

>  	word_len =3D spi->bits_per_word;
> diff --git a/drivers/spi/spi-pci1xxxx.c b/drivers/spi/spi-pci1xxxx.c
> index a31c3b612a43..1c5731641a04 100644
> --- a/drivers/spi/spi-pci1xxxx.c
> +++ b/drivers/spi/spi-pci1xxxx.c
> @@ -116,11 +116,11 @@ static void pci1xxxx_spi_set_cs(struct spi_device *=
spi, bool enable)
>  	regval =3D readl(par->reg_base + SPI_MST_CTL_REG_OFFSET(p->hw_inst));
>  	if (enable) {
>  		regval &=3D ~SPI_MST_CTL_DEVSEL_MASK;
> -		regval |=3D (spi->chip_select << 25);
> +		regval |=3D (spi_get_chipselect(spi, 0) << 25);
>  		writel(regval,
>  		       par->reg_base + SPI_MST_CTL_REG_OFFSET(p->hw_inst));
>  	} else {
> -		regval &=3D ~(spi->chip_select << 25);
> +		regval &=3D ~(spi_get_chipselect(spi, 0) << 25);
>  		writel(regval,
>  		       par->reg_base + SPI_MST_CTL_REG_OFFSET(p->hw_inst));
>  =

> diff --git a/drivers/spi/spi-pic32-sqi.c b/drivers/spi/spi-pic32-sqi.c
> index 86ad17597f5f..ed02d17897d1 100644
> --- a/drivers/spi/spi-pic32-sqi.c
> +++ b/drivers/spi/spi-pic32-sqi.c
> @@ -267,7 +267,7 @@ static int pic32_sqi_one_transfer(struct pic32_sqi *s=
qi,
>  	u32 nbits;
>  =

>  	/* Device selection */
> -	bd_ctrl =3D spi->chip_select << BD_DEVSEL_SHIFT;
> +	bd_ctrl =3D spi_get_chipselect(spi, 0) << BD_DEVSEL_SHIFT;
>  =

>  	/* half-duplex: select transfer buffer, direction and lane */
>  	if (xfer->rx_buf) {
> diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
> index 7e5c09a7d489..387673694f91 100644
> --- a/drivers/spi/spi-pic32.c
> +++ b/drivers/spi/spi-pic32.c
> @@ -591,7 +591,7 @@ static int pic32_spi_setup(struct spi_device *spi)
>  	 * unreliable/erroneous SPI transactions.
>  	 * To avoid that we will always handle /CS by toggling GPIO.
>  	 */
> -	if (!spi->cs_gpiod)
> +	if (!spi_get_csgpiod(spi, 0))
>  		return -EINVAL;
>  =

>  	return 0;
> @@ -600,7 +600,7 @@ static int pic32_spi_setup(struct spi_device *spi)
>  static void pic32_spi_cleanup(struct spi_device *spi)
>  {
>  	/* de-activate cs-gpio, gpiolib will handle inversion */
> -	gpiod_direction_output(spi->cs_gpiod, 0);
> +	gpiod_direction_output(spi_get_csgpiod(spi, 0), 0);
>  }
>  =

>  static int pic32_spi_dma_prep(struct pic32_spi *pic32s, struct device *d=
ev)
> diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
> index a17ff839117f..025bcdc30ba4 100644
> --- a/drivers/spi/spi-pl022.c
> +++ b/drivers/spi/spi-pl022.c
> @@ -1587,9 +1587,9 @@ static int pl022_transfer_one_message(struct spi_ma=
ster *master,
>  =

>  	/* Setup the SPI using the per chip configuration */
>  	pl022->cur_chip =3D spi_get_ctldata(msg->spi);
> -	pl022->cur_cs =3D msg->spi->chip_select;
> +	pl022->cur_cs =3D spi_get_chipselect(msg->spi, 0);
>  	/* This is always available but may be set to -ENOENT */
> -	pl022->cur_gpiod =3D msg->spi->cs_gpiod;
> +	pl022->cur_gpiod =3D msg->spi_get_csgpiod(spi, 0);
>  =

>  	restore_state(pl022);
>  	flush(pl022);
> diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
> index 32cc82a89ec1..abcdc1eb1a40 100644
> --- a/drivers/spi/spi-pxa2xx.c
> +++ b/drivers/spi/spi-pxa2xx.c
> @@ -368,7 +368,7 @@ static void lpss_ssp_select_cs(struct spi_device *spi,
>  =

>  	value =3D __lpss_ssp_read_priv(drv_data, config->reg_cs_ctrl);
>  =

> -	cs =3D spi->chip_select;
> +	cs =3D spi_get_chipselect(spi, 0);
>  	cs <<=3D config->cs_sel_shift;
>  	if (cs !=3D (value & config->cs_sel_mask)) {
>  		/*
> @@ -429,7 +429,7 @@ static void cs_assert(struct spi_device *spi)
>  		spi_controller_get_devdata(spi->controller);
>  =

>  	if (drv_data->ssp_type =3D=3D CE4100_SSP) {
> -		pxa2xx_spi_write(drv_data, SSSR, spi->chip_select);
> +		pxa2xx_spi_write(drv_data, SSSR, spi_get_chipselect(spi, 0));
>  		return;
>  	}
>  =

> @@ -1217,7 +1217,7 @@ static int setup(struct spi_device *spi)
>  			return -ENOMEM;
>  =

>  		if (drv_data->ssp_type =3D=3D CE4100_SSP) {
> -			if (spi->chip_select > 4) {
> +			if (spi_get_chipselect(spi, 0) > 4) {
>  				dev_err(&spi->dev,
>  					"failed setup: cs number must not be > 4.\n");
>  				kfree(chip);
> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
> index c334dfec4117..33c056fd5f4b 100644
> --- a/drivers/spi/spi-qcom-qspi.c
> +++ b/drivers/spi/spi-qcom-qspi.c
> @@ -311,7 +311,7 @@ static int qcom_qspi_prepare_message(struct spi_maste=
r *master,
>  =

>  	mstr_cfg =3D readl(ctrl->base + MSTR_CONFIG);
>  	mstr_cfg &=3D ~CHIP_SELECT_NUM;
> -	if (message->spi->chip_select)
> +	if (spi_get_chipselect(message->spi, 0))
>  		mstr_cfg |=3D CHIP_SELECT_NUM;
>  =

>  	mstr_cfg |=3D FB_CLK_EN | PIN_WPN | PIN_HOLDN | SBL_EN | FULL_CYCLE_MOD=
E;
> diff --git a/drivers/spi/spi-rb4xx.c b/drivers/spi/spi-rb4xx.c
> index 9f97d18a05c1..3c79a5d85ac2 100644
> --- a/drivers/spi/spi-rb4xx.c
> +++ b/drivers/spi/spi-rb4xx.c
> @@ -107,7 +107,7 @@ static int rb4xx_transfer_one(struct spi_master *mast=
er,
>  	 * command set was designed to almost not clash with that of the
>  	 * boot flash.
>  	 */
> -	if (spi->chip_select =3D=3D 2)
> +	if (spi_get_chipselect(spi, 0) =3D=3D 2)
>  		/* MMC */
>  		spi_ioc =3D AR71XX_SPI_IOC_CS0;
>  	else
> diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sf=
c.c
> index bd87d3c92dd3..246e81453ec3 100644
> --- a/drivers/spi/spi-rockchip-sfc.c
> +++ b/drivers/spi/spi-rockchip-sfc.c
> @@ -346,7 +346,7 @@ static int rockchip_sfc_xfer_setup(struct rockchip_sf=
c *sfc,
>  =

>  	/* set the Controller */
>  	ctrl |=3D SFC_CTRL_PHASE_SEL_NEGETIVE;
> -	cmd |=3D mem->spi->chip_select << SFC_CMD_CS_SHIFT;
> +	cmd |=3D spi_get_chipselect(mem->spi, 0) << SFC_CMD_CS_SHIFT;
>  =

>  	dev_dbg(sfc->dev, "sfc addr.nbytes=3D%x(x%d) dummy.nbytes=3D%x(x%d)\n",
>  		op->addr.nbytes, op->addr.buswidth,
> diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
> index 79242dc5272d..adc5638eff4b 100644
> --- a/drivers/spi/spi-rockchip.c
> +++ b/drivers/spi/spi-rockchip.c
> @@ -246,28 +246,30 @@ static void rockchip_spi_set_cs(struct spi_device *=
spi, bool enable)
>  	bool cs_asserted =3D spi->mode & SPI_CS_HIGH ? enable : !enable;
>  =

>  	/* Return immediately for no-op */
> -	if (cs_asserted =3D=3D rs->cs_asserted[spi->chip_select])
> +	if (cs_asserted =3D=3D rs->cs_asserted[spi_get_chipselect(spi, 0)])
>  		return;
>  =

>  	if (cs_asserted) {
>  		/* Keep things powered as long as CS is asserted */
>  		pm_runtime_get_sync(rs->dev);
>  =

> -		if (spi->cs_gpiod)
> +		if (spi_get_csgpiod(spi, 0))
>  			ROCKCHIP_SPI_SET_BITS(rs->regs + ROCKCHIP_SPI_SER, 1);
>  		else
> -			ROCKCHIP_SPI_SET_BITS(rs->regs + ROCKCHIP_SPI_SER, BIT(spi->chip_sele=
ct));
> +			ROCKCHIP_SPI_SET_BITS(rs->regs + ROCKCHIP_SPI_SER,
> +					      BIT(spi_get_chipselect(spi, 0)));
>  	} else {
> -		if (spi->cs_gpiod)
> +		if (spi_get_csgpiod(spi, 0))
>  			ROCKCHIP_SPI_CLR_BITS(rs->regs + ROCKCHIP_SPI_SER, 1);
>  		else
> -			ROCKCHIP_SPI_CLR_BITS(rs->regs + ROCKCHIP_SPI_SER, BIT(spi->chip_sele=
ct));
> +			ROCKCHIP_SPI_CLR_BITS(rs->regs + ROCKCHIP_SPI_SER,
> +					      BIT(spi_get_chipselect(spi, 0)));
>  =

>  		/* Drop reference from when we first asserted CS */
>  		pm_runtime_put(rs->dev);
>  	}
>  =

> -	rs->cs_asserted[spi->chip_select] =3D cs_asserted;
> +	rs->cs_asserted[spi_get_chipselect(spi, 0)] =3D cs_asserted;
>  }
>  =

>  static void rockchip_spi_handle_err(struct spi_controller *ctlr,
> @@ -541,7 +543,7 @@ static int rockchip_spi_config(struct rockchip_spi *r=
s,
>  	if (spi->mode & SPI_LSB_FIRST)
>  		cr0 |=3D CR0_FBM_LSB << CR0_FBM_OFFSET;
>  	if (spi->mode & SPI_CS_HIGH)
> -		cr0 |=3D BIT(spi->chip_select) << CR0_SOI_OFFSET;
> +		cr0 |=3D BIT(spi_get_chipselect(spi, 0)) << CR0_SOI_OFFSET;
>  =

>  	if (xfer->rx_buf && xfer->tx_buf)
>  		cr0 |=3D CR0_XFM_TR << CR0_XFM_OFFSET;
> @@ -724,7 +726,7 @@ static int rockchip_spi_setup(struct spi_device *spi)
>  	struct rockchip_spi *rs =3D spi_controller_get_devdata(spi->controller);
>  	u32 cr0;
>  =

> -	if (!spi->cs_gpiod && (spi->mode & SPI_CS_HIGH) && !rs->cs_high_support=
ed) {
> +	if (!spi_get_csgpiod(spi, 0) && (spi->mode & SPI_CS_HIGH) && !rs->cs_hi=
gh_supported) {
>  		dev_warn(&spi->dev, "setup: non GPIO CS can't be active-high\n");
>  		return -EINVAL;
>  	}
> @@ -735,10 +737,10 @@ static int rockchip_spi_setup(struct spi_device *sp=
i)
>  =

>  	cr0 &=3D ~(0x3 << CR0_SCPH_OFFSET);
>  	cr0 |=3D ((spi->mode & 0x3) << CR0_SCPH_OFFSET);
> -	if (spi->mode & SPI_CS_HIGH && spi->chip_select <=3D 1)
> -		cr0 |=3D BIT(spi->chip_select) << CR0_SOI_OFFSET;
> -	else if (spi->chip_select <=3D 1)
> -		cr0 &=3D ~(BIT(spi->chip_select) << CR0_SOI_OFFSET);
> +	if (spi->mode & SPI_CS_HIGH && spi_get_chipselect(spi, 0) <=3D 1)
> +		cr0 |=3D BIT(spi_get_chipselect(spi, 0)) << CR0_SOI_OFFSET;
> +	else if (spi_get_chipselect(spi, 0) <=3D 1)
> +		cr0 &=3D ~(BIT(spi_get_chipselect(spi, 0)) << CR0_SOI_OFFSET);
>  =

>  	writel_relaxed(cr0, rs->regs + ROCKCHIP_SPI_CTRLR0);
>  =

> diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
> index 411b1307b7fd..4d4b98f8eb80 100644
> --- a/drivers/spi/spi-rspi.c
> +++ b/drivers/spi/spi-rspi.c
> @@ -950,7 +950,7 @@ static int rspi_setup(struct spi_device *spi)
>  	struct rspi_data *rspi =3D spi_controller_get_devdata(spi->controller);
>  	u8 sslp;
>  =

> -	if (spi->cs_gpiod)
> +	if (spi_get_csgpiod(spi, 0))
>  		return 0;
>  =

>  	pm_runtime_get_sync(&rspi->pdev->dev);
> @@ -958,9 +958,9 @@ static int rspi_setup(struct spi_device *spi)
>  =

>  	sslp =3D rspi_read8(rspi, RSPI_SSLP);
>  	if (spi->mode & SPI_CS_HIGH)
> -		sslp |=3D SSLP_SSLP(spi->chip_select);
> +		sslp |=3D SSLP_SSLP(spi_get_chipselect(spi, 0));
>  	else
> -		sslp &=3D ~SSLP_SSLP(spi->chip_select);
> +		sslp &=3D ~SSLP_SSLP(spi_get_chipselect(spi, 0));
>  	rspi_write8(rspi, sslp, RSPI_SSLP);
>  =

>  	spin_unlock_irq(&rspi->lock);
> @@ -1001,8 +1001,8 @@ static int rspi_prepare_message(struct spi_controll=
er *ctlr,
>  		rspi->spcmd |=3D SPCMD_LSBF;
>  =

>  	/* Configure slave signal to assert */
> -	rspi->spcmd |=3D SPCMD_SSLA(spi->cs_gpiod ? rspi->ctlr->unused_native_cs
> -						: spi->chip_select);
> +	rspi->spcmd |=3D SPCMD_SSLA(spi_get_csgpiod(spi, 0) ? rspi->ctlr->unuse=
d_native_cs
> +						: spi_get_chipselect(spi, 0));
>  =

>  	/* CMOS output mode and MOSI signal from previous transfer */
>  	rspi->sppcr =3D 0;
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 71d324ec9a70..f6682bfe484c 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -891,7 +891,7 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
>  =

>  	/* NULL is fine, we just avoid using the FB delay (=3D0) */
>  	if (IS_ERR(cs)) {
> -		dev_err(&spi->dev, "No CS for SPI(%d)\n", spi->chip_select);
> +		dev_err(&spi->dev, "No CS for SPI(%d)\n", spi_get_chipselect(spi, 0));
>  		return -ENODEV;
>  	}
>  =

> diff --git a/drivers/spi/spi-sc18is602.c b/drivers/spi/spi-sc18is602.c
> index 983b3621bc2a..a12adc68731b 100644
> --- a/drivers/spi/spi-sc18is602.c
> +++ b/drivers/spi/spi-sc18is602.c
> @@ -70,7 +70,7 @@ static int sc18is602_txrx(struct sc18is602 *hw, struct =
spi_message *msg,
>  =

>  	if (hw->tlen =3D=3D 0) {
>  		/* First byte (I2C command) is chip select */
> -		hw->buffer[0] =3D 1 << msg->spi->chip_select;
> +		hw->buffer[0] =3D 1 << spi_get_chipselect(msg->spi, 0);
>  		hw->tlen =3D 1;
>  		hw->rindex =3D 0;
>  	}
> @@ -229,7 +229,7 @@ static int sc18is602_setup(struct spi_device *spi)
>  	struct sc18is602 *hw =3D spi_master_get_devdata(spi->master);
>  =

>  	/* SC18IS602 does not support CS2 */
> -	if (hw->id =3D=3D sc18is602 && spi->chip_select =3D=3D 2)
> +	if (hw->id =3D=3D sc18is602 && (spi_get_chipselect(spi, 0) =3D=3D 2))
>  		return -ENXIO;
>  =

>  	return 0;
> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
> index 9bca3d076f05..724f32d7679f 100644
> --- a/drivers/spi/spi-sh-msiof.c
> +++ b/drivers/spi/spi-sh-msiof.c
> @@ -554,7 +554,7 @@ static int sh_msiof_spi_setup(struct spi_device *spi)
>  		spi_controller_get_devdata(spi->controller);
>  	u32 clr, set, tmp;
>  =

> -	if (spi->cs_gpiod || spi_controller_is_slave(p->ctlr))
> +	if (spi_get_csgpiod(spi, 0) || spi_controller_is_slave(p->ctlr))
>  		return 0;
>  =

>  	if (p->native_cs_inited &&
> @@ -587,11 +587,11 @@ static int sh_msiof_prepare_message(struct spi_cont=
roller *ctlr,
>  	u32 ss, cs_high;
>  =

>  	/* Configure pins before asserting CS */
> -	if (spi->cs_gpiod) {
> +	if (spi_get_csgpiod(spi, 0)) {
>  		ss =3D ctlr->unused_native_cs;
>  		cs_high =3D p->native_cs_high;
>  	} else {
> -		ss =3D spi->chip_select;
> +		ss =3D spi_get_chipselect(spi, 0);
>  		cs_high =3D !!(spi->mode & SPI_CS_HIGH);
>  	}
>  	sh_msiof_spi_set_pin_regs(p, ss, !!(spi->mode & SPI_CPOL),
> diff --git a/drivers/spi/spi-sh-sci.c b/drivers/spi/spi-sh-sci.c
> index 8f30531e1418..3003dd7c72c8 100644
> --- a/drivers/spi/spi-sh-sci.c
> +++ b/drivers/spi/spi-sh-sci.c
> @@ -108,7 +108,7 @@ static void sh_sci_spi_chipselect(struct spi_device *=
dev, int value)
>  	struct sh_sci_spi *sp =3D spi_master_get_devdata(dev->master);
>  =

>  	if (sp->info->chip_select)
> -		(sp->info->chip_select)(sp->info, dev->chip_select, value);
> +		(sp->info->chip_select)(sp->info, spi_get_chipselect(dev, 0), value);
>  }
>  =

>  static int sh_sci_spi_probe(struct platform_device *dev)
> diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
> index e29e85cee88a..7840ef940ff8 100644
> --- a/drivers/spi/spi-sifive.c
> +++ b/drivers/spi/spi-sifive.c
> @@ -135,13 +135,13 @@ sifive_spi_prepare_message(struct spi_master *maste=
r, struct spi_message *msg)
>  =

>  	/* Update the chip select polarity */
>  	if (device->mode & SPI_CS_HIGH)
> -		spi->cs_inactive &=3D ~BIT(device->chip_select);
> +		spi->cs_inactive &=3D ~BIT(spi_get_chipselect(device, 0));
>  	else
> -		spi->cs_inactive |=3D BIT(device->chip_select);
> +		spi->cs_inactive |=3D BIT(spi_get_chipselect(device, 0));
>  	sifive_spi_write(spi, SIFIVE_SPI_REG_CSDEF, spi->cs_inactive);
>  =

>  	/* Select the correct device */
> -	sifive_spi_write(spi, SIFIVE_SPI_REG_CSID, device->chip_select);
> +	sifive_spi_write(spi, SIFIVE_SPI_REG_CSID, spi_get_chipselect(device, 0=
));
>  =

>  	/* Set clock mode */
>  	sifive_spi_write(spi, SIFIVE_SPI_REG_SCKMODE,
> diff --git a/drivers/spi/spi-sn-f-ospi.c b/drivers/spi/spi-sn-f-ospi.c
> index 348c6e1edd38..4e23e9dbfca6 100644
> --- a/drivers/spi/spi-sn-f-ospi.c
> +++ b/drivers/spi/spi-sn-f-ospi.c
> @@ -267,7 +267,7 @@ static void f_ospi_config_indir_protocol(struct f_osp=
i *ospi,
>  	int unit;
>  =

>  	/* Set one chip select */
> -	writel(BIT(spi->chip_select), ospi->base + OSPI_SSEL);
> +	writel(BIT(spi_get_shipselect(spi, 0)), ospi->base + OSPI_SSEL);
>  =

>  	mode =3D f_ospi_get_mode(ospi, op->cmd.buswidth, 1);
>  	prot |=3D FIELD_PREP(OSPI_PROT_MODE_CODE_MASK, mode);
> diff --git a/drivers/spi/spi-st-ssc4.c b/drivers/spi/spi-st-ssc4.c
> index 843be803696b..57aaae39e5f8 100644
> --- a/drivers/spi/spi-st-ssc4.c
> +++ b/drivers/spi/spi-st-ssc4.c
> @@ -183,7 +183,7 @@ static int spi_st_setup(struct spi_device *spi)
>  		return -EINVAL;
>  	}
>  =

> -	if (!spi->cs_gpiod) {
> +	if (!spi_get_csgpiod(spi, 0)) {
>  		dev_err(&spi->dev, "no valid gpio assigned\n");
>  		return -EINVAL;
>  	}
> diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
> index 9131660c1afb..b9e61372dcfb 100644
> --- a/drivers/spi/spi-stm32-qspi.c
> +++ b/drivers/spi/spi-stm32-qspi.c
> @@ -359,7 +359,7 @@ static int stm32_qspi_get_mode(u8 buswidth)
>  static int stm32_qspi_send(struct spi_device *spi, const struct spi_mem_=
op *op)
>  {
>  	struct stm32_qspi *qspi =3D spi_controller_get_devdata(spi->master);
> -	struct stm32_qspi_flash *flash =3D &qspi->flash[spi->chip_select];
> +	struct stm32_qspi_flash *flash =3D &qspi->flash[spi_get_chipselect(spi,=
 0)];
>  	u32 ccr, cr;
>  	int timeout, err =3D 0, err_poll_status =3D 0;
>  =

> @@ -564,7 +564,7 @@ static int stm32_qspi_transfer_one_message(struct spi=
_controller *ctrl,
>  	struct spi_mem_op op;
>  	int ret =3D 0;
>  =

> -	if (!spi->cs_gpiod)
> +	if (!spi_get_csgpiod(spi, 0))
>  		return -EOPNOTSUPP;
>  =

>  	ret =3D pm_runtime_resume_and_get(qspi->dev);
> @@ -573,7 +573,7 @@ static int stm32_qspi_transfer_one_message(struct spi=
_controller *ctrl,
>  =

>  	mutex_lock(&qspi->lock);
>  =

> -	gpiod_set_value_cansleep(spi->cs_gpiod, true);
> +	gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), true);
>  =

>  	list_for_each_entry(transfer, &msg->transfers, transfer_list) {
>  		u8 dummy_bytes =3D 0;
> @@ -626,7 +626,7 @@ static int stm32_qspi_transfer_one_message(struct spi=
_controller *ctrl,
>  	}
>  =

>  end_of_transfer:
> -	gpiod_set_value_cansleep(spi->cs_gpiod, false);
> +	gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), false);
>  =

>  	mutex_unlock(&qspi->lock);
>  =

> @@ -669,8 +669,8 @@ static int stm32_qspi_setup(struct spi_device *spi)
>  =

>  	presc =3D DIV_ROUND_UP(qspi->clk_rate, spi->max_speed_hz) - 1;
>  =

> -	flash =3D &qspi->flash[spi->chip_select];
> -	flash->cs =3D spi->chip_select;
> +	flash =3D &qspi->flash[spi_get_chipselect(spi, 0)];
> +	flash->cs =3D spi_get_chipselect(spi, 0);
>  	flash->presc =3D presc;
>  =

>  	mutex_lock(&qspi->lock);
> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> index 6000d0761206..1e3b1922059e 100644
> --- a/drivers/spi/spi-sun4i.c
> +++ b/drivers/spi/spi-sun4i.c
> @@ -167,7 +167,7 @@ static void sun4i_spi_set_cs(struct spi_device *spi, =
bool enable)
>  	reg =3D sun4i_spi_read(sspi, SUN4I_CTL_REG);
>  =

>  	reg &=3D ~SUN4I_CTL_CS_MASK;
> -	reg |=3D SUN4I_CTL_CS(spi->chip_select);
> +	reg |=3D SUN4I_CTL_CS(spi_get_chipselect(spi, 0));
>  =

>  	/* We want to control the chip select manually */
>  	reg |=3D SUN4I_CTL_CS_MANUAL;
> diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
> index 23ad052528db..46e7c446503a 100644
> --- a/drivers/spi/spi-sun6i.c
> +++ b/drivers/spi/spi-sun6i.c
> @@ -174,7 +174,7 @@ static void sun6i_spi_set_cs(struct spi_device *spi, =
bool enable)
>  =

>  	reg =3D sun6i_spi_read(sspi, SUN6I_TFR_CTL_REG);
>  	reg &=3D ~SUN6I_TFR_CTL_CS_MASK;
> -	reg |=3D SUN6I_TFR_CTL_CS(spi->chip_select);
> +	reg |=3D SUN6I_TFR_CTL_CS(spi_get_chipselect(spi, 0));
>  =

>  	if (enable)
>  		reg |=3D SUN6I_TFR_CTL_CS_LEVEL;
> diff --git a/drivers/spi/spi-synquacer.c b/drivers/spi/spi-synquacer.c
> index 47cbe73137c2..7385a85c0b01 100644
> --- a/drivers/spi/spi-synquacer.c
> +++ b/drivers/spi/spi-synquacer.c
> @@ -250,7 +250,7 @@ static int synquacer_spi_config(struct spi_master *ma=
ster,
>  	}
>  =

>  	mode =3D spi->mode;
> -	cs =3D spi->chip_select;
> +	cs =3D spi_get_chipselect(spi, 0);
>  	speed =3D xfer->speed_hz;
>  	bpw =3D xfer->bits_per_word;
>  =

> @@ -344,7 +344,7 @@ static int synquacer_spi_config(struct spi_master *ma=
ster,
>  	sspi->bpw =3D bpw;
>  	sspi->mode =3D mode;
>  	sspi->speed =3D speed;
> -	sspi->cs =3D spi->chip_select;
> +	sspi->cs =3D spi_get_chipselect(spi, 0);
>  	sspi->bus_width =3D bus_width;
>  =

>  	return 0;
> @@ -489,7 +489,7 @@ static void synquacer_spi_set_cs(struct spi_device *s=
pi, bool enable)
>  	val =3D readl(sspi->regs + SYNQUACER_HSSPI_REG_DMSTART);
>  	val &=3D ~(SYNQUACER_HSSPI_DMPSEL_CS_MASK <<
>  		 SYNQUACER_HSSPI_DMPSEL_CS_SHIFT);
> -	val |=3D spi->chip_select << SYNQUACER_HSSPI_DMPSEL_CS_SHIFT;
> +	val |=3D spi_get_chipselect(spi, 0) << SYNQUACER_HSSPI_DMPSEL_CS_SHIFT;
>  =

>  	if (!enable)
>  		val |=3D SYNQUACER_HSSPI_DMSTOP_STOP;
> diff --git a/drivers/spi/spi-tegra114.c b/drivers/spi/spi-tegra114.c
> index d9be80e3e1bc..e334183241d7 100644
> --- a/drivers/spi/spi-tegra114.c
> +++ b/drivers/spi/spi-tegra114.c
> @@ -747,7 +747,7 @@ static int tegra_spi_set_hw_cs_timing(struct spi_devi=
ce *spi)
>  	if (setup_dly && hold_dly) {
>  		setup_hold =3D SPI_SETUP_HOLD(setup_dly - 1, hold_dly - 1);
>  		spi_cs_timing =3D SPI_CS_SETUP_HOLD(tspi->spi_cs_timing1,
> -						  spi->chip_select,
> +						  spi_get_chipselect(spi, 0),
>  						  setup_hold);
>  		if (tspi->spi_cs_timing1 !=3D spi_cs_timing) {
>  			tspi->spi_cs_timing1 =3D spi_cs_timing;
> @@ -760,9 +760,9 @@ static int tegra_spi_set_hw_cs_timing(struct spi_devi=
ce *spi)
>  		inactive_cycles--;
>  	cs_state =3D inactive_cycles ? 0 : 1;
>  	spi_cs_timing =3D tspi->spi_cs_timing2;
> -	SPI_SET_CS_ACTIVE_BETWEEN_PACKETS(spi_cs_timing, spi->chip_select,
> +	SPI_SET_CS_ACTIVE_BETWEEN_PACKETS(spi_cs_timing, spi_get_chipselect(spi=
, 0),
>  					  cs_state);
> -	SPI_SET_CYCLES_BETWEEN_PACKETS(spi_cs_timing, spi->chip_select,
> +	SPI_SET_CYCLES_BETWEEN_PACKETS(spi_cs_timing, spi_get_chipselect(spi, 0=
),
>  				       inactive_cycles);
>  	if (tspi->spi_cs_timing2 !=3D spi_cs_timing) {
>  		tspi->spi_cs_timing2 =3D spi_cs_timing;
> @@ -831,8 +831,8 @@ static u32 tegra_spi_setup_transfer_one(struct spi_de=
vice *spi,
>  			tegra_spi_writel(tspi, command1, SPI_COMMAND1);
>  =

>  		/* GPIO based chip select control */
> -		if (spi->cs_gpiod)
> -			gpiod_set_value(spi->cs_gpiod, 1);
> +		if (spi_get_csgpiod(spi, 0))
> +			gpiod_set_value(spi_get_csgpiod(spi, 0), 1);
>  =

>  		if (is_single_xfer && !(t->cs_change)) {
>  			tspi->use_hw_based_cs =3D true;
> @@ -846,7 +846,7 @@ static u32 tegra_spi_setup_transfer_one(struct spi_de=
vice *spi,
>  				command1 &=3D ~SPI_CS_SW_VAL;
>  		}
>  =

> -		if (tspi->last_used_cs !=3D spi->chip_select) {
> +		if (tspi->last_used_cs !=3D spi_get_chipselect(spi, 0)) {
>  			if (cdata && cdata->tx_clk_tap_delay)
>  				tx_tap =3D cdata->tx_clk_tap_delay;
>  			if (cdata && cdata->rx_clk_tap_delay)
> @@ -855,7 +855,7 @@ static u32 tegra_spi_setup_transfer_one(struct spi_de=
vice *spi,
>  				   SPI_RX_TAP_DELAY(rx_tap);
>  			if (command2 !=3D tspi->def_command2_reg)
>  				tegra_spi_writel(tspi, command2, SPI_COMMAND2);
> -			tspi->last_used_cs =3D spi->chip_select;
> +			tspi->last_used_cs =3D spi_get_chipselect(spi, 0);
>  		}
>  =

>  	} else {
> @@ -896,7 +896,7 @@ static int tegra_spi_start_transfer_one(struct spi_de=
vice *spi,
>  		command1 |=3D SPI_TX_EN;
>  		tspi->cur_direction |=3D DATA_DIR_TX;
>  	}
> -	command1 |=3D SPI_CS_SEL(spi->chip_select);
> +	command1 |=3D SPI_CS_SEL(spi_get_chipselect(spi, 0));
>  	tegra_spi_writel(tspi, command1, SPI_COMMAND1);
>  	tspi->command1_reg =3D command1;
>  =

> @@ -980,14 +980,14 @@ static int tegra_spi_setup(struct spi_device *spi)
>  =

>  	spin_lock_irqsave(&tspi->lock, flags);
>  	/* GPIO based chip select control */
> -	if (spi->cs_gpiod)
> -		gpiod_set_value(spi->cs_gpiod, 0);
> +	if (spi_get_csgpiod(spi, 0))
> +		gpiod_set_value(spi_get_csgpiod(spi, 0), 0);
>  =

>  	val =3D tspi->def_command1_reg;
>  	if (spi->mode & SPI_CS_HIGH)
> -		val &=3D ~SPI_CS_POL_INACTIVE(spi->chip_select);
> +		val &=3D ~SPI_CS_POL_INACTIVE(spi_get_chipselect(spi, 0));
>  	else
> -		val |=3D SPI_CS_POL_INACTIVE(spi->chip_select);
> +		val |=3D SPI_CS_POL_INACTIVE(spi_get_chipselect(spi, 0));
>  	tspi->def_command1_reg =3D val;
>  	tegra_spi_writel(tspi, tspi->def_command1_reg, SPI_COMMAND1);
>  	spin_unlock_irqrestore(&tspi->lock, flags);
> @@ -1002,8 +1002,8 @@ static void tegra_spi_transfer_end(struct spi_devic=
e *spi)
>  	int cs_val =3D (spi->mode & SPI_CS_HIGH) ? 0 : 1;
>  =

>  	/* GPIO based chip select control */
> -	if (spi->cs_gpiod)
> -		gpiod_set_value(spi->cs_gpiod, 0);
> +	if (spi_get_csgpiod(spi, 0))
> +		gpiod_set_value(spi_get_csgpiod(spi, 0), 0);
>  =

>  	if (!tspi->use_hw_based_cs) {
>  		if (cs_val)
> diff --git a/drivers/spi/spi-tegra20-sflash.c b/drivers/spi/spi-tegra20-s=
flash.c
> index 220ee08c4a06..f67d0aafa744 100644
> --- a/drivers/spi/spi-tegra20-sflash.c
> +++ b/drivers/spi/spi-tegra20-sflash.c
> @@ -280,7 +280,7 @@ static int tegra_sflash_start_transfer_one(struct spi=
_device *spi,
>  			command |=3D SPI_ACTIVE_SCLK_DRIVE_HIGH;
>  		else
>  			command |=3D SPI_ACTIVE_SCLK_DRIVE_LOW;
> -		command |=3D SPI_CS0_EN << spi->chip_select;
> +		command |=3D SPI_CS0_EN << spi_get_chipselect(spi, 0);
>  	} else {
>  		command =3D tsd->command_reg;
>  		command &=3D ~SPI_BIT_LENGTH(~0);
> diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-sl=
ink.c
> index 148043d0c2b8..0afba7dbd93a 100644
> --- a/drivers/spi/spi-tegra20-slink.c
> +++ b/drivers/spi/spi-tegra20-slink.c
> @@ -758,9 +758,9 @@ static int tegra_slink_setup(struct spi_device *spi)
>  	spin_lock_irqsave(&tspi->lock, flags);
>  	val =3D tspi->def_command_reg;
>  	if (spi->mode & SPI_CS_HIGH)
> -		val |=3D cs_pol_bit[spi->chip_select];
> +		val |=3D cs_pol_bit[spi_get_chipselect(spi, 0)];
>  	else
> -		val &=3D ~cs_pol_bit[spi->chip_select];
> +		val &=3D ~cs_pol_bit[spi_get_chipselect(spi, 0)];
>  	tspi->def_command_reg =3D val;
>  	tegra_slink_writel(tspi, tspi->def_command_reg, SLINK_COMMAND);
>  	spin_unlock_irqrestore(&tspi->lock, flags);
> @@ -781,7 +781,7 @@ static int tegra_slink_prepare_message(struct spi_mas=
ter *master,
>  	tspi->command_reg |=3D SLINK_CS_SW | SLINK_CS_VALUE;
>  =

>  	tspi->command2_reg =3D tspi->def_command2_reg;
> -	tspi->command2_reg |=3D SLINK_SS_EN_CS(spi->chip_select);
> +	tspi->command2_reg |=3D SLINK_SS_EN_CS(spi_get_chipselect(spi, 0));
>  =

>  	tspi->command_reg &=3D ~SLINK_MODES;
>  	if (spi->mode & SPI_CPHA)
> diff --git a/drivers/spi/spi-tegra210-quad.c b/drivers/spi/spi-tegra210-q=
uad.c
> index 9f356612ba7e..661ea872d4ba 100644
> --- a/drivers/spi/spi-tegra210-quad.c
> +++ b/drivers/spi/spi-tegra210-quad.c
> @@ -829,7 +829,7 @@ static u32 tegra_qspi_setup_transfer_one(struct spi_d=
evice *spi, struct spi_tran
>  		tegra_qspi_mask_clear_irq(tqspi);
>  =

>  		command1 =3D tqspi->def_command1_reg;
> -		command1 |=3D QSPI_CS_SEL(spi->chip_select);
> +		command1 |=3D QSPI_CS_SEL(spi_get_chipselect(spi, 0));
>  		command1 |=3D QSPI_BIT_LENGTH(bits_per_word - 1);
>  =

>  		command1 &=3D ~QSPI_CONTROL_MODE_MASK;
> @@ -960,11 +960,11 @@ static int tegra_qspi_setup(struct spi_device *spi)
>  =

>  	/* keep default cs state to inactive */
>  	val =3D tqspi->def_command1_reg;
> -	val |=3D QSPI_CS_SEL(spi->chip_select);
> +	val |=3D QSPI_CS_SEL(spi_get_chipselect(spi, 0));
>  	if (spi->mode & SPI_CS_HIGH)
> -		val &=3D ~QSPI_CS_POL_INACTIVE(spi->chip_select);
> +		val &=3D ~QSPI_CS_POL_INACTIVE(spi_get_chipselect(spi, 0));
>  	else
> -		val |=3D QSPI_CS_POL_INACTIVE(spi->chip_select);
> +		val |=3D QSPI_CS_POL_INACTIVE(spi_get_chipselect(spi, 0));
>  =

>  	tqspi->def_command1_reg =3D val;
>  	tegra_qspi_writel(tqspi, tqspi->def_command1_reg, QSPI_COMMAND1);
> diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
> index 60086869bcae..5914335ff63d 100644
> --- a/drivers/spi/spi-ti-qspi.c
> +++ b/drivers/spi/spi-ti-qspi.c
> @@ -533,10 +533,10 @@ static void ti_qspi_enable_memory_map(struct spi_de=
vice *spi)
>  	if (qspi->ctrl_base) {
>  		regmap_update_bits(qspi->ctrl_base, qspi->ctrl_reg,
>  				   MEM_CS_MASK,
> -				   MEM_CS_EN(spi->chip_select));
> +				   MEM_CS_EN(spi_get_chipselect(spi, 0)));
>  	}
>  	qspi->mmap_enabled =3D true;
> -	qspi->current_cs =3D spi->chip_select;
> +	qspi->current_cs =3D spi_get_chipselect(spi, 0);
>  }
>  =

>  static void ti_qspi_disable_memory_map(struct spi_device *spi)
> @@ -572,7 +572,7 @@ static void ti_qspi_setup_mmap_read(struct spi_device=
 *spi, u8 opcode,
>  	memval |=3D ((addr_width - 1) << QSPI_SETUP_ADDR_SHIFT |
>  		   dummy_bytes << QSPI_SETUP_DUMMY_SHIFT);
>  	ti_qspi_write(qspi, memval,
> -		      QSPI_SPI_SETUP_REG(spi->chip_select));
> +		      QSPI_SPI_SETUP_REG(spi_get_chipselect(spi, 0)));
>  }
>  =

>  static int ti_qspi_adjust_op_size(struct spi_mem *mem, struct spi_mem_op=
 *op)
> @@ -623,7 +623,7 @@ static int ti_qspi_exec_mem_op(struct spi_mem *mem,
>  =

>  	mutex_lock(&qspi->list_lock);
>  =

> -	if (!qspi->mmap_enabled || qspi->current_cs !=3D mem->spi->chip_select)=
 {
> +	if (!qspi->mmap_enabled || qspi->current_cs !=3D spi_get_chipselect(mem=
->spi, 0)) {
>  		ti_qspi_setup_clk(qspi, mem->spi->max_speed_hz);
>  		ti_qspi_enable_memory_map(mem->spi);
>  	}
> @@ -673,11 +673,11 @@ static int ti_qspi_start_transfer_one(struct spi_ma=
ster *master,
>  	qspi->dc =3D 0;
>  =

>  	if (spi->mode & SPI_CPHA)
> -		qspi->dc |=3D QSPI_CKPHA(spi->chip_select);
> +		qspi->dc |=3D QSPI_CKPHA(spi_get_chipselect(spi, 0));
>  	if (spi->mode & SPI_CPOL)
> -		qspi->dc |=3D QSPI_CKPOL(spi->chip_select);
> +		qspi->dc |=3D QSPI_CKPOL(spi_get_chipselect(spi, 0));
>  	if (spi->mode & SPI_CS_HIGH)
> -		qspi->dc |=3D QSPI_CSPOL(spi->chip_select);
> +		qspi->dc |=3D QSPI_CSPOL(spi_get_chipselect(spi, 0));
>  =

>  	frame_len_words =3D 0;
>  	list_for_each_entry(t, &m->transfers, transfer_list)
> @@ -686,7 +686,7 @@ static int ti_qspi_start_transfer_one(struct spi_mast=
er *master,
>  =

>  	/* setup command reg */
>  	qspi->cmd =3D 0;
> -	qspi->cmd |=3D QSPI_EN_CS(spi->chip_select);
> +	qspi->cmd |=3D QSPI_EN_CS(spi_get_chipselect(spi, 0));
>  	qspi->cmd |=3D QSPI_FLEN(frame_len_words);
>  =

>  	ti_qspi_write(qspi, qspi->dc, QSPI_SPI_DC_REG);
> diff --git a/drivers/spi/spi-topcliff-pch.c b/drivers/spi/spi-topcliff-pc=
h.c
> index cbb60198a7f0..11cfe84714e7 100644
> --- a/drivers/spi/spi-topcliff-pch.c
> +++ b/drivers/spi/spi-topcliff-pch.c
> @@ -499,7 +499,7 @@ static inline void pch_spi_select_chip(struct pch_spi=
_data *data,
>  				       struct spi_device *pspi)
>  {
>  	if (data->current_chip !=3D NULL) {
> -		if (pspi->chip_select !=3D data->n_curnt_chip) {
> +		if (spi_get_chipselect(pspi, 0) !=3D data->n_curnt_chip) {
>  			dev_dbg(&pspi->dev, "%s : different slave\n", __func__);
>  			data->current_chip =3D NULL;
>  		}
> @@ -507,7 +507,7 @@ static inline void pch_spi_select_chip(struct pch_spi=
_data *data,
>  =

>  	data->current_chip =3D pspi;
>  =

> -	data->n_curnt_chip =3D data->current_chip->chip_select;
> +	data->n_curnt_chip =3D spi_get_chipselect(data->current_chip, 0);
>  =

>  	dev_dbg(&pspi->dev, "%s :Invoking pch_spi_setup_transfer\n", __func__);
>  	pch_spi_setup_transfer(pspi);
> diff --git a/drivers/spi/spi-wpcm-fiu.c b/drivers/spi/spi-wpcm-fiu.c
> index ab33710d50ac..f15312fdcdaf 100644
> --- a/drivers/spi/spi-wpcm-fiu.c
> +++ b/drivers/spi/spi-wpcm-fiu.c
> @@ -158,7 +158,7 @@ static int wpcm_fiu_normal_exec(struct spi_mem *mem, =
const struct spi_mem_op *op
>  	if (op->data.dir =3D=3D SPI_MEM_DATA_OUT)
>  		wpcm_fiu_set_data(fiu, op->data.buf.out, op->data.nbytes);
>  =

> -	ret =3D wpcm_fiu_do_uma(fiu, mem->spi->chip_select, op->addr.nbytes =3D=
=3D 3,
> +	ret =3D wpcm_fiu_do_uma(fiu, spi_get_chipselect(mem->spi, 0), op->addr.=
nbytes =3D=3D 3,
>  			      op->data.dir =3D=3D SPI_MEM_DATA_OUT, op->data.nbytes);
>  =

>  	if (op->data.dir =3D=3D SPI_MEM_DATA_IN)
> @@ -196,7 +196,7 @@ static bool wpcm_fiu_4ba_match(const struct spi_mem_o=
p *op)
>  static int wpcm_fiu_4ba_exec(struct spi_mem *mem, const struct spi_mem_o=
p *op)
>  {
>  	struct wpcm_fiu_spi *fiu =3D spi_controller_get_devdata(mem->spi->contr=
oller);
> -	int cs =3D mem->spi->chip_select;
> +	int cs =3D spi_get_chipselect(mem->spi, 0);
>  =

>  	wpcm_fiu_ects_assert(fiu, cs);
>  =

> @@ -241,7 +241,7 @@ static bool wpcm_fiu_rdid_match(const struct spi_mem_=
op *op)
>  static int wpcm_fiu_rdid_exec(struct spi_mem *mem, const struct spi_mem_=
op *op)
>  {
>  	struct wpcm_fiu_spi *fiu =3D spi_controller_get_devdata(mem->spi->contr=
oller);
> -	int cs =3D mem->spi->chip_select;
> +	int cs =3D spi_get_chipselect(mem->spi, 0);
>  =

>  	/* First transfer */
>  	wpcm_fiu_set_opcode(fiu, op->cmd.opcode);
> @@ -278,7 +278,7 @@ static bool wpcm_fiu_dummy_match(const struct spi_mem=
_op *op)
>  static int wpcm_fiu_dummy_exec(struct spi_mem *mem, const struct spi_mem=
_op *op)
>  {
>  	struct wpcm_fiu_spi *fiu =3D spi_controller_get_devdata(mem->spi->contr=
oller);
> -	int cs =3D mem->spi->chip_select;
> +	int cs =3D spi_get_chipselect(mem->spi, 0);
>  =

>  	wpcm_fiu_ects_assert(fiu, cs);
>  =

> @@ -376,7 +376,7 @@ static int wpcm_fiu_adjust_op_size(struct spi_mem *me=
m, struct spi_mem_op *op)
>  static int wpcm_fiu_dirmap_create(struct spi_mem_dirmap_desc *desc)
>  {
>  	struct wpcm_fiu_spi *fiu =3D spi_controller_get_devdata(desc->mem->spi-=
>controller);
> -	int cs =3D desc->mem->spi->chip_select;
> +	int cs =3D spi_get_chipselect(desc->mem->spi, 0);
>  =

>  	if (desc->info.op_tmpl.data.dir !=3D SPI_MEM_DATA_IN)
>  		return -ENOTSUPP;
> @@ -400,7 +400,7 @@ static int wpcm_fiu_dirmap_create(struct spi_mem_dirm=
ap_desc *desc)
>  static ssize_t wpcm_fiu_direct_read(struct spi_mem_dirmap_desc *desc, u6=
4 offs, size_t len, void *buf)
>  {
>  	struct wpcm_fiu_spi *fiu =3D spi_controller_get_devdata(desc->mem->spi-=
>controller);
> -	int cs =3D desc->mem->spi->chip_select;
> +	int cs =3D spi_get_chipselect(desc->mem->spi, 0);
>  =

>  	if (offs >=3D MAX_MEMORY_SIZE_PER_CS)
>  		return -ENOTSUPP;
> diff --git a/drivers/spi/spi-xcomm.c b/drivers/spi/spi-xcomm.c
> index 8628241ec99e..5d23411f2a3e 100644
> --- a/drivers/spi/spi-xcomm.c
> +++ b/drivers/spi/spi-xcomm.c
> @@ -58,7 +58,7 @@ static int spi_xcomm_sync_config(struct spi_xcomm *spi_=
xcomm, unsigned int len)
>  static void spi_xcomm_chipselect(struct spi_xcomm *spi_xcomm,
>  	struct spi_device *spi, int is_active)
>  {
> -	unsigned long cs =3D spi->chip_select;
> +	unsigned long cs =3D spi_get_chipselect(spi, 0);
>  	uint16_t chipselect =3D spi_xcomm->chipselect;
>  =

>  	if (is_active)
> diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
> index 7377d3b81302..2d418812fc37 100644
> --- a/drivers/spi/spi-xilinx.c
> +++ b/drivers/spi/spi-xilinx.c
> @@ -213,7 +213,7 @@ static void xilinx_spi_chipselect(struct spi_device *=
spi, int is_on)
>  	 */
>  =

>  	cs =3D xspi->cs_inactive;
> -	cs ^=3D BIT(spi->chip_select);
> +	cs ^=3D BIT(spi_get_chipselect(spi, 0));
>  =

>  	/* Activate the chip select */
>  	xspi->write_fn(cs, xspi->regs + XSPI_SSR_OFFSET);
> @@ -228,9 +228,9 @@ static int xilinx_spi_setup_transfer(struct spi_devic=
e *spi,
>  	struct xilinx_spi *xspi =3D spi_master_get_devdata(spi->master);
>  =

>  	if (spi->mode & SPI_CS_HIGH)
> -		xspi->cs_inactive &=3D ~BIT(spi->chip_select);
> +		xspi->cs_inactive &=3D ~BIT(spi_get_chipselect(spi, 0));
>  	else
> -		xspi->cs_inactive |=3D BIT(spi->chip_select);
> +		xspi->cs_inactive |=3D BIT(spi_get_chipselect(spi, 0));
>  =

>  	return 0;
>  }
> diff --git a/drivers/spi/spi-xlp.c b/drivers/spi/spi-xlp.c
> index e5707fe5c8f1..3b91cdd5ae21 100644
> --- a/drivers/spi/spi-xlp.c
> +++ b/drivers/spi/spi-xlp.c
> @@ -139,7 +139,7 @@ static int xlp_spi_setup(struct spi_device *spi)
>  	int cs;
>  =

>  	xspi =3D spi_master_get_devdata(spi->master);
> -	cs =3D spi->chip_select;
> +	cs =3D spi_get_chipselect(spi, 0);
>  	/*
>  	 * The value of fdiv must be between 4 and 65535.
>  	 */
> @@ -350,7 +350,7 @@ static int xlp_spi_transfer_one(struct spi_master *ma=
ster,
>  	struct xlp_spi_priv *xspi =3D spi_master_get_devdata(master);
>  	int ret =3D 0;
>  =

> -	xspi->cs =3D spi->chip_select;
> +	xspi->cs =3D spi_get_chipselect(spi, 0);
>  	xspi->dev =3D spi->dev;
>  =

>  	if (spi_transfer_is_last(master, t))
> diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
> index 78f31b61a2aa..debb53ef19a0 100644
> --- a/drivers/spi/spi-zynq-qspi.c
> +++ b/drivers/spi/spi-zynq-qspi.c
> @@ -296,7 +296,7 @@ static void zynq_qspi_chipselect(struct spi_device *s=
pi, bool assert)
>  	/* Select the lower (CS0) or upper (CS1) memory */
>  	if (ctlr->num_chipselect > 1) {
>  		config_reg =3D zynq_qspi_read(xqspi, ZYNQ_QSPI_LINEAR_CFG_OFFSET);
> -		if (!spi->chip_select)
> +		if (!spi_get_chipselect(spi, 0))
>  			config_reg &=3D ~ZYNQ_QSPI_LCFG_U_PAGE;
>  		else
>  			config_reg |=3D ZYNQ_QSPI_LCFG_U_PAGE;
> diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqsp=
i.c
> index 95ff15665d44..319cdd5a0bdc 100644
> --- a/drivers/spi/spi-zynqmp-gqspi.c
> +++ b/drivers/spi/spi-zynqmp-gqspi.c
> @@ -468,7 +468,7 @@ static void zynqmp_qspi_chipselect(struct spi_device =
*qspi, bool is_high)
>  	genfifoentry |=3D GQSPI_GENFIFO_MODE_SPI;
>  =

>  	if (!is_high) {
> -		if (!qspi->chip_select) {
> +		if (!spi_get_chipselect(qspi, 0)) {
>  			xqspi->genfifobus =3D GQSPI_GENFIFO_BUS_LOWER;
>  			xqspi->genfifocs =3D GQSPI_GENFIFO_CS_LOWER;
>  		} else {
> diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
> index f836567c631b..4dfcaaf73f10 100644
> --- a/drivers/spi/spidev.c
> +++ b/drivers/spi/spidev.c
> @@ -395,7 +395,7 @@ spidev_ioctl(struct file *filp, unsigned int cmd, uns=
igned long arg)
>  			struct spi_controller *ctlr =3D spi->controller;
>  =

>  			if (ctlr->use_gpio_descriptors && ctlr->cs_gpiods &&
> -			    ctlr->cs_gpiods[spi->chip_select])
> +			    ctlr->cs_gpiods[spi_get_chipselect(spi, 0)])
>  				tmp &=3D ~SPI_CS_HIGH;
>  		}
>  =

> @@ -434,7 +434,7 @@ spidev_ioctl(struct file *filp, unsigned int cmd, uns=
igned long arg)
>  			}
>  =

>  			if (ctlr->use_gpio_descriptors && ctlr->cs_gpiods &&
> -			    ctlr->cs_gpiods[spi->chip_select])
> +			    ctlr->cs_gpiods[spi_get_chipselect(spi, 0)])
>  				tmp |=3D SPI_CS_HIGH;
>  =

>  			tmp |=3D spi->mode & ~SPI_MODE_MASK;
> @@ -807,7 +807,7 @@ static int spidev_probe(struct spi_device *spi)
>  		spidev->devt =3D MKDEV(SPIDEV_MAJOR, minor);
>  		dev =3D device_create(spidev_class, &spi->dev, spidev->devt,
>  				    spidev, "spidev%d.%d",
> -				    spi->master->bus_num, spi->chip_select);
> +				    spi->master->bus_num, spi_get_chipselect(spi, 0));
>  		status =3D PTR_ERR_OR_ZERO(dev);
>  	} else {
>  		dev_dbg(&spi->dev, "no minor number available!\n");
> diff --git a/include/trace/events/spi.h b/include/trace/events/spi.h
> index c0d9844befd7..c0248a8fa79c 100644
> --- a/include/trace/events/spi.h
> +++ b/include/trace/events/spi.h
> @@ -57,7 +57,7 @@ TRACE_EVENT(spi_setup,
>  =

>  	TP_fast_assign(
>  		__entry->bus_num =3D spi->controller->bus_num;
> -		__entry->chip_select =3D spi->chip_select;
> +		__entry->chip_select =3D  spi_get_chipselect(spi, 0);
>  		__entry->mode =3D spi->mode;
>  		__entry->bits_per_word =3D spi->bits_per_word;
>  		__entry->max_speed_hz =3D spi->max_speed_hz;
> @@ -88,7 +88,7 @@ TRACE_EVENT(spi_set_cs,
>  =

>  	TP_fast_assign(
>  		__entry->bus_num =3D spi->controller->bus_num;
> -		__entry->chip_select =3D spi->chip_select;
> +		__entry->chip_select =3D spi_get_chipselect(spi, 0);
>  		__entry->mode =3D spi->mode;
>  		__entry->enable =3D enable;
>  	),
> @@ -113,7 +113,7 @@ DECLARE_EVENT_CLASS(spi_message,
>  =

>  	TP_fast_assign(
>  		__entry->bus_num =3D msg->spi->controller->bus_num;
> -		__entry->chip_select =3D msg->spi->chip_select;
> +		__entry->chip_select =3D spi_get_chipselect(msg->spi, 0);
>  		__entry->msg =3D msg;
>  	),
>  =

> @@ -154,7 +154,7 @@ TRACE_EVENT(spi_message_done,
>  =

>  	TP_fast_assign(
>  		__entry->bus_num =3D msg->spi->controller->bus_num;
> -		__entry->chip_select =3D msg->spi->chip_select;
> +		__entry->chip_select =3D spi_get_chipselect(msg->spi, 0);
>  		__entry->msg =3D msg;
>  		__entry->frame =3D msg->frame_length;
>  		__entry->actual =3D msg->actual_length;
> @@ -197,7 +197,7 @@ DECLARE_EVENT_CLASS(spi_transfer,
>  =

>  	TP_fast_assign(
>  		__entry->bus_num =3D msg->spi->controller->bus_num;
> -		__entry->chip_select =3D msg->spi->chip_select;
> +		__entry->chip_select =3D spi_get_chipselect(msg->spi, 0);
>  		__entry->xfer =3D xfer;
>  		__entry->len =3D xfer->len;
>  =

> -- =

> 2.25.1
> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
