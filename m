Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CE7EB64D8
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jun 2023 21:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTNO5pS4yVtx4SIoSRaUb0ZcfViiamEZHx8Hx4r7ans=; b=DNfzXc4tDW9srcAAQhbFqLwCJ0
	Er213ATp6vjPawrLBE9DJw8C7herqAR+QWSp6eDMkd7iX3eWPaRphjqXMZrqLUSwpth/uvjSsmcn/
	NpWOPZizGWxi19481hRt6mi6mRiIJSVpLKDPvnRC6XnWSizTNFNjxU3Fl87rZJ+cw20BV62Yc9HUn
	p0v9dgQ22nxiNg4UH9biTM77jF/1tE4+K9nwktFChVldEMyh8qMMSjhBYRgSHdrAzUIUWQp4qTgGi
	0wUeB1sCJ3Hklf6YSgCu2H0jAzjwRRi+c6Om6yYjwi6xdVVoFXkY5MZNRbeEjJc48TnIVwrkS2eQY
	ZfbBqYjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9B9v-009AA3-2T;
	Tue, 13 Jun 2023 21:02:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9B9o-009A8Z-2Q
	for linux-mtd@lists.infradead.org;
	Tue, 13 Jun 2023 21:02:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C3C163987;
	Tue, 13 Jun 2023 21:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E720AC433C8;
	Tue, 13 Jun 2023 21:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686690146;
	bh=jyw8frzPoCYARfrEDCQDW+9wm0qWESJzWlGdSUEQ4vM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/52i+n0lFJdCwXaDLrEEo8Sr+kIVC40XOIu6Qj9sBJSRRMawRPZrnHGySsMZmDnB
	 rDanIwfX+gcEnZ3fHJiUKDKbxoPfnICb0SPKi6ew+vJX1KuLJtV511U5sJ/SWzpXoj
	 oVUnp5aUG9UIfn9KKFJtKn2G8GEEnDOyUw6ssia00UOE9xkw7FXNMb/ALGqzvZOwAx
	 IdGcYYXW6fWHuJPP4rMI3YVnCCUeYxocePySqqqP7v/rJjyyLr8Luohw3Epjtm5mt6
	 HoD+QcXuq9flJgIrL3gYwpGvPrZYNQOqLVOeJJnfTWd3tGpW63DS5jvDua95RQWDi6
	 Jd7gr+kXTjORA==
Date: Tue, 13 Jun 2023 22:02:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: partition: Add missing type for
 "linux,rootfs"
Message-ID: <20230613-massive-varmint-7c3b33cf1d02@spud>
References: <20230613201014.2823185-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230613201014.2823185-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_140229_298544_468065E5 
X-CRM114-Status: GOOD (  10.37  )
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
Content-Type: multipart/mixed; boundary="===============8776829094655606248=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8776829094655606248==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qpOSysnE7Jq8zno5"
Content-Disposition: inline


--qpOSysnE7Jq8zno5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 02:10:14PM -0600, Rob Herring wrote:
> "linux,rootfs" is missing a type, add it.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--qpOSysnE7Jq8zno5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIjZXgAKCRB4tDGHoIJi
0i0aAQDFRm9BBtjFLcppPVZdx5ZJLT/LY2z8dhtUjvOrme3xKAEAj0vflj1emuNf
XYUKJeIlIsGDh8WQuJKgJvN5Fxm6uAU=
=5DDt
-----END PGP SIGNATURE-----

--qpOSysnE7Jq8zno5--


--===============8776829094655606248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8776829094655606248==--

