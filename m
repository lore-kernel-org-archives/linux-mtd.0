Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEp47-00033L-6e
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 16:55:08 +0000
Date: Tue, 15 Jan 2008 17:46:13 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Ben Hutchings <bhutchings@solarflare.com>
Subject: Re: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver (2nd
	try)
Message-ID: <20080115164613.GC22338@lazybastard.org>
References: <47866921.40904@solarflare.com>
	<20080114170358.GO3544@solarflare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080114170358.GO3544@solarflare.com>
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 January 2008 17:04:00 +0000, Ben Hutchings wrote:
> 
> This patch contains just the MTD driver code (mtd.c) and the two most
> important header files it shares with our net driver.  The low-level
> code to access the SPI bus through the network controller is not
> included (and is unchanged from last time aside from a small change to
> length validation).  Hopefully this should be more amenable to review,
> though it cannot be compiled.

Hehe.  Maybe next time I can get both?  

Most comments below are fairly generic and can be applied many times
over, both for mtd.c and the rest.

> --- /dev/null	2008-01-02 10:46:54.505379063 +0000
> +++ drivers/net/sfc/mtd.c	2008-01-14 16:32:46.000000000 +0000
> @@ -0,0 +1,655 @@
> +/****************************************************************************
> + * Driver for Solarflare network controllers
> + *           (including support for SFE4001 10GBT NIC)
> + *
> + * Copyright 2005-2006: Fen Systems Ltd.
> + * Copyright 2006-2008: Solarflare Communications Inc,
> + *                      9501 Jeronimo Road, Suite 250,
> + *                      Irvine, CA 92618, USA
> + *
> + * Initially developed by Michael Brown <mbrown@fensystems.co.uk>
> + * Maintained by Solarflare Communications <linux-net-drivers@solarflare.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published
> + * by the Free Software Foundation, incorporated herein by reference.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> + ****************************************************************************

Those GPL preambles in every file sure suck.  I guess you cannot
convince your corporate lawyers to remove them.  But at least you can
kill those stars-only lines.

> + */
> +
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/delay.h>
> +
> +#define EFX_DRIVER_NAME "sfc_mtd"
> +#include "driverlink_api.h"
> +#include "net_driver.h"
> +#include "spi.h"
> +
> +/*
> + * Flash and EEPROM (MTD) device driver
> + *
> + * This file provides a separate kernel module (sfc_mtd) which
> + * exposes the flash and EEPROM devices present on Solarflare NICs as
> + * MTD devices, enabling you to reflash the boot ROM code (or use the
> + * remaining space on the flash as a jffs2 filesystem, should you want
> + * to do so).
> + */
> +
> +#define EFX_MTD_VERIFY_BUF_LEN 4096
> +#define EFX_MAX_PARTITIONS 2
> +#define EFX_FLASH_BOOTROM_OFFSET 0x8000U
> +
> +/* Write enable for EEPROM/Flash configuration area
> + *
> + * Normally, writes to parts of non-volatile storage which contain
> + * critical configuration are disabled to prevent accidents.  This
> + * parameter allows enabling of such writes.
> + */
> +static unsigned int efx_allow_nvconfig_writes;
> +
> +struct efx_mtd {
> +	struct mtd_info mtd;
> +	struct mtd_partition mtd_part[EFX_MAX_PARTITIONS];
> +	struct semaphore access_lock;
> +	char part_name[EFX_MAX_PARTITIONS][32];
> +	char name[32];
> +	struct efx_dl_device *efx_dev; /* driverlink */

Rename to struct efx_driver_link and kill the comment?

> +	struct efx_nic *efx; 
> +	struct efx_spi_device *spi;

Needing three seperate pointers to some struct efc_* is... interesting.
Usually one would be enough and the other two can be derived.

> +};
> +
> +/**************************************************************************
> + *
> + * SPI flash/EEPROM utilities
> + *
> + **************************************************************************/

Is this comment necessary?

> +static int efx_spi_fast_wait(struct efx_mtd *efx_mtd)
> +{
> +	struct efx_spi_device *spi = efx_mtd->spi;
> +	u8 status;
> +	int i, rc;
> +
> +	/* Wait up to 1000us for flash/EEPROM to finish a fast operation. */
> +	for (i = 0; i < 50; i++) {
> +		udelay(20);
> +
> +		rc = spi->read(spi, efx_mtd->efx, SPI_RDSR, -1,
> +			       &status, sizeof(status));
> +		if (rc != 0)

if (rc)

> +			return rc;
> +		if (!(status & SPI_STATUS_NRDY))
> +			return 0;
> +	}
> +	EFX_ERR(efx_mtd->efx, "timed out waiting for %s last status=0x%02x\n",
> +		efx_mtd->name, status);
> +	return -ETIMEDOUT;
> +}
> +
> +static int efx_spi_slow_wait(struct efx_mtd *efx_mtd)
> +{
> +	struct efx_spi_device *spi = efx_mtd->spi;
> +	u8 status;
> +	int rc, i;
> +
> +	/* Wait up to 4s for flash/EEPROM to finish a slow operation. */
> +	for (i = 0; i < 40; i++) {
> +		schedule_timeout_interruptible(HZ / 10);
> +		rc = spi->read(spi, efx_mtd->efx, SPI_RDSR, -1,
> +			       &status, sizeof(status));
> +		if (rc != 0)
> +			return rc;
> +		if (!(status & SPI_STATUS_NRDY))
> +			return 0;
> +		if (signal_pending(current))
> +			return -EINTR;
> +	}
> +	EFX_ERR(efx_mtd->efx, "timed out waiting for %s\n", efx_mtd->name);
> +	return -ETIMEDOUT;
> +}
> +
> +/* Enable flash/EEPROM programming (and erasure). */
> +static inline int

With today's compilers, "inline" is fairly pointless, unless you have
tricky inline assembly.

> +efx_spi_write_enable(struct efx_mtd *efx_mtd)
> +{
> +	struct efx_spi_device *spi = efx_mtd->spi;
> +
> +	return spi->write(spi, efx_mtd->efx, SPI_WREN, -1, NULL, 0);
> +}
> +
> +/* Remove any write protection on the flash/EEPROM. */

Self-evident to flash people.

> +static int efx_spi_unlock(struct efx_mtd *efx_mtd)
> +{
> +	struct efx_spi_device *spi = efx_mtd->spi;
> +	const u8 unlock_mask = (SPI_STATUS_BP2 | SPI_STATUS_BP1 |
> +				     SPI_STATUS_BP0);
> +	u8 status;
> +	int rc;
> +
> +	rc = spi->read(spi, efx_mtd->efx, SPI_RDSR, -1, &status,
> +		       sizeof(status));
> +	if (rc != 0)
> +		return rc;
> +
> +	if (!(status & unlock_mask))
> +		return 0; /* already unlocked */
> +
> +	rc = efx_spi_write_enable(efx_mtd);
> +	if (rc != 0)
> +		return rc;
> +	rc = spi->write(spi, efx_mtd->efx, SPI_SST_EWSR, -1, NULL, 0);
> +	if (rc != 0)
> +		return rc;
> +
> +	status &= ~unlock_mask;
> +	rc = spi->write(spi, efx_mtd->efx, SPI_WRSR, -1, &status,
> +			sizeof(status));
> +	if (rc != 0)
> +		return rc;
> +	rc = efx_spi_fast_wait(efx_mtd);
> +	if (rc != 0)
> +		return rc;
> +
> +	return 0;
> +}
> +
> +/* Dummy device used in case of a failed reset. */
> +
> +static int efx_spi_dummy_read(const struct efx_spi_device *spi,
> +			      struct efx_nic *efx, unsigned int command,
> +			      int address, void *data, unsigned int len)
> +{
> +	return -EIO;
> +}
> +
> +static int efx_spi_dummy_write(const struct efx_spi_device *spi,
> +			       struct efx_nic *efx, unsigned int command,
> +			       int address, const void *data, unsigned int len)
> +{
> +	return -EIO;
> +}
> +
> +static struct efx_spi_device efx_spi_dummy_device = {
> +	.block_size	= 1,
> +	.erase_command	= 0xff,
> +	.read		= efx_spi_dummy_read,
> +	.write		= efx_spi_dummy_write,
> +};
> +
> +/**************************************************************************
> + *
> + * Interface to MTD layer
> + *
> + **************************************************************************/

Kill.

> +static int efx_mtd_read(struct mtd_info *mtd, loff_t start, size_t len,
> +			size_t *retlen, u8 *buffer)
> +{
> +	struct efx_mtd *efx_mtd = (struct efx_mtd *)mtd->priv;
> +	struct efx_spi_device *spi;
> +	unsigned int command;
> +	unsigned int block_len;
> +	unsigned int pos = 0;
> +	int rc;
> +
> +	rc = down_interruptible(&efx_mtd->access_lock);
> +	if (rc != 0)
> +		goto out;
> +	spi = efx_mtd->spi;
> +
> +	while (pos < len) {
> +		block_len = min((unsigned int)len - pos,
> +				efx_spi_read_limit(spi, start + pos));
> +		command = efx_spi_munge_command(spi, SPI_READ, start + pos);
> +		rc = spi->read(spi, efx_mtd->efx, command, start + pos,
> +			       buffer + pos, block_len);
> +		if (rc != 0)
> +			goto out_up;
> +		pos += block_len;
> +
> +		/* Avoid locking up the system */
> +		cond_resched();
> +		if (signal_pending(current))
> +			return -EINTR;
> +	}
> +
> +out_up:
> +	up(&efx_mtd->access_lock);
> +out:
> +	*retlen = pos;
> +	return rc;
> +}
> +
> +/* Check that device contents are as expected.  If buffer is NULL,
> + * contents will be checked to be empty (i.e. all 0xff).
> + */
> +static int efx_mtd_verify(struct mtd_info *mtd, loff_t offset,
> +			  size_t len, const u8 *buffer)
> +{
> +	struct efx_mtd *efx_mtd = (struct efx_mtd *)mtd->priv;

Remove cast.

> +	u8 *verify_buffer = NULL;
> +	size_t buf_len;
> +	size_t read_len;
> +	int i;
> +	u8 expected = 0xff;
> +	int rc = 0;
> +
> +	verify_buffer = kmalloc(EFX_MTD_VERIFY_BUF_LEN, GFP_KERNEL);
> +	if (!verify_buffer) {
> +		rc = -ENOMEM;
> +		goto out;
> +	}
> +
> +	/* Check device contents, EFX_MTD_VERIFY_BUF_LEN at a time */
> +	while (len > 0) {
> +		buf_len = ((len < EFX_MTD_VERIFY_BUF_LEN) ?
> +			   len : EFX_MTD_VERIFY_BUF_LEN);
> +		rc = efx_mtd_read(mtd, offset, buf_len, &read_len,
> +				  verify_buffer);
> +		if (rc != 0)
> +			goto out;
> +		EFX_ASSERT(read_len == buf_len);

You can replace EFX_ASSERT with BUG_ON (with negated condition)
throughout the code.  Duplicating existing kernel infrastructure needs a
very good reason to be accepted.

> +		/* Check contents */
> +		for (i = 0; i < buf_len; i++) {
> +			if (buffer)
> +				expected = buffer[i];
> +			if (verify_buffer[i] != expected) {
> +				EFX_ERR(efx_mtd->efx, "%s offset %lx contains "
> +					"%02x, should be %02x\n", efx_mtd->name,
> +					(unsigned long)(offset + i),
> +					verify_buffer[i], expected);
> +				rc = -EIO;
> +				goto out;
> +			}
> +		}

Home-brewn memcmp?

> +
> +		if (buffer)
> +			buffer += buf_len;
> +		offset += buf_len;
> +		len -= buf_len;
> +	}
> +	EFX_ASSERT(len == 0);
> +
> +out:
> +	kfree(verify_buffer);
> +
> +	return rc;
> +}
> +
> +static int efx_mtd_erase(struct mtd_info *mtd, struct erase_info *erase)
> +{
> +	struct efx_mtd *efx_mtd = (struct efx_mtd *)mtd->priv;
> +	struct efx_spi_device *spi;
> +	int rc;
> +
> +	rc = down_interruptible(&efx_mtd->access_lock);

What is this semaphore protecting?

> +	if (rc != 0)
> +		goto out;
> +	spi = efx_mtd->spi;
> +	if (spi->erase_command == 0) {
> +		rc = -EOPNOTSUPP;
> +		goto out_up;
> +	}
> +	if (erase->len != efx_mtd->mtd.erasesize) {
> +		rc = -EINVAL;
> +		goto out_up;
> +	}

I bet that none of the above needs such protection.  Please have the
semaphore (and any locks, for that matter) cover the least amount of
code possible.

> +	rc = efx_spi_unlock(efx_mtd);

It appears, as if the semaphore could be dropped here and retaken later.
If so, please do.  And immediatly after that, move the semaphore into
efx_spi_unlock().  Repeat and try to push it as far down the callchain
as possible.

My gut instinct tells me that you can push it through to only protect
the pure bus access and don't need a semaphore in mtd.c at all.  At that
point you can probably replace it with a mutex.  Maybe I am wrong, but
even then please cover the least amount of code possible.  And do
document what the semaphore is protecting.

> +	if (rc != 0)
> +		goto out_up;
> +	rc = efx_spi_write_enable(efx_mtd);
> +	if (rc != 0)
> +		goto out_up;
> +	rc = spi->write(spi, efx_mtd->efx, spi->erase_command, erase->addr,
> +			NULL, 0);
> +	if (rc != 0)
> +		goto out_up;
> +	rc = efx_spi_slow_wait(efx_mtd);
> +
> +out_up:
> +	up(&efx_mtd->access_lock);
> +	if (rc == 0)
> +		rc = efx_mtd_verify(mtd, erase->addr, erase->len, NULL);
> +out:
> +	if (rc == 0) {
> +		erase->state = MTD_ERASE_DONE;
> +	} else {
> +		erase->state = MTD_ERASE_FAILED;
> +		erase->fail_addr = 0xffffffff;

???

> +	}
> +	mtd_erase_callback(erase);
> +	return rc;
> +}
> +
> +static int efx_mtd_write(struct mtd_info *mtd, loff_t start,
> +			 size_t len, size_t *retlen, const u8 *buffer)
> +{
> +	struct efx_mtd *efx_mtd = (struct efx_mtd *)mtd->priv;
> +	struct efx_spi_device *spi;
> +	unsigned int command;
> +	unsigned int block_len;
> +	unsigned int pos = 0;
> +	int rc;
> +
> +	rc = down_interruptible(&efx_mtd->access_lock);
> +	if (rc != 0)
> +		goto out;
> +	spi = efx_mtd->spi;
> +
> +	rc = efx_spi_unlock(efx_mtd);
> +	if (rc != 0)
> +		goto out_up;
> +
> +	while (pos < len) {
> +		rc = efx_spi_write_enable(efx_mtd);
> +		if (rc != 0)
> +			goto out_up;
> +
> +		block_len = min((unsigned int)len - pos,
> +				efx_spi_write_limit(spi, start + pos));
> +		command = efx_spi_munge_command(spi, SPI_WRITE, start + pos);
> +		rc = spi->write(spi, efx_mtd->efx, command, start + pos,
> +				buffer + pos, block_len);
> +		if (rc != 0)
> +			goto out_up;
> +		pos += block_len;
> +
> +		rc = efx_spi_fast_wait(efx_mtd);
> +		if (rc != 0)
> +			goto out_up;
> +
> +		/* Avoid locking up the system */
> +		cond_resched();
> +		if (signal_pending(current)) {
> +			rc = -EINTR;
> +			goto out_up;
> +		}
> +	}
> +
> +out_up:
> +	up(&efx_mtd->access_lock);
> +	if (rc == 0)
> +		rc = efx_mtd_verify(mtd, start, len, buffer);
> +out:
> +	*retlen = pos;
> +	return rc;
> +}
> +
> +static void efx_mtd_sync(struct mtd_info *mtd)
> +{
> +	struct efx_mtd *efx_mtd = (struct efx_mtd *)mtd->priv;
> +	int rc;
> +
> +	down(&efx_mtd->access_lock);
> +	rc = efx_spi_slow_wait(efx_mtd);
> +	if (rc != 0)
> +		EFX_ERR(efx_mtd->efx, "%s sync failed (%d)\n",
> +			efx_mtd->name, rc);

How do you handle -EINTR?

> +	up(&efx_mtd->access_lock);
> +}
> +
> +/**************************************************************************
> + *
> + * Efx MTD device driver
> + *
> + **************************************************************************/

Kill.

> +/* Prepare for device reset */
> +static void efx_mtd_reset_suspend(struct efx_dl_device *efx_dev)
> +{
> +	struct efx_mtd *efx_mtd = efx_dev->priv;
> +
> +	if (!efx_mtd)
> +		return;
> +
> +	/* Acquire lock to ensure that any in-progress operations have
> +	 * completed, and no new ones can start.
> +	 */
> +	down(&efx_mtd->access_lock);
> +}
> +
> +/* Resume after device reset */
> +static void efx_mtd_reset_resume(struct efx_dl_device *efx_dev, int ok)
> +{
> +	struct efx_mtd *efx_mtd = efx_dev->priv;
> +
> +	if (!efx_mtd)
> +		return;
> +
> +	/* If device reset failed already, or SPI device doesn't
> +	 * become ready, disable device.
> +	 */
> +	if (!ok || efx_spi_slow_wait(efx_mtd) != 0) {
> +		efx_mtd->spi = &efx_spi_dummy_device;
> +		EFX_ERR(efx_mtd->efx, "%s disabled after failed reset\n",
> +			efx_mtd->name);
> +	}
> +
> +	up(&efx_mtd->access_lock);
> +}
> +
> +static void efx_mtd_remove(struct efx_dl_device *efx_dev)
> +{
> +	struct efx_mtd *efx_mtd = efx_dev->priv;
> +
> +	del_mtd_partitions(&efx_mtd->mtd);
> +	kfree(efx_mtd);
> +	efx_dev->priv = NULL;
> +}
> +
> +static int __devinit
> +efx_mtd_probe(struct efx_dl_device *efx_dev, struct efx_nic *efx,
> +	      struct efx_spi_device *spi,
> +	      const char *mtd_type_name, struct mtd_info *template,
> +	      struct mtd_partition *partitions, unsigned int num_partitions)
> +{
> +	struct efx_mtd *efx_mtd;
> +	size_t s = sizeof(efx_mtd->name);
> +	int rc;
> +	int i;
> +
> +	efx_mtd = kzalloc(sizeof(*efx_mtd), GFP_KERNEL);
> +	if (!efx_mtd)
> +		goto err_mem;
> +	efx_dev->priv = efx_mtd;
> +
> +	/* Initialise structure */
> +	efx_mtd->efx_dev = efx_dev;
> +	efx_mtd->efx = efx;
> +	efx_mtd->spi = spi;
> +	sema_init(&efx_mtd->access_lock, 1);
> +	memcpy(&efx_mtd->mtd, template, sizeof(efx_mtd->mtd));

I'm not too fond of this memcpy approach.  In particular because this
function is called probe and does no such thing.

Instead this function could allocate a structure and initialize any
common fields.  Remaining fields would then be initialized in the two
actual probe functions below.

> +	if (snprintf(efx_mtd->name, s, "%s %s", efx_mtd->efx->name,
> +		     mtd_type_name) >= s)
> +		goto err_len;
> +
> +	efx_mtd->mtd.priv = efx_mtd;
> +	efx_mtd->mtd.name = efx_mtd->name;
> +	efx_mtd->mtd.erase = efx_mtd_erase;
> +	efx_mtd->mtd.read = efx_mtd_read;
> +	efx_mtd->mtd.write = efx_mtd_write;
> +	efx_mtd->mtd.sync = efx_mtd_sync;
> +
> +	EFX_ASSERT(template->numeraseregions == 0);
> +
> +	EFX_ASSERT(partitions != NULL);
> +	EFX_ASSERT(num_partitions > 0);
> +	EFX_ASSERT(num_partitions <= EFX_MAX_PARTITIONS);

And I assume most of these assertions are bogus and can be removed.

> +	s = sizeof(efx_mtd->part_name[0]);
> +
> +	for (i = 0; i < num_partitions; i++) {
> +		memcpy(&efx_mtd->mtd_part[i], &partitions[i],
> +		       sizeof(efx_mtd->mtd_part[i]));
> +		if (snprintf(efx_mtd->part_name[i], s, "%s %s",
> +			     efx_mtd->efx->name, partitions[i].name) >= s)
> +			goto err_len;
> +
> +		efx_mtd->mtd_part[i].name = efx_mtd->part_name[i];
> +		if (efx_allow_nvconfig_writes != 0)
> +			efx_mtd->mtd_part[i].mask_flags &= ~MTD_WRITEABLE;
> +	}
> +
> +	rc = add_mtd_partitions(&efx_mtd->mtd, efx_mtd->mtd_part,
> +				num_partitions);
> +	if (rc != 0)
> +		goto err;
> +
> +	return 0;
> +
> + err_mem:
> +	rc = -ENOMEM;
> +	goto err;
> + err_len:
> +	rc = -ENAMETOOLONG;
> + err:
> +	efx_mtd_remove(efx_dev);
> +	return rc;
> +}
> +
> +static int __devinit
> +efx_flash_probe(struct efx_dl_device *efx_dev,
> +		const struct net_device *net_dev,
> +		const struct efx_dl_device_info *dev_info,
> +		const char *silicon_rev)
> +{
> +	struct efx_nic *efx = efx_dl_get_nic_port(efx_dev)->efx;
> +	struct mtd_partition partitions[2] = {};
> +	unsigned int num_partitions;
> +	struct mtd_info template = {
> +		.numeraseregions = 0,
> +		.type = MTD_NORFLASH,
> +		.flags = MTD_CAP_NORFLASH,
> +		.writesize = 1
> +	};
> +
> +	if (!efx->spi_flash)
> +		return -EINVAL;
> +
> +	template.size = efx->spi_flash->size;
> +	template.erasesize = efx->spi_flash->erase_size;
> +
> +	partitions[0].name = "sfc_flash_config";
> +	partitions[0].offset = 0;
> +	partitions[0].size = min(efx->spi_flash->size,
> +				 EFX_FLASH_BOOTROM_OFFSET);
> +	partitions[0].mask_flags = MTD_WRITEABLE;
> +
> +	if (efx->spi_flash->size <= EFX_FLASH_BOOTROM_OFFSET) {
> +		num_partitions = 1;
> +	} else {
> +		/* Expansion ROM image */
> +		partitions[1].name = "sfc_flash_bootrom";
> +		partitions[1].offset = EFX_FLASH_BOOTROM_OFFSET;
> +		partitions[1].size = (efx->spi_flash->size
> +				      - EFX_FLASH_BOOTROM_OFFSET);
> +		num_partitions = 2;
> +	}
> +
> +	return efx_mtd_probe(efx_dev, efx, efx->spi_flash,
> +			     "sfc_flash", &template,
> +			     partitions, num_partitions);
> +}
> +
> +static struct efx_dl_driver efx_flash_driver = {
> +	.name		= "sfc_flash",
> +	.probe		= efx_flash_probe,
> +	.remove		= efx_mtd_remove,
> +	.reset_suspend	= efx_mtd_reset_suspend,
> +	.reset_resume	= efx_mtd_reset_resume,
> +};
> +
> +static int __devinit
> +efx_eeprom_probe(struct efx_dl_device *efx_dev,
> +		 const struct net_device *net_dev,
> +		 const struct efx_dl_device_info *dev_info,
> +		 const char *silicon_rev)
> +{
> +	struct efx_nic *efx = efx_dl_get_nic_port(efx_dev)->efx;
> +	struct mtd_partition partitions[1] = {};
> +	struct mtd_info template = {
> +		.numeraseregions = 0,
> +		.type = MTD_DATAFLASH,
> +		.flags = MTD_WRITEABLE,
> +		.writesize = 1
> +	};
> +	const char *mtd_type_name;
> +
> +	if (!efx->spi_eeprom)
> +		return -EINVAL;
> +
> +	template.size = efx->spi_eeprom->size;
> +	template.erasesize = efx->spi_eeprom->size;
> +
> +	partitions[0].offset = 0;
> +	partitions[0].size = efx->spi_eeprom->size;
> +	partitions[0].mask_flags = MTD_WRITEABLE;
> +
> +	if (efx->spi_eeprom->size <= 0x200) {
> +		mtd_type_name = "sfc_small_eeprom";
> +		partitions[0].name = "sfc_small_config";
> +	} else {
> +		mtd_type_name = "sfc_large_eeprom";
> +		partitions[0].name = "sfc_large_config";
> +	}
> +
> +	return efx_mtd_probe(efx_dev, efx, efx->spi_eeprom,
> +			     mtd_type_name, &template,
> +			     partitions, 1);
> +}
> +
> +static struct efx_dl_driver efx_eeprom_driver = {
> +	.name		= "sfc_eeprom",
> +	.probe		= efx_eeprom_probe,
> +	.remove		= efx_mtd_remove,
> +	.reset_suspend	= efx_mtd_reset_suspend,
> +	.reset_resume	= efx_mtd_reset_resume,
> +};
> +
> +/**************************************************************************
> + *
> + * Kernel module interface
> + *
> + **************************************************************************
> + *
> + */

Kill.

> +static int __init efx_mtd_init_module(void)
> +{
> +	int rc;
> +
> +	rc = efx_dl_register_driver(&efx_flash_driver);
> +	if (rc != 0)
> +		return rc;
> +	rc = efx_dl_register_driver(&efx_eeprom_driver);
> +	if (rc != 0) {
> +		efx_dl_unregister_driver(&efx_flash_driver);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit efx_mtd_exit_module(void)
> +{
> +	efx_dl_unregister_driver(&efx_eeprom_driver);
> +	efx_dl_unregister_driver(&efx_flash_driver);
> +}
> +
> +module_init(efx_mtd_init_module);
> +module_exit(efx_mtd_exit_module);
> +
> +MODULE_AUTHOR("Michael Brown <mbrown@fensystems.co.uk> and "
> +	      "Solarflare Communications");
> +MODULE_DESCRIPTION("SFC MTD driver");
> +MODULE_LICENSE("GPL");

Jörn

-- 
Linux is more the core point of a concept that surrounds "open source"
which, in turn, is based on a false concept. This concept is that
people actually want to look at source code.
-- Rob Enderle
