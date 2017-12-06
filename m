Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMXPW-0004wb-FG
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 10:58:44 +0000
Subject: Re: [RFC 09/10] mtd: spi-nor: Disable hybrid mode for SPANSION
 S25FS-S family
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 Rajat Srivastava <rajat.srivastava@nxp.com>, dedekind1@gmail.com
References: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <1512548141-3319-10-git-send-email-prabhakar.kushwaha@nxp.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <c764fd31-29c4-865c-656f-23c758af0640@wedev4u.fr>
Date: Wed, 6 Dec 2017 11:58:18 +0100
MIME-Version: 1.0
In-Reply-To: <1512548141-3319-10-git-send-email-prabhakar.kushwaha@nxp.com>
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
> The S25FS-S family physical sectors may be configured as a hybrid
> combination of eight 4-kB parameter sectors at the top or bottom
> of the address space with all but one of the remaining sectors
> being uniform size.
> The default status of the flash is the hybrid architecture.
> The parameter sectors and the uniform sectors have different erase
> commands.
> 
> This patch disables the hybrid sector architecture which makes the
> flash have uniform sector size and uniform erase command.
>

This issue should be addressed in a generic way, not Spansion specific,
by adding support of the optional Sector Map Parameter Table (SFDP).
In case of non uniform memories, like this Spansion S25FS-S family or
SST26, the Sector Map Parameter Table becomes mandatory as a SFDP table.

>From the JESD216B specification, about the JEDEC Sector Map Parameter Table:
"""
This table is required when a memory device:
* Has sectors of more than one size
* Or, does not allow all Erase Type commands to be applied to all sectors.
"""

Best regards,

Cyrille
 
> Signed-off-by: Rajat Srivastava <rajat.srivastava@nxp.com>
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 49 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h   |  1 +
>  2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 58c37f6f..ca2ae44 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1692,6 +1692,33 @@ static int spansion_dummy_config(struct spi_nor *nor, u8 num_wait_states,
>  	return 0;
>  }
>  
> +static int spansion_s25fs_disable_hybrid_mode(struct spi_nor *nor)
> +{
> +	u8 cr3v = 0x0;
> +	int ret = 0x0;
> +
> +	ret = nor->read_anyreg(nor, SPINOR_OP_RDAR, SPANSION_CR3V_OFF,
> +			       &cr3v, 1);
> +	if (ret < 0) {
> +		dev_err(nor->dev, "error %d reading CR3V\n", ret);
> +		return ret;
> +	}
> +
> +	/* CR3V bit3: 4-KB Erase */
> +	if (cr3v & SPANSION_CR3V_4KB_ERASE_DISABLE)
> +		return 0;
> +
> +	cr3v |= SPANSION_CR3V_4KB_ERASE_DISABLE;
> +	ret = nor->write_anyreg(nor, SPINOR_OP_RDAR, SPANSION_CR3V_OFF,
> +				&cr3v, 1);
> +	if (ret < 0) {
> +		dev_err(nor->dev, "error %d writing CR3V\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int spi_nor_check(struct spi_nor *nor)
>  {
>  	if (!nor->dev || !nor->read || !nor->write ||
> @@ -2939,6 +2966,28 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  			return ret;
>  	}
>  
> +	/*
> +	 * The S25FS-S family physical sectors may be configured as a
> +	 * hybrid combination of eight 4-kB parameter sectors
> +	 * at the top or bottom of the address space with all
> +	 * but one of the remaining sectors being uniform size.
> +	 * The Parameter Sector Erase commands (20h or 21h) must
> +	 * be used to erase the 4-kB parameter sectors individually.
> +	 * The Sector (uniform sector) Erase commands (D8h or DCh)
> +	 * must be used to erase any of the remaining
> +	 * sectors, including the portion of highest or lowest address
> +	 * sector that is not overlaid by the parameter sectors.
> +	 * The uniform sector erase command has no effect on parameter sectors.
> +	 * The following code removes the 4-kB parameter sectors from the
> +	 * address map i.e. it disables the hybrid mode so that all sectors are
> +	 * uniform size.
> +	 */
> +	if (JEDEC_EXT_ID(info) == SPINOR_S25FS_FAMILY_ID) {
> +		ret = spansion_s25fs_disable_hybrid_mode(nor);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
>  			(long long)mtd->size >> 10);
>  
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 9ff96cb..6c34e00 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -115,6 +115,7 @@
>  #define SPANSION_CR1V_OFF	0x00800002 /* CR1V offset */
>  #define SPANSION_CR2V_OFF	0x00800003 /* CR2V offset */
>  #define SPANSION_CR3V_OFF	0x00800004 /* CR3V offset */
> +#define SPANSION_CR3V_4KB_ERASE_DISABLE	0x8
>  
>  
>  /* Used for Micron flashes only. */
> 
