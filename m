Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AB6EA3F16
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Feb 2026 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rT46G08zEw1MhFHSyIhrUJomZsgJNHbdUGc2VW7GMFo=; b=YXdv14ccRzn81FXNxM/JOg5QcL
	g+IxVJCsSlTFMmRsovOQ8QKCbCfajQKBgbrDMkPUxAU5YpHIiz2fGvLDS9V0HL/I4FS5BTj+Uyfhb
	D1H7hJ5arQvCMF9WLilBj9ip98ZZ0pqQrMI8djk0lsFgkDb4H4kEAH0Esk7G1hM3ZQJUkU9Re82HN
	y6eYk858BE2Uhe9s03P8dV72MqVnxnVNO8cD3wZImHMK/T/jgNqxoATYEkL0EuE0w274vBMjNL0U4
	sbFovKHULoRqsvm+dViMjR6KZW9nNOmmyz1m42QBbaH0bLAozWSFAHPrZquLRayZPYppHYjDSm63p
	WdRd2voQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiMa-0000000Ge0A-10we;
	Tue, 10 Feb 2026 07:40:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiMX-0000000Gdzo-1cuj
	for linux-mtd@lists.infradead.org;
	Tue, 10 Feb 2026 07:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9D8B43520;
	Tue, 10 Feb 2026 07:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7053FC19424;
	Tue, 10 Feb 2026 07:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770709244;
	bh=HUpvyTdnSxp/WMVK280ifaOqx4p9QfSA2RIUO2yQrmQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=uR4vc9UGh0NN4zdzGw4O4F+OLasdNaNosYgLCv5UuEjoFFQMwCrc+52XvblvMaZ4Q
	 wQ/DPIb64F21av3oMWojg+ycOxg2lPF/1TIEYfN26WUb70B9Mrt05qmEDcNORBv7XD
	 Rd/cL1UCdEHRgQLQrn0Af0zufotljf4V1dwMpANE0yD8oWk54f/DPq9gQeTLH1VJYD
	 cYc34T7aYrpV1prumvW3tG6iLsPJOSnPejtGSnpVQbigEEAyIJJzSKkHwVJMduQwEf
	 y4Sk8iMV2jwvymBhFUMWJZqwk4gkOh/ouLL86awPv8tYc6tfx8YkCZvZY0DE9DgJcT
	 sFmtTkurEOm6g==
Mime-Version: 1.0
Date: Tue, 10 Feb 2026 08:40:41 +0100
Message-Id: <DGB41FHN7N8M.3MZL3YMCO9ZTV@kernel.org>
Subject: Re: [PATCH 3/4] mtd: spi-nor: winbond: Fix locking support for
 w25q64jvm
From: "Michael Walle" <mwalle@kernel.org>
To: "Eliav Farber" <farbere@amazon.com>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260208061919.30498-1-farbere@amazon.com>
 <20260208061919.30498-4-farbere@amazon.com>
In-Reply-To: <20260208061919.30498-4-farbere@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_234045_469313_831E4571 
X-CRM114-Status: GOOD (  14.74  )
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
Content-Type: multipart/mixed; boundary="===============5071769195480244968=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5071769195480244968==
Content-Type: multipart/signed;
 boundary=85f2de07f6ff37745cc69fae6dfba0a2d6b1524ab31452ece5ade311a22a;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--85f2de07f6ff37745cc69fae6dfba0a2d6b1524ab31452ece5ade311a22a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun Feb 8, 2026 at 7:19 AM CET, Eliav Farber wrote:
> The Winbond w25q64jvm supports block protection through the Status
> Register (SR) and provides a Top/Bottom (TB) protection bit.
>
> Enable SPI_NOR_HAS_LOCK and SPI_NOR_HAS_TB for this device to
> properly describe its locking capabilities.
>
> The device uses Status Register bit 5 as the TB bit and supports only
> three Block Protect (BP) bits. Therefore, do not set SPI_NOR_TB_SR_BIT6
> or SPI_NOR_4BIT_BP.
>
> Reference:
> https://www.winbond.com/hq/support/documentation/levelOne.jsp?__locale=3D=
en&DocNo=3DDA00-W25Q64JV.1
>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.=
c
> index 6d325da121b4..eaa547d36aad 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -296,6 +296,7 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  		.id =3D SNOR_ID(0xef, 0x70, 0x17),
>  		.name =3D "w25q64jvm",
>  		.size =3D SZ_8M,
> +		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags =3D SECT_4K,
>  	}, {
>  		.id =3D SNOR_ID(0xef, 0x70, 0x18),

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--85f2de07f6ff37745cc69fae6dfba0a2d6b1524ab31452ece5ade311a22a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaYrg+RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i5aAGAiXjguK3xcf/C1Vi9v7FFB2CppROAyZzS
gmkKeqkuN0JP09s4Y9Tzkne6mjooJxfrAYCxJ1cXx+gLUhaPntSfspNtv4V2CwJX
CWAOz3wjCFiPZbDSF9LiCj0x2ZG3pnz2Nwk=
=uAGn
-----END PGP SIGNATURE-----

--85f2de07f6ff37745cc69fae6dfba0a2d6b1524ab31452ece5ade311a22a--


--===============5071769195480244968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5071769195480244968==--

