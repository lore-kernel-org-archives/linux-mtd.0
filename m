Return-Path: <SRS0=lLyx=23=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32E6C2D0D1
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2020 10:06:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C330C2072E
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2020 10:06:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JuU2BKWh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C330C2072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R+gzKmOrTrWSZxRKlTQva2SvW36D7oelVOqGTI4rTmc=; b=JuU2BKWhK+UvjjQTwntc+iGhz
	2Tp+5R4GG0Dz2qDSXLF+99MirNUhfxj1EVxujc6BCgd/lnaT8GVKVYp3duzejdkl17oM04t1Uo7hi
	FalDlZGr+iV0vXa+B2CioHQ520VummBkFkxCccYV86icW46ohKi6OU4ZzqnPUtADuGaNZRLvAXJZG
	YHKA99abZyWffXxRjP8xRJtc8oMesMRioXe3wclBsL67DBAxOfQw6rsgrswPmOZJZNYeFv9zEt+0T
	PF+dmijhbT6Gzn0DKToflUhlxft0faJhrsqw/cpRSbetZrh3HVRmCliq7Kh8jDTgJVkAeCvy92L81
	GWicXUpZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioPH7-0000Fw-Sw; Mon, 06 Jan 2020 10:06:17 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioPGv-00006I-LA; Mon, 06 Jan 2020 10:06:08 +0000
Received: from localhost (p54B338AC.dip0.t-ipconnect.de [84.179.56.172])
 by pokefinder.org (Postfix) with ESMTPSA id 8DC052C0686;
 Mon,  6 Jan 2020 11:06:01 +0100 (CET)
Date: Mon, 6 Jan 2020 11:05:58 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] treewide: remove redundent IS_ERR() before error code
 check
Message-ID: <20200106100558.GA4831@kunai>
References: <20200106045833.1725-1-masahiroy@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200106045833.1725-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200106_020605_846668_47C66875 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1220327183454502553=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1220327183454502553==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2020 at 01:58:33PM +0900, Masahiro Yamada wrote:
> 'PTR_ERR(p) =3D=3D -E*' is a stronger condition than IS_ERR(p).
> Hence, IS_ERR(p) is unneeded.
>=20
> The semantic patch that generates this commit is as follows:
>=20
> // <smpl>
> @@
> expression ptr;
> constant error_code;
> @@
> -IS_ERR(ptr) && (PTR_ERR(ptr) =3D=3D - error_code)
> +PTR_ERR(ptr) =3D=3D - error_code
> // </smpl>
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

For drivers/i2c:

Acked-by: Wolfram Sang <wsa@the-dreams.de>

Thanks!


--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4TBoIACgkQFA3kzBSg
KbYycQ/9HHMMaJuiDZs2ZZyg9Szbt/uDs6lfGNwX2WQjjgoo0FHwIISx26fwUSS0
sfKb1VukurwS3gKvijHI2Tgo+f8Vb5W76AfDl7l2Pt+/1Fc3udj81ejuq6hrwDtX
8lb3i4K7U7mReQW1CuGDL2a15XNeUCNSocbEz9r/fSMSCcO7vtYFQdJ1PRCiO40n
Z9RU/AGK5/6Dm8H6JaPvBbkL4cSaKu0fWTLYwZfm5lUqpj8ERaGKdlz4W/DEy5nw
/FLsLSoRRKpkrWFzohHUjEplvrX5Xv7//Pl4GHVxH25rPhKgXL7M4bkJUrAOG8Ap
zRni09tOZTNrB2zkt3dFgDSUXwPHJOM0KLrVyFeze3ZtA/8rDaDxbr7a0lK0Jgi6
X3+CMoirCftC9W2ub9a9h/IOhLqzFzVoWNN3QsHr4XxLYmE1EvhoIYbCRs3JpVrV
cgbYECZxZElbp6K6u7sEsETPvGjvHi4gzXBZUwxYpdZyWaUsV+XIzxqQyeQIqkFF
Yp6Cjmd/cjgLLUMwxL2QaopFPm+Ul+f5AojzQbMP6ScKbrjYfKn8S60q4fwrShk1
yDlNFlQgdSrn1Dt1PfGllfjLz1bcQ/tsZsmP/ulyPE0Ph9Mv5ixDhEse7mZmOVjm
8khnVJiGQcIi1CMl8mR8uDU6319aQvxcYWlG84KlF7nXsigrRqA=
=e1Dd
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--


--===============1220327183454502553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1220327183454502553==--

