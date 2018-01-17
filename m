Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebl8o-000136-7a
 for linux-mtd@lists.infradead.org; Wed, 17 Jan 2018 10:40:25 +0000
Date: Wed, 17 Jan 2018 11:40:09 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 kernel@pengutronix.de, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 6/8] mtd: nand: mxc: Add own write_page
Message-ID: <20180117104009.geal4fs6eykqai3a@pengutronix.de>
References: <20180109101148.13728-1-s.hauer@pengutronix.de>
 <20180109101148.13728-7-s.hauer@pengutronix.de>
 <20180113172551.5dab8a7c@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180113172551.5dab8a7c@xps13>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

On Sat, Jan 13, 2018 at 05:25:51PM +0100, Miquel Raynal wrote:
> Hi Sascha,
> 
> On Tue,  9 Jan 2018 11:11:46 +0100
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> > Now that we have our own read_page function add a write_page function
> > for consistency aswell. This can be a lot easier than the generic
> > function since we do not have to iterate over subpages but can write
> > the whole page at once. Also add write_page_raw and write_oob for
> > proper raw and oob write support.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  drivers/mtd/nand/mxc_nand.c | 56
> > +++++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 56
> > insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> > index 83bb01ab7079..6fbf98851a96 100644
> > --- a/drivers/mtd/nand/mxc_nand.c
> > +++ b/drivers/mtd/nand/mxc_nand.c
> > @@ -893,6 +893,59 @@ static int mxc_nand_read_oob(struct mtd_info
> > *mtd, struct nand_chip *chip, page);
> >  }
> >  
> > +static int __mxc_nand_write_page(struct mtd_info *mtd, struct
> > nand_chip *chip,
> > +				 const uint8_t *buf, int
> > oob_required, int page) +{
> > +	struct mxc_nand_host *host = nand_get_controller_data(chip);
> > +
> > +	host->devtype_data->send_cmd(host, NAND_CMD_SEQIN, false);
> > +	mxc_do_addr_cycle(mtd, 0, page);
> > +
> > +	memcpy32_toio(host->main_area0, buf, mtd->writesize);
> > +	copy_spare(mtd, false, chip->oob_poi);
> 
> If I remember correctly, there was a "spare only" mechanism to avoid
> doing full page read/write when unnecessary. What about using it here
> when (buf == NULL && oob_required)?

You are probably referring to the SP_EN bit in the NAND_FLASH_CONFIG1
register right? This is described as:

> NAND Flash spare enable. This bit determines whether host reads/writes
> are to NAND Flash spare data only or NAND Flash main and spare data.
> This feature is supported only with memories with 1/2K page size.
> Note: There is no ECC in this mode of operation.
> 0 NAND Flash main and spare data is enabled
> 1 NAND Flash spare only data is enabled

At least the i.MX25 has the limitation of 1/2k page size for this
feature. It's not in the i.MX27 manual. I don't know if the i.MX27
documentation is inaccurate or if this limitation is there already.

Anyway, I don't think it's worth optimizing for this case given that
we still need to support a full page write for 2k pages (which should
be much more widespread nowadays than the 512b page size NANDs).

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
