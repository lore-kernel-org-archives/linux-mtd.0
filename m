Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061E3C43334
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jun 2022 10:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vdlLcY/ByMcFgwZiYYfBK5ta7ALDPzqAhuNMiJXork=; b=EpiAgtrXeZuFTu
	A6OKdjnt1MyL5DC68BZhslLhC+Uk3j0zg0GADuGyilhylPYPwTG/Ybhq88x11YFo/aVbXhVldxHXe
	1Fm8JizhFavvToP7YPSjHXU11EJ0gEDx56Fum6mNVAMDdx2YeWnB7DHH+ZAcpvoldXyLs//I6IkD8
	TySsFNl2pOQcXciBYUQ9MRqhuRyYUzLV9vYj6hwO2QyBnfpnzNW7J8A0sGOB1UF5zu/6+gHY28gKD
	rRx8fFowm+nBdsJFxHhGy7Fue2MqybdPYCLsgymJ46Im4g+h8ggGAa6tmURGONd19j1Sj587qbKjM
	UNstls8CTES1leMwh3NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5m6K-000A69-Ha; Mon, 27 Jun 2022 10:36:16 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5m6H-000A2v-2E; Mon, 27 Jun 2022 10:36:14 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25RAZuUw045156;
	Mon, 27 Jun 2022 05:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656326156;
	bh=9F5SoVyG6vTy+xKAz4DQZx53RbUN3yIhlnK2kgDE/aY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dpPzAC8DcT+V80prGXqI2Pb+UikO8Gj3gOigyw3Jr+xfD4G3o4E1tYU19q4JqG1tK
	 bvtspUtIk+gdUj7BQ5V+NcpOJ7T30+hd7apgZVLO33UpG+Gl6W/aY0j2plpRiqfc3K
	 DhCUfF7vr3Q0Nz+S2oW0u3RTgidGg4vyACDH5YnQ=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25RAZuF3087355
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jun 2022 05:35:56 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 27
 Jun 2022 05:35:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 27 Jun 2022 05:35:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25RAZtBd091967;
	Mon, 27 Jun 2022 05:35:55 -0500
Date: Mon, 27 Jun 2022 16:05:54 +0530
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
Message-ID: <20220627103554.hcvvu4r7bebd2qum@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-4-p.yadav@ti.com>
 <20220517160226.4107f282@xps-13>
 <20220518060640.os5fp5rez4ie7qc4@ti.com>
 <20220518091931.279c5398@xps-13>
 <20220518075651.mvdhfnfbgutecgyq@ti.com>
 <b3bfa5a6-caac-94ed-6741-04db9c2a9ee0@kaod.org>
 <20220627091404.54257obrdazcjhre@ti.com>
 <82015d89-cab5-3e9a-a40e-e5dafa17ec0c@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82015d89-cab5-3e9a-a40e-e5dafa17ec0c@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_033613_217235_A25EA9C8 
X-CRM114-Status: GOOD (  33.29  )
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

On 27/06/22 11:43AM, C=E9dric Le Goater wrote:
> On 6/27/22 11:14, Pratyush Yadav wrote:
> > On 18/05/22 10:51AM, C=E9dric Le Goater wrote:
[...]
> =

> > > > This series does that by looking at the MTD
> > > > partitions. For that to happen, we need to create those partitions
> > > > first, which happens after mtd_device_register().
> > > =

> > > hmm, that might work for some boards. This is not at all the case for
> > > the BMC boards. Vendors can put any kind of flash model and/or layout
> > > and the driver needs to be more generic.
> > =

> > Yes, vendors can choose any layout, but one partition on that layout
> > would be your calibration pattern. I think you can use a different
> > compatible for that partition.
> =

> OK. and that it would become more generic then.
> =

> > I have not thought this through yet though.
> =

> If a partition is required, that's a dependency on mtdpart.
> =

> It could be done from spi_nor_probe() after mtd_device_register() with
> some spimem handler using the 'struct mtd_partition' for the {size,offset}
> parameters.

Hmm, yes but I've got this feedback from multiple people that we should =

not do the calibration after mtd_device_register() since at that point =

the device is usable from userspace. Maybe we can come up with an API =

from MTD parsers that can just return us a list of partitions but not =

actually register them?

> =

> > > =

> > > > But I am planning to use device tree to get that information now so=
 this
> > > > should no longer be needed and we can do calibration before registe=
ring
> > > > the device with MTD.
> > > =

> > > Perfect, we can move the calibration hook in spi_nor_create_read_dirm=
ap()
> > > then, or in devm_spi_mem_dirmap_create(), which would make more sense=
 IMHO.
> > =

> > Sorry, I still don't get why you want to tie dirmap and calibration
> > together. Just let them be independent and let flash drivers take care
> > of when to call what. SPI MEM should not care.
> =

> I know you would prefer a specific handler and that can still be done.
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
