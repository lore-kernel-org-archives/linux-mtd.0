Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1C8D43352
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 12:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnkqymJ4WemOKOS94yBFNmWBIVHijV12y5rDs1ZpZKg=; b=fnSuwB0NW7gv4HQjpd1fYDw/wO
	6xwRdWUpHQCO3/Vl/ugAs59ACskVBb5wSg9YTuhFE8MastC12TKtTHaFV9yLosgKR9vIRlD5bKYvU
	ufpyWEjUprJKBByW1pKZziZmRg6Q2KzIvHjqYl4Z2GL00JcVMC8Tln+DiMQh9Pdr0h30XWbrCmKYW
	WN074cEVglFJ9231Ae5QjwOb0hkiFw0O4Py1Hb/dVXkVkbWa1+43cjfFOcNu781ElWm7W106z5l/C
	d6cONvRemMVEV/CL/AdB8Goz3l+WYII6RAhqhWvm+dllRETqhHTrhRu/MNq64V+P6I9ODHchOAOM5
	7flXwWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91dE-00000006vuy-2SrP;
	Thu, 07 Nov 2024 12:29:00 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t91YK-00000006v8N-1Vmm
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 12:23:57 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539f72c913aso1433116e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2024 04:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730982234; x=1731587034; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e5mEBnJVQCgTXAayGd8aqvDjLlsqmRz+483jS2oi5/Q=;
        b=nWoWA9zDtK3DXej95QOuqliGwInrsh9vCiVmlzT+1I2LaSQ3hmU6iqsfvbqCjABs9S
         2InqjTwQAOHApKEZBBsDtaOoTUCc5qWMxasLIHjijq5eq5kBF9asvdJJHJLzHJnwRIlL
         +JXVGGwcBnTj/SfM8l67GMkFeUXv93813q+Mgihmi1VwSPTbtHGxFdA8k3h3R9S1BZq/
         pDOGlfjXCKWbHrB0pEAWjH3IG51HBSGttuPznMvCpjVApravlb4G9lnYqS4IAbUUWo+K
         LMuY8L3V9OJASNItuz1Ih2LhAUjYJYDICu6i9o+eHrnxLgBHLFpkPxx1EwuvQ24clXvB
         tVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730982234; x=1731587034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5mEBnJVQCgTXAayGd8aqvDjLlsqmRz+483jS2oi5/Q=;
        b=hwOtxAeVInz+FnCXA70oBX8UoI8MuiS9xasr2aiGbCV6BfQd6+5zMg2Ds4ZAYsD+qx
         UfDAJx+uBuquuG10OAP9LoSHkJsPc070r/oFkdYehD4FoR1ntxE2HnIQX3pWWwDTH8VT
         NT6mCCCXR2ohIqULe74eTNhoCnBWl+3hBSHhjduyZ03XED0FfeaXYb2qGvk8GJ5bcW/0
         FmCTJd7QB6VYNGxDaa/q18Z2rA5n2vUDvU5rpnK+PX4rRrvlSn+0OWuv/0VQMbHFfJ5I
         H7ZiFuZx+lGPi0b3fz1U+fAqNDBHm8oU5Ln9jnkygGRpGGAk0Yo2Z+Kgyr/+MLPDJrdA
         g0aw==
X-Forwarded-Encrypted: i=1; AJvYcCXx4Uto1S8GDOE0fMgPDf4e3PDKdTEiQkAp+gr0zOjf2oTynjndQF3rcShykDDJtoD0fmG/4dSlaZA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxzLQIu7Dqfs7YccBJxc86UA8j3ynPtEnZa0//VSPTNx4zOiyM
	BmQKxRViE3+RxuLgO/qasXZ7jn/837TV9j1ab5OtD0nCJrTILJqH
X-Google-Smtp-Source: AGHT+IE5NOF+MyMOh9t0PoQGFx/p+V9qIGMTb9aDtyWJG88Z0H59EDALHldmpa4vGm3Ty1CexYNlxw==
X-Received: by 2002:a05:6512:3c90:b0:539:ea54:8d22 with SMTP id 2adb3069b0e04-53b348d2696mr22712509e87.18.1730982233632;
        Thu, 07 Nov 2024 04:23:53 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826aec00sm193887e87.240.2024.11.07.04.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 04:23:52 -0800 (PST)
Date: Thu, 7 Nov 2024 13:23:49 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/2] dt-bindings: mtd: davinci: convert to yaml
Message-ID: <ZyyxVQww6PcYWFJU@gmail.com>
References: <20241107-ondie-v6-0-f70905dc12bf@gmail.com>
 <20241107-ondie-v6-2-f70905dc12bf@gmail.com>
 <5r6j26qwcxyppxicdqih6tskb2qxkb5phzjtwqv47iqb4qupkp@zxujctq7ot6k>
MIME-Version: 1.0
In-Reply-To: <5r6j26qwcxyppxicdqih6tskb2qxkb5phzjtwqv47iqb4qupkp@zxujctq7ot6k>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_042356_490103_F0EE9675 
X-CRM114-Status: GOOD (  19.54  )
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
Content-Type: multipart/mixed; boundary="===============6783537087301395348=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6783537087301395348==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GpFM4aHg++qMfh0c"
Content-Disposition: inline


--GpFM4aHg++qMfh0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 11:17:14AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Nov 07, 2024 at 10:19:54AM +0100, Marcus Folkesson wrote:
> > Convert the bindings to yaml format.
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  .../devicetree/bindings/mtd/davinci-nand.txt       |  94 -------------=
--
> >  .../devicetree/bindings/mtd/ti,davinci-nand.yaml   | 134 +++++++++++++=
++++++++
> >  2 files changed, 134 insertions(+), 94 deletions(-)
>=20
> ...
>=20
> > +allOf:
> > +  - $ref: nand-controller.yaml
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,davinci-nand
> > +      - ti,keystone-nand
> > +
> > +  reg:
> > +    items:
> > +      - description:
> > +          Access window.
>=20
> Merge two lines. See other files how they do it.

Ok

>=20
> > +      - description:
> > +          AEMIF control registers
>=20
> Merge two lines

Ok

>=20
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
>=20
> These two properties are not needed, drop. I don't understand why did
> they appear here. Changelog also does no explain it.

Ok, I drop those.

[...]

> > +examples:
> > +  - |
> > +    bus {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <1>;
> > +
> > +      nand-controller@2000000,0 {
> > +        compatible =3D "ti,davinci-nand";
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        reg =3D <0 0x02000000 0x02000000
> > +        1 0x00000000 0x00008000>;
>=20
> Two items must be encoded as two items, so two <> <>
> Also messed alignment. See DTS coding style.

Ok

>=20
> > +
> > +        ti,davinci-chipselect =3D <1>;
> > +        ti,davinci-mask-ale =3D <0>;
> > +        ti,davinci-mask-cle =3D <0>;
> > +        ti,davinci-mask-chipsel =3D <0>;
> > +
> > +        ti,davinci-nand-buswidth =3D <16>;
> > +        ti,davinci-ecc-mode =3D "hw";
> > +        ti,davinci-ecc-bits =3D <4>;
> > +        ti,davinci-nand-use-bbt;
> > +
> > +        partitions {
>=20
> Where are the partitions documented? In which binding? Don't you miss
> mtd.yaml? I think this binding misses some references, but I am not sure
> which ones.

I thought this covered it?

+  partitions:
+    $ref: /schemas/mtd/partitions/partitions.yaml

>=20
> Best regards,
> Krzysztof
>=20

Thanks,
Marcus Folkesson

--GpFM4aHg++qMfh0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmcsr3IACgkQiIBOb1ld
UjLyKxAAuaB0k58jrWRz6TcX8Bmicff94QbzPurIsl+uRngj83sqmSHvSHqZl0g0
nv+48TxVVK0ZowVop2xs/gR2dUESfOKUz0iuuDmlUYV1ovv3tRDTNxWKgKc7PPEJ
ZvTPBoOyq3VycCkdM49+DHkQFrfkMA26nhS1mEkCwfx1vgSIH0/4YTyw8MX2RfG+
F14bhPCCbtiX2hX+1vS3wxWS48+0RGXEEJp8dps+kHWjdpWS/FPSbnM6pS3nP4EG
2FMuzXeGYLN6hR8l8Zr2pG4v/11UUvSEn6x2/iw2NwFRprSpiOY9nnqo6moQwD3e
2a+ayjLiBXxbXUZ03n95vtgrvhmjoTY7FtKHHeiIVgYzpAoiY8WAk68Z+71ja47g
AhzDyLBTmNqGcc1lRzRfOTeQa9+2MAT1ok3fdDowukOjVq02uBnNgUshaRuxVVY2
39+bJBKi88w6e1I+bVFe2wMqlEDc3znzVe+gHuuy4wIpOkVFRBD0zUwLJkBRt0xV
5/czo53tj7Gzt2+J84PmeSaM5DcIrGwYwK4GJKbvD9cnGUmsDc4stra6fTsVA8Hj
ABQ2KWAnIZkc9w5MdefpGz0CBIfO8uiXhNFL9YqfAvJyXuTjx5Q1VW5m8k5EImA3
oxQj4ZU3I1CnwzzPsfiZihIvkbeMsk4mGL3JBFdh6m91W1iyv1E=
=rTaQ
-----END PGP SIGNATURE-----

--GpFM4aHg++qMfh0c--


--===============6783537087301395348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6783537087301395348==--

