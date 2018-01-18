Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ec4R0-0001rQ-1x
 for linux-mtd@lists.infradead.org; Thu, 18 Jan 2018 07:16:28 +0000
Date: Thu, 18 Jan 2018 08:16:10 +0100
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@free-electrons.com>, kernel@pengutronix.de, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH 6/8] mtd: nand: mxc: Add own write_page
Message-ID: <20180118081610.32937f54@xps13>
In-Reply-To: <20180117104009.geal4fs6eykqai3a@pengutronix.de>
References: <20180109101148.13728-1-s.hauer@pengutronix.de>
 <20180109101148.13728-7-s.hauer@pengutronix.de>
 <20180113172551.5dab8a7c@xps13>
 <20180117104009.geal4fs6eykqai3a@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sascha,

On Wed, 17 Jan 2018 11:40:09 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Hi Miquel,
>=20
> On Sat, Jan 13, 2018 at 05:25:51PM +0100, Miquel Raynal wrote:
> > Hi Sascha,
> >=20
> > On Tue,  9 Jan 2018 11:11:46 +0100
> > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >  =20
> > > Now that we have our own read_page function add a write_page
> > > function for consistency aswell. This can be a lot easier than
> > > the generic function since we do not have to iterate over
> > > subpages but can write the whole page at once. Also add
> > > write_page_raw and write_oob for proper raw and oob write support.
> > >=20
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > ---
> > >  drivers/mtd/nand/mxc_nand.c | 56
> > > +++++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 56
> > > insertions(+)
> > >=20
> > > diff --git a/drivers/mtd/nand/mxc_nand.c
> > > b/drivers/mtd/nand/mxc_nand.c index 83bb01ab7079..6fbf98851a96
> > > 100644 --- a/drivers/mtd/nand/mxc_nand.c
> > > +++ b/drivers/mtd/nand/mxc_nand.c
> > > @@ -893,6 +893,59 @@ static int mxc_nand_read_oob(struct mtd_info
> > > *mtd, struct nand_chip *chip, page);
> > >  }
> > > =20
> > > +static int __mxc_nand_write_page(struct mtd_info *mtd, struct
> > > nand_chip *chip,
> > > +				 const uint8_t *buf, int
> > > oob_required, int page) +{
> > > +	struct mxc_nand_host *host =3D
> > > nand_get_controller_data(chip); +
> > > +	host->devtype_data->send_cmd(host, NAND_CMD_SEQIN,
> > > false);
> > > +	mxc_do_addr_cycle(mtd, 0, page);
> > > +
> > > +	memcpy32_toio(host->main_area0, buf, mtd->writesize);
> > > +	copy_spare(mtd, false, chip->oob_poi); =20
> >=20
> > If I remember correctly, there was a "spare only" mechanism to avoid
> > doing full page read/write when unnecessary. What about using it
> > here when (buf =3D=3D NULL && oob_required)? =20
>=20
> You are probably referring to the SP_EN bit in the NAND_FLASH_CONFIG1
> register right? This is described as:
>=20
> > NAND Flash spare enable. This bit determines whether host
> > reads/writes are to NAND Flash spare data only or NAND Flash main
> > and spare data. This feature is supported only with memories with
> > 1/2K page size. Note: There is no ECC in this mode of operation.
> > 0 NAND Flash main and spare data is enabled
> > 1 NAND Flash spare only data is enabled =20
>=20
> At least the i.MX25 has the limitation of 1/2k page size for this
> feature. It's not in the i.MX27 manual. I don't know if the i.MX27
> documentation is inaccurate or if this limitation is there already.

Ok, I ignored this limitation on i.MX25. Better write generic code
then.

>=20
> Anyway, I don't think it's worth optimizing for this case given that
> we still need to support a full page write for 2k pages (which should
> be much more widespread nowadays than the 512b page size NANDs).

Sure!

Thanks,
Miqu=C3=A8l
