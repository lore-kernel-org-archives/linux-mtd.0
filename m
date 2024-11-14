Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952A2D6A22C
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2024 19:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huxEINXANQwikO2lBmganUNhxlRE1uv94gC7/kFD9J4=; b=zbv3HyWZJua3uf8ct+OSLRITnr
	ObnJ0VvVTBgBsjtRbNVssOzmE2pxVzjdt1XVCsd2YQbUOquGCgI3eglYXEl+l6a3yM0b94q9bJDnp
	OunkIbrNmhtfqvPw2BoMMW7T4Wd5ae8un5eJ4EI7+KADC+fHKfkyB9JQHCJN7bXYCI/UPZYl3ziip
	6iqW/Q5rzFmKUmaeurRZgaaHbw1S8q0NqpbWj/uT6m1U8kRMYzO138QnzdS4vADKZW2i4T6f5Wknf
	avnMkP80s+6zgTIriTBG7PK6OKOWA1mxON76iyeamJdwdspmyoWcP3uDorCOwm0NHLdiIbQZbUlM1
	+502SNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBfze-00000000fww-324J;
	Thu, 14 Nov 2024 19:59:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBfzd-00000000fw9-0vv5
	for linux-mtd@lists.infradead.org;
	Thu, 14 Nov 2024 19:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 48E495C5BDB;
	Thu, 14 Nov 2024 19:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C55C4CECD;
	Thu, 14 Nov 2024 19:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731614344;
	bh=SQSJuA5ZJjGxcHd3x3HQbygt6rb02hRsoGOjMLmtHig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLozVyedExT8zIs+JijAW90zDcwsSRsuqDYGJdkdrTD0yK5jqDTVrU1zGPN8/HEnm
	 Gotj68MrXcARYpXsf59YUZfZKMNMTPrkEtNWkxZBb1b30rcpXqRjxeP9W0pZvei7kx
	 WkXADi0wR2m1gW3cXV0m6C0iRSGww6p+P1Dkg9IC7tEHtV6KI/oXf9K9SHBBkFB9yf
	 kM5x5OeJo9/53uhuUfMggsB/9rjU/xnW6hb83uczrXfDWVrZqofWlOzmtG8m/REQjB
	 3YMtl0qGfBj6aFL7M00i4W6NrzPxoNhjLLqqLg38XNEBGzz+zUYFOkl5aS8isRxU11
	 2YGCsPo36Y4SA==
Date: Thu, 14 Nov 2024 19:59:00 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: fixed-partitions: Fix "compression"
 typo
Message-ID: <20241114-deniable-conical-a57b36ae6dc3@spud>
References: <20241113225632.1783241-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241113225632.1783241-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_115905_300182_63F6DEF2 
X-CRM114-Status: UNSURE (   8.13  )
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
Content-Type: multipart/mixed; boundary="===============3933419585271242558=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3933419585271242558==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P8FMnCtoSWhax0MH"
Content-Disposition: inline


--P8FMnCtoSWhax0MH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 04:56:31PM -0600, Rob Herring (Arm) wrote:
> The example erroneously has "compress" property rather than the
> documented "compression" property.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--P8FMnCtoSWhax0MH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzZWgwAKCRB4tDGHoIJi
0iEjAP44UzO5FUVwEujbOdAmPlMfUvh+QrvwrlPQbzT8f7/UqgEAuJsfYUidXWg6
dLl/3ZvUusQEqoD33r/hyZV/Hq6mcg0=
=+bY1
-----END PGP SIGNATURE-----

--P8FMnCtoSWhax0MH--


--===============3933419585271242558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3933419585271242558==--

