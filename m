Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti4bP-00045H-TT
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 14:45:04 +0000
Message-ID: <1355150764.2657.35.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: mxc_nand: fix unbalanced clk_disable() in
 error path
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Lothar =?ISO-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Date: Mon, 10 Dec 2012 16:46:04 +0200
In-Reply-To: <1354779748-28869-1-git-send-email-LW@KARO-electronics.de>
References: <1354779748-28869-1-git-send-email-LW@KARO-electronics.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-hLZUFHVxbzo6TI9v/LuP"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-hLZUFHVxbzo6TI9v/LuP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-12-06 at 08:42 +0100, Lothar Wa=C3=9Fmann wrote:
> If nand_scan_ident() or nand_scan_tail() fails, the NAND chip may have
> been deselected and the clock already disabled. Thus, check 'clk_act'
> in the error path to decide whether the clock still needs to be
> disabled.
>=20
> This fixes a:
> |WARNING: at drivers/clk/clk.c:472 __clk_disable+0x3c/0x78()

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-hLZUFHVxbzo6TI9v/LuP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQxfWsAAoJECmIfjd9wqK0pHIP/RKLDmWRuyH3K/tbvCJfEU6Q
ad8J+BOPzFEAR3mBuaMPwRYy+EUghDVUxaWHYW9/5TlOQM7m2kCun9P1UWZLJArs
mShDiLKPfJWWytcIj02SFBBA2iLJz5HrZHrr5RmAs48D4fQatb7VeY3Wae7CZgNN
GrLY6rs/Bwpcxaejtf7kYjhPcRU5EcVQ/6e5sruAyB++wUrguNQaYGCIuC69qgNk
2fBePfYisZ4KxqJ4PrWBCKVohHbNJfEwL/oAjsj39lqSAp0uJ4IydrqhbIZyQ0aL
qlFPhHME6DeLrh2p42zgAaA5cEAlBQdVur4gePhIyTgpVpSeB/Skp7mAucilGZbk
1+GVgrynqu/uK0+9hOuLFOPoC3yjuZEyiCburOcfELae4165PM4/Id3M1GpjGogD
30PpM8fGkjIO7/e/AgeEy1gP+lEyu7S0MZyPkKYQCuNge8qpBeKFRgq8c/V02QcF
jmJ50NZRW1Lb41xYHJrmp3VEtyof3pgjuw10wloGbfWDb9BuOhIK3Cy2CtNvB2pV
jHWsEoUaufOEpr2IlAw1RlTll9OYlt3e93UxjLgpJeBkLcRT7JyLzaMGEV29C7FE
Gn0rOw6E2IkuMYpQvkIoXbm+R1M00MC2P69Ark+OdNKJ17UZn3sSMbproS6N9ZyY
4rMI+vh5RlcuphWqGvFu
=9spq
-----END PGP SIGNATURE-----

--=-hLZUFHVxbzo6TI9v/LuP--
