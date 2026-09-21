Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DE4C982EE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 07:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmEO0jIHisuAz5cNNdjwgdH9JnehD2v9sT436B6VQnU=; b=YQS91UtmLXQwceI3ldElH8g3K2
	HwbYEvmt+eoc57AufmFSLdkzdxEnuue9/2FMpAaVAAJ7c5j0UWdSqGLRS9/KJOm1hJOSomqkYqOTp
	+0Xbz6Lw2MA7aVM1pPHbb3NZg0KBIkJtjfnoa093imoVQY/EleNaDu0y7S4DQbhYItx3JWJKq7Qgt
	xC91n9+iK/ejcSfsadxrmsSSNsYfORgS2pQJJYiMT9g4q1/wBdZMm0LtIPG2djY9CJJzJxmvVKtD1
	CwlWW1acdys0AjPjZSYva3Ew1b97mZmywsZCAuX3r2G1EUmndZdVTD7ACeizVyZWwtnHoV3BSNbfk
	heS/X6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YsJ-00000001H1I-1NTJ;
	Mon, 21 Sep 2026 07:55:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YsH-00000001H0G-44Aj
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 07:55:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 693E5600D1;
	Mon, 21 Sep 2026 07:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9BD161F000FF;
	Mon, 21 Sep 2026 07:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789977341;
	bh=1E0s58OdvUjvYlmidPn/3TmPeOT/AtnArGrXGHhHfsk=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=iMLOeDcDKQt/KovrcXge7lyONWGDZtrrKe8OhSfTsiKYZfVIreYLmFyagwI+Avaen
	 iT902gPd2naVNBNGvoubQr1jgZSP7UMGXX/53Qu6RMyWYHdloNzhLcaak0GdBDKbBy
	 FepHxYsyfRA2AX0onfeioNvLjk5opTzAkc3A6ZmAfBcS/YVJtyOZOHob4se/MW51qY
	 4IOEsn8KmZTD30QxhG7mo5POiFO0Wq87UPji7+asIxrV8bYBuXY6ioOVLhHLP+d2EQ
	 Yi/FlDU34ZnhJtiCbgVOIHhnvsvwBP97cDksbGqGtnTyU0bQhv7ON8ZkuG791iiOmk
	 LRJiUP/0aod+Q==
Mime-Version: 1.0
Date: Mon, 21 Sep 2026 09:55:37 +0200
Message-Id: <DLKU0CTP0OES.30VZXJXDXRLNW@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: reduce stack usage in
 spi_nor_parse_sfdp()
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "HyeongJun An" <sammiee5311@gmail.com>, "David Laight"
 <david.laight.linux@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Arnd Bergmann" <arnd@kernel.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260915194203.3511147-1-arnd@kernel.org>
In-Reply-To: <20260915194203.3511147-1-arnd@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============0025729036035028403=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0025729036035028403==
Content-Type: multipart/signed;
 boundary=1aed385ab4518a4194b06517c29d2c1374cbe228d53923bd1e1fbea7ceb4;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--1aed385ab4518a4194b06517c29d2c1374cbe228d53923bd1e1fbea7ceb4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Arnd,

On Tue Sep 15, 2026 at 9:40 PM CEST, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Two large spi_nor_flash_parameter structures on a function stack
> is really too much, and this can exceed an otherwise reasonable
> frame limit:
>
> drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
> drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is=
 larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]
>
> Change one of them to a dynamic allocation to make this more reasonable.

Thanks for taking care of that. Will you respin the patch with what
David suggested?

-michael

> Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the =
sfdp module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

--1aed385ab4518a4194b06517c29d2c1374cbe228d53923bd1e1fbea7ceb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCarDi+RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jwuAGA0b/VhzOESTZ2vh3trXzFHjqSLW5pH5+Y
VQ0va4Qlb/t7SLJSLj4L94nvicDp23+tAX90yIlisEQ7rkxbZrPWImsffW7C5f2y
31CJmVtVYIPMPQcgG/p3rxpa6KYiOzuAQr4=
=4JD/
-----END PGP SIGNATURE-----

--1aed385ab4518a4194b06517c29d2c1374cbe228d53923bd1e1fbea7ceb4--


--===============0025729036035028403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0025729036035028403==--

