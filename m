Date: Tue, 28 Apr 2015 15:30:12 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: pxa3xx: Switch FIFO draining to
 jiffies-based timeout
Message-ID: <20150428133012.GF10950@lukather>
References: <1428413565-27644-1-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="E7i4zwmWs5DOuDSH"
Content-Disposition: inline
In-Reply-To: <1428413565-27644-1-git-send-email-maxime.ripard@free-electrons.com>
Cc: Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Baruch Siach <baruch@tkos.co.il>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--E7i4zwmWs5DOuDSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Brian,

On Tue, Apr 07, 2015 at 03:32:45PM +0200, Maxime Ripard wrote:
> Now that the driver handles the FIFO draining in a threaded interrupt, we=
 can
> base our timeout on jiffies and sleeping, instead of using mdelay.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Ping?

You were the one that asked for this patch in the first place, so I
was kind of expecting you would merge it :)

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--E7i4zwmWs5DOuDSH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVP4tkAAoJEBx+YmzsjxAgVqEP/ihYQeQK649GN7dgNHbCt9Ep
zcbSNm1B4e1bnhNbYRjDso2IhYs0Rq5vHVaYP4PQI6pIbz2Aw/Exvo9bBOR2IOhN
M/EyQbXOGf9SjI54XeWs/XKqdR+5LB7VUBegINghUL82iRKUCVf0BKTxhU+htGN+
l9whUNwgDG/4y2kLwSklmyKa0W2SwxHhkhTvZf9NttKGOHJHQchW3lzugWrD5b6U
9JnSRyqWK/SX1gaooLhnH6wzx1NtdQhjJgPMwAmCUFaK0Asmp6KbhF5121PKIPoM
lN21bs/nYi5dUhCRQ0sUp2SOGdGDTMtqk0b9ssBak1N/7+T1gzf74hWQtJ3qtODc
wleksQUTDorq5LSCVPnybkv6Fc7JegHfmJvneZRztea7SLO9RFCrYXZvL3N15ylJ
DHi27w3K4/iWDgGfJysB/B/IzCWi1S+4FGiiaxN3GGfsQOjugdD0UOyI4DCSFX0E
LFvGYJV3hBwTf99e8HBT0ur35FOgXtWOaYSDLNvcPzqyZwdEPW1rpzPjYdSWt/5O
eWlDP8481OvIVBErM1izpLONyRzaV9Q0iFc39MBQvbU8VDLhe0/zIJU6jO7Vsq1Z
WJagZiaTUiQGfhtSxk+FWORwW12DU/YCKVLLkut9pMVr+1+RtvhyC2hZhu2E2IGL
1TY683t80psfxTXHWnc3
=li3J
-----END PGP SIGNATURE-----

--E7i4zwmWs5DOuDSH--
