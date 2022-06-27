Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC12FC43334
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jun 2022 09:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0JMMkS8cFMIvgtunyPvMgLxX25R4iAZaSXvGTIn9sQ=; b=4TiVAvCdHt5HF8
	3GD0/OcHnN5qMJCDfCBxepATsUTFXevfmFeLiPxygCQ6EiPSGsZyZHAYYBFU8LPQjSwyYRiSn92zp
	FFeHPgII87JFL/qO5FTZVgBjW2zbm0jyVQGk93I7uh41Xeqm554omltu+piIiFenA/zwY7jeyabP0
	RMnEk/lixMKqM0wF2MjYluwCsFCJxT/ph2xSLS3yjq06DUVqtvADyUIiMkYd8yOSdx8yXWBjWMsLJ
	VxI4rSX2o5Q7D7UFqbOQmCiw/5gAS8aq+byxGhvsAsNpaHA/x777N+cQcEiepXj/PY05DuoxwLlqA
	JYLd7GR4TtZKTdpqKbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kpI-00HCZr-W5; Mon, 27 Jun 2022 09:14:37 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kpF-00HCWD-28; Mon, 27 Jun 2022 09:14:34 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25R9E6WD027570;
	Mon, 27 Jun 2022 04:14:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656321246;
	bh=tWbBgDrQnfNCG3vnwxvqioR8AXnxO6yEJbi9A8jtAdA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OHBD+drI4hV4r7dCrgeLmXSYVsZKFAitTdzyuO5zft6UsWzZLNVXMxHbPELHnDFhg
	 EifQvQ254ydq/jipCvyTTeFU0nyvEa2BZwhbm6RPySKAPtitQE3PoSYbB97jNBxsO2
	 u3MLysAiDWGI1vlQ0G5bNeU1Q2DjS3qJ2ulQVNwc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25R9E6Jh083690
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jun 2022 04:14:06 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 27
 Jun 2022 04:14:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 27 Jun 2022 04:14:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25R9E4tN025167;
	Mon, 27 Jun 2022 04:14:05 -0500
Date: Mon, 27 Jun 2022 14:44:04 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Tudor
 Ambarus <tudor.ambarus@microchip.com>,
        Michael Walle <michael@walle.cc>, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-spi@vger.kernel.org>, Joel Stanley
	<joel@jms.id.au>
Subject: Re: [RFC PATCH 3/6] mtd: spi-nor: core: run calibration when
 initialization is done
Message-ID: <20220627091404.54257obrdazcjhre@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-4-p.yadav@ti.com>
 <20220517160226.4107f282@xps-13>
 <20220518060640.os5fp5rez4ie7qc4@ti.com>
 <20220518091931.279c5398@xps-13>
 <20220518075651.mvdhfnfbgutecgyq@ti.com>
 <b3bfa5a6-caac-94ed-6741-04db9c2a9ee0@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3bfa5a6-caac-94ed-6741-04db9c2a9ee0@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_021433_317998_297CDFC2 
X-CRM114-Status: GOOD (  52.19  )
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

On 18/05/22 10:51AM, C=E9dric Le Goater wrote:
> Hello,
> =

> On 5/18/22 09:56, Pratyush Yadav wrote:
> > On 18/05/22 09:19AM, Miquel Raynal wrote:
> > > Hi Pratyush,
> > > =

> > > p.yadav@ti.com wrote on Wed, 18 May 2022 11:37:05 +0530:
> > > =

> > > > +Cedric
> > > > =

> > > > On 17/05/22 04:02PM, Miquel Raynal wrote:
> > > > > Hi Pratyush,
> > > > > =

> > > > > p.yadav@ti.com wrote on Fri, 12 Mar 2021 00:42:13 +0530:
> > > > > > Once the flash is initialized tell the controller it can run
> > > > > > calibration procedures if needed. This can be useful when calib=
ration is
> > > > > > needed to run at higher clock speeds.
> > > > > > =

> > > > > > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > > > > > ---
> > > > > >   drivers/mtd/spi-nor/core.c | 12 ++++++++++--
> > > > > >   1 file changed, 10 insertions(+), 2 deletions(-)
> > > > > > =

> > > > > > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/c=
ore.c
> > > > > > index 88888df009f0..e0cbcaf1be89 100644
> > > > > > --- a/drivers/mtd/spi-nor/core.c
> > > > > > +++ b/drivers/mtd/spi-nor/core.c
> > > > > > @@ -3650,6 +3650,7 @@ static int spi_nor_probe(struct spi_mem *=
spimem)
> > > > > >   	 * checking what's really supported using spi_mem_supports_o=
p().
> > > > > >   	 */
> > > > > >   	const struct spi_nor_hwcaps hwcaps =3D { .mask =3D SNOR_HWCA=
PS_ALL };
> > > > > > +	struct spi_mem_op op;
> > > > > >   	char *flash_name;
> > > > > >   	int ret;
> > > > > > @@ -3709,8 +3710,15 @@ static int spi_nor_probe(struct spi_mem =
*spimem)
> > > > > >   	if (ret)
> > > > > >   		return ret;
> > > > > > -	return mtd_device_register(&nor->mtd, data ? data->parts : NU=
LL,
> > > > > > -				   data ? data->nr_parts : 0);
> > > > > > +	ret =3D mtd_device_register(&nor->mtd, data ? data->parts : N=
ULL,
> > > > > > +				  data ? data->nr_parts : 0);
> > > > > > +	if (ret)
> > > > > > +		return ret;
> > > > > > +
> > > > > > +	op =3D spi_nor_spimem_get_read_op(nor);
> > > > > =

> > > > > Isn't this too specific? I really don't know much about spi-nors,=
 but I
> > > > > find odd to have this op being created here, why not moving this =
into
> > > > > the _do_calibration() helper?
> > > > =

> > > > Maybe the naming confused you but this is a function in the SPI NOR
> > > > core, not in SPI MEM. SPI NOR supports both SPI MEM based controlle=
rs
> > > > and "legacy" controllers, so the convention is to add the "spimem"
> > > > prefix before SPI MEM specific functions. So I don't get the comment
> > > > about it being too specific. It is too specific to what?
> > > =

> > > Mmh right, it's fine then.
> > > =

> > > > =

> > > > And how can spi_mem_do_calibration() know what op the flash uses to=
 read
> > > > data? SPI NOR or SPI NAND would know it, but not SPI MEM. That is w=
hy we
> > > > pass in that information to spi_mem_do_calibration().
> > > =

> > > But here the op is "spi-nor wide", I would have expected a
> > > per-device op. But that is not a big deal, that is something that can
> > > also be updated later if needed I guess.
> > =

> > It is per-device. The op is generated using nor->read_opcode,
> > nor->addr_width, nor->read_dummy, etc. So if you have 2 NOR flashes on
> > your system with different opcodes, it would work for both.
> > =

> > > =

> > > One last question, is there something that mtd_device_register() does
> > > that is really needed for the calibration to work? Otherwise I would
> > > rather prefer to have that calibration happening before the user gets
> > > access to the device.
> =

> Which would mean calling it right after :
> =

> 	ret =3D spi_nor_create_read_dirmap(nor);
> 	if (ret)
> 		return ret;
> =

> 	ret =3D spi_nor_create_write_dirmap(nor);
> 	if (ret)
> 		return ret;
> =

> > The calibration works by reading a known pattern that is already written
> > to the flash again and again and seeing what delays work and what don't.
> > For that to happen, the controller driver needs to know where the
> > pattern is stored.
> =

> Why don't you simply choose some random place, first 16KB for instance,
> and check that the data is random enough ? If not, declare calibration
> not possible and choose a default safe setting which is anyhow a
> requirement for calibration. Retry at reboot as data might have changed.

I did not come up with the pattern myself. But from what I can =

understand, the pattern is not random at all, but is carefully chosen to =

target certain ways a read can fail on the controller. So a random piece =

of data won't work as well as this carefully designed pattern.

> =

> > This series does that by looking at the MTD
> > partitions. For that to happen, we need to create those partitions
> > first, which happens after mtd_device_register().
> =

> hmm, that might work for some boards. This is not at all the case for
> the BMC boards. Vendors can put any kind of flash model and/or layout
> and the driver needs to be more generic.

Yes, vendors can choose any layout, but one partition on that layout =

would be your calibration pattern. I think you can use a different =

compatible for that partition. I have not thought this through yet =

though.

> =

> > But I am planning to use device tree to get that information now so this
> > should no longer be needed and we can do calibration before registering
> > the device with MTD.
> =

> Perfect, we can move the calibration hook in spi_nor_create_read_dirmap()
> then, or in devm_spi_mem_dirmap_create(), which would make more sense IMH=
O.

Sorry, I still don't get why you want to tie dirmap and calibration =

together. Just let them be independent and let flash drivers take care =

of when to call what. SPI MEM should not care.

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
