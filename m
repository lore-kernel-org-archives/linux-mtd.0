Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKklE-0006v6-9p
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 10:08:24 +0000
Date: Thu, 30 Jul 2015 12:07:26 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH] nand: sunxi: fix write to USER_DATA reg
Message-ID: <20150730100726.GH2564@lukather>
References: <1438250466-18396-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="+/c+wG9PuVDVAlsu"
Content-Disposition: inline
In-Reply-To: <1438250466-18396-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--+/c+wG9PuVDVAlsu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 12:01:06PM +0200, Boris Brezillon wrote:
> The USER_DATA register cannot be accessed using byte accessors on A13
> SoCs, thus triggering a bug when using memcpy_toio on this register.
> Declare a temporary u32 variable to store the USER_DATA value and access
> the register with writel.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--+/c+wG9PuVDVAlsu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVufdeAAoJEBx+YmzsjxAgvaYP/0vfcUvRXGz+096b4IrxxGbT
+dN3SjtoA0JC5+ekw5A52jXsobdDPdGieB5L2m4/eRzUTQtnCHav8WYsiUvGmjSE
dwyIDW7u7sir0j+O+GZLCXR52vm4nSC+dht4tm8WQGj4QQsOBxCB944WzmkHDh+S
/LTxmF7jK+6glapV+E9NO7PrSFma6R0XNdUPnhkYxZZlv4mUcLKn+tLnRjKsLnmx
Ihbk9A2zNQePlE1tuPBkanhw0KSvnO+gYNOsayJJOfLHWwsgDarDysUdpOQxdhib
hRxaBE/nlIr3anISnHPJVSy0SsQ4mFcLK9Enp+AusaqJiaAzt3WcYCfStn9Q58/G
DmxcRGkWJQwcez9uFDsmPblEFPouZc9hgF3hQL0y4FiZ+w6brzyYYRe8YdyeoSN/
KbefkkoSOZPPEhaimAUsNb+MngJ61FuvGod4QURhUSGETqG8hH1ncz7OQzP4EYJb
GjMDpUg7G3C9pJKvw425dA0f5iP2qy9RAt95aG6dQdrMobpjT6cJvni7+bnJRgOw
edlKbf8gacWCcyibpUlavtF4VU/X4BadAkQv5qeHBwNOU+d7gPly6i8SvCUcs8s5
WKZVjASyo3idYWXGAZB5i0MDL1QqSsVnvG0u5b5jM0iWQKEsEXJzcW3LHjxMKPJf
YvnXkL328H5nG/GSfuK1
=3XCu
-----END PGP SIGNATURE-----

--+/c+wG9PuVDVAlsu--
