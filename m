Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D736FC4828F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Feb 2024 17:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLkkiYmQmomBBYeWOHBZrhg4xkIcqVQov+iXLHsVPgY=; b=krVCfD7Go6LfDMF2hqADSSZsfe
	f3Lm6Jgu3iwoRsSgJejyJyhUIfUcz9umZ3q3dvkvtndJCAgUOrpCopKxkgLVTlBou8UsqXI8h0RCJ
	4i+qOVnS0QDGkjMROQHf6icgrkoWQI2w7DBXGBVhowiOlQjoXpdUBIZwMvZXNR+xI1wUUL4PimiQ4
	sk9XaH264CST2MAyttN52XrDZ4kA4QdqEe9pJVaEXKZKksYDLDQzjLG/aIFACI+1Hya46u3Z5svus
	+KgHz9z26nJysObxFgnK+gdGZhNEQHDWYLjeiGMV6JE50ixq/UTQZmOxNa35vGs54qjKTQ77/Ff8m
	6/CQlE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYUlQ-000000008ES-2KiO;
	Fri, 09 Feb 2024 17:34:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYUlM-000000008Bx-3RLG;
	Fri, 09 Feb 2024 17:34:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F77262121;
	Fri,  9 Feb 2024 17:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98A1C433F1;
	Fri,  9 Feb 2024 17:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707500048;
	bh=Yza2DHejlc9nZ8HXyQC6kyRUdGbbM+hTIoBQEh4Dp3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VA4AD/8ANvBLOkTh/VkHswws5LCvcuLPTAr6cpvxOjIGUZM53ioCsrMvGzJLRB+Pj
	 LFaWxO/w+ktj7FU4hxnlLJl143wWReDSRcWAMTLxQsDeZ3qfg5O0zTF1TnvD6bb7fx
	 5XFUw3E6xQiWGW4MdahgUwGtcsId5af5CV1+NNGi0DZfAFX82alRtZzo4FDhATm+ug
	 wXulFQIEnfd0wuvhO2GlTeM42Ks1NSyVp0DCrZMKwapOP0aDSlRZkhPtL7ZZZevH0k
	 AH2iPH5C1aF+dEBwNh6+i5hPTwGRRO4ZfEEcCcHQRBFHXLZjsErkEvUiHUeYdvivpf
	 eFmzQqKbhqUyw==
Date: Fri, 9 Feb 2024 17:34:01 +0000
From: Conor Dooley <conor@kernel.org>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	f.fainelli@gmail.com, kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com, anand.gore@broadcom.com, dregan@mail.com,
	kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com, devicetree@vger.kernel.org,
	Brian Norris <computersforpeace@gmail.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 02/12] dt-bindings: mtd: brcmnand: Add WP pin
 connection property
Message-ID: <20240209-buffoon-cleat-e0dd67e0c5f7@spud>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
 <20240207202257.271784-3-william.zhang@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <20240207202257.271784-3-william.zhang@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_093408_963566_6CB445D9 
X-CRM114-Status: UNSURE (   8.44  )
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
Content-Type: multipart/mixed; boundary="===============1226127692472430034=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1226127692472430034==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4M4QCWMdx5AohHxN"
Content-Disposition: inline


--4M4QCWMdx5AohHxN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 07, 2024 at 12:22:47PM -0800, William Zhang wrote:
> Add brcm,wp-not-connected property to have an option for disabling this
> feature on broadband board design that does not connect WP pin.
>=20
> Signed-off-by: William Zhang <william.zhang@broadcom.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--4M4QCWMdx5AohHxN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcZiCQAKCRB4tDGHoIJi
0nJLAQDMWXmT4mt+4PLyrzHlfXj+/DY/gC5lCn/y4fANaTSyxQD7B96+TYnoxiye
7DIvvIa22KEP8wBY9LkJm8lH+0jRAQM=
=K+5h
-----END PGP SIGNATURE-----

--4M4QCWMdx5AohHxN--


--===============1226127692472430034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1226127692472430034==--

