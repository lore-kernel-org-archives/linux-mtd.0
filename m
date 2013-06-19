Received: from mailout.micron.com ([137.201.242.129])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UpLSW-0007rJ-7m
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2013 16:42:15 +0000
From: "Mona Anonuevo (manonuevo)" <manonuevo@micron.com>
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Subject: RE: [PATCH] MTD: Micron SPINAND Driver support
Date: Wed, 19 Jun 2013 16:41:46 +0000
Message-ID: <814C696C26B5294C8E153E846D6EF6944688DD12@NTXBOIMBX03.micron.com>
References: <A9FA7AA17969164DBE492D9DACF1594C0258AD25@ntxsjombx02.micron.com>
 <20130619073854.GA14077@kpatel.netlogicmircro.com>
In-Reply-To: <20130619073854.GA14077@kpatel.netlogicmircro.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!
Yes we move it to the staging tree.
Thank you,
Mona Anonuevo

-----Original Message-----
From: Kamlakant Patel [mailto:kamlakant.patel@broadcom.com]=20
Sent: Wednesday, June 19, 2013 12:39 AM
To: Mona Anonuevo (manonuevo)
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: Micron SPINAND Driver support

On Mon, May 24, 2010 at 09:54:00PM -0000, Mona Anonuevo (manonuevo) wrote:
>=20
> This patch adds support for Micron SPINAND via MTD.
>=20
>=20
> Signed-off-by: Mona Anonuevo (manonuevo at micron.com)
> Signed-off-by: Tuan Nguyen (tqnguyen at micron.com)
> ----
>  drivers/mtd/Kconfig               |    2=20
>  drivers/mtd/Makefile              |    2=20
>  drivers/mtd/spinand/Kconfig       |   25 +
>  drivers/mtd/spinand/Makefile      |   10=20
>  drivers/mtd/spinand/spinand_lld.c |  760
> ++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/spinand/spinand_mtd.c |  728
> ++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spinand.h       |  160 ++++++++
>  7 files changed, 1687 insertions(+)
>=20

I do not see this driver in Linux kernel yet. Is there any plan to merge it=
?
We are using this chip on our Netlogic XLP board and we have some updates t=
o
this driver. If you are not planning to merge it to upstream, can we move i=
t
to the staging tree for now?

> PATCH FOLLOWS
> Kernel Version:  Linux 2.6.33.20
> diff -urN linux-2.6.33.20-orig/drivers/mtd/Kconfig
> linux-2.6.33.20/drivers/mtd/Kconfig
> --- linux-2.6.33.20-orig/drivers/mtd/Kconfig	2010-04-01
> 16:02:33.000000000 -0700
> +++ linux-2.6.33.20/drivers/mtd/Kconfig	2010-05-19 04:28:06.000000000
> -0700
> @@ -325,6 +325,8 @@
> =20
>  source "drivers/mtd/onenand/Kconfig"
> =20
> +source "drivers/mtd/spinand/Kconfig"
> +
>  source "drivers/mtd/lpddr/Kconfig"
> =20
>  source "drivers/mtd/ubi/Kconfig"
> diff -urN linux-2.6.33.20-orig/drivers/mtd/Makefile
> linux-2.6.33.20/drivers/mtd/Makefile
> --- linux-2.6.33.20-orig/drivers/mtd/Makefile	2010-04-01
> 16:02:33.000000000 -0700
> +++ linux-2.6.33.20/drivers/mtd/Makefile	2010-05-19
> 04:28:06.000000000 -0700
> @@ -31,4 +31,6 @@
> =20
>  obj-y		+=3D chips/ lpddr/ maps/ devices/ nand/ onenand/ tests/
> =20
> +obj-y		+=3D spinand/=20
> +
>  obj-$(CONFIG_MTD_UBI)		+=3D ubi/
> diff -urN linux-2.6.33.20-orig/drivers/mtd/spinand/Kconfig
> linux-2.6.33.20/drivers/mtd/spinand/Kconfig
> --- linux-2.6.33.20-orig/drivers/mtd/spinand/Kconfig	1969-12-31
> 16:00:00.000000000 -0800
> +++ linux-2.6.33.20/drivers/mtd/spinand/Kconfig	2010-05-19
> 04:28:06.000000000 -0700
> @@ -0,0 +1,25 @@
> +#
> +# linux/drivers/mtd/spinand/Kconfig
> +#
> +
> +menuconfig MTD_SPINAND
> +	tristate "SPINAND Device Support"
> +	depends on MTD
> +	help
> +	  This enables support for accessing Micron SPI NAND flash
> +	  devices.
> +
> +if MTD_SPINAND
> +
> +config MTD_SPINAND_ONDIEECC
> +	bool "Use SPINAND internal ECC"
> +	help
> +	 Internel ECC
> +
> +config MTD_SPINAND_SWECC
> +	bool "Use software ECC"
> +	depends on MTD_NAND
> +	help
> +	 software ECC
> +
> +endif
> diff -urN linux-2.6.33.20-orig/drivers/mtd/spinand/Makefile
> linux-2.6.33.20/drivers/mtd/spinand/Makefile
> --- linux-2.6.33.20-orig/drivers/mtd/spinand/Makefile	1969-12-31
> 16:00:00.000000000 -0800
> +++ linux-2.6.33.20/drivers/mtd/spinand/Makefile	2010-05-19
> 04:28:07.000000000 -0700
> @@ -0,0 +1,10 @@
> +#
> +# Makefile for the SPI NAND MTD
> +#
> +
> +# Core functionality.
> +obj-$(CONFIG_MTD_SPINAND)		+=3D spinand.o
> +
> +spinand-objs :=3D spinand_mtd.o spinand_lld.o
> +
> +
> diff -urN linux-2.6.33.20-orig/drivers/mtd/spinand/spinand_lld.c
> linux-2.6.33.20/drivers/mtd/spinand/spinand_lld.c
> --- linux-2.6.33.20-orig/drivers/mtd/spinand/spinand_lld.c
> 1969-12-31 16:00:00.000000000 -0800
> +++ linux-2.6.33.20/drivers/mtd/spinand/spinand_lld.c	2010-05-19
> 03:56:51.000000000 -0700
> @@ -0,0 +1,760 @@
> +/*
> +spinand_lld.c
> +
> +Copyright (c) 2009-2010 Micron Technology, Inc.
> +
> +This program is free software; you can redistribute it and/or
> +modify it under the terms of the GNU General Public License
> +as published by the Free Software Foundation; either version 2
> +of the License, or (at your option) any later version.
> +
> +This program is distributed in the hope that it will be useful,
> +but WITHOUT ANY WARRANTY; without even the implied warranty of
> +MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +GNU General Public License for more details.
> +
> +*/
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/mutex.h>
> +#include <linux/math64.h>
> +
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/spinand.h>
> +
> +#include <linux/spi/spi.h>
> +
> +#define mu_spi_nand_driver_version
> "Beagle-MTD_01.00_Linux2.6.33_20100507"
> +#define SPI_NAND_MICRON_DRIVER_KEY 0x1233567
> +
> +/**********************************************************************
> ******/
> +
> +/**
> +   OOB area specification layout:  Total 32 available free bytes.
> +*/
> +static struct nand_ecclayout spinand_oob_64 =3D {
> +	.eccbytes =3D 24,
> +	.eccpos =3D {
> +		   1, 2, 3, 4, 5, 6,
> +		   17, 18, 19, 20, 21, 22,
> +		   33, 34, 35, 36, 37, 38,
> +		   49, 50, 51, 52, 53, 54, },
> +	.oobavail =3D 32,
> +	.oobfree =3D {
> +		{.offset =3D 8,
> +		 .length =3D 8},
> +		{.offset =3D 24,
> +		 .length =3D 8},
> +		{.offset =3D 40,
> +		 .length =3D 8},
> +		{.offset =3D 56,
> +		 .length =3D 8}, }
> +};
> +/**
> + * spinand_cmd - to process a command to send to the SPI Nand
> + *=20
> + * Description:
> + *    Set up the command buffer to send to the SPI controller.
> + *    The command buffer has to initized to 0
> + */
> +int spinand_cmd(struct spi_device *spi, struct spinand_cmd *cmd)
> +{
> +	int					ret;
> +	struct spi_message	message;
> +	struct spi_transfer		x[4];
> +	u8 dummy =3D 0xff;
> +
> +
> +	spi_message_init(&message);
> +	memset(x, 0, sizeof x);
> +=09
> +	x[0].len =3D 1;
> +	x[0].tx_buf =3D &cmd->cmd;
> +	spi_message_add_tail(&x[0], &message);
> +=09
> +	if (cmd->n_addr)
> +	{
> +		x[1].len =3D cmd->n_addr;
> +		x[1].tx_buf =3D cmd->addr;
> +		spi_message_add_tail(&x[1], &message);
> +	}
> +
> +	if (cmd->n_dummy)
> +	{
> +		x[2].len =3D cmd->n_dummy;
> +		x[2].tx_buf =3D &dummy;
> +		spi_message_add_tail(&x[2], &message);	=09
> +	}
> +
> +	if (cmd->n_tx)
> +	{
> +		x[3].len =3D cmd->n_tx;
> +		x[3].tx_buf =3D cmd->tx_buf;
> +		spi_message_add_tail(&x[3], &message);	=09
> +	}
> +
> +	if (cmd->n_rx)
> +	{
> +		x[3].len =3D cmd->n_rx;
> +		x[3].rx_buf =3D cmd->rx_buf;
> +		spi_message_add_tail(&x[3], &message);=09
> +	}
> +=09
> +	ret =3D spi_sync(spi, &message);
> +
> +	return ret;=20
> +}
> +
> +/**
> + * spinand_reset- send reset command "0xff" to the Nand device
> + *=20
> + * Description:
> + *    Reset the SPI Nand with the reset command 0xff
> + */
> +static int spinand_reset(struct spi_device *spi_nand)
> +{
> +	struct spinand_cmd cmd =3D {0};
> +
> +	cmd.cmd =3D CMD_RESET;
> +
> +	return spinand_cmd(spi_nand, &cmd);
> +}
> +/**
> + * spinand_read_id- Read SPI Nand ID
> + *=20
> + * Description:
> + *    Read ID: read two ID bytes from the SPI Nand device
> + */
> +static int spinand_read_id(struct spi_device *spi_nand, u8 *id)
> +{
> +	struct spinand_cmd cmd =3D {0};
> +	ssize_t retval;
> +
> +=09
> +	cmd.cmd =3D CMD_READ_ID;
> +	cmd.n_dummy =3D 1;
> +	cmd.n_rx =3D 2;
> +	cmd.rx_buf =3D id;
> +=09
> +	retval =3D spinand_cmd(spi_nand, &cmd);
> +
> +	if (retval !=3D 0) {
> +		dev_err(&spi_nand->dev, "error %d reading id\n",
> +				(int) retval);
> +		return retval;
> +	}
> +=09
> +	return 0;=09
> +}
> +
> +/**
> + * spinand_lock_block- send write register 0x1f command to the Nand
> device
> + *=20
> + * Description:
> + *    After power up, all the Nand blocks are locked.  This function
> allows
> + *    one to unlock the blocks, and so it can be wriiten or erased.
> + */
> +static int spinand_lock_block(struct spi_device *spi_nand, struct
> spinand_info *info, u8 lock)
> +{
> +	struct spinand_cmd cmd =3D {0};
> +	ssize_t retval;
> +=09
> +	cmd.cmd =3D CMD_WRITE_REG;
> +	cmd.n_addr =3D 1;
> +	cmd.addr[0] =3D REG_BLOCK_LOCK;
> +	cmd.n_tx =3D 1;
> +	cmd.tx_buf =3D &lock;
> +=09
> +	retval =3D spinand_cmd(spi_nand, &cmd);
> +
> +	if (retval !=3D 0) {
> +		dev_err(&spi_nand->dev, "error %d lock block\n",
> +				(int) retval);
> +		return retval;
> +	}
> +=09
> +	return 0;=09
> +}
> +
> +/**
> + * spinand_read_status- send command 0xf to the SPI Nand status
> register
> + *=20
> + * Description:
> + *    After read, write, or erase, the Nand device is expected to set
> the busy status.
> + *    This function is to allow reading the status of the command:
> read, write, and erase.
> + *    Once the status turns to be ready, the other status bits also are
> valid status bits.
> + */
> +static int spinand_read_status(struct spi_device *spi_nand, struct
> spinand_info *info, u8 *status)
> +{
> +	struct spinand_cmd cmd =3D {0};
> +	ssize_t retval;
> +=09
> +	cmd.cmd =3D CMD_READ_REG;
> +	cmd.n_addr =3D 1;
> +	cmd.addr[0] =3D REG_STATUS;
> +	cmd.n_rx =3D 1;
> +	cmd.rx_buf =3D status;
> +=09
> +	retval =3D spinand_cmd(spi_nand, &cmd);
> +
> +	if (retval !=3D 0) {
> +		dev_err(&spi_nand->dev, "error %d reading status
> register\n",
> +				(int) retval);
> +		return retval;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * spinand_get_otp- send command 0xf to read the SPI Nand OTP register
> + *=20
> + * Description:
> + *   There is one bit( bit 0x10 ) to set or to clear the internal ECC.
> + *   Enable chip internal ECC, set the bit to 1
> + *   Disable chip internal ECC, clear the bit to 0
> + */
> +static int spinand_get_otp(struct spi_device *spi_nand, struct
> spinand_info *info, u8* otp)
> +{
> +	struct spinand_cmd cmd =3D {0};
> +	ssize_t retval;
> +=09
> +	cmd.cmd =3D CMD_READ_REG;
> +	cmd.n_addr =3D 1;
> +	cmd.addr[0] =3D REG_OTP;
> +	cmd.n_rx =3D 1;
> +	cmd.rx_buf =3D otp;
> +=09
> +	retval =3D spinand_cmd(spi_nand, &cmd);
> +
> +	if (retval !=3D 0) {
> +		dev_err(&spi_nand->dev, "error %d get otp\n",
> +				(int) retval);
> +		return retval;
> +	}
> +=09
> +	return 0;=09
> +}
> +
> +
> +/**
> + * spinand_set_otp- send command 0x1f to write the SPI Nand OTP
> register
> + *=20
> + * Description:
> + *   There is one bit( bit 0x10 ) to set or to clear the internal ECC.
> + *   Enable chip internal ECC, set the bit to 1
> + *   Disable chip internal ECC, clear the bit to 0
> + */
> +static int spinand_set_otp(struct spi_device *spi_nand, struct
> spinand_info *info, u8* otp)
> +{
> +	struct spinand_cmd cmd =3D {0};
> +	ssize_t retval;
> +=09
> +	cmd.cmd =3D CMD_WRITE_REG;
> +	cmd.n_addr =3D 1;
> +	cmd.addr[0] =3D REG_OTP;
> +	cmd.n_tx =3D 1;
> +	cmd.tx_buf =3D otp;
> +=09
> +	retval =3D spinand_cmd(spi_nand, &cmd);
> +
> +	if (retval !=3D 0) {
> +		dev_err(&spi_nand->dev, "error %d set otp\n",
> +				(int) retval);
> +		return retval;
> +	}
> +=09
> +	return 0;
> +}
> +
> +/**
> + * sspinand_enable_ecc- send command 0x1f to write the SPI Nand OTP
> register
> + *=20
> + * Description:
> + *   There is one bit( bit 0x10 ) to set or to clear the internal ECC.
> + *   Enable chip internal ECC, set the bit to 1
> + *   Disable chip internal ECC, clear the bit to 0
> + */
> +static int spinand_enable_ecc(struct spi_device *spi_nand, struct
> spinand_info *info)
> +{
> +	ssize_t retval;
> +	u8 otp =3D 0;
> +=09
> +	retval =3D spinand_get_otp(spi_nand, info, &otp);
> +
> +	if ((otp & OTP_ECC_MASK) =3D=3D OTP_ECC_MASK)
> +	{
> +		return 0;
> +	}
> +	else
> +	{
> +		otp |=3D OTP_ECC_MASK;
> +		retval =3D spinand_set_otp(spi_nand, info, &otp);
> +		retval =3D spinand_get_otp(spi_nand, info, &otp);
> +		return retval;
> +	}
> +}
> +
> +static int spinand_disable_ecc(struct spi_device *spi_nand, struct
> spinand_info *info)
> +{
> +	ssize_t retval;
> +	u8 otp =3D 0;
> +=09
> +	retval =3D spinand_get_otp(spi_nand, info, &otp);
> +
> +
> +	if ((otp & OTP_ECC_MASK) =3D=3D OTP_ECC_MASK)
> +	{
> +		otp &=3D ~OTP_ECC_MASK;
> +		retval =3D spinand_set_otp(spi_nand, info, &otp);
> +		retval =3D spinand_get_otp(spi_nand, info, &otp);
> +		return retval;
> +	}
> +	else
> +	{
> +		return 0;
> +	}
> +}
> +
> +/**
> + * sspinand_write_enable- send command 0x06 to enable write or erase
> the Nand cells
> + *=20
> + * Description:
> + *   Before write and erase the Nand cells, the write enable has to be
> set.
> + *   After the write or erase, the write enable bit is automatically
> cleared( status register bit 2 )
> + *   Set the bit 2 of the status register has the same effect
> + */
> +static int spinand_write_enable(struct spi_device *spi_nand, struct
> spinand_info *info)
> +{
> +	struct spinand_cmd cmd =3D {0};
> +
> +	cmd.cmd =3D CMD_WR_ENABLE;
> +
> +	return spinand_cmd(spi_nand, &cmd);
> +}
> +
> +static int spinand_read_page_to_cache(struct spi_device *spi_nand,
> struct spinand_info *info, u16 page_id)
> +{
> +	struct spinand_cmd cmd =3D {0};
> +	u16 row;
> +
> +	row =3D page_id;
> +
> +	cmd.cmd =3D CMD_READ;
> +	cmd.n_addr =3D 3;
> +	cmd.addr[1] =3D (u8)((row&0xff00)>>8);
> +	cmd.addr[2] =3D (u8)(row&0x00ff);
> +
> +	return spinand_cmd(spi_nand, &cmd);
> +}
> +
> +/**
> + * spinand_read_from_cache- send command 0x03 to read out the data from
> the cache register( 2112 bytes max )
> + *=20
> + * Description:
> + *   The read can specify 1 to 2112 bytes of data read at the
> coresponded locations.
> + *   No tRd delay.
> + */
> +static int spinand_read_from_cache(struct spi_device *spi_nand, struct
> spinand_info *info, u16 byte_id, u16 len, u8* rbuf)
> +{
> +	struct spinand_cmd cmd =3D {0};
> +	u16 column;
> +
> +	column =3D byte_id;
> +
> +	cmd.cmd =3D CMD_READ_RDM;
> +	cmd.n_addr =3D 2;
> +	cmd.addr[0] =3D (u8)((column&0xff00)>>8);
> +	cmd.addr[1] =3D (u8)(column&0x00ff);
> +	cmd.n_dummy =3D 1;
> +	cmd.n_rx =3D len;
> +	cmd.rx_buf =3D rbuf;
> +=09
> +	return spinand_cmd(spi_nand, &cmd);=09
> +}
> +
> +/**
> + * spinand_read_page-to read a page with:
> + * @page_id: the physical page number
> + * @offset:  the location from 0 to 2111
> + * @len:     number of bytes to read
> + * @rbuf:    read buffer to hold @len bytes
> + *
> + * Description:
> + *   The read icludes two commands to the Nand: 0x13 and 0x03 commands
> + *   Poll to read status to wait for tRD time.
> + */
> +static int spinand_read_page(struct spi_device *spi_nand, struct
> spinand_info *info, u16 page_id, u16 offset, u16 len, u8* rbuf)
> +{
> +	ssize_t retval;
> +	u8 status =3D 0;
> +=09
> +	retval =3D spinand_read_page_to_cache(spi_nand, info, page_id);
> +
> +	while (1)
> +	{
> +		retval =3D spinand_read_status(spi_nand, info, &status);
> +		if (retval<0) {
> +			dev_err(&spi_nand->dev, "error %d reading status
> register\n",
> +					(int) retval);
> +			return retval;
> +		}
> +
> +		if ((status & STATUS_OIP_MASK) =3D=3D STATUS_READY)
> +		{
> +			if ((status & STATUS_ECC_MASK) =3D=3D
> STATUS_ECC_ERROR)
> +			{
> +				dev_err(&spi_nand->dev, "ecc error,
> page=3D%d\n", page_id);
> +				if (spi_nand =3D=3D
> SPI_NAND_MICRON_DRIVER_KEY)
> +					printk(KERN_INFO "Error:
> reformat or erase your device. \n");=20
> +				else
> +				return -1;
> +			}
> +			break;
> +		}
> +	}
> +
> +	retval =3D spinand_read_from_cache(spi_nand, info, offset, len,
> rbuf);
> +	return 0;
> +	=09
> +}
> +
> +/**
> + * spinand_program_data_to_cache--to write a page to cache with:
> + * @byte_id: the location to write to the cache
> + * @len:     number of bytes to write
> + * @rbuf:    read buffer to hold @len bytes
> + *
> + * Description:
> + *   The write command used here is 0x84--indicating that the cache is
> not cleared first.
> + *   Since it is writing the data to cache, there is no tPROG time.
> + */
> +static int spinand_program_data_to_cache(struct spi_device *spi_nand,
> struct spinand_info *info, u16 byte_id, u16 len, u8* wbuf)
> +{
> +	struct spinand_cmd cmd =3D {0};
> +	u16 column;
> +
> +	column =3D byte_id;
> +
> +	cmd.cmd =3D CMD_PROG_PAGE_CLRCACHE;
> +	cmd.n_addr =3D 2;
> +	cmd.addr[0] =3D (u8)((column&0xff00)>>8);
> +	cmd.addr[1] =3D (u8)(column&0x00ff);
> +	cmd.n_tx =3D len;
> +	cmd.tx_buf =3D wbuf;
> +
> +	return spinand_cmd(spi_nand, &cmd);
> +}
> +
> +/**
> + * spinand_program_execute--to write a page from cache to the Nand
> array with:
> + * @page_id: the physical page location to write the page.
> + *
> + * Description:
> + *   The write command used here is 0x10--indicating the cache is
> writing to the Nand array.
> + *   Need to wait for tPROG time to finish the transaction.
> + */
> +static int spinand_program_execute(struct spi_device *spi_nand, struct
> spinand_info *info, u16 page_id)
> +{
> +	struct spinand_cmd cmd =3D {0};
> +	u16 row;
> +
> +	row =3D page_id;
> +
> +	cmd.cmd =3D CMD_PROG_PAGE_EXC;
> +	cmd.n_addr =3D 3;
> +	cmd.addr[1] =3D (u8)((row&0xff00)>>8);
> +	cmd.addr[2] =3D (u8)(row&0x00ff);
> +
> +	return spinand_cmd(spi_nand, &cmd);
> +}
> +
> +/**
> + * spinand_program_page--to write a page with:
> + * @page_id: the physical page location to write the page.
> + * @offset:  the location from the cache starting from 0 to 2111
> + * @len:     the number of bytes to write=20
> + * @wbuf:    the buffer to hold the number of bytes
> + *
> + * Description:
> + *   The commands used here are 0x06, 0x84, and 0x10--indicating that
> the write enable is first
> + *   sent, the write cache command, and the write execute command
> + *   Poll to wait for the tPROG time to finish the transaction.
> + */
> +static int spinand_program_page(struct spi_device *spi_nand, struct
> spinand_info *info, u16 page_id, u16 offset, u16 len, u8* wbuf)
> +{
> +	ssize_t retval;
> +	u8 status =3D 0;
> +
> +	retval =3D spinand_write_enable(spi_nand, info);
> +=09
> +	retval =3D spinand_program_data_to_cache(spi_nand, info, offset,
> len, wbuf);
> +
> +	retval =3D spinand_program_execute(spi_nand, info, page_id);
> +
> +	while (1)
> +	{
> +		retval =3D spinand_read_status(spi_nand, info, &status);
> +		if (retval<0) {
> +			dev_err(&spi_nand->dev, "error %d reading status
> register\n",
> +					(int) retval);
> +			return retval;
> +		}
> +
> +		if ((status & STATUS_OIP_MASK) =3D=3D STATUS_READY)
> +		{
> +
> +			if ((status & STATUS_P_FAIL_MASK) =3D=3D
> STATUS_P_FAIL)
> +			{
> +				dev_err(&spi_nand->dev, "program error,
> page=3D%d\n", page_id);
> +				return -1;
> +			}
> +			else
> +				break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * spinand_erase_block_erase--to erase a page with:
> + * @block_id: the physical block location to erase.
> + *
> + * Description:
> + *   The command used here is 0xd8--indicating an erase command to
> erase one block--64 pages
> + *   Need to wait for tERS.
> + */
> +static int spinand_erase_block_erase(struct spi_device *spi_nand,
> struct spinand_info *info, u16 block_id)
> +{
> +	struct spinand_cmd cmd =3D {0};
> +	u16 row;
> +
> +	row =3D block_id << 6;
> +	cmd.cmd =3D CMD_ERASE_BLK;
> +	cmd.n_addr =3D 3;
> +	cmd.addr[1] =3D (u8)((row&0xff00)>>8);
> +	cmd.addr[2] =3D (u8)(row&0x00ff);
> +
> +	return spinand_cmd(spi_nand, &cmd);=09
> +}
> +
> +/**
> + * spinand_erase_block--to erase a page with:
> + * @block_id: the physical block location to erase.
> + *
> + * Description:
> + *   The commands used here are 0x06 and 0xd8--indicating an erase
> command to erase one block--64 pages
> + *   It will first to enable the write enable bit ( 0x06 command ), and
> then send the 0xd8 erase command
> + *   Poll to wait for the tERS time to complete the tranaction.
> + */
> +static int spinand_erase_block(struct spi_device *spi_nand, struct
> spinand_info *info, u16 block_id)
> +{
> +	ssize_t retval;
> +	u8 status=3D 0;
> +
> +	retval =3D spinand_write_enable(spi_nand, info);
> +=09
> +	retval =3D spinand_erase_block_erase(spi_nand, info, block_id);
> +
> +	while (1)
> +	{
> +		retval =3D spinand_read_status(spi_nand, info, &status);
> +		if (retval<0) {
> +			dev_err(&spi_nand->dev, "error %d reading status
> register\n",
> +					(int) retval);
> +			return retval;
> +		}
> +
> +		if ((status & STATUS_OIP_MASK) =3D=3D STATUS_READY)
> +		{
> +			if ((status & STATUS_E_FAIL_MASK) =3D=3D
> STATUS_E_FAIL)
> +			{
> +				dev_err(&spi_nand->dev, "erase error,
> block=3D%d\n", block_id);
> +				return -1;
> +			}
> +			else
> +				break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> +* spinand_get_info: get NAND info, from read id or const value=20
> +
> + * Description:
> + *   To set up the device parameters.
> + */
> +static int spinand_get_info(struct spi_device *spi_nand, struct
> spinand_info *info, u8* id)
> +{
> +	if (id[0]=3D=3D0x2C && (id[1]=3D=3D0x11 || id[1]=3D=3D0x12 || id[1]=3D=
=3D0x13))
> +	{
> +		info->mid =3D id[0];
> +		info->did =3D id[1];
> +		info->name =3D "MT29F1G01ZAC";
> +		info->nand_size =3D (1024 * 64 * 2112);
> +		info->usable_size =3D (1024 * 64 * 2048);
> +		info->block_size =3D (2112*64);
> +		info->block_main_size =3D (2048*64);
> +		info->block_num_per_chip =3D 1024;
> +		info->page_size =3D 2112;
> +		info->page_main_size =3D 2048;
> +		info->page_spare_size =3D 64;
> +		info->page_num_per_block =3D 64;
> +
> +		info->block_shift =3D 17;
> +		info->block_mask =3D 0x1ffff;
> +
> +		info->page_shift =3D 11;
> +		info->page_mask =3D 0x7ff;
> +	=09
> +		info->ecclayout =3D &spinand_oob_64;
> +	}=09
> +=09
> +	return 0;
> +}
> +
> +/**
> + * spinand_probe - [spinand Interface]=20
> +* @spi_nand: registered device driver.
> + *
> + * Description:
> + *   To set up the device driver parameters to make the device
> available.
> + */
> +static int __devinit spinand_probe(struct spi_device *spi_nand)
> +{
> +	ssize_t retval;
> +	struct mtd_info *mtd;
> +	struct spinand_chip *chip;=20
> +	struct spinand_info *info;
> +	u8 id[2]=3D {0};
> +=09
> +	retval =3D spinand_reset(spi_nand);
> +	retval =3D spinand_reset(spi_nand);
> +	retval =3D spinand_read_id(spi_nand, (u8*)&id);
> +	if (id[0]=3D=3D0 && id[1]=3D=3D0)
> +	{
> +		printk(KERN_INFO "SPINAND: read id error! 0x%02x,
> 0x%02x!\n", id[0], id[1]);=20
> +		return 0;
> +	}
> +
> +	info  =3D kzalloc(sizeof(struct spinand_info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +=09
> +	retval =3D spinand_get_info(spi_nand, info, (u8*)&id);
> +	printk(KERN_INFO "SPINAND: 0x%02x, 0x%02x, %s\n", id[0], id[1],
> info->name);=20
> +	printk(KERN_INFO "%s\n", mu_spi_nand_driver_version);
> +	retval =3D spinand_lock_block(spi_nand, info, BL_ALL_UNLOCKED);
> +
> +#ifdef CONFIG_MTD_SPINAND_ONDIEECC
> +	retval =3D spinand_enable_ecc(spi_nand, info);
> +#else
> +	retval =3D spinand_disable_ecc(spi_nand, info);
> +#endif
> +
> +	chip  =3D kzalloc(sizeof(struct spinand_chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->spi_nand =3D spi_nand;
> +	chip->info =3D info;
> +	chip->reset =3D spinand_reset;
> +	chip->read_id =3D spinand_read_id;
> +	chip->read_page =3D spinand_read_page;
> +	chip->program_page =3D spinand_program_page;
> +	chip->erase_block =3D spinand_erase_block;
> +
> +	chip->buf =3D kzalloc(info->page_size, GFP_KERNEL);
> +	if (!chip->buf)
> +		return -ENOMEM;
> +
> +	chip->oobbuf =3D kzalloc(info->ecclayout->oobavail, GFP_KERNEL);
> +	if (!chip->oobbuf)
> +		return -ENOMEM;
> +
> +	mtd =3D kzalloc(sizeof(struct mtd_info), GFP_KERNEL);
> +	if (!mtd)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&spi_nand->dev, mtd);
> +=09
> +	mtd->priv =3D chip;
> +
> +	retval =3D spinand_mtd(mtd);
> +=09
> +	return retval;
> +}
> +
> +/**
> + * __devexit spinand_remove--Remove the device driver
> + * @spi: the spi device.
> + *
> + * Description:
> + *   To remove the device driver parameters and free up allocated
> memories.
> + */
> +static int __devexit spinand_remove(struct spi_device *spi)
> +{
> +	struct mtd_info *mtd;
> +	struct spinand_chip *chip;=20
> +
> +	DEBUG(MTD_DEBUG_LEVEL1, "%s: remove\n", dev_name(&spi->dev));
> +
> +	mtd =3D dev_get_drvdata(&spi->dev);
> +=09
> +	spinand_mtd_release(mtd);
> +
> +	chip =3D mtd->priv;
> +=09
> +	kfree(chip->info);
> +	kfree(chip->buf);
> +	kfree(chip->oobbuf);
> +	kfree(chip);
> +	kfree(mtd);
> +=09
> +	return 0;
> +}
> +
> +/**
> + * Device name structure description
> +*/
> +static struct spi_driver spinand_driver =3D {
> +	.driver =3D {
> +		.name		=3D "spi_nand",
> +		.bus		=3D &spi_bus_type,
> +		.owner		=3D THIS_MODULE,
> +	},
> +
> +	.probe		=3D spinand_probe,
> +	.remove		=3D __devexit_p(spinand_remove),
> +};
> +
> +/**
> + * Device driver registration
> +*/
> +static int __init spinand_init(void)
> +{
> +	return spi_register_driver(&spinand_driver);
> +}
> +
> +/**
> + * unregister Device driver.
> +*/
> +static void __exit spinand_exit(void)
> +{
> +	spi_unregister_driver(&spinand_driver);
> +}
> +
> +module_init(spinand_init);
> +module_exit(spinand_exit);
> +
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Henry Pan <hspan at micron.com>");
> +MODULE_DESCRIPTION("SPI NAND driver code");
> diff -urN linux-2.6.33.20-orig/drivers/mtd/spinand/spinand_mtd.c
> linux-2.6.33.20/drivers/mtd/spinand/spinand_mtd.c
> --- linux-2.6.33.20-orig/drivers/mtd/spinand/spinand_mtd.c
> 1969-12-31 16:00:00.000000000 -0800
> +++ linux-2.6.33.20/drivers/mtd/spinand/spinand_mtd.c	2010-05-19
> 04:28:07.000000000 -0700
> @@ -0,0 +1,728 @@
> +/*
> +spinand_mtd.c
> +
> +Copyright (c) 2009-2010 Micron Technology, Inc.
> +
> +This program is free software; you can redistribute it and/or
> +modify it under the terms of the GNU General Public License
> +as published by the Free Software Foundation; either version 2
> +of the License, or (at your option) any later version.
> +
> +This program is distributed in the hope that it will be useful,
> +but WITHOUT ANY WARRANTY; without even the implied warranty of
> +MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +GNU General Public License for more details.
> +
> +*/
> +
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/sched.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/jiffies.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/spinand.h>
> +#include <linux/mtd/nand_ecc.h>
> +
> +/**
> + * spinand_get_device - [GENERIC] Get chip for selected access
> + * @param mtd		MTD device structure
> + * @param new_state	the state which is requested
> + *
> + * Get the device and lock it for exclusive access
> + */
> +#define mu_spi_nand_driver_version
> "Beagle-MTD_01.00_Linux2.6.33_20100507"
> +static int spinand_get_device(struct mtd_info *mtd, int new_state)
> +{
> +	struct spinand_chip *this =3D mtd->priv;
> +	DECLARE_WAITQUEUE(wait, current);
> +
> +	/*
> +	 * Grab the lock and see if the device is available
> +	 */
> +	while (1) {
> +		spin_lock(&this->chip_lock);
> +		if (this->state =3D=3D FL_READY) {
> +			this->state =3D new_state;
> +			spin_unlock(&this->chip_lock);
> +			break;
> +		}
> +		if (new_state =3D=3D FL_PM_SUSPENDED) {
> +			spin_unlock(&this->chip_lock);
> +			return (this->state =3D=3D FL_PM_SUSPENDED) ? 0 :
> -EAGAIN;
> +		}
> +		set_current_state(TASK_UNINTERRUPTIBLE);
> +		add_wait_queue(&this->wq, &wait);
> +		spin_unlock(&this->chip_lock);
> +		schedule();
> +		remove_wait_queue(&this->wq, &wait);
> +	}
> +	return 0;
> +}
> +
> +/**
> + * spinand_release_device - [GENERIC] release chip
> + * @param mtd		MTD device structure
> + *
> + * Deselect, release chip lock and wake up anyone waiting on the device
> + */
> +static void spinand_release_device(struct mtd_info *mtd)
> +{
> +	struct spinand_chip *this =3D mtd->priv;
> +
> +	/* Release the chip */
> +	spin_lock(&this->chip_lock);
> +	this->state =3D FL_READY;
> +	wake_up(&this->wq);
> +	spin_unlock(&this->chip_lock);
> +}
> +
> +#ifdef CONFIG_MTD_SPINAND_SWECC=20
> +static void spinand_calculate_ecc(struct mtd_info *mtd)
> +{
> +	int i;=20
> +	int eccsize =3D 512;
> +	int eccbytes =3D 3;
> +	int eccsteps =3D 4;
> +	int ecctotal =3D 12;
> +	struct spinand_chip *chip =3D mtd->priv;
> +	struct spinand_info *info =3D chip->info;
> +	unsigned char *p =3D chip->buf;
> +
> +	for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D eccsize)
> +		__nand_calculate_ecc(p, eccsize, &chip->ecc_calc[i]);
> +
> +	for (i =3D 0; i < ecctotal; i++)
> +		chip->buf[info->page_main_size +
> info->ecclayout->eccpos[i]] =3D chip->ecc_calc[i];
> +}
> +
> +static int spinand_correct_data(struct mtd_info *mtd)
> +{
> +	int i;=20
> +	int eccsize =3D 512;
> +	int eccbytes =3D 3;
> +	int eccsteps =3D 4;
> +	int ecctotal =3D 12;
> +	struct spinand_chip *chip =3D mtd->priv;
> +	struct spinand_info *info =3D chip->info;
> +	unsigned char *p =3D chip->buf;
> +	int errcode =3D 0;
> +
> +	for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D eccsize)
> +		__nand_calculate_ecc(p, eccsize, &chip->ecc_calc[i]);
> +
> +	for (i =3D 0; i < ecctotal; i++)
> +		chip->ecc_code[i] =3D chip->buf[info->page_main_size +
> info->ecclayout->eccpos[i]];
> +
> +	for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D eccsize)
> +	{
> +		int stat;
> +	=09
> +		stat =3D __nand_correct_data(p, &chip->ecc_code[i],
> &chip->ecc_calc[i], eccsize);
> +		if (stat < 0)
> +		{
> +			errcode =3D -1;
> +		}
> +		else if (stat =3D=3D 1)
> +		{
> +			errcode =3D 1;
> +		}
> +	}
> +
> +	return errcode;
> +}
> +#endif
> +
> +static int spinand_read_ops(struct mtd_info *mtd, loff_t from,
> +			  struct mtd_oob_ops *ops)
> +{
> +	struct spinand_chip *chip =3D mtd->priv;
> +	struct spi_device *spi_nand =3D chip->spi_nand;
> +	struct spinand_info *info =3D chip->info;
> +	int page_id, page_offset, page_num, oob_num;
> +
> +	int count;
> +	int main_ok, main_left, main_offset;
> +	int oob_ok, oob_left;
> +=09
> +	signed int retval;
> +	signed int errcode=3D0;
> +
> +	if (!chip->buf)
> +		return -1;
> +
> +	page_id =3D from >> info->page_shift;
> +
> +	/* for main data */
> +	page_offset =3D from & info->page_mask;
> +	page_num =3D (page_offset + ops->len + info->page_main_size -1 ) /
> info->page_main_size;
> +
> +	/* for oob */
> +	oob_num =3D (ops->ooblen + info->ecclayout->oobavail -1) /
> info->ecclayout->oobavail;
> +
> +	count =3D 0;
> +
> +	main_left =3D ops->len;
> +	main_ok =3D 0;
> +	main_offset =3D page_offset;
> +
> +	oob_left =3D ops->ooblen;
> +	oob_ok =3D 0;
> +
> +	while (1)
> +	{
> +		if (count < page_num || count < oob_num)=20
> +		{
> +			memset(chip->buf, 0, info->page_size);=20
> +			retval =3D chip->read_page(spi_nand, info, page_id
> + count, 0, info->page_size, chip->buf);
> +			if (retval !=3D 0)
> +			{
> +				errcode =3D -1;
> +				printk(KERN_INFO "spinand_read_ops:
> fail, page=3D%d!\n", page_id);
> +
> +				return errcode;
> +			}
> +		}
> +		else
> +		{
> +			break;
> +		}
> +=09
> +		if (count < page_num && ops->datbuf)=20
> +		{
> +			int size;
> +		=09
> +#ifdef CONFIG_MTD_SPINAND_SWECC
> +			retval =3D spinand_correct_data(mtd);
> +			if (retval =3D=3D -1)
> +				printk(KERN_INFO "SWECC uncorrectable
> error! page=3D%x\n", page_id+count);=20
> +			else if (retval =3D=3D 1)
> +				printk(KERN_INFO "SWECC 1 bit error,
> corrected! page=3D%x\n", page_id+count);=20
> +
> +#endif
> +
> +			if ((main_offset + main_left) <
> info->page_main_size)
> +			{
> +				size =3D main_left;
> +			}
> +			else
> +			{
> +				size =3D info->page_main_size -
> main_offset;
> +			}
> +		=09
> +			memcpy (ops->datbuf + main_ok, chip->buf, size);
> +
> +			main_ok +=3D size;
> +			main_left -=3D size;
> +			main_offset =3D 0;
> +
> +			ops->retlen =3D main_ok;
> +		}
> +
> +		if (count < oob_num && ops->oobbuf && chip->oobbuf)
> +		{
> +			int size;
> +			int offset, len, temp;
> +	=09
> +			/* repack spare to oob */
> +			memset(chip->oobbuf, 0,
> info->ecclayout->oobavail);
> +
> +			temp =3D 0;
> +			offset =3D info->ecclayout->oobfree[0].offset;
> +			len =3D info->ecclayout->oobfree[0].length;
> +			memcpy (chip->oobbuf + temp, chip->buf +
> info->page_main_size + offset, len);
> +=09
> +			temp +=3D len;
> +			offset =3D info->ecclayout->oobfree[1].offset;
> +			len =3D info->ecclayout->oobfree[1].length;
> +			memcpy (chip->oobbuf + temp, chip->buf +
> info->page_main_size + offset, len);
> +=09
> +			temp +=3D len;
> +			offset =3D info->ecclayout->oobfree[2].offset;
> +			len =3D info->ecclayout->oobfree[2].length;
> +			memcpy (chip->oobbuf + temp, chip->buf +
> info->page_main_size + offset, len);
> +
> +			temp +=3D len;
> +			offset =3D info->ecclayout->oobfree[3].offset;
> +			len =3D info->ecclayout->oobfree[3].length;
> +			memcpy (chip->oobbuf + temp, chip->buf +
> info->page_main_size + offset, len);
> +
> +			/* copy oobbuf to ops oobbuf */
> +			if (oob_left < info->ecclayout->oobavail)=20
> +			{
> +				size =3D oob_left;
> +			}
> +			else
> +			{
> +				size =3D info->ecclayout->oobavail;
> +			}
> +
> +			memcpy (ops->oobbuf + oob_ok, chip->oobbuf,
> size);
> +
> +			oob_ok +=3D size;
> +			oob_left -=3D size;
> +
> +			ops->oobretlen =3D oob_ok;
> +		}
> +
> +		count++;
> +	}
> +	return errcode;
> +}
> +
> +static int spinand_write_ops(struct mtd_info *mtd, loff_t to,
> +			  struct mtd_oob_ops *ops)
> +{
> +	struct spinand_chip *chip =3D mtd->priv;
> +	struct spi_device *spi_nand =3D chip->spi_nand;
> +	struct spinand_info *info =3D chip->info;
> +	int page_id, page_offset, page_num, oob_num;
> +
> +	int count;
> +
> +	int main_ok, main_left, main_offset;
> +	int oob_ok, oob_left;
> +=09
> +	signed int retval;
> +	signed int errcode=3D0;
> +
> +	if (!chip->buf)
> +		return -1;
> +
> +	page_id =3D to >> info->page_shift;
> +
> +	/* for main data */
> +	page_offset =3D to & info->page_mask;
> +	page_num =3D (page_offset + ops->len + info->page_main_size -1 ) /
> info->page_main_size;
> +
> +	/* for oob */
> +	oob_num =3D (ops->ooblen + info->ecclayout->oobavail -1) /
> info->ecclayout->oobavail;
> +
> +	count =3D 0;
> +
> +	main_left =3D ops->len;
> +	main_ok =3D 0;
> +	main_offset =3D page_offset;
> +
> +	oob_left =3D ops->ooblen;
> +	oob_ok =3D 0;
> +
> +	while (1)
> +	{
> +		if (count < page_num || count < oob_num)=20
> +		{
> +			memset(chip->buf, 0xFF, info->page_size);=20
> +		}
> +		else
> +		{
> +			break;=20
> +		}
> +
> +		if (count < page_num && ops->datbuf)=20
> +		{
> +			int size;
> +
> +			if ((main_offset + main_left) <
> info->page_main_size)
> +			{
> +				size =3D main_left;
> +			}
> +			else
> +			{
> +				size =3D info->page_main_size -
> main_offset;
> +			}
> +
> +			memcpy (chip->buf, ops->datbuf + main_ok, size);
> +		=09
> +			main_ok +=3D size;
> +			main_left -=3D size;
> +			main_offset =3D 0;
> +		=09
> +#ifdef CONFIG_MTD_SPINAND_SWECC=20
> +			spinand_calculate_ecc(mtd);
> +#endif
> +		}
> +
> +		if (count < oob_num && ops->oobbuf && chip->oobbuf)
> +		{
> +			int size;
> +			int offset, len, temp;
> +
> +			memset(chip->oobbuf, 0xFF,
> info->ecclayout->oobavail);
> +
> +			if (oob_left < info->ecclayout->oobavail)=20
> +			{
> +				size =3D oob_left;
> +			}
> +			else
> +			{
> +				size =3D info->ecclayout->oobavail;
> +			}
> +
> +			memcpy (chip->oobbuf, ops->oobbuf + oob_ok,
> size);
> +
> +			oob_ok +=3D size;
> +			oob_left -=3D size;
> +
> +			/* repack oob to spare */
> +			temp =3D 0;
> +			offset =3D info->ecclayout->oobfree[0].offset;
> +			len =3D info->ecclayout->oobfree[0].length;
> +			memcpy (chip->buf + info->page_main_size +
> offset, chip->oobbuf + temp, len);
> +	=09
> +			temp +=3D len;
> +			offset =3D info->ecclayout->oobfree[1].offset;
> +			len =3D info->ecclayout->oobfree[1].length;
> +			memcpy (chip->buf + info->page_main_size +
> offset, chip->oobbuf + temp, len);
> +
> +			temp +=3D len;
> +			offset =3D info->ecclayout->oobfree[2].offset;
> +			len =3D info->ecclayout->oobfree[2].length;
> +			memcpy (chip->buf + info->page_main_size +
> offset, chip->oobbuf + temp, len);
> +
> +			temp +=3D len;
> +			offset =3D info->ecclayout->oobfree[3].offset;
> +			len =3D info->ecclayout->oobfree[3].length;
> +			memcpy (chip->buf + info->page_main_size +
> offset, chip->oobbuf + temp, len);
> +	=09
> +		}
> +
> +		if (count < page_num || count < oob_num)=20
> +		{
> +
> +			retval =3D chip->program_page(spi_nand, info,
> page_id + count, 0, info->page_size, chip->buf);
> +			if (retval !=3D 0)
> +			{
> +				errcode =3D -1;
> +				printk(KERN_INFO "spinand_write_ops:
> fail, page=3D%d!\n", page_id);
> +
> +				return errcode;
> +			}
> +		}
> +
> +		if (count < page_num && ops->datbuf)=20
> +		{
> +			ops->retlen =3D main_ok;
> +		}
> +
> +		if (count < oob_num && ops->oobbuf && chip->oobbuf)
> +		{
> +			ops->oobretlen =3D oob_ok;
> +		}
> +
> +		count++;
> +
> +	}
> +
> +	return errcode;
> +}
> +
> +static int spinand_read(struct mtd_info *mtd, loff_t from, size_t len,
> +	size_t *retlen, u_char *buf)
> +{
> +	struct mtd_oob_ops ops =3D {0};
> +	int ret;
> +=09
> +	/* Do not allow reads past end of device */
> +	if ((from + len) > mtd->size)
> +		return -EINVAL;
> +
> +	if (!len)
> +		return 0;
> +
> +	spinand_get_device(mtd, FL_READING);
> +
> +	ops.len =3D len;
> +	ops.datbuf =3D buf;
> +
> +	ret =3D spinand_read_ops(mtd, from, &ops);
> +=20
> + 	*retlen =3D ops.retlen;
> +
> +	spinand_release_device(mtd);
> +
> +	return ret;
> +}
> +
> +static int spinand_write(struct mtd_info *mtd, loff_t to, size_t len,
> +	size_t *retlen, const u_char *buf)
> +{
> +	struct mtd_oob_ops ops =3D {0};
> +	int ret;
> +=09
> +	/* Do not allow reads past end of device */
> +	if ((to + len) > mtd->size)
> +		return -EINVAL;
> +	if (!len)
> +		return 0;
> +
> +	spinand_get_device(mtd, FL_WRITING);
> +
> +	ops.len =3D len;
> +	ops.datbuf =3D (uint8_t *)buf;
> +
> +	ret =3D  spinand_write_ops(mtd, to, &ops);
> +
> +	*retlen =3D ops.retlen;
> +
> +	spinand_release_device(mtd);
> +
> +	return ret;
> +}
> +
> +static int spinand_read_oob(struct mtd_info *mtd, loff_t from,
> +			  struct mtd_oob_ops *ops)
> +{
> +	int ret;
> +
> +	spinand_get_device(mtd, FL_READING);
> +
> +	ret =3D spinand_read_ops(mtd, from, ops);
> +
> +	spinand_release_device(mtd);
> +
> +	return ret;
> +}
> +
> +static int spinand_write_oob(struct mtd_info *mtd, loff_t to,
> +			  struct mtd_oob_ops *ops)
> +{
> +	int ret;
> +
> +	spinand_get_device(mtd, FL_WRITING);
> +
> +	ret =3D spinand_write_ops(mtd, to, ops);
> +=09
> +	spinand_release_device(mtd);
> +=09
> +	return ret;
> +}
> +
> +/**
> + * spinand_erase - [MTD Interface] erase block(s)
> + * @param mtd		MTD device structure
> + * @param instr		erase instruction
> + *
> + * Erase one ore more blocks
> + */
> +static int spinand_erase(struct mtd_info *mtd, struct erase_info
> *instr)
> +{
> +	struct spinand_chip *chip =3D mtd->priv;
> +	struct spi_device *spi_nand =3D chip->spi_nand;
> +	struct spinand_info *info =3D chip->info;
> +	u16 block_id, block_num, count;
> +	signed int retval=3D0;
> +	signed int errcode=3D0;
> +
> +	DEBUG(MTD_DEBUG_LEVEL3, "spinand_erase: start =3D 0x%012llx, len =3D
> %llu\n",
> +	      (unsigned long long)instr->addr, (unsigned long
> long)instr->len);
> +
> +	/* check address align on block boundary */
> +	if (instr->addr & (info->block_main_size - 1)) {
> +		DEBUG(MTD_DEBUG_LEVEL0, "spinand_erase: Unaligned
> address\n");
> +		return -EINVAL;
> +	}
> +
> +	if (instr->len & (info->block_main_size - 1)) {
> +		DEBUG(MTD_DEBUG_LEVEL0, "spinand_erase: "
> +		      "Length not block aligned\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Do not allow erase past end of device */
> +	if ((instr->len + instr->addr) > info->usable_size) {
> +		DEBUG(MTD_DEBUG_LEVEL0, "spinand_erase: "
> +		      "Erase past end of device\n");
> +		return -EINVAL;
> +	}
> +
> +	instr->fail_addr =3D MTD_FAIL_ADDR_UNKNOWN;=09
> +
> +=09
> +	/* Grab the lock and see if the device is available */
> +	spinand_get_device(mtd, FL_ERASING);
> +
> +	block_id =3D instr->addr >> info->block_shift;
> +	block_num =3D instr->len >> info->block_shift;=20
> +	count =3D 0;
> +=09
> +	while (count < block_num )
> +	{
> +		retval =3D chip->erase_block(spi_nand, info,
> block_id+count);
> +
> +		if (retval!=3D0)
> +		{
> +			retval =3D chip->erase_block(spi_nand, info,
> block_id+count);
> +			if (retval!=3D0)
> +			{
> +				printk(KERN_INFO "spinand_erase: fail,
> block=3D%d!\n", block_id+count);
> +				errcode =3D -1;
> +			}
> +		}
> +		count++;
> +	}
> +=09
> +	if (errcode =3D=3D 0)
> +	{
> +		instr->state =3D MTD_ERASE_DONE;
> +	}
> +=09
> +	/* Deselect and wake up anyone waiting on the device */
> +	spinand_release_device(mtd);
> +
> +	/* Do call back function */
> +	if(instr->callback)
> +		instr->callback(instr);
> +=09
> +	return errcode;
> +}
> +
> +/**
> + * spinand_sync - [MTD Interface] sync
> + * @param mtd		MTD device structure
> + *
> + * Sync is actually a wait for chip ready function
> + */
> +static void spinand_sync(struct mtd_info *mtd)
> +{
> +	DEBUG(MTD_DEBUG_LEVEL3, "spinand_sync: called\n");
> +
> +	/* Grab the lock and see if the device is available */
> +	spinand_get_device(mtd, FL_SYNCING);
> +
> +	/* Release it and go back */
> +	spinand_release_device(mtd);
> +}
> +
> +static int spinand_block_isbad(struct mtd_info *mtd, loff_t ofs)
> +{
> +	struct spinand_chip *chip =3D mtd->priv;
> +	struct spi_device *spi_nand =3D chip->spi_nand;
> +	struct spinand_info *info =3D chip->info;
> +	u16 block_id;
> +	u8 is_bad =3D 0x00;
> +	u8 ret =3D 0;
> +
> +	spinand_get_device(mtd, FL_READING);
> +
> +	block_id =3D ofs >> info->block_shift;
> +
> +	chip->read_page(spi_nand, info,
> block_id*info->page_num_per_block, info->page_main_size, 1, &is_bad);
> +
> +	if (is_bad !=3D 0xFF)
> +	{
> +		ret =3D  1;=09
> +	}
> +
> +	spinand_release_device(mtd);
> +
> +	return ret;=20
> +}
> +
> +/**
> + * spinand_block_markbad - [MTD Interface] Mark bad block
> + * @param mtd		MTD device structure
> + * @param ofs       Bad block number
> + */
> +static int spinand_block_markbad(struct mtd_info *mtd, loff_t ofs)
> +{
> +	struct spinand_chip *chip =3D mtd->priv;
> +	struct spi_device *spi_nand =3D chip->spi_nand;
> +	struct spinand_info *info =3D chip->info;
> +	u16 block_id;
> +	u8 is_bad =3D 0x00;=20
> +	u8 ret =3D 0;
> +
> +	spinand_get_device(mtd, FL_WRITING);
> +
> +	block_id =3D ofs >> info->block_shift;
> +
> +	chip->program_page(spi_nand, info,
> block_id*info->page_num_per_block, info->page_main_size, 1, &is_bad);
> +
> +	spinand_release_device(mtd);
> +
> +	return ret;
> +}
> +
> +
> +/**
> + * spinand_suspend - [MTD Interface] Suspend the spinand flash
> + * @param mtd		MTD device structure
> + */
> +static int spinand_suspend(struct mtd_info *mtd)
> +{
> +	return spinand_get_device(mtd, FL_PM_SUSPENDED);
> +}
> +
> +/**
> + * spinand_resume - [MTD Interface] Resume the spinand flash
> + * @param mtd		MTD device structure
> + */
> +static void spinand_resume(struct mtd_info *mtd)
> +{
> +	struct spinand_chip *this =3D mtd->priv;
> +
> +	if (this->state =3D=3D FL_PM_SUSPENDED)
> +		spinand_release_device(mtd);
> +	else
> +		printk(KERN_ERR "resume() called for the chip which is
> not"
> +				"in suspended state\n");
> +}
> +
> +/**
> + * spinand_mtd - add MTD device with parameters
> + * @param mtd		MTD device structure
> + *
> + * Add MTD device with parameters.
> + */
> +int spinand_mtd(struct mtd_info *mtd)
> +{
> +	struct spinand_chip *chip =3D mtd->priv;
> +	struct spinand_info *info =3D chip->info;
> +
> +	chip->state =3D FL_READY;
> +	init_waitqueue_head(&chip->wq);
> +	spin_lock_init(&chip->chip_lock);
> +
> +	mtd->name =3D info->name;
> +	mtd->size =3D info->usable_size;
> +	mtd->erasesize =3D info->block_main_size;
> +	mtd->writesize =3D info->page_main_size;
> +	mtd->oobsize =3D info->ecclayout->oobavail;
> +	mtd->owner =3D THIS_MODULE;
> +	mtd->type =3D MTD_NANDFLASH;
> +	mtd->flags =3D MTD_CAP_NANDFLASH;
> +
> +	mtd->ecclayout =3D info->ecclayout;
> +
> +	mtd->erase =3D spinand_erase;
> +	mtd->point =3D NULL;
> +	mtd->unpoint =3D NULL;
> +	mtd->read =3D spinand_read;
> +	mtd->write =3D spinand_write;
> +	mtd->read_oob =3D spinand_read_oob;
> +	mtd->write_oob =3D spinand_write_oob;
> +	mtd->sync =3D spinand_sync;
> +	mtd->lock =3D NULL;
> +	mtd->unlock =3D NULL;
> +	mtd->suspend =3D spinand_suspend;
> +	mtd->resume =3D spinand_resume;
> +	mtd->block_isbad =3D spinand_block_isbad;
> +	mtd->block_markbad =3D spinand_block_markbad;
> +=09
> +	return add_mtd_device(mtd) =3D=3D 1 ? -ENODEV : 0;
> +}
> +
> +void spinand_mtd_release(struct mtd_info *mtd)
> +{
> +	del_mtd_device(mtd);
> +}
> +
> +EXPORT_SYMBOL_GPL(spinand_mtd);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Henry Pan <hspan at micron.com>");
> +MODULE_DESCRIPTION("SPI NAND driver code");
> diff -urN linux-2.6.33.20-orig/include/linux/mtd/spinand.h
> linux-2.6.33.20/include/linux/mtd/spinand.h
> --- linux-2.6.33.20-orig/include/linux/mtd/spinand.h	1969-12-31
> 16:00:00.000000000 -0800
> +++ linux-2.6.33.20/include/linux/mtd/spinand.h	2010-05-19
> 04:28:07.000000000 -0700
> @@ -0,0 +1,160 @@
> +/*
> + *  linux/include/linux/mtd/spinand.h
> + *
> + Copyright (c) 2009-2010 Micron Technology, Inc.
> +
> +This software is licensed under the terms of the GNU General Public
> +License version 2, as published by the Free Software Foundation, and
> +may be copied, distributed, and modified under those terms.
> +
> +This program is distributed in the hope that it will be useful,
> +but WITHOUT ANY WARRANTY; without even the implied warranty of
> +MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +GNU General Public License for more details.
> +
> + *  Henry Pan <hspan at micron.com>
> + *
> + *  based on nand.h
> + */
> +#ifndef __LINUX_MTD_SPI_NAND_H
> +#define __LINUX_MTD_SPI_NAND_H
> +
> +#include <linux/wait.h>
> +#include <linux/spinlock.h>
> +#include <linux/mtd/mtd.h>
> +
> +/* cmd */
> +#define CMD_READ				0x13
> +#define CMD_READ_RDM			0x03
> +#define CMD_PROG_PAGE_CLRCACHE	0x02
> +#define CMD_PROG_PAGE			0x84
> +#define CMD_PROG_PAGE_EXC		0x10
> +#define CMD_ERASE_BLK			0xd8
> +#define CMD_WR_ENABLE			0x06
> +#define CMD_WR_DISABLE			0x04
> +#define CMD_READ_ID			0x9f
> +#define CMD_RESET				0xff
> +#define CMD_READ_REG			0x0f
> +#define CMD_WRITE_REG			0x1f
> +
> +/* feature/ status reg */
> +#define REG_BLOCK_LOCK		0xa0
> +#define REG_OTP				0xb0
> +#define REG_STATUS			0xc0/* timing */
> +
> +/* status */
> +#define STATUS_OIP_MASK		0x01
> +#define STATUS_READY		0 << 0
> +#define STATUS_BUSY			1 << 0
> +
> +#define STATUS_E_FAIL_MASK	0x04
> +#define STATUS_E_FAIL		1 << 2
> +
> +#define STATUS_P_FAIL_MASK 	0x08
> +#define STATUS_P_FAIL		1 << 3
> +
> +#define STATUS_ECC_MASK 	0x30
> +#define STATUS_ECC_1BIT_CORRECTED	1 << 4
> +#define STATUS_ECC_ERROR			2 << 4
> +#define STATUS_ECC_RESERVED			3 << 4
> +
> +
> +/*ECC enable defines*/
> +#define OTP_ECC_MASK		0x10
> +#define OTP_ECC_OFF			0
> +#define OTP_ECC_ON			1
> +
> +#define ECC_DISABLED
> +#define ECC_IN_NAND  =20
> +#define ECC_SOFT
> +
> +/* block lock */
> +#define BL_ALL_LOCKED      0x38=20
> +#define BL_1_2_LOCKED      0x30
> +#define BL_1_4_LOCKED      0x28
> +#define BL_1_8_LOCKED      0x20
> +#define BL_1_16_LOCKED     0x18
> +#define BL_1_32_LOCKED     0x10
> +#define BL_1_64_LOCKED     0x08
> +#define BL_ALL_UNLOCKED    0
> +
> +/**********************************************************************
> ******/
> +
> +struct spinand_info {
> +	u8		mid;
> +	u8		did;
> +	char		*name;
> +	u64		nand_size;
> +	u64		usable_size;
> +
> +	u32		block_size;
> +	u32		block_main_size;
> +	/*u32		block_spare_size; */
> +	u16		block_num_per_chip;
> +=09
> +	u16		page_size;
> +	u16		page_main_size;
> +	u16		page_spare_size;
> +	u16		page_num_per_block;
> +=09
> +	u8		block_shift;
> +	u32		block_mask;
> +
> +	u8		page_shift;
> +	u16		page_mask;
> +
> +	struct nand_ecclayout *ecclayout;
> +};
> +
> +typedef enum {
> +	FL_READY,
> +	FL_READING,
> +	FL_WRITING,
> +	FL_ERASING,
> +	FL_SYNCING,
> +	FL_LOCKING,
> +	FL_RESETING,
> +	FL_OTPING,
> +	FL_PM_SUSPENDED,
> +} spinand_state_t;
> +=09
> +struct spinand_chip { /* used for multi chip */
> +	spinlock_t		chip_lock;
> +	wait_queue_head_t wq;=09
> +	spinand_state_t	state;
> +	struct spi_device	*spi_nand;
> +	struct spinand_info *info;
> +	/*struct mtd_info	*mtd; */
> +
> +	int (*reset) (struct spi_device *spi_nand);
> +	int (*read_id) (struct spi_device *spi_nand, u8* id);
> +	int (*read_page) (struct spi_device *spi_nand, struct
> spinand_info *info, u16 page_id, u16 offset, u16 len, u8* rbuf);
> +	int (*program_page) (struct spi_device *spi_nand, struct
> spinand_info *info, u16 page_id, u16 offset, u16 len, u8* wbuf);
> +	int (*erase_block) (struct spi_device *spi_nand, struct
> spinand_info *info, u16 block_id);
> +
> +	u8 *buf;
> +	u8 *oobbuf; /* temp buffer */
> +
> +
> +#ifdef CONFIG_MTD_SPINAND_SWECC
> +	u8 ecc_calc[12];
> +	u8 ecc_code[12];
> +#endif
> +};
> +
> +struct spinand_cmd {
> +	u8 cmd;
> +	unsigned n_addr;=09
> +	u8 addr[3];
> +	unsigned n_dummy;
> +	unsigned n_tx;=09
> +	u8 *tx_buf;
> +	unsigned n_rx;
> +	u8 *rx_buf;
> +};
> +
> +extern int spinand_mtd(struct mtd_info *mtd);
> +extern void spinand_mtd_release(struct mtd_info *mtd);
> +
> +
> +#endif /* __LINUX_MTD_SPI_NAND_H */

Thanks,
Kamlakant Patel
