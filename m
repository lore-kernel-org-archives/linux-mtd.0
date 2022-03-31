Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1D9C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Mar 2022 12:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBFYfAu4cePmV8wMRsCX9LsMghuqmdXL9e4QsNzwO6Q=; b=L7B6MBWA3fwZDp
	9rjTWYx2Mg9lrxUWXOGed6zM1H22lkm0/4lLm69dILSEa+ihbKsTl4g8XbeykzMpCkTwHfE04Q9KB
	Bmgqlfo++LzQqX5Px47n9xtjjyXrHECgn07KKUIpXbJ988Nfsg1+L4L/JEHhWQHp4xXckBcJqYhYM
	O+r3Z0fsOvw66/U4MOYYJheybHzA1LTgDshK7rlj64mHaga1G9PJ43dF2OPS+lOcDCQCoZdLmGbpq
	EKySfW3dSoEVoVyrGzfwToMOSgq895cd/AsLH9ALZ7Y3S+SP+3NWiBIzsMajgajSHhwEkbrYgOr0c
	3T+b5Nos5CvIC7It3F7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZtn8-002CVN-LQ; Thu, 31 Mar 2022 12:20:42 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZtn5-002CRl-F4; Thu, 31 Mar 2022 12:20:41 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22VCK404046663;
 Thu, 31 Mar 2022 07:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648729204;
 bh=U/Bd5JEPMZiETyPMjxTZkK0xTLGPXruq7bxamvC/BPE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=p/8v7ChWKtnstAQkNaNKlPYO5HNv82HVDZDet7QGSG/V+7MQvfJ0L1rLZSrS3cYVQ
 L60fynQTGf9ZeFkH483HHSEwH8AuIsvGGAlRHDANvK833a3Z8cySbMJzx2T82HQjcI
 FeQy5iJdInmuqxeeAnxXgE+wrN+S9S16BOMbqRyk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22VCK4cX045704
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 31 Mar 2022 07:20:04 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 31
 Mar 2022 07:20:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 31 Mar 2022 07:20:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22VCK2XC083438;
 Thu, 31 Mar 2022 07:20:03 -0500
Date: Thu, 31 Mar 2022 17:50:02 +0530
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
 Tao Ren <rentao.bupt@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 02/11] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
Message-ID: <20220331122002.55vwda6fnnenuqhf@ti.com>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-3-clg@kaod.org>
 <20220330191908.nhg52a5ayzczpzai@ti.com>
 <2a411a3e-4b7f-c116-b595-f33bffccb4e7@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a411a3e-4b7f-c116-b595-f33bffccb4e7@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_052039_646144_326B777F 
X-CRM114-Status: GOOD (  19.07  )
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

On 31/03/22 09:36AM, C=E9dric Le Goater wrote:
> Hello Pratyush,
> =

> On 3/30/22 21:19, Pratyush Yadav wrote:
> > On 25/03/22 11:08AM, C=E9dric Le Goater wrote:
> > > The "interrupt" property is optional because it is only necessary for
> > > controllers supporting DMAs (Not implemented yet in the new driver).
> > > =

> > > Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> > > Tested-by: Joel Stanley <joel@jms.id.au>
> > > Tested-by: Tao Ren <rentao.bupt@gmail.com>
> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > > ---
> > >   .../bindings/spi/aspeed,ast2600-fmc.yaml      | 87 ++++++++++++++++=
+++
> > >   MAINTAINERS                                   |  9 ++
> > >   2 files changed, 96 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast=
2600-fmc.yaml
> > > =

> > > diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc=
.yaml b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> > > new file mode 100644
> > > index 000000000000..e16bbcd38560
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> > > @@ -0,0 +1,87 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/spi/aspeed,ast2600-fmc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Aspeed SMC controllers bindings
> > > +
> > > +maintainers:
> > > +  - Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> > > +  - C=E9dric Le Goater <clg@kaod.org>
> > > +
> > > +description: |
> > > +  This binding describes the Aspeed Static Memory Controllers (FMC a=
nd
> > > +  SPI) of the AST2400, AST2500 and AST2600 SOCs.
> > > +
> > > +allOf:
> > > +  - $ref: "spi-controller.yaml#"
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - aspeed,ast2600-fmc
> > > +      - aspeed,ast2600-spi
> > > +      - aspeed,ast2500-fmc
> > > +      - aspeed,ast2500-spi
> > > +      - aspeed,ast2400-fmc
> > > +      - aspeed,ast2400-spi
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: registers
> > > +      - description: memory mapping
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +patternProperties:
> > > +  "@[0-9a-f]+":
> > > +    type: object
> > > +
> > > +    properties:
> > > +      spi-rx-bus-width:
> > > +        enum: [1, 2, 4]
> > =

> > No need for this. It should already be taken care of by
> > spi-peripheral-props.yaml
> =

> So we could drop the whole 'patternProperties' section ?

Yes.

[...]

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
