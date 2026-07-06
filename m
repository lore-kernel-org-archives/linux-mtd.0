Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2882FC43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RBBMQGjgCYBv3DgVqSPUqXS3N6Al9D3ua3jZQhUjmM=; b=eVcuInFru1VTJiKYQcBwd9oSaw
	bVnQaI7BarC3rJBMuCGXsv5GzmCZrAF/Ce2e3dNEeRkWvVEczs0Xkax9Tgjfs9e46ERme/JkFqj7o
	/TyDhbk5Ce1N6uEeOp28A9y/kyIsXA9Ea8RJ2wym1NSxu5q7E3cDWsyKx0oce/GeUCQADlDYOSMyt
	OGkBZocPnyIFoVnje5exYVvsS7uQEhWT53hX/OqcEg3gIdXIZldtZQpw6XtNTQ8gM613dvwp3BofG
	xPA0jCPzNogUwP/fI56FQqm04QXCc/zLePv3GMm6u5Y4qh5NKnfm93WuoxzuQp2yZZyaMHrYGagnz
	Zu9rMh+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjmO-0000000CfbT-2m0x;
	Mon, 06 Jul 2026 13:54:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjmN-0000000CfbJ-0GnS
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 13:54:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 24B6461383;
	Mon,  6 Jul 2026 13:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 563E71F000E9;
	Mon,  6 Jul 2026 13:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783346073;
	bh=Gqunv36uCA2qUOgNp4YavO+YYCLovLGLDYERNlBHawk=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=J6fkwOB+ADgQFPRr5hP31Q4tyxGLWvj0R1c0w3cFaEOZeO6+6JNPdJaTarbW376Po
	 EW5OofNqpaRw7WkvTdad9L5AGUIdUeRmlixkZ6oCQErsQvY+XR6YbqpaTKbbgRvO8b
	 dy1G/0JqsPqXYhBU5OsPjxYa5xg97cXgCRomofWerIfvJzCepU5J9KYmYsX9+GDnT+
	 LgC8vZfQWCTvmM+XhL1ctfyUuXkW7hTNUYs3b8Kx5stskhVomVeSNfSPl/eZ1qr5Nt
	 IIcsdHrDp/i219EgK/FheU+9Cm/vJTacFDe0tL7ccWDga2Qunw2/66zLyBzQq/nvFj
	 5/EaVy7IMKnoQ==
Mime-Version: 1.0
Date: Mon, 06 Jul 2026 15:54:29 +0200
Message-Id: <DJRJF6J9F2LP.1I3R9A9L9H75B@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
Subject: Re: [PATCH 01/30] mtd: spi-nor: winbond: Move W25Q01NW to its right
 place
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com> <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-1-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-1-87e5d3122244@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============7264199873036544762=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7264199873036544762==
Content-Type: multipart/signed;
 boundary=401d873de763bbadc70c0875ff6cd3156f566405e294617b8cf34050be5f;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--401d873de763bbadc70c0875ff6cd3156f566405e294617b8cf34050be5f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 29, 2026 at 5:22 PM CEST, Miquel Raynal wrote:
> Chips are sorted by families, and inside the families, by density. The
> second ID byte indicates the family, the third indicates the
> density. Move W25Q01NW to the right place.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--401d873de763bbadc70c0875ff6cd3156f566405e294617b8cf34050be5f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCakuzlhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jfywF/QXLFmlWRc8lVXBioPaN0HRp/LtXG4Qwl
8Dx2Twki7y6QvBk43ZjJR1dElLqLGhBSAYCDnXydyzQNrvL3lR9R0uQAAAUosqOQ
Xj5/HYKKvs5bFi9uieGde8FZhA3FcrE1oEM=
=TOm7
-----END PGP SIGNATURE-----

--401d873de763bbadc70c0875ff6cd3156f566405e294617b8cf34050be5f--


--===============7264199873036544762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7264199873036544762==--

