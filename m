Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9B7C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 17 May 2022 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOCtk10O+dtTzrQcxVS2giGb/+y1JJbr0uVW3rVSn5c=; b=xkVULizvCrGm9h
	UgN78KzwxkFAVh6yOEB3MEpt5duKIkXiVPA6wOfOoJJVPlqndEvEtlf/WjOT5tV4Z5tJKZeM3JTfD
	wSLP3vIa9J4Lj+EWAEaOUYTaQS3v5s2ZV7MYaJQE2Huy9RGM2Ky53OtT8eMoKY03WCJ4EniQ1VCyc
	ph/GuuDxi1wuRuatZJ7mcZmEmxInGnX9QSBJFmEzoDVFKGycwtMdGrWFDkAvmUjC/IUYF04XHMP2n
	gPzWHZXbIq2nJHO6cmQZItbqQFbmFAtWxoC+ZU8Oe/6J1RHxKMOFnS5k6LEMzi1Y0U5c7O/EXHxDt
	UV1RZJobtvmMn6AfavCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqwPA-00DZzD-1w; Tue, 17 May 2022 12:34:24 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqwOx-00DZsg-EB; Tue, 17 May 2022 12:34:13 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24HCXiuX090876;
 Tue, 17 May 2022 07:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1652790824;
 bh=jX/75826u0dAvndf/WCTgLn1BPxJ18FVo/2uucSrT3Y=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ksCA4A3K9ssPA9nasc1mvGNYBJRLlfv+cVMJ1NgTBdWUOI9f/I3BARSCJtQewvqIi
 xkA9MBYoWj2ZVU4RmoTY4etI9m6jghCOtHMUdCZOmvs4Rg47zPO9VoNGJ4otocPobm
 w5d9sFsBjpbZYMq1I/G37MsCJv1o0CLcWvkcX13U=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24HCXi48070260
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 May 2022 07:33:44 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 17
 May 2022 07:33:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 17 May 2022 07:33:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24HCXh78095767;
 Tue, 17 May 2022 07:33:44 -0500
Date: Tue, 17 May 2022 18:03:43 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
CC: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <andrew@aj.id.au>,
 <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <richard@nod.at>,
 <joel@jms.id.au>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <chin-ting_kuo@aspeedtech.com>,
 <linux-aspeed@lists.ozlabs.org>, <vigneshr@ti.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v7 00/11] spi: spi-mem: Convert Aspeed SMC
 driver to spi-mem
Message-ID: <20220517123343.5cust7y6uqeeamjs@ti.com>
References: <20220509175616.1089346-1-clg@kaod.org>
 <165272636363.750911.14933122170662994904.b4-ty@kernel.org>
 <20220517110509.2e6xbwot63yl6a3c@ti.com>
 <a17b2446-f5a6-d606-8ef4-3931b8bc94da@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a17b2446-f5a6-d606-8ef4-3931b8bc94da@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_053411_604286_AFCF4142 
X-CRM114-Status: GOOD (  34.73  )
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

Hi Cedric,

On 17/05/22 02:03PM, C=E9dric Le Goater wrote:
> Pratyush,
> =

> On 5/17/22 13:05, Pratyush Yadav wrote:
> > Hi Cedric,
> > =

> > On 16/05/22 07:39PM, Mark Brown wrote:
> > > On Mon, 9 May 2022 19:56:05 +0200, C=E9dric Le Goater wrote:
> > > > This series adds a new SPI driver using the spi-mem interface for t=
he
> > > > Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> > > > SoCs.
> > > > =

> > > >   * AST2600 Firmware SPI Memory Controller (FMC)
> > > >   * AST2600 SPI Flash Controller (SPI1 and SPI2)
> > > >   * AST2500 Firmware SPI Memory Controller (FMC)
> > > >   * AST2500 SPI Flash Controller (SPI1 and SPI2)
> > > >   * AST2400 New Static Memory Controller (also referred as FMC)
> > > >   * AST2400 SPI Flash Controller (SPI)
> > > > =

> > > > [...]
> > > =

> > > Applied to
> > > =

> > >     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git f=
or-next
> > > =

> > > Thanks!
> > > =

> > > [02/11] dt-bindings: spi: Convert the Aspeed SMC controllers device t=
ree binding
> > >          commit: ce9858ea499da025684a7a5f19823c2c3f14bdce
> > > [03/11] spi: spi-mem: Convert Aspeed SMC driver to spi-mem
> > >          commit: 9c63b846e6df43e5b3d31263f7db545f32deeda3
> > > [04/11] spi: aspeed: Add support for direct mapping
> > >          commit: 9da06d7bdec7dad8018c23b180e410ef2e7a4367
> > > [05/11] spi: aspeed: Adjust direct mapping to device size
> > >          commit: bb084f94e1bca4a5c4f689d7aa9b410220c1ed71
> > > [06/11] spi: aspeed: Workaround AST2500 limitations
> > >          commit: 5785eedee42c34cfec496199a80fa8ec9ddcf7fe
> > > [07/11] spi: aspeed: Add support for the AST2400 SPI controller
> > >          commit: 53526ab27d9c256504f267713aea60db7af18fb0
> > > [08/11] spi: aspeed: Calibrate read timings
> > >          commit: eeaec1ea05c0e0f08e04c6844f20cc24a2fcc0f4
> > =

> > I have repeatedly objected to this patch [0][1][2] and you have
> > repeatedly decided to not address my objections.
> =

> That's a very harsh way of saying things. I did not decide anything
> or ignore your comments. I answered your questions and acknowledged
> that indeed the read training was done under the dirmap handler but
> this was not a concern today since we had all the required information
> from spimem.

I think the correct thing to do here would be to move this patch out of =

your main series. Since the old driver did not have this feature anyway, =

it is not necessary for the conversion to achieve feature parity. Then =

have a separate series to drive the conversation on how to best =

implement this contentious feature.

> =

> We waited _together_, 5 or 6 weeks, for more inputs on how to address
> the concerns you raised regarding the sustainability of this method.
> =

> > I won't spend any more time fighting it.
> =

> This is not a fight. I don't know why you interpret it that way.

I interpret it this way because I feel you have ignored my comments and =

have kept this patch in regardless. But maybe I _am_ being too harsh. So =

apologies if I have interpreted things wrong.

> =

> Now, since you object so explicitly, and since this patchset has
> not reached the Linux kernel yet, we should consider dropping it.
> I rather do that than push crap in mainline. But then, please,
> provide solutions and not only objections !

Yes please. I would like to have this patch dropped, and then reopen =

this discussion in a separate thread.

I have provided solutions before but maybe you missed them. Please see =

[3]. Specifically patches 1 and 3. These are still not very refined and =

might not be accepted in their current state (especially patch 3 since =

it does the calibration after registering the device with MTD), but they =

should be a good starting point for discussion.

And we might end up deciding to just use the dirmap_create() hook to do =

the calibration, but it is important to have this conversation =

separately and clearly instead of it being missed as part of a large =

patch series.

> =

> > But I will say that you should not expect any
> > guarantees that SPI NOR or SPI NAND will not break your calibration in
> > the future if they decide to move the dirmap_create() call around.
> =

> If that's the case one day, we have multiple solutions :
> =

>   - stop doing the training
>   - move the training to the appropriate handler if it exists

This is my preferred option, [3] is a good starting point for proposing =

that handler.

>   - use a default value
> > > [11/11] mtd: spi-nor: aspeed: set the decoding size to at least 2MB f=
or AST2600
> > >          commit: 73ae97e3cabb580639f02f12a192324a53c4bebb
> > > =

> > =

> > [0] https://patchwork.kernel.org/project/spi-devel-general/patch/202203=
25100849.2019209-9-clg@kaod.org/
> > [1] https://patchwork.kernel.org/project/spi-devel-general/patch/202202=
14094231.3753686-9-clg@kaod.org/
> > [2] https://lore.kernel.org/all/20220208190636.h6dubktkmuosvdxo@ti.com/
[3] https://patchwork.ozlabs.org/project/linux-mtd/list/?series=3D233504&st=
ate=3D%2A&archive=3Dboth

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
