Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD0CC54E71
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2024 07:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6/semKD5/IkAENiHuVyKI//vOBPqLH9jzhCpzDKz5k=; b=APSmxLkBcU9SIF/8Xb3uILPglY
	z7EQabheVICFxLWgDO42PrzaNzuzyXBnPW/2P3NUgoh5xi4blozubKx+9oOSz+zWoM1se1zv/SzPg
	E2orgAnbwod6LIy8DXNZddfqkwkgFoIIKNGv1OtqzKa/fxPPFRtmlm/XK6GlNV/1R3zhZeKZ+KGlS
	ltKYDGsNnOggXiuqEmbQaqeXIa+J1iD1DbDB2OBsGyYfHatZ77c8yKbw29tGFU9vyjkjBzgTWa1b8
	sk5NfdnpCyAy5qbPhaqsCrFxbtWsSX/na/X5dqq5CwCqcd7t0etnbZMBSU34mbkzyMeYPPDK64mPo
	QB9CdXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnZNO-00000006CN0-3lLX;
	Fri, 22 Mar 2024 07:31:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnZNL-00000006CLr-3nva;
	Fri, 22 Mar 2024 07:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711092699; x=1742628699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1rzS6p1dJQyF/ZSOpXxB1J4g5C8EI88hO1+/BB5uU90=;
  b=nBYpGBH3UPYp0x3HXmvLrklM9IcDj7IWwWOz//HoYMZ8dj7gI/pcbNs3
   BKicp0VljZlt8U0ijNTpKAY7MlYdWoFPPPRodmxNqhd9WQ4a20z1rPpSe
   rx+3hWMlXhlalZFGzSoE1cgw6SmfmDCaoFJbmM0ZWPr9mdK4drwoBQQ8K
   cB7dMaLGEoW4voGe6bhSLCmRwHK0WqrXd2N+lAeQpGK2ZA/2ugstMHb6r
   SCJPyPzY4ubKK5NTc5WaAXiZHi/N9PNLbARifJ02TcgybCG4lwK3kFIn8
   VOjPRAC50ctlUz6Ydt+OZup0q9oaz08E95O/NxDZHPU9kMz+BURp6VDX0
   g==;
X-CSE-ConnectionGUID: aRUh/ppPSjiLg30OD7E4FA==
X-CSE-MsgGUID: 8SIMjWfATaawJYZQlZMRbQ==
X-IronPort-AV: E=Sophos;i="6.07,145,1708412400"; 
   d="asc'?scan'208";a="18544964"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Mar 2024 00:31:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 00:31:29 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 22 Mar 2024 00:31:26 -0700
Date: Fri, 22 Mar 2024 07:30:39 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: <Balamanikandan.Gunasundar@microchip.com>
CC: <conor@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: atmel-nand: convert txt to yaml
Message-ID: <20240322-arrest-pucker-7ff731359fa0@wendy>
References: <20240320-linux-next-nand-yaml-v1-0-2d2495363e88@microchip.com>
 <20240320-linux-next-nand-yaml-v1-1-2d2495363e88@microchip.com>
 <20240320-quicksand-attentive-14610103237b@spud>
 <3c199359-f0d8-4ec0-bf86-930b2ecfb876@microchip.com>
MIME-Version: 1.0
In-Reply-To: <3c199359-f0d8-4ec0-bf86-930b2ecfb876@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_003140_078060_D3FF5CFA 
X-CRM114-Status: GOOD (  18.53  )
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
Content-Type: multipart/mixed; boundary="===============2014620327045815269=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2014620327045815269==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5XY8D9lenP0Sop6x"
Content-Disposition: inline

--5XY8D9lenP0Sop6x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 04:27:29AM +0000, Balamanikandan.Gunasundar@microch=
ip.com wrote:
> On 20/03/24 10:05 pm, Conor Dooley wrote:
> > On Wed, Mar 20, 2024 at 11:22:07AM +0530, Balamanikandan Gunasundar wro=
te:

> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - atmel,at91rm9200-nand-controller
> >> +              - atmel,at91sam9260-nand-controller
> >> +              - atmel,at91sam9261-nand-controller
> >> +              - atmel,at91sam9g45-nand-controller
> >> +              - atmel,sama5d3-nand-controller
> >> +              - microchip,sam9x60-nand-controller
> >> +    then:
> >> +      properties:
> >> +        "#address-cells":
> >> +          const: 2
> >> +
> >> +        "#size-cells":
> >> +          const: 1
> > Why is this in an if? Isn't this all of the devices in the binding?
> >=20
>=20
> The default nand-controller.yaml defines this as const values.=20
> (#address-cell : 1 and #size-cells : 1). I am trying to override this=20
> const value.

You're not overriding anything as you don't have a ref to
nand-controller.yaml in this file, AFAICT. Why don't you?

> May be I should think about better approach ?

You should be able to apply this unconditionally for this file. I don't
see why the if would be needed?


> >> +patternProperties:
> >> +  "^nand@[a-f0-9]$":
> >> +    type: object
> >> +    $ref: nand-chip.yaml#
> >> +    description:
> >> +      NAND chip bindings. All generic properties described in
> >> +      Documentation/devicetree/bindings/mtd/{common,nand}.txt also ap=
ply to
> >> +      the NAND device node, and NAND partitions should be defined und=
er the
> >> +      NAND node as described in
> >> +      Documentation/devicetree/bindings/mtd/partition.txt.
> > These files do not exist.
> >=20
>=20
> Apologies for copying the content from the text file. I will correct this.

You don't need these comments at all I think. You have the ref to
nand-chip.yaml, so at least the first text file reference can be
removed.

> Yes. I should fix the alignment. I will send a v2 shortly

I did make other comments, so I assume you agree with everything else I
mentioned and will implement them in v2.

Thanks,
Conor.

--5XY8D9lenP0Sop6x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZf0zmQAKCRB4tDGHoIJi
0udtAQD10mY1UxAUiy245iE/HFMBpXrP6RsT1/Jv5xwrvG6KqQD/XUG4OLX7ZUxr
FFeupjEPcEhaLjXcg3DqAb7W/vtRCAw=
=Lnin
-----END PGP SIGNATURE-----

--5XY8D9lenP0Sop6x--


--===============2014620327045815269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2014620327045815269==--

