Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A1DC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Mar 2022 19:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9X+kSPuLgz4bv/NK7g7SJN/yOHdNFx8SP5s7FxoFTA=; b=yEXRHSiZ2ldehj
	J433igHml0RuXFbqu3OgiyxTzzT7ErRPibrUA/ZYzaUNhlciTsXStHDVztu0jHKthXunsH+zQjU6D
	WH5OeOj9wt0qCg9y//Jwx99PhUinLwjvaNwxO1UCeINmue7Xlgq+u2vb1fvs9xVc3lrfQgvlKsGDZ
	aALRie23/OSOXjjvkseD6QmoiAKLgn0oqIfJHU4lnHZRjtycm5xjj85LtNMms3N42CMUuKGSR9xL6
	K7fELPMYhPVAivPpjKrdj5zlP1Z4AumhWHDOZ5ETdTCkqSAOyj71HV/2UrKOJXVSSeXoVmkj3lm9b
	VFDEhZL6+9gOGveX+m/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZeK5-00HMw6-LT; Wed, 30 Mar 2022 19:49:41 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZeK2-00HMvU-IK; Wed, 30 Mar 2022 19:49:40 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22UJnIgw086057;
 Wed, 30 Mar 2022 14:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648669758;
 bh=Wxy1IwTpIUIfVJGOAq2NOfEI+2cbw3VlSeZRH56rW8M=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=UoJPVuBNI8m/ixKDfQugawBpaOyrVQYZLFWOFD03gjpDJlBPH8cKwO37t+M19l5Yl
 Gmw6vNhEwLZqW4oe0dd9YnxdBahdOAzLBgLXZP/Xak8DUjosIBS0Nskfe3kmxhzSgx
 E7banJMetcx2zpdREZKEf30l5/Vzffhy9CIelmNE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22UJnIw9062750
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Mar 2022 14:49:18 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 30
 Mar 2022 14:49:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 30 Mar 2022 14:49:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22UJnHrB010599;
 Wed, 30 Mar 2022 14:49:17 -0500
Date: Thu, 31 Mar 2022 01:19:16 +0530
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
 Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH v4 11/11] mtd: spi-nor: aspeed: set the decoding size to
 at least 2MB for AST2600
Message-ID: <20220330194916.olffkctxjhfqksvf@ti.com>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-12-clg@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220325100849.2019209-12-clg@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_124938_725625_F64B4E6E 
X-CRM114-Status: GOOD (  22.50  )
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


> Subject: [PATCH v4 11/11] mtd: spi-nor: aspeed: set the decoding size to =
at least 2MB for AST2600

Nitpick: s/mtd: spi-nor: aspeed:/spi: aspeed:/

On 25/03/22 11:08AM, C=E9dric Le Goater wrote:
> From: Potin Lai <potin.lai@quantatw.com>
> =

> In AST2600, the unit of SPI CEx decoding range register is 1MB, and end
> address offset is set to the acctual offset - 1MB. If the flash only has
> 1MB, the end address will has same value as start address, which will
> causing unexpected errors.
> =

> This patch set the decoding size to at least 2MB to avoid decoding errors.
> =

> Tested:
> root@bletchley:~# dmesg | grep "aspeed-smc 1e631000.spi: CE0 window"
> [   59.328134] aspeed-smc 1e631000.spi: CE0 window resized to 2MB (AST260=
0 Decoding)
> [   59.343001] aspeed-smc 1e631000.spi: CE0 window [ 0x50000000 - 0x50200=
000 ] 2MB
> root@bletchley:~# devmem 0x1e631030
> 0x00100000
> =

> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> [ clg : Ported on new spi-mem driver ]
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  drivers/spi/spi-aspeed-smc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> =

> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 660451667a39..227797e13997 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -466,6 +466,8 @@ static int aspeed_spi_set_window(struct aspeed_spi *a=
spi,
>   *   is correct.
>   */
>  static const struct aspeed_spi_data ast2500_spi_data;
> +static const struct aspeed_spi_data ast2600_spi_data;
> +static const struct aspeed_spi_data ast2600_fmc_data;
>  =

>  static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
>  					 u32 local_offset, u32 size)
> @@ -489,6 +491,17 @@ static int aspeed_spi_chip_adjust_window(struct aspe=
ed_spi_chip *chip,
>  			 chip->cs, size >> 20);
>  	}
>  =

> +	/*
> +	 * The decoding size of AST2600 SPI controller should set at
> +	 * least 2MB.
> +	 */
> +	if ((aspi->data =3D=3D &ast2600_spi_data || aspi->data =3D=3D &ast2600_=
fmc_data) &&
> +	    size < SZ_2M) {
> +		size =3D SZ_2M;
> +		dev_info(aspi->dev, "CE%d window resized to %dMB (AST2600 Decoding)",
> +			 chip->cs, size >> 20);
> +	}
> +
>  	aspeed_spi_get_windows(aspi, windows);
>  =

>  	/* Adjust this chip window */
> -- =

> 2.34.1
> =


-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
