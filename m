Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB369C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Feb 2022 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MC7pjhAIeaeWAcFzXVQG8IuCGWW/47b9ABRckrmOog=; b=xrqzVBqQsQWOF2rp/d+BXNYX7k
	IoRZdrv+R+R6fdPql43fwqG93fkCU7uNHrCXYplQ1QOjqDE3ZACTl5tmBK3wOUbLv1Efmc7+k+lYx
	Am+jLusrJs3hTDxwCB8KNzNqDiFBTsRYVh4c/XicB7Bc3gNa+xM0tMuZIaRYRreYQXwoI+KyKEGDA
	hsEXFbnUvZswwOFvoOWgtjm9RFKtPeHtUH7ycA8raKrGsU9ES6LAcEiu3kme0mnLrFl+GUFArw9o/
	cYfftW8gX/RKAWXUPO6rKf/gXgYIpagrqovom2xNsFEcozMnr/ajHW94s/DbbmxQKs6MY4h1HnzQJ
	VxfC38Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKNAr-007hwD-MG; Wed, 16 Feb 2022 16:29:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKNAo-007hub-K3
 for linux-mtd@lists.infradead.org; Wed, 16 Feb 2022 16:29:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97FBCB81F56;
 Wed, 16 Feb 2022 16:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02126C004E1;
 Wed, 16 Feb 2022 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645028935;
 bh=7aw8KHoi72vmlWzUJUruEe6Fj6OtL4yDvPz9349QW2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PFSOH+IPOh18cLuHmUQlTinUAX+n/J/95/BSCh7FRREZLeHzQr2A8h6qAcVSySR43
 4zfjley5EOy+qTRB/0tCiD/Dbe5H//EtJQwsrB9BN/00pK7QJz/X6xKnl65EYgSfdo
 iJd4XuJ/IaW6481lTUVq8fsoFCcatTKqhk16fXyNYr8wMY0qlNV4Bb5kwTrgv/jH4F
 UxR3j6+fKdY3vVyXVN1HJLX4f2/i3Nx9tQBVU9iDlO30y1a6NG+UNRDIlqNoqlkI6c
 EAEBXK7p8ODOPhunYsD05AhG567E90BETftf1e+9IzGDJZAdqMy+Zx7lWguhjTaqOy
 a1xZaPnXbBnbg==
Date: Wed, 16 Feb 2022 16:28:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Tudor.Ambarus@microchip.com
Cc: mika.westerberg@linux.intel.com, lee.jones@linaro.org, p.yadav@ti.com,
 andriy.shevchenko@linux.intel.com, linux-mtd@lists.infradead.org,
 michael@walle.cc, mauro.lima@eclypsium.com,
 hans-gert.dahmen@immu.ne, boris.brezillon@collabora.com,
 miquel.raynal@bootlin.com, richard@nod.at,
 linux-spi@vger.kernel.org, vigneshr@ti.com,
 alexander.sverdlin@nokia.com, corbet@lwn.net
Subject: Re: [PATCH v6 0/3] mtd: spi-nor / spi / MFD: Convert intel-spi to
 SPI MEM
Message-ID: <Yg0mQF+oqmZlFi20@sirena.org.uk>
References: <20220209122706.42439-1-mika.westerberg@linux.intel.com>
 <164492969770.14011.5135767095761454169.b4-ty@kernel.org>
 <ec42e96a-0240-9cb8-2f27-746fbbeef56f@microchip.com>
MIME-Version: 1.0
In-Reply-To: <ec42e96a-0240-9cb8-2f27-746fbbeef56f@microchip.com>
X-Cookie: Fremen add life to spice!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_082858_845428_6A2B9864 
X-CRM114-Status: GOOD (  12.64  )
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
Content-Type: multipart/mixed; boundary="===============3369732123057265147=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3369732123057265147==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="in6RCF0ZULD1Vaij"
Content-Disposition: inline


--in6RCF0ZULD1Vaij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 15, 2022 at 01:46:13PM +0000, Tudor.Ambarus@microchip.com wrote:

> Have you synced with Lee Jones? I remember he asked for an immutable branch
> when the patch set will be applied. There's no need to sync with MTD.

I think I sent out a pull request?  Or perhaps I didn't if you
explicitly said you didn't want one.  I don't remember at this point.

--in6RCF0ZULD1Vaij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmINJkAACgkQJNaLcl1U
h9C/5Qf7B1f8A7MLmxH6RyENE59QGI8i9Bhv9F+aG0T19lqQJLEvXWirod6mlW7f
YU9lfvwc+ibzEAjK7uY7a+qgGHxRKxor9YqKIk9JuRoU6ZDdtQd785qx3U+Bpg4Y
SElhfmfoB4KIrT8VyJCoHO/bqMMNh3LZnFWNuzuNg23Ct74fY9WuPGLv7e5FXVgu
M0vaGvRxqGb7MTHJ9Fx/eJbV0TfbWEN61vB0ScTlgw31DQEKviDEkXnq36ddE0jS
akZIZ5l6RdCO//6Gp8RnfLxLHmAkww/DcHChL07Fb9TjFlsSIsv0J1egJdJTceO9
GxL2qjPZiXepUV1BFR6xsywWOt5U1Q==
=qpNT
-----END PGP SIGNATURE-----

--in6RCF0ZULD1Vaij--


--===============3369732123057265147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3369732123057265147==--

