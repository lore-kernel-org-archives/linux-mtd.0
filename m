Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B96BC54791
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 15:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+h6w8l/g7tHCJjlo/QypVVf+yCVY38BYODR6zW2lOg=; b=mrJLTNPQnCEH+M7MsgLn1ZOAx6
	nmheEeuAPVUbdll3YyjOAQBwG77BACZDR/uoDIzUVj+pAz0ky0hbx8uFT2HG4kUBBZRTzzAkZH2F8
	WxTJNcLeejmZAvWr5OzZqRXujX5YV9Sly6Y0eGMDikSd1zMaMKlJK4QuZG/EiAQwheS/5s6m5pL8c
	aGq3NjygZV+EQY0V+CtsGGfPeifp9mxqY4/uv9adxE7Wot1/KnaGRNoLtoaw/TOeA3Ys5lM/Cc7Aj
	SYXxxJUQuxamQB+p8etXsuhv5vD+mz8XeJ7f25h3r8xmn7N8nutsskNYf8nTGNIuLxMiOho9JxK8Q
	/cSU0Sww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQxu-0000000AgVH-35Nz;
	Wed, 13 Mar 2024 15:56:26 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQxo-0000000AgPH-12m5
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 15:56:24 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B6F8FA57;
	Wed, 13 Mar 2024 16:56:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1710345365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=0kMx2fnLG9S7QuFGxkEk0mKxM9IIq52H3BHVY49JHOo=;
	b=eLwSR1m0Ax3+MWq7PQkwieRJ5WLjMrpCkYqvqfVpaL65dyCaT1FAZqBmqPx/u8RjISDBxU
	5ObwEhczI6lUbB+8Py0TwalyHjbKMcgGp6l9KlMpD/I4fD0yxhnE7zezlL0iYZQb3KVdF7
	FMh4QrJyBORVs6BFuFjNaWFlcPElHujzL6aszvgArnTOxTm3h5Ln1IynijWqTzB7Em5qGv
	9PEWqvYiPKZ9NZ530BysQ+PVnwyM/uJPROHe2Og3mWS2t5cbxuV+F2E94kobaIPKLvnVKS
	qDarovdw8J6tGH77V2A7a5zd0UGRHhEeq74xiFW/z6iiOEtqcyxukTczpGSTCg==
Date: Wed, 13 Mar 2024 16:56:00 +0100
Message-Id: <CZSQTVDX6QR1.1K5UGJUNPLM0S@walle.cc>
To: "AceLan Kao" <acelan.kao@canonical.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Mika Westerberg"
 <mika.westerberg@linux.intel.com>, "Dhruva Gole" <d-gole@ti.com>,
 <linux-mtd@lists.infradead.org>, "Mark Brown" <broonie@kernel.org>, "Kamal
 Dasu" <kamal.dasu@broadcom.com>, =?utf-8?q?Jonathan_Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>, "Mario Kicherer" <dev@kicherer.org>, "Chuanhong
 Guo" <gch981213@gmail.com>, <linux-spi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/2] spi: Unify error codes by replacing -ENOTSUPP
 with -EOPNOTSUPP
Cc: "Florian Fainelli" <florian.fainelli@broadcom.com>
From: "Michael Walle" <michael@walle.cc>
X-Mailer: aerc 0.16.0
References: <20231129064311.272422-1-acelan.kao@canonical.com>
In-Reply-To: <20231129064311.272422-1-acelan.kao@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_085623_068946_5C0EBEE4 
X-CRM114-Status: GOOD (  11.45  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7896223201539291356=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7896223201539291356==
Content-Type: multipart/signed;
 boundary=ec260765e73bac126ee51ca62d74f74f4bbd22afdb55110dde7cef8988ef;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--ec260765e73bac126ee51ca62d74f74f4bbd22afdb55110dde7cef8988ef
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

I just had a quick look to see where Florians breakage could come
from and just noticed this:

> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 849ccfedbc72..e0b6715e5dfe 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -974,7 +974,7 @@ static int spinand_manufacturer_match(struct spinand_=
device *spinand,
>  		spinand->manufacturer =3D manufacturer;
>  		return 0;
>  	}
> -	return -ENOTSUPP;
> +	return -EOPNOTSUPP;
>  }
> =20
>  static int spinand_id_detect(struct spinand_device *spinand)

This seems to be random as no other spi-nand ENOTSUPP was converted
but just this. Is there a reason for this, AceLan?

-michael

--ec260765e73bac126ee51ca62d74f74f4bbd22afdb55110dde7cef8988ef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIcEABYIAC8WIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZfHMkBEcbWljaGFlbEB3
YWxsZS5jYwAKCRDNyh2jtWxG++m7APsGW7Jo4lpVFMx2pZX2ivdcG1PCQ8xeW1SQ
QsPWXO6HlgEA6GXGBiyJkT1rh+sJTBKn5D6J/jDGAcdt6SCLWtzR/wk=
=TR1q
-----END PGP SIGNATURE-----

--ec260765e73bac126ee51ca62d74f74f4bbd22afdb55110dde7cef8988ef--


--===============7896223201539291356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7896223201539291356==--

