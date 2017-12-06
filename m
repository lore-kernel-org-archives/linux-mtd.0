Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMXDe-0007ab-KL
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 10:46:27 +0000
Subject: Re: [RFC 03/10] mtd: spi-nor: Configure read latency for read commands
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dedekind1@gmail.com
References: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <1512548141-3319-4-git-send-email-prabhakar.kushwaha@nxp.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <1f97ee81-a027-c5cf-04a4-cb29bc6a7ba4@wedev4u.fr>
Date: Wed, 6 Dec 2017 11:45:52 +0100
MIME-Version: 1.0
In-Reply-To: <1512548141-3319-4-git-send-email-prabhakar.kushwaha@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Prabhakar,

Le 06/12/2017 à 09:15, Prabhakar Kushwaha a écrit :
> All read commands have read latency (dummy cycle). It defines a
> period between the end of address or mode and the beginning of
> read data returning to the host. Flashes have default read latency.
> This default read latency may not match with the selected latency.
>

The read latency is either hard-coded (0 mode cycles and 8 wait-states)
for Fast Read 1-1-z operations or read from the Basic Flash Parameter
Table programmed as one mandatory table of the JEDEC JESD126B
specification when SFDP tables are supported by the memory parts.

In all cases, those values are factory settings. I don't understand why
there would be a mismatch between the default read latency and the
selected latency if any boot-loader or flash programming tool has ever
changed the memory settings.

Could you please explain in which case you found a mismatch ?

Best regards,

Cyrille
 
> So, selected latency needs to be programmed in flash via
> volatile configuration register. Considering flashes have different
> types of configuration registers/bits depending upon vendor/family.
> 
> This patch provides a way define function pointer per flash vendor
> to configure volatile configuration register. function pointer has
> flash_info parameter to take care of difference within the family of
> a vendor.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 34 +++++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 01898e1..7d94874 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1695,6 +1695,9 @@ struct spi_nor_read_command {
>  	u8			num_wait_states;
>  	u8			opcode;
>  	enum spi_nor_protocol	proto;
> +
> +	int (*dummy_config)(struct spi_nor *nor, u8 num_wait_states,
> +			    const struct flash_info *info);
>  };
>  
>  struct spi_nor_pp_command {
> @@ -1760,12 +1763,19 @@ spi_nor_set_read_settings(struct spi_nor_read_command *read,
>  			  u8 num_mode_clocks,
>  			  u8 num_wait_states,
>  			  u8 opcode,
> -			  enum spi_nor_protocol proto)
> +			  enum spi_nor_protocol proto,
> +			  const struct flash_info *info)
>  {
>  	read->num_mode_clocks = num_mode_clocks;
>  	read->num_wait_states = num_wait_states;
>  	read->opcode = opcode;
>  	read->proto = proto;
> +
> +	switch (JEDEC_MFR(info)) {
> +	default:
> +		read->dummy_config = NULL;
> +		break;
> +	}
>  }
>  
>  static void
> @@ -2385,41 +2395,41 @@ static int spi_nor_init_params(struct spi_nor *nor,
>  	params->hwcaps.mask |= SNOR_HWCAPS_READ;
>  	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
>  				  0, 0, SPINOR_OP_READ,
> -				  SNOR_PROTO_1_1_1);
> +				  SNOR_PROTO_1_1_1, info);
>  
>  	if (!(info->flags & SPI_NOR_NO_FR)) {
>  		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
>  		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
>  					  0, 8, SPINOR_OP_READ_FAST,
> -					  SNOR_PROTO_1_1_1);
> +					  SNOR_PROTO_1_1_1, info);
>  	}
>  
>  	if (info->flags & SPI_NOR_DUAL_READ) {
>  		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
>  		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
>  					  0, 8, SPINOR_OP_READ_1_1_2,
> -					  SNOR_PROTO_1_1_2);
> +					  SNOR_PROTO_1_1_2, info);
>  	}
>  
>  	if (info->flags & SPI_NOR_DUAL_IO_READ) {
>  		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_2_2;
>  		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_2_2],
>  					  0, 8, SPINOR_OP_READ_1_2_2,
> -					  SNOR_PROTO_1_2_2);
> +					  SNOR_PROTO_1_2_2, info);
>  	}
>  
>  	if (info->flags & SPI_NOR_QUAD_READ) {
>  		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
>  		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_4],
>  					  0, 8, SPINOR_OP_READ_1_1_4,
> -					  SNOR_PROTO_1_1_4);
> +					  SNOR_PROTO_1_1_4, info);
>  	}
>  
>  	if (info->flags & SPI_NOR_QUAD_IO_READ) {
>  		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_4_4;
>  		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_4_4],
>  					  0, 10, SPINOR_OP_READ_1_4_4,
> -					  SNOR_PROTO_1_4_4);
> +					  SNOR_PROTO_1_4_4, info);
>  	}
>  
>  
> @@ -2519,7 +2529,8 @@ static int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
>  
>  static int spi_nor_select_read(struct spi_nor *nor,
>  			       const struct spi_nor_flash_parameter *params,
> -			       u32 shared_hwcaps)
> +			       u32 shared_hwcaps,
> +			       const struct flash_info *info)
>  {
>  	int cmd, best_match = ffs(shared_hwcaps & SNOR_HWCAPS_READ_MASK) - 1;
>  	const struct spi_nor_read_command *read;
> @@ -2535,6 +2546,10 @@ static int spi_nor_select_read(struct spi_nor *nor,
>  	nor->read_opcode = read->opcode;
>  	nor->read_proto = read->proto;
>  
> +	if (read->dummy_config &&
> +	    !read->dummy_config(nor, read->num_wait_states, info))
> +		return -EINVAL;
> +
>  	/*
>  	 * In the spi-nor framework, we don't need to make the difference
>  	 * between mode clock cycles and wait state clock cycles.
> @@ -2546,6 +2561,7 @@ static int spi_nor_select_read(struct spi_nor *nor,
>  	 * into the so called dummy clock cycles.
>  	 */
>  	nor->read_dummy = read->num_mode_clocks + read->num_wait_states;
> +
>  	return 0;
>  }
>  
> @@ -2622,7 +2638,7 @@ static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
>  	}
>  
>  	/* Select the (Fast) Read command. */
> -	err = spi_nor_select_read(nor, params, shared_mask);
> +	err = spi_nor_select_read(nor, params, shared_mask, info);
>  	if (err) {
>  		dev_err(nor->dev,
>  			"can't select read settings supported by both the SPI controller and memory.\n");
> 
