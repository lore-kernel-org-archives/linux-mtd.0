Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaouV-0001NE-Gw
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 16:11:35 +0000
Received: by mail-pd0-f175.google.com with SMTP id x10so514490pdj.6
 for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2014 09:10:54 -0700 (PDT)
Date: Fri, 18 Apr 2014 00:05:17 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC PATCH] mtd: spi-nor: add DDR quad read support
Message-ID: <20140417160515.GB14819@localhost.localdomain>
References: <1397641641-11430-1-git-send-email-b32955@freescale.com>
 <201404171624.36700.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201404171624.36700.marex@denx.de>
Cc: angus.clark@st.com, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, sourav.poddar@ti.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 17, 2014 at 04:24:36PM +0200, Marek Vasut wrote:
> On Wednesday, April 16, 2014 at 11:47:21 AM, Huang Shijie wrote:
> [...]
> 
> > @@ -74,6 +74,11 @@ static int read_cr(struct spi_nor *nor)
> >  static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
> >  {
> >  	switch (nor->flash_read) {
> > +	case SPI_NOR_DDR_QUAD:
> > +		/*
> > +		 * We set 8 for the DDR Quad read, the SPI NOR controller
> > +		 * can change it to 6 or 4 with DeviceTree property.
> > +		 */
> 
> Isn't the number of dummy cycles a property of the chip ?
I want to add DT node, such as "ddr_quad_read_dummy".
But I do not know which Document file to put the DT node to. 

the spi-bus.txt ? or the spi-nor.txt? 


> [...]
> 
> > +static int set_ddr_quad_mode(struct spi_nor *nor, u32 jedec_id)
> > +{
> > +	int status;
> > +
> > +	switch (JEDEC_MFR(jedec_id)) {
> > +	default: /* Spansion */
> 
> This should really _check_ the jedec ID here and only enable the quad mode for 
> spansion on spansion flashes. The default case should just return -ENOTSUP or 
> something.
> [...]
ok. change it in next version.


> 
> > @@ -1016,8 +1038,15 @@ int spi_nor_scan(struct spi_nor *nor, const struct
> > spi_device_id *id, if (info->flags & SPI_NOR_NO_FR)
> >  		nor->flash_read = SPI_NOR_NORMAL;
> > 
> > -	/* Quad/Dual-read mode takes precedence over fast/normal */
> > -	if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
> > +	/* DDR Quad/Quad/Dual-read mode takes precedence over fast/normal */
> > +	if (mode == SPI_NOR_DDR_QUAD && info->flags & SPI_NOR_DDR_QUAD_READ) {
> > +		ret = set_ddr_quad_mode(nor, info->jedec_id);
> > +		if (ret) {
> > +			dev_err(dev, "DDR quad mode not supported\n");
> > +			return ret;
> 
> Is it really necessary to fail here? Can we not fall back to some "lower" mode ?
I perfer to fail here.
If we fail to enable the quad read, we also do not fall back to fast
read mode.

thanks
Huang Shijie
