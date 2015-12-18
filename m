Date: Thu, 17 Dec 2015 18:08:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, nicolas.ferre@atmel.com, marex@denx.de,
 vigneshr@ti.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Subject: Re: [PATCH linux-next 1/5] mtd: spi-nor: properly detect the memory
 when it boots in Quad or Dual mode
Message-ID: <20151218020841.GH10460@google.com>
References: <cover.1449494420.git.cyrille.pitchen@atmel.com>
 <813edd1addf9a09b9f01031d3cb279c8cdfe97bb.1449494420.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <813edd1addf9a09b9f01031d3cb279c8cdfe97bb.1449494420.git.cyrille.pitchen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Hit send too early; a few more comments)

On Mon, Dec 07, 2015 at 03:09:10PM +0100, Cyrille Pitchen wrote:
>  drivers/mtd/spi-nor/spi-nor.c | 52 +++++++++++++++++++++++++++++++++++++++----
>  include/linux/mtd/spi-nor.h   | 23 +++++++++++++++++--
>  2 files changed, 69 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 3b2460efc019..bf17736750c1 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -73,6 +73,11 @@ struct flash_info {
>  
>  #define JEDEC_MFR(info)	((info)->id[0])
>  
> +struct read_id_config {
> +	enum read_mode		mode;
> +	enum spi_protocol	proto;
> +};
> +
>  static const struct flash_info *spi_nor_match_id(const char *name);
>  
>  /*
> @@ -867,11 +872,16 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ },
>  };
>  
> -static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
> +static const struct flash_info *spi_nor_read_id(struct spi_nor *nor,
> +						enum read_mode mode)
>  {
> -	int			tmp;
> +	int			i, tmp;
>  	u8			id[SPI_NOR_MAX_ID_LEN];
>  	const struct flash_info	*info;
> +	static const struct read_id_config configs[] = {
> +		{SPI_NOR_QUAD, SPI_PROTO_4_4_4},
> +		{SPI_NOR_DUAL, SPI_PROTO_2_2_2}
> +	};
>  
>  	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, SPI_NOR_MAX_ID_LEN);
>  	if (tmp < 0) {
> @@ -879,6 +889,34 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
>  		return ERR_PTR(tmp);
>  	}
>  
> +	/* Special case for Micron/Macronix qspi nor. */
> +	if ((id[0] == 0xff && id[1] == 0xff && id[2] == 0xff) ||
> +	    (id[0] == 0x00 && id[1] == 0x00 && id[2] == 0x00))

Is this specified anywhere, or is this just a heuristic, to guess
whether we're getting valid IDs? Do we know anything about what opcodes
look like ...

> +		for (i = 0; i < ARRAY_SIZE(configs); ++i) {
> +			if (configs[i].mode != mode)
> +				continue;
> +
> +			/* Set this protocol for all commands. */
> +			nor->reg_proto = configs[i].proto;
> +			nor->read_proto = configs[i].proto;
> +			nor->write_proto = configs[i].proto;
> +			nor->erase_proto = configs[i].proto;
> +
> +			/*
> +			 * Multiple I/O Read ID only returns the Manufacturer ID
> +			 * (1 byte) and the Device ID (2 bytes). So we reset the
> +			 * remaining bytes.
> +			 */

Ugh, does that mean we get different IDs returned via the different
modes? That sounds like a disaster. What about all the flash that we
need 5+ bytes to differentiate? Just be glad we haven't come across any
Micron or Macronix like that yet?

> +			memset(id, 0, sizeof(id));
> +			tmp = nor->read_reg(nor, SPINOR_OP_MIO_RDID, id, 3);

Hmm, so you're passing implicit configuration data via the
nor->reg_proto field. So, spi-nor drivers now have to read that field
during every read_reg() invocation? Seems like either this should be:
 (a) a driver hook/callback, so we can just reconfigure a handful of
 times or
 (b) part of a parameter that gets passed as part of the function
 signature

> +			if (tmp < 0) {
> +				dev_dbg(nor->dev,
> +					"error %d reading JEDEC ID Multi I/O\n",
> +					tmp);
> +				return ERR_PTR(tmp);
> +			}
> +		}
> +
>  	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
>  		info = &spi_nor_ids[tmp];
>  		if (info->id_len) {
[...]

Brian
