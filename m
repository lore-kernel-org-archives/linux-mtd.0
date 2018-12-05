Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUSFV-0001NA-PU
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2018 08:09:40 +0000
Date: Wed, 5 Dec 2018 09:09:26 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: Avoid forward declaration of
 internal functions
Message-ID: <20181205090926.7326eaff@bbrezillon>
In-Reply-To: <8ef2fdbf-35cd-bbe5-5fcf-d890546328da@microchip.com>
References: <20181129141026.24892-1-boris.brezillon@bootlin.com>
 <20181129141026.24892-3-boris.brezillon@bootlin.com>
 <8ef2fdbf-35cd-bbe5-5fcf-d890546328da@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 4 Dec 2018 19:09:04 +0000
<Tudor.Ambarus@microchip.com> wrote:

> Hi, Boris,
> 
> On 11/29/2018 04:10 PM, Boris Brezillon wrote:
> > Reorganize the code to kill forward declarations of spi_nor_match_id()
> > macronix_quad_enable() and spi_nor_hwcaps_read2cmd().
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> > Changes in v2:
> > - None
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 202 +++++++++++++++++-----------------
> >  1 file changed, 98 insertions(+), 104 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 0aa1b1035b4b..e1eaabf98d08 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -96,8 +96,6 @@ struct flash_info {
> >  
> >  #define JEDEC_MFR(info)	((info)->id[0])
> >  
> > -static const struct flash_info *spi_nor_match_id(const char *name);
> > -
> >  /*
> >   * Read the status register, returning its value in the location
> >   * Return the status register value.
> > @@ -1202,7 +1200,42 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> >  	return ret;
> >  }
> >  
> > -static int macronix_quad_enable(struct spi_nor *nor);
> > +/**
> > + * macronix_quad_enable() - set QE bit in Status Register.
> > + * @nor:	pointer to a 'struct spi_nor'
> > + *
> > + * Set the Quad Enable (QE) bit in the Status Register.
> > + *
> > + * bit 6 of the Status Register is the QE bit for Macronix like QSPI memories.
> > + *
> > + * Return: 0 on success, -errno otherwise.
> > + */
> > +static int macronix_quad_enable(struct spi_nor *nor)
> > +{
> > +	int ret, val;
> > +
> > +	val = read_sr(nor);
> > +	if (val < 0)
> > +		return val;
> > +	if (val & SR_QUAD_EN_MX)
> > +		return 0;
> > +
> > +	write_enable(nor);
> > +
> > +	write_sr(nor, val | SR_QUAD_EN_MX);
> > +
> > +	ret = spi_nor_wait_till_ready(nor);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = read_sr(nor);
> > +	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
> > +		dev_err(nor->dev, "Macronix Quad bit not set\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}  
> 
> The *_quad_enable() functions are now spread in the file. Would it make sense to
> move all the *_quad_enable() functions, to keep them together?

Yep, will do.

> 
> >  
> >  /* Used when the "_ext_id" is two bytes at most */
> >  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
> > @@ -1778,43 +1811,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
> >  	return ret;
> >  }
> >  
> > -/**
> > - * macronix_quad_enable() - set QE bit in Status Register.
> > - * @nor:	pointer to a 'struct spi_nor'
> > - *
> > - * Set the Quad Enable (QE) bit in the Status Register.
> > - *
> > - * bit 6 of the Status Register is the QE bit for Macronix like QSPI memories.
> > - *
> > - * Return: 0 on success, -errno otherwise.
> > - */
> > -static int macronix_quad_enable(struct spi_nor *nor)
> > -{
> > -	int ret, val;
> > -
> > -	val = read_sr(nor);
> > -	if (val < 0)
> > -		return val;
> > -	if (val & SR_QUAD_EN_MX)
> > -		return 0;
> > -
> > -	write_enable(nor);
> > -
> > -	write_sr(nor, val | SR_QUAD_EN_MX);
> > -
> > -	ret = spi_nor_wait_till_ready(nor);
> > -	if (ret)
> > -		return ret;
> > -
> > -	ret = read_sr(nor);
> > -	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
> > -		dev_err(nor->dev, "Macronix Quad bit not set\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> >  /*
> >   * Write status Register and configuration register with 2 bytes
> >   * The first byte will be written to the status register, while the
> > @@ -2479,7 +2475,56 @@ static const struct sfdp_bfpt_erase sfdp_bfpt_erases[] = {
> >  	{BFPT_DWORD(9), 16},
> >  };
> >  
> > -static int spi_nor_hwcaps_read2cmd(u32 hwcaps);
> > +static int spi_nor_hwcaps2cmd(u32 hwcaps, const int table[][2], size_t size)
> > +{
> > +	size_t i;
> > +
> > +	for (i = 0; i < size; i++)
> > +		if (table[i][0] == (int)hwcaps)
> > +			return table[i][1];
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static int spi_nor_hwcaps_read2cmd(u32 hwcaps)
> > +{
> > +	static const int hwcaps_read2cmd[][2] = {
> > +		{ SNOR_HWCAPS_READ,		SNOR_CMD_READ },
> > +		{ SNOR_HWCAPS_READ_FAST,	SNOR_CMD_READ_FAST },
> > +		{ SNOR_HWCAPS_READ_1_1_1_DTR,	SNOR_CMD_READ_1_1_1_DTR },
> > +		{ SNOR_HWCAPS_READ_1_1_2,	SNOR_CMD_READ_1_1_2 },
> > +		{ SNOR_HWCAPS_READ_1_2_2,	SNOR_CMD_READ_1_2_2 },
> > +		{ SNOR_HWCAPS_READ_2_2_2,	SNOR_CMD_READ_2_2_2 },
> > +		{ SNOR_HWCAPS_READ_1_2_2_DTR,	SNOR_CMD_READ_1_2_2_DTR },
> > +		{ SNOR_HWCAPS_READ_1_1_4,	SNOR_CMD_READ_1_1_4 },
> > +		{ SNOR_HWCAPS_READ_1_4_4,	SNOR_CMD_READ_1_4_4 },
> > +		{ SNOR_HWCAPS_READ_4_4_4,	SNOR_CMD_READ_4_4_4 },
> > +		{ SNOR_HWCAPS_READ_1_4_4_DTR,	SNOR_CMD_READ_1_4_4_DTR },
> > +		{ SNOR_HWCAPS_READ_1_1_8,	SNOR_CMD_READ_1_1_8 },
> > +		{ SNOR_HWCAPS_READ_1_8_8,	SNOR_CMD_READ_1_8_8 },
> > +		{ SNOR_HWCAPS_READ_8_8_8,	SNOR_CMD_READ_8_8_8 },
> > +		{ SNOR_HWCAPS_READ_1_8_8_DTR,	SNOR_CMD_READ_1_8_8_DTR },
> > +	};
> > +
> > +	return spi_nor_hwcaps2cmd(hwcaps, hwcaps_read2cmd,
> > +				  ARRAY_SIZE(hwcaps_read2cmd));
> > +}
> > +
> > +static int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
> > +{
> > +	static const int hwcaps_pp2cmd[][2] = {
> > +		{ SNOR_HWCAPS_PP,		SNOR_CMD_PP },
> > +		{ SNOR_HWCAPS_PP_1_1_4,		SNOR_CMD_PP_1_1_4 },
> > +		{ SNOR_HWCAPS_PP_1_4_4,		SNOR_CMD_PP_1_4_4 },
> > +		{ SNOR_HWCAPS_PP_4_4_4,		SNOR_CMD_PP_4_4_4 },
> > +		{ SNOR_HWCAPS_PP_1_1_8,		SNOR_CMD_PP_1_1_8 },
> > +		{ SNOR_HWCAPS_PP_1_8_8,		SNOR_CMD_PP_1_8_8 },
> > +		{ SNOR_HWCAPS_PP_8_8_8,		SNOR_CMD_PP_8_8_8 },
> > +	};
> > +
> > +	return spi_nor_hwcaps2cmd(hwcaps, hwcaps_pp2cmd,
> > +				  ARRAY_SIZE(hwcaps_pp2cmd));
> > +}  
> 
> Would it be a better place to put these immediately after
> spi_nor_set_pp_settings()? It would be consistent with how they were declared
> back in cfc5604c488ccd17936b69008af0c9ae050f4a08.

I thought it would be preferable to have the xx2cmd[] conversion tables
grouped together, but I can move this one next to
spi_nor_set_pp_settings() if you prefer.
