Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A10C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 09:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feewYn6xjUCOVY7azLdu5cYifQdxybHI2zuxKYJpEd0=; b=J62YVFqpAnR8wS
	C8o+XuNqtTdelNMu/WhFinAvoViwO4/htbmfbDPIQcJ/6ZfR/1NWDnac7xHKoiUSiu4BagPBFNF2k
	VTyLaPAHP8yyBR+C3OI1wXGagUOnWlyYJBAP9FR9YnjyuAnjen6JuP0nF8zKYloF6KYmzhTQfgivj
	NqEF9og7Q0AXQO+LlNU4rLs+9UMSfQybP9Bmv/0mIMznXevZ1njWb+axhLiOEzE8cDjozTAeMiN5L
	9cu//GjWDSscGOcO5M7e5pSjqzwVsm2FWB1XMhOdH686cls0xunXw2liRzglQRUd2KYOgkmWfy6Pw
	oxd/G1XuWCAmipfiDQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNWkh-00479r-Az; Fri, 25 Feb 2022 09:19:03 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNWkF-004745-0p; Fri, 25 Feb 2022 09:18:36 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21P9IBjF017495;
 Fri, 25 Feb 2022 03:18:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645780691;
 bh=rvWbhCJfnEIOUkIutnw+J3DZO5DRfhnDxkBwC3aC8fE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Dii+kV0O8lo7+yx9O7UyWiW3gSP6WIDtP/4eZgE9Ho3Cw26ca86US8X/AxQnfks1G
 nASL/KcwxckCgSbhpmVeBT9xnbVkTil2IopvLPhBkrOnoL+iOuszuj3r/4TahYOuuD
 xnFsC8AoW1vpbjkbo3nNFSOHCla7+eB+KnEynj/M=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21P9IB0H081229
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Feb 2022 03:18:11 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Feb 2022 03:18:10 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Feb 2022 03:18:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21P9IAlO009024;
 Fri, 25 Feb 2022 03:18:10 -0600
Date: Fri, 25 Feb 2022 14:48:09 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-aspeed@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 08/10] spi: aspeed: Calibrate read timings
Message-ID: <20220225091809.gvup3mcst45szi6x@ti.com>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-9-clg@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214094231.3753686-9-clg@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_011835_184291_FDDCB0AC 
X-CRM114-Status: GOOD (  13.52  )
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

On 14/02/22 10:42AM, C=E9dric Le Goater wrote:
> To accommodate the different response time of SPI transfers on different
> boards and different SPI NOR devices, the Aspeed controllers provide a
> set of Read Timing Compensation registers to tune the timing delays
> depending on the frequency being used. The AST2600 SoC has one of
> these registers per device. On the AST2500 and AST2400 SoCs, the
> timing register is shared by all devices which is a bit problematic to
> get good results other than for one device.
> =

> The algorithm first reads a golden buffer at low speed and then performs
> reads with different clocks and delay cycle settings to find a breaking
> point. This selects a default good frequency for the CEx control register.
> The current settings are bit optimistic as we pick the first delay giving
> good results. A safer approach would be to determine an interval and
> choose the middle value.
> =

> Due to the lack of API, calibration is performed when the direct mapping
> for reads is created.

The dirmap_create mapping says nothing about _when_ it should be called. =

So there is no guarantee that it will only be called after the flash is =

fully initialized. I suggest you either make this a requirement of the =

API, or create a new API that guarantees it will only be called after =

the flash is initialized, like [0].

[0] https://patchwork.ozlabs.org/project/linux-mtd/patch/20210311191216.736=
3-2-p.yadav@ti.com/

> =

> Cc: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
