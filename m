Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bn6I6-0002A8-GV
 for linux-mtd@lists.infradead.org; Thu, 22 Sep 2016 15:52:03 +0000
Subject: Re: [PATCH 1/6] mtd: spi-nor: Add quad page program support
To: Jagan Teki <jteki@openedev.com>, <linux-mtd@lists.infradead.org>
References: <1470775225-19787-1-git-send-email-jteki@openedev.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, <linux-kernel@vger.kernel.org>
Message-ID: <0c154a78-3f09-42d1-be6c-7ca6df6bba91@atmel.com>
Date: Thu, 22 Sep 2016 17:51:39 +0200
MIME-Version: 1.0
In-Reply-To: <1470775225-19787-1-git-send-email-jteki@openedev.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jagan,

The support of Quad Page Program is already addressed by the series for
SPI x-2-2 and x-4-4 protocols and SFDP parsing:
http://lists.infradead.org/pipermail/linux-mtd/2016-June/068212.html

especially patch 5 and 9
http://lists.infradead.org/pipermail/linux-mtd/2016-June/068217.html
http://lists.infradead.org/pipermail/linux-mtd/2016-June/068220.html

Since then, I've tested the series with a small bug fix in
spi_nor_init_params() for the SPI_NOR_NO_FR case:

	/* (Fast) Read settings. */
-	params->rd_modes = SNOR_MODE_1_1_1;
-	spi_nor_set_read_settings(&params->reads[SNOR_PINDEX_1_1_1],
-			  0, 8, SPINOR_OP_READ_FAST);
-	if (!(info->flags & SPI_NOR_NO_FR)) {
-		params->rd_modes |= SNOR_MODE_SLOW;
-		spi_nor_set_read_settings(&params->reads[SNOR_PINDEX_SLOW],
-					  0, 0, SPINOR_OP_READ);
-	}
+	params->rd_modes = SNOR_MODE_SLOW;
+	spi_nor_set_read_settings(&params->reads[SNOR_PINDEX_SLOW],
+				  0, 0, SPINOR_OP_READ);
+	if (!(info->flags & SPI_NOR_NO_FR)) {
+		params->rd_modes |= SNOR_MODE_1_1_1;
+		spi_nor_set_read_settings(&params->reads[SNOR_PINDEX_1_1_1],
+					  0, 8, SPINOR_OP_READ_FAST);
+	}

I've tested it with more memory samples (Micron, Spansion, Macronix, SST)
and it seems reliable so I should send a new version soon.

Best regards,

Cyrille

Le 09/08/2016 à 22:40, Jagan Teki a écrit :
> Add quad page program support with the use of nor->flags
> and then controller will use 4 lines for data transmission
> which is quite faster than page program(02h)
> 
> Cc: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Jagan Teki <jteki@openedev.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 13 +++++++++++++
>  include/linux/mtd/spi-nor.h   |  2 ++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d0fc165..f88bd7e 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -75,6 +75,7 @@ struct flash_info {
>  					 * bit. Must be used with
>  					 * SPI_NOR_HAS_LOCK.
>  					 */
> +#define SPI_NOR_QUAD_WRITE	BIT(10)	/* Flash supports Quad Write */
>  };
>  
>  #define JEDEC_MFR(info)	((info)->id[0])
> @@ -1306,6 +1307,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  	struct device *dev = nor->dev;
>  	struct mtd_info *mtd = &nor->mtd;
>  	struct device_node *np = spi_nor_get_flash_node(nor);
> +	bool need_quad = false;
>  	int ret;
>  	int i;
>  
> @@ -1441,6 +1443,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  			return ret;
>  		}
>  		nor->flash_read = SPI_NOR_QUAD;
> +		need_quad = true;
>  	} else if (mode == SPI_NOR_DUAL && info->flags & SPI_NOR_DUAL_READ) {
>  		nor->flash_read = SPI_NOR_DUAL;
>  	}
> @@ -1465,6 +1468,16 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  	}
>  
>  	nor->program_opcode = SPINOR_OP_PP;
> +	if (nor->flags == SNOR_F_USE_QPP && info->flags & SPI_NOR_QUAD_WRITE) {
> +		if (!need_quad)
> +			ret = set_quad_mode(nor, info);
> +			if (ret) {
> +				dev_err(dev, "quad mode not supported\n");
> +				return ret;
> +			}
> +		}
> +		nor->program_opcode = SPINOR_OP_QPP;
> +	}
>  
>  	if (info->addr_width)
>  		nor->addr_width = info->addr_width;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index c425c7b..aa0e6cd 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -46,6 +46,7 @@
>  #define SPINOR_OP_READ_1_1_2	0x3b	/* Read data bytes (Dual SPI) */
>  #define SPINOR_OP_READ_1_1_4	0x6b	/* Read data bytes (Quad SPI) */
>  #define SPINOR_OP_PP		0x02	/* Page program (up to 256 bytes) */
> +#define SPINOR_OP_QPP		0x32	/* Quad Page program */
>  #define SPINOR_OP_BE_4K		0x20	/* Erase 4KiB block */
>  #define SPINOR_OP_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips */
>  #define SPINOR_OP_BE_32K	0x52	/* Erase 32KiB block */
> @@ -119,6 +120,7 @@ enum spi_nor_ops {
>  enum spi_nor_option_flags {
>  	SNOR_F_USE_FSR		= BIT(0),
>  	SNOR_F_HAS_SR_TB	= BIT(1),
> +	SNOR_F_USE_QPP		= BIT(2),
>  };
>  
>  /**
> 
