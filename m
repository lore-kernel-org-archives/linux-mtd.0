Date: Mon, 16 Feb 2015 21:58:25 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v3 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
Message-ID: <20150216205825.GG25269@lukather>
References: <1424091072-7738-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424091072-7738-2-git-send-email-maxime.ripard@free-electrons.com>
 <87oaotaa6r.fsf@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="KR/qxknboQ7+Tpez"
Content-Disposition: inline
In-Reply-To: <87oaotaa6r.fsf@free.fr>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--KR/qxknboQ7+Tpez
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Robert,

On Mon, Feb 16, 2015 at 09:11:24PM +0100, Robert Jarzmik wrote:
> Maxime Ripard <maxime.ripard@free-electrons.com> writes:
>=20
> >  drivers/mtd/nand/pxa3xx_nand.c | 47 ++++++++++++++++++++++++++++++++++=
++------
> >  1 file changed, 41 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_n=
and.c
> > index 96b0b1d27df1..b2d8d6960765 100644
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -480,6 +480,41 @@ static void disable_int(struct pxa3xx_nand_info *i=
nfo, uint32_t int_mask)
> >  	nand_writel(info, NDCR, ndcr | int_mask);
> >  }
> > =20
> > +static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int =
len)
> > +{
> > +	if (info->ecc_bch) {
> > +		int index =3D 0;
> > +
> > +		while (index < (len * 4)) {
> > +			u32 timeout;
> > +
> > +			__raw_readsl(info->mmio_base + NDDB, data + index, 8);
> > +
> > +			/*
> > +			 * According to the datasheet, when reading
> > +			 * from NDDB with BCH enabled, after each 32
> > +			 * bytes reads, we have to make sure that the
> > +			 * NDSR.RDDREQ bit is set
> > +			 */
> > +			for (timeout =3D 0;
> > +			     !(nand_readl(info, NDSR) & NDSR_RDDREQ);
> > +			     timeout++) {
> > +				if (timeout >=3D 5) {
> > +					dev_err(&info->pdev->dev,
> > +						"Timeout on RDDREQ while draining the FIFO\n");
> > +					return;
> > +				}
> > +
> > +				mdelay(1);
> So in worst case, we'll end up with 4 times mdelay(1) times len / 32.
> For a 2048 page, it is : 256ms where everything is stuck (mdelay and not
> msleep).
>=20
> I know you had no choice because this is called from interrupt handler (t=
op
> half). But having a irq handler and a irq thread handler would solve that=
 issue,
> and you'll end up with msleep(1) in this code.
>=20
> I don't think an mdelay(256) is acceptable.

That's very true that this driver would need some love, but
valentine's day was last week.

I'm sorry, but this is a patch targeted for stable. This is a pure
bugfix. I won't rewrite the whole driver solely to make the driver
better, especially since that would make such a patch (or more likely
a whole serie) unsuitable for stable.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--KR/qxknboQ7+Tpez
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU4lnxAAoJEBx+YmzsjxAgWUcQAJXa24RCvCqI2anMK+YSRGAb
ki6UbL8kJwNc5giKpRFicKzacA46Ri8SfGDa1AU3tZ+P57F4AlxM/PtgLp3ggBC8
IRC5qx4ngepSmPoOWgI2O3v6KXII54Hx7Hde+rpck9o9CBthdXxJCKADupRuy5m/
davf+TBL8V7WLhw+9uM21bYbYhBBhwiEN6igyNCYzVS2S/Qomv8ZynIKGzogu0ik
6YUmA/C9lZU2XW6OrVbT7OIeEnCiD4Y9GP0AIyDhBbLuZ1Ez35LAmZskbt11t++/
QNv+qiWKXEtcCC1JDBqUVvaaKTkHe1cwJmEbFO9+r3+JosYvtOThlpElm6n3HIw6
5pXGxA+19n1xbrbTjcjFWones8QgADSE9F8c3iFYmLnH2BqEgRMMKxRSI3VUVsO2
peOQc0W6clJUh47HmCLXz/fKcwttI1puA5vf5nOXJUCpof6UgyRd1X7ScdjCYNC3
j1AUc18w21Qqzv8CNbjhbRlZ11OkCg9GIRbbxq6rraCHF8aFfRE1e3VsLhtTxAIK
0lYUmoxQ/ZhYqYpD7cwD1GkxhTHSAK//sh3MZcYDdG631pSYAAI7SH1UylchjDUj
DVrkHWDCjYPTC0bMo/D5t33WtINb8niPritEN0ef7jTV1wNOeuXq102aYMbvSw3S
V4dXxzCH3u6q4g1qu6hJ
=NJuV
-----END PGP SIGNATURE-----

--KR/qxknboQ7+Tpez--
