Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DD3C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 17 May 2022 11:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJ8xAi9JVBKY1Q8APz60X+AZVlZ4J+UpaRvAftv0/vU=; b=HICsj0IR1XPHc+
	aOO9hvfSocz+3IBA7ko0kxVsEz4rUFKYs/QYwZliw8fK9KC1rva05E+1yJrbswe8uMzU6Dw9cdghD
	UPM+bCBd45EklKEDyKP7vQ9lVKjszaSnEEdQGVvLW/7trL12cmiuiUUirTANQVrcu0bpwPr+2ZoV8
	yEQwSxaMVWtVaoRpb/vGeLuXPwOVtk5bjbrP0vG3/eoBeklxV3xG/rg/ESReSwGob2lTuyu2hqARv
	gZs2PDww2U7tDYEbtxWjFDNYOcmmRslxcn6eN1A/fjF2JIrbPQFH2XZvY7atbtquuvDCx2M4UoWwE
	1yzmQbhjGpdIWtYBUqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqv1S-00DGef-Na; Tue, 17 May 2022 11:05:50 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqv1H-00DGc2-KS; Tue, 17 May 2022 11:05:41 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24HB5B9Y067885;
 Tue, 17 May 2022 06:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1652785511;
 bh=hDsJq/b0VuKRFUYgX46+pCCeUUg4Uzz56vD30lAdDWc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=C+/lmMp4a8s3j9ztwdKfi7X1KsqIIY1E5422WCsWEqlsAcsrl0AdPawNsRP35HaPH
 P2WrLbLq1j3T6P2cYbplwX1Y6xPVhdgFY+ffLq6IfmaUZbNSMlNpb1Io98yAIR5Czv
 1/WsUufFlJhznkoSNZkcQLWY5SxOiHUWJqH0l7TY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24HB5BGR079369
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 May 2022 06:05:11 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 17
 May 2022 06:05:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 17 May 2022 06:05:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24HB5Ahl014403;
 Tue, 17 May 2022 06:05:10 -0500
Date: Tue, 17 May 2022 16:35:09 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <clg@kaod.org>, <andrew@aj.id.au>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <richard@nod.at>, <joel@jms.id.au>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <chin-ting_kuo@aspeedtech.com>,
 <linux-aspeed@lists.ozlabs.org>, <vigneshr@ti.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v7 00/11] spi: spi-mem: Convert Aspeed SMC
 driver to spi-mem
Message-ID: <20220517110509.2e6xbwot63yl6a3c@ti.com>
References: <20220509175616.1089346-1-clg@kaod.org>
 <165272636363.750911.14933122170662994904.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <165272636363.750911.14933122170662994904.b4-ty@kernel.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_040539_854179_C09F8608 
X-CRM114-Status: GOOD (  12.53  )
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

On 16/05/22 07:39PM, Mark Brown wrote:
> On Mon, 9 May 2022 19:56:05 +0200, C=E9dric Le Goater wrote:
> > This series adds a new SPI driver using the spi-mem interface for the
> > Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> > SoCs.
> > =

> >  * AST2600 Firmware SPI Memory Controller (FMC)
> >  * AST2600 SPI Flash Controller (SPI1 and SPI2)
> >  * AST2500 Firmware SPI Memory Controller (FMC)
> >  * AST2500 SPI Flash Controller (SPI1 and SPI2)
> >  * AST2400 New Static Memory Controller (also referred as FMC)
> >  * AST2400 SPI Flash Controller (SPI)
> > =

> > [...]
> =

> Applied to
> =

>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-ne=
xt
> =

> Thanks!
> =

> [02/11] dt-bindings: spi: Convert the Aspeed SMC controllers device tree =
binding
>         commit: ce9858ea499da025684a7a5f19823c2c3f14bdce
> [03/11] spi: spi-mem: Convert Aspeed SMC driver to spi-mem
>         commit: 9c63b846e6df43e5b3d31263f7db545f32deeda3
> [04/11] spi: aspeed: Add support for direct mapping
>         commit: 9da06d7bdec7dad8018c23b180e410ef2e7a4367
> [05/11] spi: aspeed: Adjust direct mapping to device size
>         commit: bb084f94e1bca4a5c4f689d7aa9b410220c1ed71
> [06/11] spi: aspeed: Workaround AST2500 limitations
>         commit: 5785eedee42c34cfec496199a80fa8ec9ddcf7fe
> [07/11] spi: aspeed: Add support for the AST2400 SPI controller
>         commit: 53526ab27d9c256504f267713aea60db7af18fb0
> [08/11] spi: aspeed: Calibrate read timings
>         commit: eeaec1ea05c0e0f08e04c6844f20cc24a2fcc0f4

I have repeatedly objected to this patch [0][1][2] and you have =

repeatedly decided to not address my objections. I won't spend any more =

time fighting it. But I will say that you should not expect any =

guarantees that SPI NOR or SPI NAND will not break your calibration in =

the future if they decide to move the dirmap_create() call around.

> [11/11] mtd: spi-nor: aspeed: set the decoding size to at least 2MB for A=
ST2600
>         commit: 73ae97e3cabb580639f02f12a192324a53c4bebb
> =


[0] https://patchwork.kernel.org/project/spi-devel-general/patch/2022032510=
0849.2019209-9-clg@kaod.org/
[1] https://patchwork.kernel.org/project/spi-devel-general/patch/2022021409=
4231.3753686-9-clg@kaod.org/
[2] https://lore.kernel.org/all/20220208190636.h6dubktkmuosvdxo@ti.com/

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
