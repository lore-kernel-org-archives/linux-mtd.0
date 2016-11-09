Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4TfB-0004tw-JE
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 14:15:42 +0000
Date: Wed, 9 Nov 2016 16:15:08 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, mkraemer@de.adit-jv.com,
 David Woodhouse <dwmw2@infradead.org>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org, Peter Tyser <ptyser@xes-inc.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v4 1/3] spi-nor: Add support for Intel SPI serial flash
 controller
Message-ID: <20161109141508.GH1447@lahna.fi.intel.com>
References: <20161017145858.143771-1-mika.westerberg@linux.intel.com>
 <20161017145858.143771-2-mika.westerberg@linux.intel.com>
 <36b27635-8163-f3cb-5953-88f102e22ee4@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36b27635-8163-f3cb-5953-88f102e22ee4@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 09, 2016 at 02:51:20PM +0100, Cyrille Pitchen wrote:
> > +/* Reads max 64 bytes from the device fifo */
> > +static int intel_spi_read_block(struct intel_spi *ispi, void *buf, size_t size)
> > +{
> > +	size_t bytes;
> > +	int i = 0;
> > +
> > +	if (size > 64)
> 
> This is not a blocking point but just a recommendation: you should define
> and use a macro for this 64 byte FIFO size instead of using this hardcoded
> 64 value here and in intel_spi_write_block(), intel_spi_write(),
> intel_spi_read().

Good point. I'll change that to use a macro.

> > +		return -EINVAL;
> > +
> > +	while (size > 0) {
> > +		bytes = min_t(size_t, size, 4);
> > +		memcpy_fromio(buf, ispi->base + FDATA(i++), bytes);
> Here again another general recommendation: be careful about using
> operators like ++ on macro parameters. In the case of this FDATA() macro
> it will work as expected but unwanted side effect might occur depending on
> the actual macro definition:
> 
> int i = 1;
> 
> #define DOUBLE(n)	((n) + (n))
> DOUBLE(i++); /* here i is incremented twice, not just once. */

Indeed, even though with the current macro it does not happen I'm going
change it to update i separately like:

	memcpy_fromio(buf, ispi->base + FDATA(i), bytes);
	i++

> > +		size -= bytes;
> > +		buf += bytes;
> > +	}
> > +
> > +	return 0;
> > +}

[snip]

> > +static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
> > +			      u_char *read_buf)
> > +{
> > +	struct intel_spi *ispi = nor->priv;
> > +	size_t block_size, retlen = 0;
> > +	u32 val, status;
> > +	ssize_t ret;
> > +
> 
> As I understand some Intel SPI controllers can only use op codes in a fixed
> instruction set, so here you should check the nor->read_opcode.
> Indeed when the support of SFDP tables will be integrated, the
> nor->read_opcode might change between calls of the nor->read() handler.

OK, I did not know that it can change.

> spi_nor_read_sfdp() make use of this nor->read() handler but set
> nor->read_opcode to SPINOR_OP_RDSFDP (5Ah) before calling the handler.
> 
> Then, if intel_spi_read() is called with an unsupported nor->read_opcode,
> it should fail returning -EINVAL. The spi-nor framework will handle this
> failure correctly.
> 
> You can find the SFDP patch here:
> http://patchwork.ozlabs.org/patch/685984/

Thanks for the pointer. I'll update the driver to take read_opcode into
account in intel_spi_read().

Thanks for the comments.
