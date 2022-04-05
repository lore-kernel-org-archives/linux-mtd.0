Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98890C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 19:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pc7NF3uKzdz7z2EsHFAuY2NrbYUy9JE3ukJ7O8ZmEfg=; b=FhZU1AFY/U/sA8
	giTzimCm0ldP+/aHeLLVgRVWi+CoqTmnsCyXK8aE9uXxyn0hOnze0B5qkDT+QyYCS36HG+n7ujXAZ
	O8CiTHYhjdP0t2aNfir7W0gYcmXGqlSTrnkncllaF65ZVBIjbUDskBu5oCHCwEuOMRSkSqVyMVom3
	pPBj2hx2PFaTi7R1rWn2+tJ87DrSwtsFJrMDXDJFgNcfAcJ0AxpFHtpro5cm+VJ4tJzBSCxzPPH0X
	fwi1BnGBDoKecbE1mdj2G+bePQIPwr8vRvY98HX9dHQUD1t6ILzLc72i5P6F+kuMP7n2C73By7R1m
	NOD0dFyjg8qtGm5OV/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbolr-002L5b-Jz; Tue, 05 Apr 2022 19:23:19 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nboln-002L3X-Rm; Tue, 05 Apr 2022 19:23:17 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 235JMjDv005917;
 Tue, 5 Apr 2022 14:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1649186565;
 bh=gyTjrVE6XZL0s0mFe2hpv610AmkYDUb5iT13rkgmKRc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=PKBKT8masPEuR2LOHeC3RosC3UfwVAOBbmci39ci03yRnQIY7L693HlQISqV5EhBi
 Pf851tANHiSV/1GhVdsERrDoEtTUvfdEe//BrbqWiTHGsHPqvSkgPqqMtwCcOjlfxA
 b+oHaewX2Mtkj8jRegPfopO8NDUb3Ee1k9Dei77w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 235JMjtb023636
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Apr 2022 14:22:45 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Apr 2022 14:22:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Apr 2022 14:22:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 235JMiEb104214;
 Tue, 5 Apr 2022 14:22:45 -0500
Date: Wed, 6 Apr 2022 00:52:43 +0530
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
Message-ID: <20220405192243.7ilibbsyomg42uwg@ti.com>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-9-clg@kaod.org>
 <20220331164115.w5q3wxlmwcg3w4ns@ti.com>
 <8c88e726-0ddb-e2ba-35df-676cfc3d0475@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c88e726-0ddb-e2ba-35df-676cfc3d0475@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_122316_020443_83E8083A 
X-CRM114-Status: GOOD (  36.36  )
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

On 04/04/22 09:30AM, C=E9dric Le Goater wrote:
> On 3/31/22 18:41, Pratyush Yadav wrote:
> > Hi,
> > =

> > On 25/03/22 11:08AM, C=E9dric Le Goater wrote:
> > > To accommodate the different response time of SPI transfers on differ=
ent
> > > boards and different SPI NOR devices, the Aspeed controllers provide a
> > > set of Read Timing Compensation registers to tune the timing delays
> > > depending on the frequency being used. The AST2600 SoC has one of the=
se
> > > registers per device. On the AST2500 and AST2400 SoCs, the timing
> > > register is shared by all devices which is problematic to get good
> > > results other than for one device.
> > > =

> > > The algorithm first reads a golden buffer at low speed and then perfo=
rms
> > > reads with different clocks and delay cycle settings to find a breaki=
ng
> > > point. This selects a default good frequency for the CEx control regi=
ster.
> > > The current settings are a bit optimistic as we pick the first delay =
giving
> > > good results. A safer approach would be to determine an interval and
> > > choose the middle value.
> > > =

> > > Calibration is performed when the direct mapping for reads is created.
> > > Since the underlying spi-nor object needs to be initialized to create
> > > the spi_mem operation for direct mapping, we should be fine. Having a
> > > specific API would clarify the requirements though.
> > > =

> > > Cc: Pratyush Yadav <p.yadav@ti.com>
> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > Tested-by: Joel Stanley <joel@jms.id.au>
> > > Tested-by: Tao Ren <rentao.bupt@gmail.com>
> > > Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > > ---
> > >   drivers/spi/spi-aspeed-smc.c | 281 ++++++++++++++++++++++++++++++++=
+++
> > >   1 file changed, 281 insertions(+)
> > > =

> > [...]
> > > @@ -517,6 +527,8 @@ static int aspeed_spi_chip_adjust_window(struct a=
speed_spi_chip *chip,
> > >   	return 0;
> > >   }
> > > +static int aspeed_spi_do_calibration(struct aspeed_spi_chip *chip);
> > > +
> > >   static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *des=
c)
> > >   {
> > >   	struct aspeed_spi *aspi =3D spi_controller_get_devdata(desc->mem->=
spi->master);
> > > @@ -565,6 +577,8 @@ static int aspeed_spi_dirmap_create(struct spi_me=
m_dirmap_desc *desc)
> > >   	chip->ctl_val[ASPEED_SPI_READ] =3D ctl_val;
> > >   	writel(chip->ctl_val[ASPEED_SPI_READ], chip->ctl);
> > > +	ret =3D aspeed_spi_do_calibration(chip);
> > > +
> > =

> > I am still not convinced this is a good idea. The API does not say
> > anywhere what dirmap_create must be called after the flash is completely
> > initialized, though that is what is done currently in practice.
> =

> Yes because we wouldn't have a correct 'spi_mem_dirmap_info' if it wasn't
> the case. May be change the documentation ?

SPI NOR knows what protocol and opcodes it would use before it actually =

puts the flash in that mode. So in theory it could call dirmap_create() =

before it has put the flash in say 8D-8D-8D mode. I don't see much =

reason to do so in practice, but who knows, that might change. This is =

why I would like to hear what other people think.

> =

> > I think
> > an explicit API to mark flash as "ready for calibration" would be a
> > better idea.
> =

> OK. Since the above is a oneliner, it should not be a problem to move
> it under a new handler if needed.
> =

> The dirmap_create() handler expects the spi-mem descriptor and the field
> 'desc->info.op_tmpl' to be correctly initialized in order to compute the
> control register value, which is a requirement for dirmap_read(). The
> calibration sequence simply comes after.
> =

> AFAICT, there is nothing incorrect today.

In practice, no there is nothing incorrect. But as I explained above, it =

is certainly possible to call dirmap_create() before the flash is ready.

> =

> > Tudor/Mark/Miquel, what do you think?
> =

> =

> Thanks,
> =

> C.

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
