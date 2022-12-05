Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41196C4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 08:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLgjCvYFaV16hSzNkoWLM5fQGFGXqI18G7QoWnC8K1g=; b=QI+thczf9rO+oQKA3n9OZNtx6S
	zmWxQ+YOpXejr4AaCHooHyj3VNa9s+4cr0JN2rzr+FXUR6TmngiaQ9l+pMQxp61NaquqfRfbd9D/q
	GFnL4nwQOgLGD9zcgeUSJbrSNLIrgFR3hGWtCxvc5pRsZTgtu/mayMRMEJRKcX/GPSUGsBS4sSA6r
	vHQV3WEiFtzKAgROFQR4k2aJ85Fw3IuL4uMazpqu2ojKUsXo2iIq4fU3p7yCYCFxKYAakgAY7T/Od
	JkS4h6EnIC7T8K1BTwzPrLTYsyDzQHEjUwH5LSBa/yKbcF90j+twbHcsIlIbBDdmHl9GLC3pKTvya
	pjyKrpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27HN-00GgcJ-Ut; Mon, 05 Dec 2022 08:56:49 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27HJ-00GgYZ-FY
	for linux-mtd@lists.infradead.org; Mon, 05 Dec 2022 08:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=k1; bh=K7LkyI3EyZtAporb19ChbmQpds4O
	ChSNzIOkIRouAdM=; b=gmo3iwVfGineystUR+8I7+fJPbd1BFQVff/L03zkTjqv
	rY8Qn3/XjmRIuQGwgw0KEbGni7ctVfKgwZ/mf6PaZ0KPygxI6ttt0xbqA2BxH5Nv
	VmuDr3NYgMkq8rJPkPiU6j7T5rcDGoQJwm/WuuRqrV6TPFwcy0CFZJc7Zr74a2Y=
Received: (qmail 2245272 invoked from network); 5 Dec 2022 09:56:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Dec 2022 09:56:37 +0100
X-UD-Smtp-Session: l3s3148p1@0ulr3RDvRIRehhrO
Date: Mon, 5 Dec 2022 09:56:36 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/6] memory: renesas-rpc-if: Rebind fixes and misc
 cleanups
Message-ID: <Y42yRFSai6XKnLiC@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
References: <cover.1669213027.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <cover.1669213027.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_005646_608687_D59A6AAC 
X-CRM114-Status: GOOD (  15.03  )
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
Content-Type: multipart/mixed; boundary="===============8214707132106328584=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8214707132106328584==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3141AOsAMOMu/lh9"
Content-Disposition: inline


--3141AOsAMOMu/lh9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 03:41:16PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,
>=20
> The Renesas RPC-IF provides either HyperFlash or SPI host access.
> To handle this, three drivers are used:
>   1. The RPC-IF core diver,
>   2. An HyperFlash child driver,
>   3. An SPI child driver.
>=20
> Currently this driver collection suffers from a sub-optimal division of
> roles and reponsibilities, leading to (un)bind issues: after manually
> unbinding the child driver, rebinding the child driver fails with
> -EBUSY.
>=20
> This patch series aims to fix this, by splitting off private data and
> making the RPC-IF core driver responsible for resource acquisition.
> After that, a few customary cleanups are provided.
>=20
> This has been tested on the Salvator-X(S) and Ebisu-4D (HyperFlash) and
> White-Hawk (QSPI FLASH) development boards.

Sadly, I don't have the bandwidth to do a full review. But from a
glimpse, it all looks good. And from a high level PoV, this all makes a
lot of sense. So:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--3141AOsAMOMu/lh9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmONskQACgkQFA3kzBSg
KbYZCQ/+J9lcmKr9+8n+KR8ECOOyla6PiySP7OhFib9ryO+tOUhFcBwRrNJaDj0J
Q58ZuHzdo9mDoHct3MZaDuurFDKydb0VtUh/KBfrygvI4iSPK8KKELc3NXMyjBuY
fdHISN3kPD8dZ4kER+g6NuQ/9xFI2QRfFSFYQm4BsztJgenHkqeVbgERs8j5zBZF
I49AiK7zYq1bwRSOHV7T2ZVzUB1wpzDIHJNOBdZiXyeVejkB3stHfRvASlksFF6g
VTTPsBLQ79mZV6o/+FiFYotY+wv34mqkBykBd6wxxcUqjusgW3ty33iyALUHySEK
P2UrNBxUcNW9NHBh5FDhXaF8Wo9tHjYbdtZuRfKkvIqLVEJye7RkJ+wbDdG3QKyd
z7BLyFGL4e0+2L18ClK3DzUV+sJYY1a8jw6aKZNKlrjbdirKwq9ZtIlvo9FtrzHM
7a6jHGH88QpD0nsSBZt5llMqileVG75EiyrY/VsWRZZKYk1kP+qw6boK7y1HZcmu
uKjPqtHVDPXnZAWJh8KkgV9ogYnwaqijxqt9SPlaB7bJoUOA1pXLNeyXZj+UTMHd
hR+xmD/u5Q//rJ+wiO3HXfofl/ql4r2l/p67FRmVnKlFg0k75cYEddOYu2PXxGtU
B64Za2UdTYGdXm0XUPJptoOeajBRo6FlSggm9q+kDCOfeSOw41Q=
=QLgK
-----END PGP SIGNATURE-----

--3141AOsAMOMu/lh9--


--===============8214707132106328584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8214707132106328584==--

