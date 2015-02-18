Date: Wed, 18 Feb 2015 15:01:43 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v4 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
Message-ID: <20150218140143.GQ25269@lukather>
References: <1424255528-1717-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424255528-1717-2-git-send-email-maxime.ripard@free-electrons.com>
 <54E49632.1000001@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Vsi50HYs5tPfr+1I"
Content-Disposition: inline
In-Reply-To: <54E49632.1000001@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
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


--Vsi50HYs5tPfr+1I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2015 at 10:40:02AM -0300, Ezequiel Garcia wrote:
> On 02/18/2015 07:32 AM, Maxime Ripard wrote:
> > The NDDB register holds the data that are needed by the read and write
> > commands.
> >=20
> > However, during a read PIO access, the datasheet specifies that after e=
ach 32
> > bytes read in that register, when BCH is enabled, we have to make sure =
that the
> > RDDREQ bit is set in the NDSR register.
> >=20
> > This fixes an issue that was seen on the Armada 385, and presumably oth=
er mvebu
> > SoCs, when a read on a newly erased page would end up in the driver rep=
orting a
> > timeout from the NAND.
> >=20
> > Cc: <stable@vger.kernel.org> # v3.14
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/mtd/nand/pxa3xx_nand.c | 48 ++++++++++++++++++++++++++++++++++=
++------
> >  1 file changed, 42 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_n=
and.c
> > index 96b0b1d27df1..bc677362bc73 100644
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -480,6 +480,42 @@ static void disable_int(struct pxa3xx_nand_info *i=
nfo, uint32_t int_mask)
> >  	nand_writel(info, NDCR, ndcr | int_mask);
> >  }
> > =20
> > +static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int =
len)
> > +{
> > +	if (info->ecc_bch) {
> > +		int timeout;
> > +
> > +		/*
> > +		 * According to the datasheet, when reading from NDDB
> > +		 * with BCH enabled, after each 32 bytes reads, we
> > +		 * have to make sure that the NDSR.RDDREQ bit is set.
> > +		 *
> > +		 * Drain the FIFO 8 32 bits reads at a time, and skip
> > +		 * the polling on the last read.
> > +		 */
> > +		while (len > 8) {
> > +			__raw_readsl(info->mmio_base + NDDB, data, 8);
> > +
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
>=20
> This is probably a stupid nit.. but here it goes is it any
> difference if udelay is used here?
>=20
> Does this makes anything better/worse?

It doesn't make any difference. On the board I've been using, we never
hit the delay.

So I really don't care about the number of retries and the sleep
behind them. I made these numbers up, feel free to come up with others
if it makes you more comfortable, but could we settle this?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Vsi50HYs5tPfr+1I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU5JtHAAoJEBx+YmzsjxAgDbMP/jR7IutOJlW6HXRvrwl9CEDY
BGZofSLZlDEuBkP1rBTxqglYyM9b42pFSJ1fWnRcVCUqLmq+3L3EeTspJ/b+ETxm
FO8gnqbUkCQg44xR8bW9H55mpYgSFVQy16UtFzW8LlGhgZRUmlax47ysvTg7p7ei
ZloSnWHZ7iGN4J7CWoImEgNqWoZuGBt/5tNfzCq88pjcW0ZF+k8fBQ5YRiyJUHEL
3rmY54TAr3TD2ETtubQ9x45u9RKXFy/PW4UBBM3lmQ+1hJDcRuLCy6KCfxryhb+V
1sVnLGvAQzF/TFCXe5ZvR3FSpJKjVLd+nbVqvScybNKgunpa1Lfkrt/uwjt3bFQG
4k8E5fZv+iaLWihmNaKoTGs+UAo3c7kRYCWLeop6MmvpYP8D5vhCBii2W3dOkWUQ
s8vDV2R5MPX41bQOai7PEzRpJbbRLjwTfRMy8V2e0QNCvW7z+ZCM0k3d75C63HG5
PitcZUcyKcwS4/ODJyQqoVDGBEKtnPoBZeJShblHJ7VcTlHILqVEmFbnvytdVMqB
FnxCem+fMQp0/A4nb5K5Op7sBLmvxp/7tbQS5z4dOgc9DXZlemu3J6iMMUrJDkf/
lxpEO/M/ztXiiXBPnN4401RUyjm5YbuMT4Cdu1Ksa1mLjK3O5nl6RPSQCB9UBBSm
CDvdTy31GLRYV2h82Vx8
=I1K9
-----END PGP SIGNATURE-----

--Vsi50HYs5tPfr+1I--
