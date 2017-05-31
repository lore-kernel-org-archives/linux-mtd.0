Received: from 14.mo7.mail-out.ovh.net ([178.33.251.19])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGBRs-0007bB-8R
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 21:46:38 +0000
Received: from player762.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id B4657578EE
 for <linux-mtd@lists.infradead.org>; Wed, 31 May 2017 23:46:08 +0200 (CEST)
Subject: Re: [PATCH v6 10/15] nand: spi: add basic blocks for infrastructure
To: Peter Pan <peterpandong@micron.com>, boris.brezillon@free-electrons.com,
 richard@nod.at, computersforpeace@gmail.com, arnaud.mouiche@gmail.com,
 thomas.petazzoni@free-electrons.com, marex@denx.de,
 linux-mtd@lists.infradead.org
Cc: peterpansjtu@gmail.com, linshunquan1@hisilicon.com
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-11-git-send-email-peterpandong@micron.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <4f9fa40c-c2b6-005b-42e3-0cea0b8ee347@wedev4u.fr>
Date: Wed, 31 May 2017 23:45:55 +0200
MIME-Version: 1.0
In-Reply-To: <1495609631-18880-11-git-send-email-peterpandong@micron.com>
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

Hi Peter,

Le 24/05/2017 à 09:07, Peter Pan a écrit :
> This is the first commit for spi nand framkework.
> This commit is to add add basic building blocks
> for the SPI NAND infrastructure.
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/Kconfig      |   1 +
>  drivers/mtd/nand/Makefile     |   1 +
>  drivers/mtd/nand/spi/Kconfig  |   5 +
>  drivers/mtd/nand/spi/Makefile |   1 +
>  drivers/mtd/nand/spi/core.c   | 419 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spinand.h   | 267 +++++++++++++++++++++++++++
>  6 files changed, 694 insertions(+)
>  create mode 100644 drivers/mtd/nand/spi/Kconfig
>  create mode 100644 drivers/mtd/nand/spi/Makefile
>  create mode 100644 drivers/mtd/nand/spi/core.c
>  create mode 100644 include/linux/mtd/spinand.h
> 
[...]
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> new file mode 100644
> index 0000000..dd9da71
> --- /dev/null
> +++ b/include/linux/mtd/spinand.h
> @@ -0,0 +1,267 @@
[...]
> +#define SPINAND_MAX_ADDR_LEN	4
> +
> +/**
> + * struct spinand_op - SPI NAND operation description
> + * @cmd: opcode to send
> + * @n_addr: address bytes
> + * @addr_nbits: number of bit used to transfer address
> + * @dummy_types: dummy bytes followed address
> + * @addr: buffer held address
> + * @n_tx: size of tx_buf
> + * @tx_buf: data to be written
> + * @n_rx: size of rx_buf
> + * @rx_buf: data to be read
> + * @data_nbits: number of bit used to transfer data
> + */
> +struct spinand_op {
> +	u8 cmd;
> +	u8 n_addr;
> +	u8 addr_nbits;
> +	u8 dummy_bytes;
> +	u8 addr[SPINAND_MAX_ADDR_LEN];

I think it would be better to use some integral type (maybe loff_t)
rather than an array of u8. Indeed integers are better suited to some
(Q)SPI controllers, especially those using some kind of memory area
mapped into the system bus.

For other SPI controllers, it would still be easy to build an array of
u8 if needed from a loff_t.


> +	u32 n_tx;
> +	const u8 *tx_buf;
> +	u32 n_rx;

just a detail but n_tx and n_rx could be merged into a single n_buf:
- at the spi-nor side, tx_buf and rx_buf can never be both != NULL
- at the spi-nand side, looking at the gen_spi_spinand_exec_op()
  function, this is still true.

> +	u8 *rx_buf;
> +	u8 data_nbits;
> +};

Besides, this structure is really close to
'struct spi_flash_read_message' from include/spi/spi.h.
So I think it would be interesting to rework a little bit the structure
from the SPI sub-system so it can fit your needs and support all kind of
SPI flash commands, not only read commands.
Then this structure could be used by both the spi-nand and spi-nor
sub-systems.

Hence 'struct spi_flash_read_message' could be renamed into 'struct
spi_flash_message', 'struct spi_flash_op' 'struct spi_flash_command' or
whatever... as long as we just remove the "read" part.

In the reworked structure, I propose to add some enum or flags to
provide the SPI controller with the kind of SPI flash command we want it
to execute, actually a SPI flash command type:
- SFLASH_TYPE_READ:  (Fast) Read (spi-nor) / Read From Cache (spi-nand)
- SFLASH_TYPE_WRITE:  Page Program (spi-nor) or Program Load (spi-nand)
- SFLASH_TYPE_ERASE: Sector/Block Erase
- SFLASH_TYPE_READ_REG: Read ID, Read Status, Page Read, ...
- SFLASH_TYPE_WRITE_REG: Write Enable, Write Status, ...

Based on my experience with SPI NOR memories, it's not reliable to guess
the type of the SPI flash command only from its instruction op code:
most of the instruction op codes are pretty standard but *really* often
many SPI flash manufacturers have their own quirks and use different and
unexpected op codes...

So providing the type of SPI flash command would clarify and allow the
(Q)SPI controller driver to tell the spi-nand/spi-nor frameworks whether
this SPI flash command is supported by spi_flash_command_exec() / exec_op().

That's why I suggest to add 2 new optional handlers in 'struct
spi_master' from the SPI sub-system:

bool (*spi_flash_is_command_supported)(struct spi_device *spi,
				       const struct spi_flash_command *)

and

int (*spi_flash_command_exec)(struct spi_device *spi,
			      const struct spi_flash_command *cmd);

For some (Q)SPI controllers, like those from Cadence and TI I guess,
spi_flash_is_command_supported() is likely to return true only for a SPI
flash command type of SFLASH_TYPE_READ.

Other (Q)SPI controllers, like the one from Atmel, would return true for
any command. Indeed, the regular spi_sync() API based on
'struct spi_message' and 'struct spi_transfer' is not suited at all for
the Atmel QSPI controller.

If spi_flash_is_command_supported() returns false or is not implemented
by the SPI controller driver, then you can use a default implementation
based on spi_sync(), actually the one you propose through your
gen_spi_spinand_exec_op() function.

The idea behind that is, in term, to replace the current
flash_read_supported() / spi_flash_read() functions by the more generic
spi_flash_is_command_supported() / spi_flash_command_exec().
We just want to extend the already existing SPI API to support more SPI
flash commands than the only (Fast) Read commands.

Also, if done at the SPI sub-system side, this API could be used by both
the spi-nand and spi-nor sub-systems, then we could imagine moving some
(Q)SPI controller drivers, like drivers/mtd/spi-nor/atmel-quadspi.c,
back into the SPI sub-system, where they should belong.

Currently, the Atmel QSPI driver dwells in the spi-nor sub-system simply
because, as I said, the spi-sync() API is not suited at all for the
hardware register interface. However with the proper SPI API, this
controller could also be used with SPI NAND memories.

Best regards,

Cyrille
