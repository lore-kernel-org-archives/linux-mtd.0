Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761C3CAC5B0
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Oct 2025 18:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtD7f/KPgFRga1Lj1RmEiigQMLbK+wwHYYUjNiydydQ=; b=rmo9ZU6pBkZpRw8Smbzs1FiEQv
	Po/LHEFtkby03HK046boe8JrgUtKFvVAivquN0DHUlGb0N8vlizeI0owZpcBsQXu6wci9TUJ1VZru
	f/WiBf3O3tzr0RMCkLyaa/+SMYETvwXH2dv3E08LV77ojiNeXK61vYihei6dlu//dm8ch0glnwMQ3
	JOVH5+c5f2ie/y3fyY7oHqApqDHIYfo1gHI/d8NVvOHuFMjsLxrZYSCg0jvZkIn46Y1/N22VpAqGe
	j9LOOphi8Y0MyKcv4yFmwabSXdKfeOwfuaSF+GEVI/fr42ZgUt63k8wwT8a0pUXPRfMALtGYZI0aU
	dgs9gKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4OAg-0000000B2p7-3GZq;
	Thu, 02 Oct 2025 18:36:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4OAe-0000000B2ob-1yFO;
	Thu, 02 Oct 2025 18:36:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9A05611BD;
	Thu,  2 Oct 2025 18:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D2BC4CEF4;
	Thu,  2 Oct 2025 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759430211;
	bh=n5kiSAcbhb2eHuuUHogicf0hIb8cWyg9KNsm4j+akvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JC+92sJbWT3GFAshOqJqRxpkZoiXcm1Y3cat6v8hDF0pQmsTxEGSmf03mdaAGzGws
	 wUfesAvRp5saaFMpOQB3At9M+aJ9rHXFpaDqOmr39xLrtP1G5BGvnK1yPXq+7fNcL3
	 NaXiaaVDJ8C0w8eu2Ob31hlJi5llkUjrW7PQ9SxmXMkjs6iIb33RSO7+mf0kY//FhD
	 /ZKYO8+G9LDS12SmSgkzA7LDiUM44VZkGYzZw0sHdB5dssGsUDkqlwBtapFKW/nbCK
	 osPppBAgzVUZdZDEy9F2nZk/zNSiSjmB3sRpDO3XQV8MnlxMyAZXg1IsLN4ZZgRjYC
	 KRkfwgOWGvwXw==
Date: Thu, 2 Oct 2025 19:36:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: physmap: add 'clocks' and
 'power-domains'
Message-ID: <20251002-lethargic-veggie-f6d4b5e3d2cb@spud>
References: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
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
Content-Type: multipart/mixed; boundary="===============7453858809251665958=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7453858809251665958==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x40NfRc09puMoOvJ"
Content-Disposition: inline


--x40NfRc09puMoOvJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--x40NfRc09puMoOvJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN7GPgAKCRB4tDGHoIJi
0ktLAP42zDrr5TqKRUdJdYKMIoirw/SwiG2ofx0WSyImzyfVoAEA26Qdkusn1iOP
+MBcHgThSn6vsUsQ9DiGydsV9RAjiQQ=
=b6Pp
-----END PGP SIGNATURE-----

--x40NfRc09puMoOvJ--


--===============7453858809251665958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7453858809251665958==--

