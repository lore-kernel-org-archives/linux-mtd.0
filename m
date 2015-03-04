Date: Wed, 4 Mar 2015 17:18:55 +0100
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Switch FIFO draining to jiffies-based
 timeout
Message-ID: <20150304161855.GN4911@lukather>
References: <1425376529-1860-1-git-send-email-maxime.ripard@free-electrons.com>
 <20150303101846.GO15668@tarshish>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="i6vqABX3nJKXLk01"
Content-Disposition: inline
In-Reply-To: <20150303101846.GO15668@tarshish>
From: maxime.ripard@free-electrons.com
Cc: Boris Brezillon <boris@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--i6vqABX3nJKXLk01
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Baruch,

On Tue, Mar 03, 2015 at 12:18:46PM +0200, Baruch Siach wrote:
> Hi Maxime,
>=20
> On Tue, Mar 03, 2015 at 10:55:29AM +0100, Maxime Ripard wrote:
> > Now that the driver handles the FIFO draining in a threaded interrupt, =
we can
> > base our timeout on jiffies and sleeping, instead of using mdelay.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/mtd/nand/pxa3xx_nand.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_n=
and.c
> > index 3f09f2e9aeb4..1eb957c347cd 100644
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -496,16 +496,15 @@ static void drain_fifo(struct pxa3xx_nand_info *i=
nfo, void *data, int len)
> >  		while (len > 8) {
> >  			__raw_readsl(info->mmio_base + NDDB, data, 8);
> > =20
> > -			for (timeout =3D 0;
> > -			     !(nand_readl(info, NDSR) & NDSR_RDDREQ);
> > -			     timeout++) {
> > -				if (timeout >=3D 5) {
> > +			timeout =3D jiffies + msecs_to_jiffies(5);
> > +			while (!(nand_readl(info, NDSR) & NDSR_RDDREQ)) {
> > +				if (!time_before(jiffies, timeout)) {
> >  					dev_err(&info->pdev->dev,
> >  						"Timeout on RDDREQ while draining the FIFO\n");
> >  					return;
> >  				}
> > =20
> > -				mdelay(1);
> > +				msleep(1);
> >  			}
>=20
> You may want to consider using readl_relaxed_poll_timeout() from=20
> linux/iopoll.h, which was introduced in v4.0-rc1.

Thanks for pointing this out.

I'll send a new version using this.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--i6vqABX3nJKXLk01
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU9zBvAAoJEBx+YmzsjxAgGs0P/A4t7lY38S/l0e8hV51jPy9I
1sWE8vChi/pgGaSthV68wL2Bdbx33S/lE3PqgR4PqfR3UHbaH3h4nGwo4X3po2O6
FVdzU5IskgTsWjiVs6MIlhZzzTcz002vkP/a4XlvL0etTrDXcK/U/K4hKXxyOvxe
RdPo7dXc9k5gi1U8dIo5tZxQWvKugAqWXJn5CMKF2wxz1TRqdV54VZ/knwp3I0fb
wGiXEzhQd/asbVUsOrF5wWMJP5drqzYMCSNGCVfXoM2qfruZ2oDHJmur3e5D6kEL
UNRPMxYXgJrxoi30P2pT57PsgMpLtf4WxZgDzkQTp26V09Y3jM1hB3MY2odsHhsq
n1/hhI7IpFGnvx69YC3ETRdCKhcu+INw/y/g2TI9AeZ+VcdrKZ4wChiTdqdT82Xf
VtHd1hfz54vdxWZz04wP84ZLKqDOU4VMvlQMC0dGtVeRd63wkuR1RRT/GTGAuTjz
d9vk5SwttWJRc02j4l0KIxrWqG8aksLvgXiK7dZjA6B6XqY8UjCj6ujV8cNA5mEp
Qo+3BAzvJouthhgj+SSG7JCUGuQ7gg5qaxpKEmPdJ5NZyGM7SR+X2AlT0hWBlJKd
aBbeQ34Ooorw5n7VQFOQAJEGB/a3VY8MVVsK1uYUuhlS1rePWeYIRicVcZ2RjLG4
+GwZA74k6f3ldeqJfCuI
=8ly7
-----END PGP SIGNATURE-----

--i6vqABX3nJKXLk01--
