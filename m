Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C55EC5478C
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 18:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wq1RkHjlToUxJo8VKNDIAa5yhOEYxXZboL9cvtlXMtE=; b=30fdb6zBGWy21WXxfYpvkihixu
	ST0oN75P3Lwm5BLqcOScRVnm1G2+8FtVuAr6kprbTvno7rnzFQFAUa7gIyAIbHW+cpQW2FKFJzF0Y
	/zKmtJ2dDy5fDycSfGsPlTHg/jW+FTEVJ2BRxE3fnjNIVQwDALpqWFS+SNzIBQUc58+jZl1FwTBKo
	KPk30Ern2L6VxEjpEx3wQwh62L1jeEFieHKP6n8FzA30y73xs22P0qeAZfo/Q6jAwmH/FW5aPC0iz
	jnuUO1Jk3IB1rQJpRkE5S8pzjIArjANazHzGR2UtG3Q14Yd39tzZckR/9a4ZAHmsw/pqQePnGOrZE
	ZUqJYJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdaa3-0000000AuXW-3Ldz;
	Fri, 23 Feb 2024 18:47:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdaZt-0000000AuPj-1BmU;
	Fri, 23 Feb 2024 18:47:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DC2461653;
	Fri, 23 Feb 2024 18:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989F7C433F1;
	Fri, 23 Feb 2024 18:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708714032;
	bh=eVLWzS7gYaF42Hqu36RJiepcfVw/lg0keFM7RtUV0Zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UpP5gPFr/wO3BW32q043WYJ8BndpF+5c5kvBbPcCvKFQoWIG8bQxVldGM5HF8/7Zn
	 19GFA+mY4vLTHE0QqgTa9TW1CDUBWJmW/1pGul98tVLPC8XRtgXruShuDyzrr63fXs
	 DKygP3MxjDZwjMsUSC+X4mGT+4U2lFBYh1lp9ar2DGTMGRX65f76HenH4YSxIJOk9T
	 ZcwrK3IKo534NeFkb3w7GCYemQapPnOc5B/4ZuEa6ymmiYltJbpQ9P/YZ7HUWmv3uM
	 geVSVjFUCQ1pyN6PLP716Z0ag8V5iEdv+Dpk+IL47x1wJozGWDpnWUL0uaAkPqH7/d
	 BEYm/83ZFsNuQ==
Date: Fri, 23 Feb 2024 18:47:06 +0000
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
Subject: Re: [PATCH v6 06/13] dt-bindings: mtd: brcmnand: Add ecc strap
 property
Message-ID: <20240223-revolver-astute-8fb3bdbb6b2e@spud>
References: <20240223034758.13753-1-william.zhang@broadcom.com>
 <20240223034758.13753-7-william.zhang@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <20240223034758.13753-7-william.zhang@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_104721_419732_CC65BF07 
X-CRM114-Status: UNSURE (   8.78  )
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
Content-Type: multipart/mixed; boundary="===============5967028482519792318=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5967028482519792318==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n37UuXkV/2mgwiHJ"
Content-Disposition: inline


--n37UuXkV/2mgwiHJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 07:47:51PM -0800, William Zhang wrote:
> Add brcm,nand-ecc-use-strap to get ecc and spare area size settings from
> board boot strap for broadband board designs because they do not specify
> ecc setting in dts but rather using the strap setting.
>=20
> Signed-off-by: William Zhang <william.zhang@broadcom.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--n37UuXkV/2mgwiHJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdjoKgAKCRB4tDGHoIJi
0oLTAQD6uuZ7A4FClI0rca2qTrbTuWwDulHcIMWL6jq5deCSoQEA4yGAktqwg9dD
8s+wtFRJwP+4UEJdvzAjCR2i8xbyHwE=
=0j/A
-----END PGP SIGNATURE-----

--n37UuXkV/2mgwiHJ--


--===============5967028482519792318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5967028482519792318==--

