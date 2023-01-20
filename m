Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A4AC05027
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Jan 2023 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OyAPUwBVfcJTl4+P6HLFWAXjSSsRMqUap6x+3Or2iXs=; b=vaVY86yVCjlgub
	ks38YUClcGZA0vZxjj5zPHoYS7F1dcupKN5AK9yg4/9/ydAp7qJLXEH0vV2ZfYEH1S6oiKuxUiirk
	jGx5gzYbCL+kLXP1lsK1rQDbZXD9SBkSrFoOJMivM85NDzX+IifbRwaWkTcWYzEvLBFgW0GczNNu4
	RYSBcKjN/2D49VgHUzSQPZXxvxDcMmZU0SRco4LfK7ZR50bo+ABvIzxGO/OI1BWFWKLSGxFXF57MB
	2f/es+IVP+Vx0KBWGxR4Wg9jSG9Oo5gcaw4LHDNX0ZCZipLoWc6Cffot8dgD3lUidQKdR1sHi0s5c
	tFuKK7Gkvmogr0IDYncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoOJ-009iBT-49; Fri, 20 Jan 2023 10:12:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoLF-009gr1-1i; Fri, 20 Jan 2023 10:09:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4CF861EFE;
	Fri, 20 Jan 2023 10:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA804C433D2;
	Fri, 20 Jan 2023 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674209387;
	bh=QQh8ShqbKc4vcCYjUJJI+sW3w3r+3sanu/vPZ2IyzTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rMYgPKw1pGl3FwPpK4PFmTlmFnpTnyZ7ux/Z8gB+BTQu8ad2dbnHGdmqSUUh9QAo3
	 C+u0IUTCPhPJwzafpGLLSfvLo60WsvNwXWf3AIb1nv8SUA+shDrhHnhPjsEK+wxt8Q
	 HF3ooQ8AjjaEe2zCmeFagpTzLf/Qp8lQOOmYtGYc=
Date: Fri, 20 Jan 2023 11:09:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
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
	pabeni@redhat.com, alex.aring@gmail.com, stefan@datenfreihafen.org,
	kvalo@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	skomatineni@nvidia.com, sumit.semwal@linaro.org,
	christian.koenig@amd.com, j.neuschaefer@gmx.net, vireshk@kernel.org,
	rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org, git@amd.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com,
	fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, yogeshgaur.83@gmail.com,
	konrad.dybcio@somainline.org, alim.akhtar@samsung.com,
	ldewangan@nvidia.com, michal.simek@amd.com,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	netdev@vger.kernel.org, linux-wpan@vger.kernel.org,
	libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-mtd@lists.infradead.org, lars@metafoo.de,
	Michael.Hennerich@analog.com, linux-iio@vger.kernel.org,
	michael@walle.cc, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, amitrkcian2002@gmail.com
Subject: Re: [PATCH v2 06/13] staging: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Message-ID: <Y8poZ1wN8/dAO3H/@kroah.com>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-7-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230119185342.2093323-7-amit.kumar-mahapatra@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_020949_444845_58A6D070 
X-CRM114-Status: GOOD (  11.45  )
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

On Fri, Jan 20, 2023 at 12:23:35AM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpiod
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
