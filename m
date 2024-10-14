Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C9FD16262
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Oct 2024 13:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lf7i2kWrjvPzmjXICvyp19DDLFCCvYbtzk3x97t3o3Y=; b=hjGcHhx2vcIHF7dyP6CcjNMxjI
	DMRVWiXw0R1OZcJkFmbgwHpCaW8zVAEFioPLFjxd1wt/1YYA6qxWmRwq4PygzM54E9ap7crEHeT4/
	jVt15URqQKIwFVv/jq7+zysq7r06sNt9u2ttgiyoBsMsK3Wwuw+KwHJLwTrwvTSnB/XkEt98aRUJF
	LWr6ciyhk2huK1dmaAl45WQjM1nMmZszulJNx04QZ4mmVTvBnnonEYYBMv785kWo83YtXWKwf/TUV
	5zyqkJc+5Xfe74I8SBm+AJZEYUWDUMLMqHVd9513X/z1+NoF+qaW8jB2Xf2bzjXWT0UjvugZSvL4n
	vuGVXwuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0LC3-00000005IkJ-01cB;
	Mon, 14 Oct 2024 13:33:03 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0JoL-000000051Me-0a1u
	for linux-mtd@lists.infradead.org;
	Mon, 14 Oct 2024 12:04:30 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539f6e1f756so953076e87.0
        for <linux-mtd@lists.infradead.org>; Mon, 14 Oct 2024 05:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728907466; x=1729512266; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gAhKE9vd5VoPEDERdDcAkweB+/fuBqaQlx8ZWt7jHoE=;
        b=Y/MD9r0Rlz2YQ9cQCTcSQdwFHvShjzPNSAI2xZOoTQT4jSbZtTYcTMYPLS4qAbHr/F
         ezJS7/m5s+bhq9DIHUi68ZS4g/2r8kZrhEDJ++z5PwaEeWm/erzWWATjp2bwsvGsMfAA
         QZAix0q3K/RTYRCK/UPnpmwj6ceOjM1dFGmvPNw6l7bzeO7zBBdSOZ99apmW+F1fG0oy
         VAVTRI6Jta7yZUMZHOyDtsmT33crPMRYXruwfExtYmcS29FVIvYyd4+qYPVZwbX1Z3TX
         b0xG5lfWWhKXWww+gVMSVL6Q6AvgETIzpZtirLP4mMkPP7B5EAb4cBzawvKMx3cXWXah
         87lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728907466; x=1729512266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAhKE9vd5VoPEDERdDcAkweB+/fuBqaQlx8ZWt7jHoE=;
        b=h/IlgQ7TVmHpqZR7Q6p4xO1spLoDFYhCQW58gR4HUNRuNuazohkT+j3nhi4wowRU26
         f7vwAiSV2wIYJoFmFKwzQwj4P0MGxw6TrTG0CNAEtldTqNcO2CpIc3LrffnrWIzDqyDW
         H/DbG7DBXIEPMJhk/1huOTfFci56dC2cYBHlrStIJgqysDC16w00nkmtYwWq/J741XA3
         TDjbpSHLGCGVXRmFl3rA6Cic+7NIf7A/BbKygpa/qCVJpq7wjXerB/evdW/Vqqa7xNuW
         BJQ0RE9FHr8riME8tzbNmkAD7TR5sIkJvfWRL2/TDgWLyehz3DUIwuwrPf3IcR62Dcsj
         kV7g==
X-Forwarded-Encrypted: i=1; AJvYcCUGzoMHxuZvKmGADydme3TnMaaoln1Cl6v5WK1kyFa0N4fh7nXpVFv1KvP92TanfRSePvc9DrCTyzo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrzDSKmUQEDvHL9wom8FR9D/mNBPK3bp7+BfO5u1j57ynpmyyA
	vebVOsq1YlRn7rAfXom3NA2snDDA8LIEx7IrPocclBK56jqIoskbBf3pOZvf
X-Google-Smtp-Source: AGHT+IGstZmxwNsompie+aLTNH6Adpdfi+FGz/MmaD5OGfP/FGHcH7YFWNRG3hj+N8YDPneCt2WGoA==
X-Received: by 2002:a05:6512:1105:b0:539:fc42:e5ee with SMTP id 2adb3069b0e04-539fc42e6femr776977e87.29.1728907466071;
        Mon, 14 Oct 2024 05:04:26 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e2c4a137sm1111628e87.243.2024.10.14.05.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 05:04:25 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:04:23 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: mtd: davinci: convert to yaml
Message-ID: <Zw0Ixx9Qu9tgGXGP@gmail.com>
References: <20241008-ondie-v5-0-041ca4ccc5ee@gmail.com>
 <20241008-ondie-v5-2-041ca4ccc5ee@gmail.com>
 <4u5iv24enpz46funfvbo2aggx6yiqxy7beaa3ldt5ai5wf65kl@bnlm4eyuwkui>
MIME-Version: 1.0
In-Reply-To: <4u5iv24enpz46funfvbo2aggx6yiqxy7beaa3ldt5ai5wf65kl@bnlm4eyuwkui>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_050429_273108_E7D2A4EA 
X-CRM114-Status: GOOD (  34.01  )
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
Content-Type: multipart/mixed; boundary="===============2225985356004055670=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2225985356004055670==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D0LLp9JK1EE8uudv"
Content-Disposition: inline


--D0LLp9JK1EE8uudv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Krzysztof,

I'm sorry for all these iterations, it wouldn't have been necessary if I had
done my homework better. I'm not too familiar with writing these and I do
often find the descriptions unclear and not obvious.
Anyway, thank you for your patience, reviews and help.


On Tue, Oct 08, 2024 at 03:28:33PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 08, 2024 at 09:02:45AM +0200, Marcus Folkesson wrote:
> > Convert the bindings to yaml format.
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  .../devicetree/bindings/mtd/davinci-nand.txt       |  94 -------------=
----
> >  .../devicetree/bindings/mtd/ti,davinci-nand.yaml   | 115 +++++++++++++=
++++++++
> >  2 files changed, 115 insertions(+), 94 deletions(-)
> >=20
>=20
>=20
> > diff --git a/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml=
 b/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..1263616593532e8483d556b=
4242b004a16620ddf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml
> > @@ -0,0 +1,115 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI DaVinci NAND controller
> > +
> > +maintainers:
> > +  - Marcus Folkesson <marcus.folkesson@gmail.com>
> > +
> > +allOf:
> > +  - $ref: nand-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,davinci-nand
> > +      - ti,keystone-nand
> > +
> > +  reg:
> > +    maxItems: 1
>=20
> This was different in original binding and commit msg does not explain
> changes.  Be sure any change from pure conversion is explained in the
> commit msg.

Hm. Another misinterpretation from my side.
Should I use items instead? E.g.

  reg:
    items:
      - description: |
        Contains 2 offset/length values:
        - offset and length for the access window.
        - offset and length for accessing the AEMIF
        control registers.

>=20
> > +
> > +  partitions:
> > +    $ref: /schemas/mtd/partitions/partitions.yaml
> > +
> > +  ti,davinci-chipselect:
> > +    description:
> > +      Number of chipselect. Indicate on the davinci_nand driver which
> > +      chipselect is used for accessing the nand.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1, 2, 3]
> > +
> > +  ti,davinci-mask-ale:
> > +    description:
> > +      Mask for ALE. Needed for executing address phase. These offset w=
ill be
> > +      added to the base address for the chip select space the NAND Fla=
sh
> > +      device is connected to.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0x08
> > +
> > +  ti,davinci-mask-cle:
> > +    description:
> > +      Mask for CLE. Needed for executing command phase. These offset w=
ill be
> > +      added to the base address for the chip select space the NAND Fla=
sh device
> > +      is connected to.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0x10
> > +
> > +  ti,davinci-mask-chipsel:
> > +    description:
> > +      Mask for chipselect address. Needed to mask addresses for given
> > +      chipselect.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0
> > +
> > +  ti,davinci-ecc-bits:
> > +    description: Used ECC bits.
> > +    enum: [1, 4]
> > +
> > +  ti,davinci-ecc-mode:
> > +    description: Operation mode of the NAND ECC mode.
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    enum: [none, soft, hw, on-die]
> > +    deprecated: true
> > +
> > +  ti,davinci-nand-buswidth:
> > +    description: Bus width to the NAND chip
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [8, 16]
> > +    default: 8
> > +    deprecated: true
> > +
> > +  ti,davinci-nand-use-bbt:
> > +    type: boolean
> > +    description:
> > +      Use flash based bad block table support. OOB identifier is saved=
 in OOB
> > +      area.
> > +    deprecated: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - ti,davinci-chipselect
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    nand-controller@2000000 {
> > +      compatible =3D "ti,davinci-nand";
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
>=20
> I did not notice it last time.... but what is this? How could you have
> no sizes?
>=20
> > +
> > +      reg =3D <0 0x02000000>;
>=20
> This is odd. Address is not 0... and size should be 0.
>=20
> I don't get how it even works. For sure it is not correct.

Outch. It slipped through when I was laborating.

This was the example I wanted to get working:


```
examples:
  - |
    nand-controller@2000000,0 {
      compatible =3D "ti,davinci-nand";
      #address-cells =3D <1>;
      #size-cells =3D <1>;
      reg =3D <0 0x02000000 0x02000000
      1 0x00000000 0x00008000>;

      ti,davinci-chipselect =3D <1>;
      ti,davinci-mask-ale =3D <0>;
      ti,davinci-mask-cle =3D <0>;
      ti,davinci-mask-chipsel =3D <0>;

      ti,davinci-nand-buswidth =3D <16>;
      ti,davinci-ecc-mode =3D "hw";
      ti,davinci-ecc-bits =3D <4>;
      ti,davinci-nand-use-bbt;

      partitions {
        compatible =3D "fixed-partitions";
        #address-cells =3D <1>;
        #size-cells =3D <1>;

        partition@0 {
          label =3D "u-boot env";
          reg =3D <0 0x020000>;
        };
      };
    };
```


But I'm getting the following errors:

```
=2E../ti,davinci-nand.example.dtb: nand-controller@2000000,0: #size-cells: =
0 was expected
        from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.=
yaml#
=2E../ti,davinci-nand.example.dtb: nand-controller@2000000,0: reg: [[0, 335=
54432], [33554432, 1], [0, 32768]] is too long
        from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.=
yaml#
=2E../ti,davinci-nand.example.dtb: nand-controller@2000000,0: Unevaluated p=
roperties are not allowed ('reg' was unexpected)
        from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.=
yaml#
```

The resuling 'ti,davinci-nand.example.dts' contains the following:

```
    example-0 {
        #address-cells =3D <1>;
        #size-cells =3D <1>;

        nand-controller@2000000,0 {
          compatible =3D "ti,davinci-nand";
          #address-cells =3D <1>;
          #size-cells =3D <1>;
          reg =3D <0 0x02000000 0x02000000
          1 0x00000000 0x00008000>;
```
       =20

How do I set #address-cells in example-0 to 2?
I guess that is the problem.
>=20
> Best regards,
> Krzysztof

Thanks,
Marcus

--D0LLp9JK1EE8uudv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmcNCMEACgkQiIBOb1ld
UjItAxAApvXS5J63yVeffC/7GhIWALzNCxsP8G8svrNF+6jz0b6j/FkvhWVYsTxQ
FpPEkVM8KBOY9ZBYEHeNVlJNciDJMV9SNNiWbiPTTLFofBED14eXEbCN5yorUCjY
PFDcYYPDJYdwkHsdyMkH7XrSNVl0y8mT5hM1FsTR0zm0CO7SDvN4riQ+1Bdbh2Xh
3s7bdcnfOE8YY+UQYf6c85SfGQWmw5WX3voQzuBlo1rh7G2rLkg7UM4vQ4+A5Bsp
Ht1pAy0RieodHZziuTnYWGvHhMCS8gIRO/NiLUEL1GUjye2tY6JJ4vptLdH1lvmQ
+8fW0RKnTnuvwaxpYVDQl1NVF3388U1hRlLTID3etPZ34ig1NB/JfAg/W6VbrLOk
R4myKdRvnfNC6Ets/K8KsPvu+vUbJ/HMcAeI09dCXni3m+NScoZQx8iOcdBSMxL+
SGznacfKhW+d4R1cqv9sgcmwCDApYDOnWfg7bB/bGSEKYSAWvgkX/1j6A9b6IpNw
ZV++pw07YcrAW3Ex2n/2GyozuiWl5tjua8VXX2xbwkkk2mpUfq5Kg++yipDSPtet
F74nk3kgheUZvNqhuHiEyG6LhBeNfP2WLlDn1vg70R8TpyPJazdVjH100ZI/cbbG
PfqOeAiUVfOaoKCOvHUOYq3U3Xk0vF5y9gnCtPXtSNi3anvN3w0=
=2XDV
-----END PGP SIGNATURE-----

--D0LLp9JK1EE8uudv--


--===============2225985356004055670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2225985356004055670==--

