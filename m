Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5uq-00055E-BH
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 08:35:22 +0000
Date: Tue, 21 Feb 2017 09:34:45 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH 02/11] nand: spi: create spi_nand_chip struct
Message-ID: <20170221093445.712ec39d@bbrezillon>
In-Reply-To: <1487664010-25926-3-git-send-email-peterpandong@micron.com>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
 <1487664010-25926-3-git-send-email-peterpandong@micron.com>
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

On Tue, 21 Feb 2017 16:00:01 +0800
Peter Pan <peterpandong@micron.com> wrote:

> Create spi_nand_chip struct and helper functions.
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  include/linux/mtd/spi-nand.h | 67 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/include/linux/mtd/spi-nand.h b/include/linux/mtd/spi-nand.h
> index 68442e08..23b16f0 100644
> --- a/include/linux/mtd/spi-nand.h
> +++ b/include/linux/mtd/spi-nand.h
> @@ -16,6 +16,12 @@
>  #ifndef __LINUX_MTD_SPI_NAND_H
>  #define __LINUX_MTD_SPI_NAND_H
>  
> +#include <linux/wait.h>
> +#include <linux/spinlock.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/flashchip.h>
> +#include <linux/mtd/nand.h>
> +
>  /*
>   * Standard SPI-NAND flash commands
>   */
> @@ -109,4 +115,65 @@
>  #define SPI_NAND_MT29F_ECC_7_8_BIT	0x50
>  #define SPI_NAND_MT29F_ECC_UNCORR	0x20
>  
> +/**
> + * struct spi_nand_chip - SPI-NAND Private Flash Chip Data
> + * @base:		[INTERN] NAND device instance

Drop extra tabs after the field name, and please drop these
[INTERN/BOARDSPECIFIC] specifiers.

> + * @chip_lock:		[INTERN] protection lock
> + * @name:		name of the chip
> + * @wq:			[INTERN] wait queue to sleep on if a SPI-NAND operation
> + *			is in progress used instead of the per chip wait queue
> + *			when a hw controller is available.
> + * @mfr_id:		[BOARDSPECIFIC] manufacture id
> + * @dev_id:		[BOARDSPECIFIC] device id
> + * @state:		[INTERN] the current state of the SPI-NAND device
> + * @read_cache_op:	[REPLACEABLE] Opcode of read from cache
> + * @write_cache_op:	[REPLACEABLE] Opcode of program load
> + * @buf:		[INTERN] buffer for read/write data
> + * @oobbuf:		[INTERN] buffer for read/write oob
> + * @controller_caps:	[INTERN] capacities of SPI NAND controller
> + * @size:		[INTERN] the size of chip
> + * @options:		[BOARDSPECIFIC] various chip options. They can partly
> + *			be set to inform nand_scan about special functionality.
> + * @ecc_strength:	[INTERN] ECC correctability from the datasheet.
> + * @priv:		[BOARDSPECIFIC] pointer to controller data
> + */
> +struct spi_nand_chip {

s/spi_nand_chip/spinand_device/

Let's try to be consistent with the rawnand_device naming scheme. So in
general s/spi_nand/spinand/

> +	struct nand_device	base;

No tabs, just a single space.

> +	spinlock_t	chip_lock;

s/chip_lock/lock/, why do you need a spinlock here? 

> +	char		*name;
> +	wait_queue_head_t wq;
> +	u8		mfr_id;
> +	u8		dev_id;

Can we make it an array of u8 and then have pre-defined indexes like

#define SPINAND_MFR_ID		0
#define SPINAND_DEV_ID		1
...
	
> +	flstate_t	state;
> +	u8		read_cache_op;
> +	u8		write_cache_op;

Hm, so these operations are manufacturer specific.

> +	u8		*buf;
> +	u8		*oobbuf;
> +	u32		controller_caps;

What flags do you plan to put here ^?

> +	u64		size;

Isn't it already defined in nand_device?

> +	u32		options;

Again, what do you plan to put in this field?

> +	u32		ecc_strength;
> +	void		*priv;

Ok, it seems that ->priv is actually used to store controller specific
data. Please rename it or do something like:

	struct {
		void *priv;
	} controller;

It will avoid the kind of confusion we have in the rawnand framework.

Since you also have controller caps, you could do:

	struct {
		u32 caps;
		void *priv;
		/*
		 * whatever is controller specific. probably a pointer
		 * to the SPI controller or something like that.
		 */
	} controller;

> +};
> +
> +static inline struct spi_nand_chip *mtd_to_spi_nand(struct mtd_info *mtd)
> +{
> +	return container_of(mtd_to_nand(mtd), struct spi_nand_chip, base);
> +}
> +
> +static inline struct mtd_info *spi_nand_to_mtd(struct spi_nand_chip *chip)
> +{
> +	return nand_to_mtd(&chip->base);
> +}
> +
> +static inline void *spi_nand_get_controller_data(struct spi_nand_chip *chip)
> +{
> +	return chip->priv;
> +}
> +
> +static inline void spi_nand_set_controller_data(struct spi_nand_chip *chip,
> +						void *priv)
> +{
> +	chip->priv = priv;
> +}
>  #endif /* __LINUX_MTD_SPI_NAND_H */
