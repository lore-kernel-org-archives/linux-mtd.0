Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4914D2127B
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2024 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJoYZ69cGa4woPmSjyZAvKxhQbIQ72paiTJXyLp0/ZI=; b=PZlMQpgJ+n03wquUeOxzUJ0YZT
	rkM0hbeXEmnx7YbSMmrGtNB/HZVXpJXFfQKmwjm0ROr4HG6UUUjnoKPlmobTfQGSKAmH56xdLT38r
	uIIDF3Ycz0XphQBc6r/c0nGXy8uYSpkfL71kJbwELws7d9ydJfSzWr4LcNpSEeuEpBj6rXprZlbuO
	sCdbkaewF6L9aoQXvMIxBKEM0r9F6c7jqiRnjLyViTm1otLzD6glKkAy71+KSSSiD35FBTNAI3m3x
	lCuS99HYS7w5a6d8Xo1q8Xu0fo89XSJMa3sINHSLHZlw7U04LtWyNvHVyUKtjO8UYMw+vNUMFIcRo
	0wsjw/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1j9z-00000000Aa4-3XtY;
	Fri, 18 Oct 2024 09:20:39 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1j2K-000000008RP-1KS5
	for linux-mtd@lists.infradead.org;
	Fri, 18 Oct 2024 09:12:45 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539f58c68c5so3066213e87.3
        for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2024 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729242761; x=1729847561; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ym2XxYPta4PmjeInIbnDM1RgCbJY0OW1VeC9meShLg=;
        b=nZOOPo2DHbBlXjjBL+LItDKyVNDy2tL8RRWIOuLDB1KKgIc7/7045QlDMJ2ZAIPQgv
         fPFZrJSqke71wVag9V/553ju0GYKEDV74o90HEWhVj2nZurydrqqSo7eXHOchNW5IOcV
         nID7lrFhthJO9ap3IQp2Q3gTiNfZccu2e3my+GHbZk2DUZmrGfsCojhW/9v09rwEc5EL
         lTedNkv+MnWea/jEV+tb1s390IVRbm8RqMCiopdw8TIHXMZFveisqcBj/ul2fdySrTWX
         NbuQ9C6MFPY/NK0eXOUjbRRDYIP9UEvbne8U/FOgIC/WleStgfI9CrNqNSbMk/I+UFFk
         bR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729242761; x=1729847561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ym2XxYPta4PmjeInIbnDM1RgCbJY0OW1VeC9meShLg=;
        b=k1cO8RKOA53dipt8+2uCotuqjTniUtqFlEzEpEqQEbeXur2oaDqdIal6IimyedBbJa
         kPHLAB7+fP1h8QZGro+aVg53kbrL0B6CTZyulM5MXZpJZk2u+qoECUaAgclvwgcbtRu1
         WZsVqFvzR5kjWvjnzT1M0uScWCJpTUz80jTHnA8CEor9PxG5yIHPl/MGqsufbC6IDuL5
         WiQMpcWR+d+eUEryqyPV2HEZ3GGh6j62lXdThnOZdp+EongfAScagqFZKcH6cqrJrJkd
         JwurU84yBxboepw1LOOaLeGF37UooNicPnoS1+l2D1rxlwE61tqaZBs4eRNkAtKYofSf
         qmuA==
X-Forwarded-Encrypted: i=1; AJvYcCUHW6rLDC9LfxI3SrCpb2tva93yBruFMznnUEeW6zCm0vD405V2KtT4QhiOPKJ+K3RLSbwnexo+9ck=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6MKwv52igY1Uy+0+z7miSwjpUMu1Fy81pj/jSXBZQpirduO3f
	bDHFcLWFGvUh2BKZIUsqHqplPTNEw9LT0+wmwSykgcHYRX3chBSLvxu+jr8h
X-Google-Smtp-Source: AGHT+IEe4fpKcbTP0utZlfCeaG4i5zdJ6KSnB2whgWOsH0NR8KjxDlESNwpYCR60GxyfPHM05do4vw==
X-Received: by 2002:a05:6512:4009:b0:530:b773:b4ce with SMTP id 2adb3069b0e04-53a15494e40mr1635748e87.33.1729242761221;
        Fri, 18 Oct 2024 02:12:41 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15211a3esm166190e87.272.2024.10.18.02.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:12:40 -0700 (PDT)
Date: Fri, 18 Oct 2024 11:12:38 +0200
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
Message-ID: <ZxImhhPhOWuYqSfK@gmail.com>
References: <20241008-ondie-v5-0-041ca4ccc5ee@gmail.com>
 <20241008-ondie-v5-2-041ca4ccc5ee@gmail.com>
 <4u5iv24enpz46funfvbo2aggx6yiqxy7beaa3ldt5ai5wf65kl@bnlm4eyuwkui>
 <Zw0Ixx9Qu9tgGXGP@gmail.com>
 <10a0efab-83a8-4168-993a-c4482a568c96@kernel.org>
MIME-Version: 1.0
In-Reply-To: <10a0efab-83a8-4168-993a-c4482a568c96@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_021244_394569_CFD54EF8 
X-CRM114-Status: GOOD (  27.89  )
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
Content-Type: multipart/mixed; boundary="===============4134104016526052942=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4134104016526052942==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0wxXT3JH117vcORs"
Content-Disposition: inline


--0wxXT3JH117vcORs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Kryzstof,

On Mon, Oct 14, 2024 at 08:08:15PM +0200, Krzysztof Kozlowski wrote:
> On 14/10/2024 14:04, Marcus Folkesson wrote:

[...]

> >=20
> >   reg:
> >     items:
> >       - description: |
> >         Contains 2 offset/length values:
> >         - offset and length for the access window.
> >         - offset and length for accessing the AEMIF
> >         control registers.
>=20
> You need to list two items, so two times "- description:"
> (and drop redundant parts like "offset and length" because this cannot
> be anything else)
>=20
> and this should be pointed out by testing, so open the example and try
> to explain why it is so different than expected.
>=20
>=20
> Unless, it is supposed to be one item... but how do I know? You are
> looking at the device and its driver, not  me.

Ok, thank you.

I will go for:

  reg:
    items:
      - description:
          Access window
      - description:
          AEMIF control registers



[...]

> >=20
> > But I'm getting the following errors:
> >=20
> > ```
> > .../ti,davinci-nand.example.dtb: nand-controller@2000000,0: #size-cells=
: 0 was expected
> >         from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-n=
and.yaml#
> > .../ti,davinci-nand.example.dtb: nand-controller@2000000,0: reg: [[0, 3=
3554432], [33554432, 1], [0, 32768]] is too long
> >         from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-n=
and.yaml#
> > .../ti,davinci-nand.example.dtb: nand-controller@2000000,0: Unevaluated=
 properties are not allowed ('reg' was unexpected)
> >         from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-n=
and.yaml#
> > ```
>=20
> Well, obviously. That's the point of the schema. The example part is
> embedded in node with some address/size cells, which might fit your case
> or might not.
>=20
> >=20
> > The resuling 'ti,davinci-nand.example.dts' contains the following:
> >=20
> > ```
> >     example-0 {
> >         #address-cells =3D <1>;
> >         #size-cells =3D <1>;
> >=20
> >         nand-controller@2000000,0 {
> >           compatible =3D "ti,davinci-nand";
> >           #address-cells =3D <1>;
> >           #size-cells =3D <1>;
> >           reg =3D <0 0x02000000 0x02000000
> >           1 0x00000000 0x00008000>;
> > ```
> >        =20
> >=20
> > How do I set #address-cells in example-0 to 2?
> > I guess that is the problem.
>=20
>=20
>=20
> You just set it... There are dozens/hundreds of schemas doing it, what
> is exactly a problem here?

I think I will solve the problem by including the parent nodes.
What do you think about this?

examples:
  - |
    aemif: aemif@68000000 {
      compatible =3D "ti,da850-aemif";
      #address-cells =3D <2>;
      #size-cells =3D <1>;

      reg =3D <0x68000000 0x00008000>;
      ranges =3D <0 0 0x60000000 0x08000000
      1 0 0x68000000 0x00008000>;
      clocks =3D <&psc0 3>;
      clock-names =3D "aemif";
      clock-ranges;

      cs3 {
        #address-cells =3D <2>;
        #size-cells =3D <1>;
        clock-ranges;
        ranges;

        ti,cs-chipselect =3D <3>;

        nand-controller@2000000,0 {
          compatible =3D "ti,davinci-nand";
          #address-cells =3D <1>;
          #size-cells =3D <0>;
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
      };
    };


>=20
> Best regards,
> Krzysztof
>=20

Best regards,
Marcus Folkesson

--0wxXT3JH117vcORs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmcSJoEACgkQiIBOb1ld
UjJZTQ//bDKxPptc8++o//upFWgxG9oOifAmrLAXKb3+6XFdoefvQ4WiMycu0tV1
ggCzxO0JNudz0TUzmTEC3Z09NEM1uyeUhhjo81EPOxye7xhO6MOw5UhOy8SKNNQF
1gQ5lsfva6YMnAL4TFPlSkCST2y/GpXnzUQs+l/enkVWqUcSCMx1VS/kJugCkYcQ
yZxDmjF1dUJZuf0vSlp7VydlL/hR/ahGmFQh+nx1cuHcnXaX421Ds0WwlfyZOjAW
tr4Kdp2rJfnWsas9iG5HuQna1WHAAKGtCeoFXffGfUmm5x/bs8FL1s8AfizHUsTu
r2vR7J8A+AbkbfHEnhweI/Py1SwgfnPxpeHxl05TpWA5ii90pDMZdUzwVPmauwrT
jE9skZ9lp+PNmgWeuszBdpdk6/yYalq8nahFeQvjoGCouybpE4PjoqIP9Xzpybs9
iQ3b/WtiItlT4vIUVaPUB+0TLhvgbNnWWZGuTZI+F7TD04A0OdX7MdOPPUMoFJKc
3enTiSra1+YW0QKOE+JA5vNafTFUqgsUQ7a3n6g/hgaS1LMbHnnzUA+NxWOQhIBA
aJJLVOo1791oefpglKaCTVkah7bTcY+VTZ+lnosj7EYcDNYshkl+OXajSSUPxZZQ
L3Rg28GK1ctGb0CiAV2BkQs68MteVD0vypim24htHs1umEbPgkU=
=sofE
-----END PGP SIGNATURE-----

--0wxXT3JH117vcORs--


--===============4134104016526052942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4134104016526052942==--

