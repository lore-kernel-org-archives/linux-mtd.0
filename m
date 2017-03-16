Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1coS8R-0001Tl-1u
 for linux-mtd@lists.infradead.org; Thu, 16 Mar 2017 09:55:56 +0000
Date: Thu, 16 Mar 2017 10:55:33 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v3 3/8] nand: spi: add basic blocks for infrastructure
Message-ID: <20170316105533.343e183a@bbrezillon>
In-Reply-To: <1489646857-10112-4-git-send-email-peterpandong@micron.com>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-4-git-send-email-peterpandong@micron.com>
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

On Thu, 16 Mar 2017 14:47:32 +0800
Peter Pan <peterpandong@micron.com> wrote:

> +
> +#define SPINAND_CAP_RD_X1 BIT(0)
> +#define SPINAND_CAP_RD_X2 BIT(1)
> +#define SPINAND_CAP_RD_X4 BIT(2)
> +#define SPINAND_CAP_RD_DUAL BIT(3)
> +#define SPINAND_CAP_RD_QUAD BIT(4)
> +#define SPINAND_CAP_WR_X1 BIT(5)
> +#define SPINAND_CAP_WR_X2 BIT(6)
> +#define SPINAND_CAP_WR_X4 BIT(7)
> +#define SPINAND_CAP_WR_DUAL BIT(8)
> +#define SPINAND_CAP_WR_QUAD BIT(9)
> +#define SPINAND_CAP_HW_ECC BIT(10)

Empty line please.

> +struct spinand_controller {
> +	struct spinand_controller_ops *ops;
> +	u32 caps;
> +	void *priv;

Nope, the ->priv field is a per-device private data, so it should be
placed in struct spinand_device (see below), otherwise, if you have the
same controller connected to 2 different chips, each time you call
spinand_set_controller_data() you will overwrite the ->priv value.

Each spinand_controller should then inherit from struct
spinand_controller:

struct my_spinand_controller {
	struct spinand_controller base;

	/* put your SPI NAND controller specific fields here. */
};

> +};
> +
> +/**
> + * struct spinand_device - SPI-NAND Private Flash Chip Data
> + * @base: NAND device instance
> + * @lock: protection lock
> + * @name: name of the chip
> + * @id: ID structure
> + * @read_cache_op: Opcode of read from cache
> + * @write_cache_op: Opcode of program load
> + * @buf: buffer for read/write data
> + * @oobbuf: buffer for read/write oob
> + * @rw_mode: read/write mode of SPI NAND chip
> + * @controller: SPI NAND controller instance
> + * @manufacturer: SPI NAND manufacturer instance, describe
> + *                manufacturer related objects
> + * @ecc_engine: SPI NAND ECC engine instance
> + */
> +struct spinand_device {
> +	struct nand_device base;
> +	struct mutex lock;
> +	char *name;
> +	struct spinand_id id;
> +	u8 read_cache_op;
> +	u8 write_cache_op;
> +	u8 *buf;
> +	u8 *oobbuf;
> +	u32 rw_mode;
> +	struct spinand_controller *controller;

	struct {
		struct spinand_controller *controller;
		void *priv;
	} controller;

> +	struct {
> +		const struct spinand_manufacturer *manu;
> +		void *priv;
> +	} manufacturer;
> +	struct {
> +		struct spinand_ecc_engine *engine;
> +		void *context;
> +	} ecc;
> +};
