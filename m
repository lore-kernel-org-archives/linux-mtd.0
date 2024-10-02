Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48BCCF3199
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 07:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C332jArCTKq9ouFs+uCjHolVdYUR0w1iFZZMWguZcIc=; b=Ku6d50JyzhF6HEt8KsC/1vg8Y3
	jX0pvM+kLrRX770l1kWF8Mso6v5foqY6h4a1tFogmm8d+G3sW4fLV60Fyl3C2bZEZYrhPb58HWn1Y
	6wY3ckIMzXx+uNA3qgS84VH2SWTjqf95zVB2WtX7BSv6/i5Q1YI8A1MD0CSxAe/acPYN+L26ZmDhO
	zzuTyX1ROf85guIIL3yPhQZqWnCEOVhaxrr9IogwBQZvQEUgrqgvib52dPSnT4Cr+Dgo1sm7KGzdK
	QlWhbvqA2q5f1sak0knva5IymiUXKBtww3VXhEvmjG3mRvXHXMt9JogwAVYtiwbkv6kz8S/pmHdhV
	mvN9Xh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svu9d-000000054v7-1YgS;
	Wed, 02 Oct 2024 07:52:13 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svu7M-000000054S2-0dhX
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 07:49:53 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-537a399e06dso7294022e87.1
        for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2024 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727855389; x=1728460189; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jpWmhulI7Msld3hi9gp2HgczvTxG5GAZGwAH8UaHcsM=;
        b=lyZYN173e2LHsOnEXe76i4ao1+UtiGrHCTXI71scyHPPGGbjEZZ1ZfSCUQfIZ/Rnxl
         gSXVObPQlGBnwx48KwPkRsmAopauXd9ZJfaCwPS5G0QVn8vf6Nyx016iK9fSzeWF/A+V
         3UFVjpxzmybd2uMB5ihI8VXyIKGKWMFShyhJbW5wajkbJS1BIRILoDfvvXQeEW/bQ/IU
         Xpdwt7dxDFWCahC3WMD0tAUyGKlM69iUGv0U28BWosKYisq8JLCcNMrFXVAYwN6+ZXnj
         LD7gPvhBXKRMtD48z6wmHmMXxBLtUHqvtGlil08DmV/9PrA+6hWttkuA/LLgtY5Ws9jg
         A4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727855389; x=1728460189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpWmhulI7Msld3hi9gp2HgczvTxG5GAZGwAH8UaHcsM=;
        b=a3RAVh0VVG11IBFjfEMy1JqIS4KtxsU9dfcNBH/9MPytNPAekaq8R2HWkzzjD//Byi
         aJHkrV5ouqDyIY10fcioUEDZqz9e5N2izAne8NdU3t0b4vYHgt14JPYsK5e9Dpx0rlFz
         auRspEqleuow4v4XbMjd78Thp7vI775Pf6wOu4NE38KO5uq4uvUxMbw/VOXSt1y/sb3Q
         bgLZWEGurcSVGEKQ80bGYP6osLjPfxwG2U342SI7ogJbKzAxC6/HYEBPefar/fjaKmO6
         D5qDGuii9T9tD/UFLj5le7nw0MurzcgWiTLkVVlyqthiRS+KMwRnkr5OnS5RONbW8TZe
         4g9g==
X-Forwarded-Encrypted: i=1; AJvYcCU1+V0Ev3IAbRypIqxh+rkTGNmLdTnjx1OZwdtkYF1mBoTePC9ZHnXtPUbgIx9Pg4V4ZqIqTrfTX+k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz7YvDnYpg+QG87OdIm9qMbI3RZCGU0lcEHttbokQTvGhmEDeB
	0Y1Wl6J+TtdXyfQnBGfhQwnH0dTfBf6qYxcZXWpCvvv5u3B6FrZsNPxG1g24
X-Google-Smtp-Source: AGHT+IHhov8RkI1UXkOeqc8PEFKDi1iQhiClpEJgsMXzPz5POtDD26bfPFGLmFLSN7vjMrEA3cn9xQ==
X-Received: by 2002:a05:6512:3d0c:b0:52c:8abe:51fb with SMTP id 2adb3069b0e04-539a065ec3dmr1190028e87.10.1727855389127;
        Wed, 02 Oct 2024 00:49:49 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-538a04321d3sm1860966e87.161.2024.10.02.00.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 00:49:47 -0700 (PDT)
Date: Wed, 2 Oct 2024 09:49:44 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: mtd: davinci: add support for on-die
 ECC engine type
Message-ID: <Zvz7GDA278Vam4nQ@gmail.com>
References: <20241001-ondie-v1-0-a3daae15c89d@gmail.com>
 <20241001-ondie-v1-2-a3daae15c89d@gmail.com>
 <20241001221032.525be1e4@xps-13>
MIME-Version: 1.0
In-Reply-To: <20241001221032.525be1e4@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_004952_217392_12BDA4A6 
X-CRM114-Status: GOOD (  20.38  )
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
Content-Type: multipart/mixed; boundary="===============4238810528564206690=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4238810528564206690==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Lk0Il1dqjQ3kDTVE"
Content-Disposition: inline


--Lk0Il1dqjQ3kDTVE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Miquel,

On Tue, Oct 01, 2024 at 10:10:32PM +0200, Miquel Raynal wrote:
> Hi Marcus,
>=20
> marcus.folkesson@gmail.com wrote on Tue, 01 Oct 2024 12:42:27 +0200:
>=20
> > Some chips, e.g. Micron MT29F1G08ABBFAH4, has a mandatory on-die ECC.
> > Add "on-die" as ECC engine type in order to be compatible with those.
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/davinci-nand.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mtd/davinci-nand.txt b/D=
ocumentation/devicetree/bindings/mtd/davinci-nand.txt
> > index eb8e2ff4dbd2901b3c396f2e66c1f590a32dcf67..9afda5cd956494c6b3171bd=
baecaeb289acd64ea 100644
> > --- a/Documentation/devicetree/bindings/mtd/davinci-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
> > @@ -44,6 +44,7 @@ Recommended properties :
> >  				- "none"
> >  				- "soft"
> >  				- "hw"
> > +				- "on-die"
>=20
> This file is very legacy and this addition would be totally unneeded if
> that file had been converted to yaml earlier. Just referencing
> nand-controller.yaml will authorize nand-ecc-mode =3D "on-die" (while
> still marking it legacy). Would you mind converting this file please?

Sure, I will give it a try.
I will send out a v2 later today.

>=20
> Thanks,
> Miqu=E8l


Best regards,
Marcus Folkesson

--Lk0Il1dqjQ3kDTVE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmb8+xMACgkQiIBOb1ld
UjJLTxAAhwmz/MNJlzpTjWl4SPKqPklm4sjeubkDZ73otz7FQlpIIr1Gont3sP/q
jAEWpXLaNaaD64advLi5zJJawCf26etULk1zMb5IjU4xgxKz+to6umsPdebMGMwY
64l4cD6qeTUGtflYzQLQt68RXen/XDP8XV9Zf/S6o8WbZLqyxjtzMFb7s/NJu5yA
kziZknr6F0Jr0ucYqjJyJwtql+lZescz4MY4iR4i2VjtZL8SNYWGPHHZphKQJU0n
byht+9dr60UNPjXVfdtMT+hA+3bRmfXP+xRXArh2cekjnybw2c7kecjxX39nvVtt
72KsVWuHDqGLSWpfnEDIOf+tPDpLD78+e70ZLmZmSEKaR0E2LnhlyHmAVYGyIBkF
mPNFRONHQFicbebsDIQ4Je/yZAkv3HhDGNzZELpy65TxOI/oWgU9I8wz4iTBuSiX
1v4IChntLAEhlATWaRIJ3xM/KgadXBUcmPv1cA9fzPwmxZxpU0DXYdys5QfPBMvE
xTEVYarg11Nflza/A+iDjhYRrlgED7TBfrMGkLaT2j08hXlvjFHmuJ06fffKGe2W
L7wdI7c/eEjbYhfF1WKRZydl60N/YIG0pSuEOaUAcvm25uLcC10iFoHK8HYPs4TC
AYcmpmE2ruja2beiblQRpsgBC1+/Ox5Cymt4SostqV2LJ7/eoVw=
=Xrsg
-----END PGP SIGNATURE-----

--Lk0Il1dqjQ3kDTVE--


--===============4238810528564206690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4238810528564206690==--

