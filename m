Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B90C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2024 09:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRa5rpZQkqjUWilyGwGkyIdsFM+0bYhxxSz5MWpgC+M=; b=h4D/JkinOrSnBP1rkFAyj8P0a+
	C4rY6zBGV6MnoDD1GG3FgDsVq4lWHoQzYzSC1A/bLJD8QV3yYHsqbHCz4nUUuW49QviAQO/cXimfw
	EyKqtQX9iXM8w9HaAd/7U6JsjhJWEmZfu/vgnrIacDiTYUUHlzrp7NYtT6pch0vRw/dx+yVIl6ajb
	WhrCeH7CeNmG1dmmtngf6PSv2AGovA3FWYjt9q/hz4qWpv7d0o6no5n0QO9otleOHm1PkHLayopN1
	AkH7vTpL6VbQiyZyNg9GF9lAu33qIRgtgW30IBhSZh7SD+y7DmwxUEJJfSmTHjm6/xa0UndkAZoW2
	NEyUczcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqMy-0000000D2gK-3g63;
	Mon, 22 Apr 2024 09:53:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqMv-0000000D2fh-2xr8
	for linux-mtd@lists.infradead.org;
	Mon, 22 Apr 2024 09:53:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CDE560D45;
	Mon, 22 Apr 2024 09:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC913C113CC;
	Mon, 22 Apr 2024 09:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713779628;
	bh=8+CCJrCws3RT752Z9I+0nlUuqHVENz1nohjmsspboWY=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=Y5Cn1ogHk6ZrbriQ5w/sBHkX/bPBzJBVFiF2rYrfe/ZINzfmae+qgeIIDVD+zbxqm
	 /ADuC2EomfM9nMOZ1Erld0+5eq2H7qKInVBsss6qqyOgASEfw4awERYt60yoNh5lyi
	 Ae8KMngzvnDeGk4SlKOiH2fGbSuKR7XZpMdHpG1ryTIrI9Mmu3mLpEcRGv37VR8mgx
	 12lYXKxWIr3X3jYpjQgI/oIJQlZybZ3lYyLxhOGWOwcZHMDeXvFg5PD2i9JBTiTBbA
	 zuG8ORam9YnJv6lJCk6o4C5OgU+gGAQ6uxEuoBhrdSSWOgZSczB7TWKoomN02iVOCA
	 nyKxLHgFhFYHw==
Date: Mon, 22 Apr 2024 11:53:35 +0200
Message-Id: <D0QK66M6GGD7.2ESAAEDMDOUUO@kernel.org>
Cc: "Ricardo Ribalda" <ribalda@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
Subject: Re: [PATCH v2 5/6] mtd: spi-nor: simplify spi_nor_get_flash_info()
X-Mailer: aerc 0.16.0
References: <20240419141249.609534-1-mwalle@kernel.org>
 <20240419141249.609534-6-mwalle@kernel.org>
 <ea3b32a8-7a1c-4a32-beb5-acc6f6435954@linaro.org>
In-Reply-To: <ea3b32a8-7a1c-4a32-beb5-acc6f6435954@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_025349_811597_38A944F8 
X-CRM114-Status: UNSURE (   6.12  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2826267062071626357=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2826267062071626357==
Content-Type: multipart/signed;
 boundary=cb134ca7a9f8e269b067b74597d138b5ec5c5ba6f747c56adefe89ccdc46;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--cb134ca7a9f8e269b067b74597d138b5ec5c5ba6f747c56adefe89ccdc46
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> 	if (name)
> 		info =3D spi_nor_match_name(nor, name);
>
> 	if (!info || info->id) {
> 		jinfo =3D spi_nor_detect(nor);
> 		if (IS_ERR(jinfo))
> 			return jinfo;
> 	=09
> 		if (jinfo !=3D info)

info could be NULL here. So "info &&", apart from that looks good.

> 			dev_warn(();
> 		info =3D jinfo;
> 	}

Pratyush, should I'll drop your Rb tag then.

-michael

--cb134ca7a9f8e269b067b74597d138b5ec5c5ba6f747c56adefe89ccdc46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZiYzoRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hq0QF/W5w0LJO/Tlly9UKjiQWmjTnpkfEPgTaQ
Tp+tPIGsjpj72mnmkuBX4/JHyRKMGEelAXwOghOr7t3XVLc8EW+UQdr3cd4WmZET
4jwa6114y252B2D2XwB3Xr0k8qnU+QELAQs=
=AUVn
-----END PGP SIGNATURE-----

--cb134ca7a9f8e269b067b74597d138b5ec5c5ba6f747c56adefe89ccdc46--


--===============2826267062071626357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2826267062071626357==--

