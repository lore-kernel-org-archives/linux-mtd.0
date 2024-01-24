Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D162C47E49
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlpPLq/5HVLTK5zST4ObZb6WZzP9EBTvnd+b7WD2jzQ=; b=4/x6qndOjeLtD2HDmuavfzpiR0
	tngrA9dv8tSXCt0jYLcjgZkXN9e9UROwr7TpCJ72BZU1I9Cmpa5lKHgxYru0OkgyCimF+qaaowilF
	7xYHp1VgP/EWTPTNxNqm8Wly+uQ5kX4+ZqgKUGvE6VungmtL8BV1XkV9ROU5Sc6NqMKoWtU22HuM5
	6kNbGDmM40F//jsRbKJEbqHaf13HPl8OEgArsf8HltJx9oKqJ0zoke82qYFpa3mbMTfNtUJEwUpPf
	3VjlR2xjonQJvmEZx6aeBd3mau39VHelZSCmni/HDcqqg6IUYVXplt6ksPMNrsnUuE/HX4Mf1t99u
	qrivHIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSgzl-004SGs-33;
	Wed, 24 Jan 2024 17:25:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSgzh-004SD2-15;
	Wed, 24 Jan 2024 17:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 85877CE3199;
	Wed, 24 Jan 2024 17:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DE7C43390;
	Wed, 24 Jan 2024 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706117093;
	bh=Tyoyg16m+L9fCBHSlhtH6nlFRNPPjNF7BTPAFm7yRLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NwjqjcaG2uVSX3LiUVh14RJRgcqSAysI+F7o7DiL+nNOkLGH1KH5Ra5mEeRXPel9O
	 4vkTSm7bH8TPXwywSVnK6zBlhoANxRMSdOmx5hYbJcNLsbPUWiH0TbI0q0uwj9WLmm
	 rON4hwyM0KmaEtPJekd+xKsb0Q1GASBBtmn4QD+VA9SHcEmzfsewRERjfMc+SrLg+Z
	 npZZ9ev9TtT2/KwU6cBgkz3/i7lby98lVE/TqX190zUX3j4Zse6TSWq26JsDxLSuyV
	 GQeA0KgqrQvsS2/DUN3KWPkMpBBypwMpbYwkCOi0Pv49lUKWKvG7W2NTNiZHpmBUGg
	 72MWDhysdUKSQ==
Date: Wed, 24 Jan 2024 17:24:46 +0000
From: Conor Dooley <conor@kernel.org>
To: David Regan <dregan@broadcom.com>
Cc: dregan@mail.com, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	computersforpeace@gmail.com, kdasu.kdev@gmail.com,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com,
	tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
	william.zhang@broadcom.com, anand.gore@broadcom.com,
	kursad.oney@broadcom.com, florian.fainelli@broadcom.com,
	rafal@milecki.pl, bcm-kernel-feedback-list@broadcom.com,
	andre.przywara@arm.com, baruch@tkos.co.il,
	linux-arm-kernel@lists.infradead.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v3 01/10] dt-bindings: mtd: brcmnand: Updates for bcmbca
 SoCs
Message-ID: <20240124-rectify-tubular-1dfe659ceac7@spud>
References: <20240124030458.98408-1-dregan@broadcom.com>
 <20240124030458.98408-2-dregan@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <20240124030458.98408-2-dregan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_092457_623778_C55C6FB2 
X-CRM114-Status: GOOD (  13.62  )
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
Content-Type: multipart/mixed; boundary="===============4151701847309514573=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4151701847309514573==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oefS8yUbzuzQDHdr"
Content-Disposition: inline


--oefS8yUbzuzQDHdr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 07:04:49PM -0800, David Regan wrote:
> From: William Zhang <william.zhang@broadcom.com>
>=20
> Update the descriptions to reflect different families of broadband SoC and
> use the general name bcmbca for ARM based SoC.
>=20
> Add brcm,nand-use-wp property to have an option for disabling this
> feature on broadband board design that does not use write protection.
>=20
> Add brcm,nand-ecc-use-strap to get ecc setting from board boot strap for
> broadband board designs because they do not specify ecc setting in dts
> but rather using the strap setting.
>=20
> Remove the requirement of interrupts property to reflect the driver
> code. Also add myself to the list of maintainers.
>=20
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: David Regan <dregan@broadcom.com>

Oh, and the patch is missing your signoff David.

--oefS8yUbzuzQDHdr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbFH3gAKCRB4tDGHoIJi
0ugAAQDPYIVJB/OprlKbbtXgUBVgLVOW/5xcsrk63na+ktc3KgEA8814J96igPC2
vVzqjQxIuwTo/yQXnDYu6UuTSxSZhgY=
=MbCJ
-----END PGP SIGNATURE-----

--oefS8yUbzuzQDHdr--


--===============4151701847309514573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4151701847309514573==--

