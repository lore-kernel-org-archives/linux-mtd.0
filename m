Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A57C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Mar 2022 16:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dW9OHq24YKNYIw1tD3I4WAUco+zp6TVPBD40edgwJms=; b=hZECoDT2SZBVzb
	YaCLxDQy4Kf0NZbEG4Mm9GI3L4CXzRgvK+bWytpzj31nWac//wokxuconWSXcgGsxWDKbWv66Xu2P
	g8r09Q6LdjLWHehrnG+YfipSC3Pmj836o/Ky/kV3u52qXijaaYEjglNJc17e7tSMSEpK0lMfTfICK
	Qp/BvS/ik3Z9EJQPfXI1qteK7UfUVGxjIolx3osNhzhN59QshERjA+jsnoeruVfXVKsTJl1xzuroH
	9cVWqnDNw/39CwzuTQOn8z5C2prWNwcC6UeOVbKINWVD4gKeovDWXwtTDyl4cYnGL4q07cS7aEb8s
	euALI0NLFzMvI1CD2IXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZxrr-002zcC-EM; Thu, 31 Mar 2022 16:41:51 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZxrn-002zbY-6j; Thu, 31 Mar 2022 16:41:48 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22VGfHbT077632;
 Thu, 31 Mar 2022 11:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648744877;
 bh=q4I8OmbE9lpXlZiTsZ65bC0HGywDTKwPLArPoG/uE2k=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=q0Xzj8+bwKSW6n1SqCu0ajMaUE0JPYpjhHRhw91vS23GJPbmNB2y4KvnSyMwK4b0G
 tICwB/nlIKOZogc7v+AgBb7Nkgi4L+dNaEnoD/OTRXYvqtb41WlnIaWJh/1ja6UlnB
 Z/18XT7txfkmCyGW5GBJXH9G+eMWUZRcGGK66ZrM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22VGfHo6024529
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 31 Mar 2022 11:41:17 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 31
 Mar 2022 11:41:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 31 Mar 2022 11:41:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22VGfG1R087297;
 Thu, 31 Mar 2022 11:41:16 -0500
Date: Thu, 31 Mar 2022 22:11:15 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-aspeed@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Tao Ren <rentao.bupt@gmail.com>
Subject: Re: [PATCH v4 08/11] spi: aspeed: Calibrate read timings
Message-ID: <20220331164115.w5q3wxlmwcg3w4ns@ti.com>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-9-clg@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220325100849.2019209-9-clg@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_094147_367678_BB4F9E1B 
X-CRM114-Status: GOOD (  20.71  )
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

Hi,

On 25/03/22 11:08AM, C=E9dric Le Goater wrote:
> To accommodate the different response time of SPI transfers on different
> boards and different SPI NOR devices, the Aspeed controllers provide a
> set of Read Timing Compensation registers to tune the timing delays
> depending on the frequency being used. The AST2600 SoC has one of these
> registers per device. On the AST2500 and AST2400 SoCs, the timing
> register is shared by all devices which is problematic to get good
> results other than for one device.
> =

> The algorithm first reads a golden buffer at low speed and then performs
> reads with different clocks and delay cycle settings to find a breaking
> point. This selects a default good frequency for the CEx control register.
> The current settings are a bit optimistic as we pick the first delay givi=
ng
> good results. A safer approach would be to determine an interval and
> choose the middle value.
> =

> Calibration is performed when the direct mapping for reads is created.
> Since the underlying spi-nor object needs to be initialized to create
> the spi_mem operation for direct mapping, we should be fine. Having a
> specific API would clarify the requirements though.
> =

> Cc: Pratyush Yadav <p.yadav@ti.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Tao Ren <rentao.bupt@gmail.com>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  drivers/spi/spi-aspeed-smc.c | 281 +++++++++++++++++++++++++++++++++++
>  1 file changed, 281 insertions(+)
> =

[...]
> @@ -517,6 +527,8 @@ static int aspeed_spi_chip_adjust_window(struct aspee=
d_spi_chip *chip,
>  	return 0;
>  }
>  =

> +static int aspeed_spi_do_calibration(struct aspeed_spi_chip *chip);
> +
>  static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
>  {
>  	struct aspeed_spi *aspi =3D spi_controller_get_devdata(desc->mem->spi->=
master);
> @@ -565,6 +577,8 @@ static int aspeed_spi_dirmap_create(struct spi_mem_di=
rmap_desc *desc)
>  	chip->ctl_val[ASPEED_SPI_READ] =3D ctl_val;
>  	writel(chip->ctl_val[ASPEED_SPI_READ], chip->ctl);
>  =

> +	ret =3D aspeed_spi_do_calibration(chip);
> +

I am still not convinced this is a good idea. The API does not say =

anywhere what dirmap_create must be called after the flash is completely =

initialized, though that is what is done currently in practice. I think =

an explicit API to mark flash as "ready for calibration" would be a =

better idea.

Tudor/Mark/Miquel, what do you think?

>  	dev_info(aspi->dev, "CE%d read buswidth:%d [0x%08x]\n",
>  		 chip->cs, op->data.buswidth, chip->ctl_val[ASPEED_SPI_READ]);
>  =

[...]

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
