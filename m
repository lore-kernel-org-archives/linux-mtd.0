Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eR2MC-0007rH-6a
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 20:49:55 +0000
Date: Mon, 18 Dec 2017 21:49:35 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, kernel@pengutronix.de
Subject: Re: [PATCH 2/3] mtd: nand: mxc: Add own write_page
Message-ID: <20171218204935.cmacd6bsvhl7y277@pengutronix.de>
References: <20171215085504.32296-1-s.hauer@pengutronix.de>
 <20171215085504.32296-3-s.hauer@pengutronix.de>
 <20171218180308.17eb3a28@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171218180308.17eb3a28@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 18, 2017 at 06:03:08PM +0100, Boris Brezillon wrote:
> On Fri, 15 Dec 2017 09:55:03 +0100
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> > Now that we have our own read_page function add a write_page function
> > for consistency aswell. This can be a lot easier than the generic
> > function since we do not have to iterate over subpages but can write
> > the whole page at once.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  drivers/mtd/nand/mxc_nand.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> > index 65d5cde4692b..a54804f14bb1 100644
> > --- a/drivers/mtd/nand/mxc_nand.c
> > +++ b/drivers/mtd/nand/mxc_nand.c
> > @@ -142,6 +142,8 @@ struct mxc_nand_devtype_data {
> >  	void (*preset)(struct mtd_info *);
> >  	int (*read_page)(struct mtd_info *mtd, struct nand_chip *chip,
> >  			uint8_t *buf, int oob_required, int page);
> > +	int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
> > +			  const uint8_t *buf, int oob_required, int page);
> >  	void (*send_cmd)(struct mxc_nand_host *, uint16_t, int);
> >  	void (*send_addr)(struct mxc_nand_host *, uint16_t, int);
> >  	void (*send_page)(struct mtd_info *, unsigned int);
> > @@ -658,6 +660,17 @@ static int mxc_nand_read_page_hwecc_v2_v3(struct mtd_info *mtd,
> >  	return max_bitflips;
> >  }
> >  
> > +static int mxc_nand_write_page_hwecc_v2_v3(struct mtd_info *mtd,
> > +					   struct nand_chip *chip,
> > +					   const uint8_t *buf, int oob_required,
> > +					   int page)
> > +{
> > +	chip->write_buf(mtd, buf, mtd->writesize);
> > +	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
> > +
> > +	return 0;
> > +}
> > +
> >  static int mxc_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
> >  				  u_char *ecc_code)
> >  {
> > @@ -1456,6 +1469,7 @@ static const struct mxc_nand_devtype_data imx27_nand_devtype_data = {
> >  static const struct mxc_nand_devtype_data imx25_nand_devtype_data = {
> >  	.preset = preset_v2,
> >  	.read_page = mxc_nand_read_page_hwecc_v2_v3,
> > +	.write_page = mxc_nand_write_page_hwecc_v2_v3,
> >  	.send_cmd = send_cmd_v1_v2,
> >  	.send_addr = send_addr_v1_v2,
> >  	.send_page = send_page_v2,
> > @@ -1482,6 +1496,7 @@ static const struct mxc_nand_devtype_data imx25_nand_devtype_data = {
> >  static const struct mxc_nand_devtype_data imx51_nand_devtype_data = {
> >  	.preset = preset_v3,
> >  	.read_page = mxc_nand_read_page_hwecc_v2_v3,
> > +	.write_page = mxc_nand_write_page_hwecc_v2_v3,
> >  	.send_cmd = send_cmd_v3,
> >  	.send_addr = send_addr_v3,
> >  	.send_page = send_page_v3,
> > @@ -1508,6 +1523,7 @@ static const struct mxc_nand_devtype_data imx51_nand_devtype_data = {
> >  static const struct mxc_nand_devtype_data imx53_nand_devtype_data = {
> >  	.preset = preset_v3,
> >  	.read_page = mxc_nand_read_page_hwecc_v2_v3,
> > +	.write_page = mxc_nand_write_page_hwecc_v2_v3,
> >  	.send_cmd = send_cmd_v3,
> >  	.send_addr = send_addr_v3,
> >  	.send_page = send_page_v3,
> > @@ -1766,6 +1782,7 @@ static int mxcnd_probe(struct platform_device *pdev)
> >  	switch (this->ecc.mode) {
> >  	case NAND_ECC_HW:
> >  		this->ecc.read_page = host->devtype_data->read_page;
> > +		this->ecc.write_page = host->devtype_data->write_page;
> >  		this->ecc.calculate = mxc_nand_calculate_ecc;
> 
> I'm pretty sure you don't need this dummy calculate method now that you
> provide your own ->write/read_page() implementations.

True for the v2/v3 type controllers, but not for v1 which I haven't
changed in this series.

Will update the series next year.

Thanks
  Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
