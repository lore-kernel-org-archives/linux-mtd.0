Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E3DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 10:26:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8FAF61BFA
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 10:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8FAF61BFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqdHPqMsA2BhX+Hp4Kw+ND4Bt6fSW0vPMph771yjIFI=; b=hHuSs4y/eyS8Om
	ijxgg6Yj3qFThTZQEEiYEH3dZ6IpjBNHndEUJ6LnZ9owLCs1teP2z2qSEvFhibnLvlUEyLVKnow6w
	kt5RWD3PDYjr/3VciVz8szQtgsw0ozMN9XmHIONkY0HUwg27zTXg8aoOf8kKtgQJzLTDiOWbTVBvR
	B2mq28LSI9mTw/eoeE6SyIMMfV2NLnTNEufQTeT7rKmMkKXcnBVnS602NqzWukmjpXQMoYi6iHRno
	QTuvOmwCMyCfDaRu50Hc2x68BfLsSSeeWlvYqI6MD+MYx2kRVZv55V2LW/mc9VQL8pxcmqETHUaGh
	rU80DtUg0yS+IUGcF5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmZBf-00FBLs-Og; Mon, 15 Nov 2021 10:26:08 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmZ8w-00FATI-E7
 for linux-mtd@lists.infradead.org; Mon, 15 Nov 2021 10:23:21 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AFANCDl126391;
 Mon, 15 Nov 2021 04:23:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1636971792;
 bh=HJ44vHSf/yx1mqEyNAUnPFfW/9lCW+pRuJ+/mFaDbdU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=KYkUSvG9z4UGemXMZWm5eByMm5V1KjGst46kGmL/iLHRwmO49AT/n6XAVJb9+8hBL
 G+mo9WRNbiY2l+P+e5j9QQZKoNA57Ey16N5JGITFhpfD75HQZuJBC6LnJGuynxesku
 +w8GsfwiWuiZs2ekC3PxoGl7NQLKRQztH3tw3DZQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AFANB3a028962
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Nov 2021 04:23:12 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 15
 Nov 2021 04:23:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 15 Nov 2021 04:23:11 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AFANAHj043570;
 Mon, 15 Nov 2021 04:23:11 -0600
Date: Mon, 15 Nov 2021 15:53:10 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>, Mark Brown
 <broonie@kernel.org>, <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Michal Simek <monstr@monstr.eu>
Subject: Re: [RFC PATCH 0/3] Dual stacked/parallel memories bindings
Message-ID: <20211115102308.64chfwj2vtssiyin@ti.com>
References: <20211112152411.818321-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112152411.818321-1-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_022318_617347_DF26DAA6 
X-CRM114-Status: GOOD (  25.86  )
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

On 12/11/21 04:24PM, Miquel Raynal wrote:
> Hello Rob, Mark, Tudor & Pratyush,
> =

> Here is an RFC to open the discussion about the sensitive task of
> supporting specific SPI controller modes like Xilinx's where the
> controller can highly abstract the hardware and provide access to a
> single bigger device instead. I'll let you go through the series and
> tell me what you think.
> =

> I think there are two possible approaches:
> 1- Describe the two devices as being a single one which is what we will
>    get from the controller anyway (implies supporting two CS per SPI
>    device)
> or
> 2- Describe the two devices in the device tree and then by software hack
>    into the MTD core to simulate a single device to talk to.

Approach 1 makes more sense to me since once we implement it you can =

also use such multi-CS flashes with "dumber" controllers as well like =

spi-cadence-quadspi. There, the driver would have to manually set the =

chip select instead of it being done automatically by looking at the top =

bit. This would at least work for the dual-stacked memories.

How I envision this being implemented is that SPI NOR would be aware of =

the number of Chip Selects and when to use which one, and it would =

specify the CS value in the SPI MEM op. The controller driver can then =

execute this op as needed. One point to note here is that the entire =

memory won't be read in a single transaction. There would be 2 =

transactions: one with CS=3D0 and one with CS=3D1. Is this fine for you? Do =

you have something else in mind?

I am not sure how this model would work for a dual-parallel memory =

though.

> =

> I have looked at the code, there is no good solution, but #2 definitely
> looks horribly complicated and subject to a lot of corner cases to
> handle, hence this proposal to go for solution #1.
> =

> Cheers,
> Miqu=E8l
> =

> Miquel Raynal (3):
>   spi: dt-bindings: Allow describing flashes with two CS
>   dt-binding: mtd: spi-nor: Allow two CS per device
>   spi: dt-bindings: zynqmp: Describe dual stacked/parallel memories
>     modes
> =

>  .../bindings/mtd/jedec,spi-nor.yaml           |  2 +-
>  .../bindings/spi/spi-controller.yaml          |  6 ++--
>  .../bindings/spi/spi-zynqmp-qspi.yaml         | 31 +++++++++++++++++++
>  scripts/dtc/checks.c                          | 24 ++++++++------
>  4 files changed, 50 insertions(+), 13 deletions(-)
> =

> -- =

> 2.27.0
> =


-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
