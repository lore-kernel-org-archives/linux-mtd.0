Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BDFC0650F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 15:15:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 779C420693
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 15:15:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C1zGJLjR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 779C420693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zGHxU+3VmVrmwSvxheCztM9+mIh/tBbjMBZuiOHiWus=; b=C1zGJLjR5SN9hH9voqDrCOzHH
	Bc6Cge98RrOV0v+0mowSSHgpKKKbDqZFa7UZDZirFgI4RNxo+9d4jRC9IP8xFHVSF4I0+OYV32bT2
	83xSzqIfk9CPl0Z5GkDC0RL7xoT8Ixa9kBPKkgMie4eZ2jxSJ4Iif9yb5gTz13rAxQL8luYejhyKN
	+zza4rRQQQ82bBvFG6Yqsj3VNuN5ssvX/UmHRXRDL8u5N6NCaX3XlZhmtDlVALtV1Sawioij/5RXo
	AIh6CiIQ1jlwBz7pSnKg9nxfnnq2Q8/LQ4+HzojTYBaR0tLVuIVpj8UFDGWtYrS5fLtxqeqyXvj4a
	akfHZjq+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsTqZ-00054I-0R; Tue, 30 Jul 2019 15:15:27 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsTqD-0003gB-1G
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 15:15:07 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45yg8j6xQxz1rJh3;
 Tue, 30 Jul 2019 17:15:01 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45yg8j5wYWz1qqkK;
 Tue, 30 Jul 2019 17:15:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 22g-8UGNh7wX; Tue, 30 Jul 2019 17:14:59 +0200 (CEST)
X-Auth-Info: r8dPYEyvTbaQ+bPM3ZUCg2RK7//Y8yZyHURsYqUc8aw=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 30 Jul 2019 17:14:59 +0200 (CEST)
Date: Tue, 30 Jul 2019 17:14:58 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [imx][vybrid][qspi] Regression notification - vybrid vf610
 QUADSPI - BK4 board
Message-ID: <20190730171458.7ea68db7@jawa>
In-Reply-To: <CAOMZO5BXvMByYX2ixLK+rXoT7ueb0aTmR+L-w6s6-GvFkC1Bcw@mail.gmail.com>
References: <20190725001114.0ceff19c@jawa>
 <CAOMZO5CsTPaRSe-VmOwnnYrsMMXa3GhurmsWwzaPo948xs10FA@mail.gmail.com>
 <20190729224326.44aa3057@jawa>
 <CAOMZO5C4UgetHAW6_JqLGZH96_8TyHSzj10DxFe+XMnZR07ASA@mail.gmail.com>
 <20190729235409.222c8880@jawa>
 <CAOMZO5BXvMByYX2ixLK+rXoT7ueb0aTmR+L-w6s6-GvFkC1Bcw@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_081505_431677_F8223E39 
X-CRM114-Status: GOOD (  15.78  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, Suresh Gupta <suresh.gupta@nxp.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: multipart/mixed; boundary="===============2650788084951857345=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2650788084951857345==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/USNi+Xd_G=l57K_E0I5q=zE"; protocol="application/pgp-signature"

--Sig_/USNi+Xd_G=l57K_E0I5q=zE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> Hi Lukasz,
>=20
> On Mon, Jul 29, 2019 at 6:54 PM Lukasz Majewski <lukma@denx.de> wrote:
>=20
> > At best it is possible to have both memories working with double SPI
> > configuration or single (QSPI0_A with quad SPI [2]). =20
>=20
> But according to
> Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt if you use one
> chip select for bus A and one chip select for bus B, then you should
> have your dts changed like this:
>=20
> diff --git a/arch/arm/boot/dts/vf610-bk4.dts
> b/arch/arm/boot/dts/vf610-bk4.dts index 3fa0cbe456db..0f3870d3b099
> 100644 --- a/arch/arm/boot/dts/vf610-bk4.dts
> +++ b/arch/arm/boot/dts/vf610-bk4.dts
> @@ -246,13 +246,13 @@
>                 reg =3D <0>;
>         };
>=20
> -       n25q128a13_2: flash@1 {
> +       n25q128a13_2: flash@2 {
>                 compatible =3D "n25q128a13", "jedec,spi-nor";
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
>                 spi-max-frequency =3D <66000000>;
>                 spi-rx-bus-width =3D <2>;
> -               reg =3D <1>;
> +               reg =3D <2>;
>         };
>  };

That was the exact issue it seems. I've tested the 5.2. kernel with
this test [1] and it works reliably now.

Apparently those were leftovers from some old, in-house development.

Anyway thanks for help :-)

>=20
> From the dt-bindings:
>=20
> "Required SPI slave node properties:
>   - reg: There are two buses (A and B) with two chip selects each.
> This encodes to which bus and CS the flash is connected:
> <0>: Bus A, CS 0
> <1>: Bus A, CS 1
> <2>: Bus B, CS 0
> <3>: Bus B, CS 1"


Note:

[1] -
https://github.com/lmajewski/tests-spi/blob/master/tests/spi/spi_nor_quadsp=
i_test.sh

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/USNi+Xd_G=l57K_E0I5q=zE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl1AXvIACgkQAR8vZIA0
zr3jfgf/SIHScGKTrvxOhFM1AZI/y1zjhBDONGghm5XWh1Km17/45o4ZvuD7zdub
sncRCcwkH1jHFUvBgRESb5eYrCnIR2wtxQ+7MuoDmWwUXNrhCQbVWTtslGo86RQl
kWoyXislc1GB6zcLknE0Un5a87KDtyzuM7EQnm4PABdjzFkXOGVREsPvefuJh/ga
iDYtPLpJhyznrEoP6VE+5d8c2beaC34kK2OfeaT9fCdNIsiOzXaalcbbuCbG2hS9
NEs5ewN8WRzzExXynJ1o4LjGZ1OD3219Va+Af0VHjNfJqAuHrU/4Aq+s6yXOpEeG
2MMFUogYogZP65Ns0GTL2QJ/S+jKMg==
=5jHp
-----END PGP SIGNATURE-----

--Sig_/USNi+Xd_G=l57K_E0I5q=zE--


--===============2650788084951857345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2650788084951857345==--

