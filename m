Received: from rutherford.zen.co.uk ([212.23.3.142])
	by pentafluge.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JESnA-00033l-Jm
	for linux-mtd@lists.infradead.org; Mon, 14 Jan 2008 17:08:23 +0000
Received: from [82.69.137.158] (helo=opal.uk.level5networks.com)
	by rutherford.zen.co.uk with esmtp (Exim 4.63)
	(envelope-from <bwh@solarflare.com>) id 1JESjB-0000JB-00
	for linux-mtd@lists.infradead.org; Mon, 14 Jan 2008 17:04:01 +0000
Date: Mon, 14 Jan 2008 17:04:00 +0000
From: Ben Hutchings <bhutchings@solarflare.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver (2nd try)
Message-ID: <20080114170358.GO3544@solarflare.com>
References: <47866921.40904@solarflare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47866921.40904@solarflare.com>
Sender: "Ben Hutchings <bhutchings>" <bwh@solarflare.com>
Cc: linux-net-drivers@solarflare.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We've taken Jörn Engel's advice on board and simplified this driver
as far as I think we can:

- Deleted obvious comments
- Deleted redundant eraseregion definitions
- Replaced efx_mtd_operations with an efx_spi_device pointer in
  efx_mtd, since the implementations only differed in the
  device pointer they passed to other functions
- Deleted redundant log messages
- Combined some functions that were only ever used together
- Replaced dead flag on efx_mtd with a dummy efx_spi_device that
  fails all operations
- Fixed confusion between various length limits for SPI commands
- Renamed falcon_*() functions to efx_*(), as they are not specific
  to Falcon hardware
- Changed the sync implementation efx_mtd_sync() to call
  efx_spi_slow_wait(), which I think matches the required semantics.
  This is usually redundant since write and erase operations wait for
  the SPI device to become ready before returning, but if an earlier
  operation was interrupted then this may have some effect.

This patch contains just the MTD driver code (mtd.c) and the two most
important header files it shares with our net driver.  The low-level
code to access the SPI bus through the network controller is not
included (and is unchanged from last time aside from a small change to
length validation).  Hopefully this should be more amenable to review,
though it cannot be compiled.

Ben.

--- /dev/null	2008-01-02 10:46:54.505379063 +0000
+++ drivers/net/sfc/mtd.c	2008-01-14 16:32:46.000000000 +0000
@@ -0,0 +1,655 @@
+/****************************************************************************
+ * Driver for Solarflare network controllers
+ *           (including support for SFE4001 10GBT NIC)
+ *
+ * Copyright 2005-2006: Fen Systems Ltd.
+ * Copyright 2006-2008: Solarflare Communications Inc,
+ *                      9501 Jeronimo Road, Suite 250,
+ *                      Irvine, CA 92618, USA
+ *
+ * Initially developed by Michael Brown <mbrown@fensystems.co.uk>
+ * Maintained by Solarflare Communications <linux-net-drivers@solarflare.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published
+ * by the Free Software Foundation, incorporated herein by reference.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ ****************************************************************************
+ */
+
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/delay.h>
+
+#define EFX_DRIVER_NAME "sfc_mtd"
+#include "driverlink_api.h"
+#include "net_driver.h"
+#include "spi.h"
+
+/*
+ * Flash and EEPROM (MTD) device driver
+ *
+ * This file provides a separate kernel module (sfc_mtd) which
+ * exposes the flash and EEPROM devices present on Solarflare NICs as
+ * MTD devices, enabling you to reflash the boot ROM code (or use the
+ * remaining space on the flash as a jffs2 filesystem, should you want
+ * to do so).
+ */
+
+#define EFX_MTD_VERIFY_BUF_LEN 4096
+#define EFX_MAX_PARTITIONS 2
+#define EFX_FLASH_BOOTROM_OFFSET 0x8000U
+
+/* Write enable for EEPROM/Flash configuration area
+ *
+ * Normally, writes to parts of non-volatile storage which contain
+ * critical configuration are disabled to prevent accidents.  This
+ * parameter allows enabling of such writes.
+ */
+static unsigned int efx_allow_nvconfig_writes;
+
+struct efx_mtd {
+	struct mtd_info mtd;
+	struct mtd_partition mtd_part[EFX_MAX_PARTITIONS];
+	struct semaphore access_lock;
+	char part_name[EFX_MAX_PARTITIONS][32];
+	char name[32];
+	struct efx_dl_device *efx_dev; /* driverlink */
+	struct efx_nic *efx; 
+	struct efx_spi_device *spi;
+};
+
+/**************************************************************************
+ *
+ * SPI flash/EEPROM utilities
+ *
+ **************************************************************************/
+
+static int efx_spi_fast_wait(struct efx_mtd *efx_mtd)
+{
+	struct efx_spi_device *spi = efx_mtd->spi;
+	u8 status;
+	int i, rc;
+
+	/* Wait up to 1000us for flash/EEPROM to finish a fast operation. */
+	for (i = 0; i < 50; i++) {
+		udelay(20);
+
+		rc = spi->read(spi, efx_mtd->efx, SPI_RDSR, -1,
+			       &status, sizeof(status));
+		if (rc != 0)
+			return rc;
+		if (!(status & SPI_STATUS_NRDY))
+			return 0;
+	}
+	EFX_ERR(efx_mtd->efx, "timed out waiting for %s last status=0x%02x\n",
+		efx_mtd->name, status);
+	return -ETIMEDOUT;
+}
+
+static int efx_spi_slow_wait(struct efx_mtd *efx_mtd)
+{
+	struct efx_spi_device *spi = efx_mtd->spi;
+	u8 status;
+	int rc, i;
+
+	/* Wait up to 4s for flash/EEPROM to finish a slow operation. */
+	for (i = 0; i < 40; i++) {
+		schedule_timeout_interruptible(HZ / 10);
+		rc = spi->read(spi, efx_mtd->efx, SPI_RDSR, -1,
+			       &status, sizeof(status));
+		if (rc != 0)
+			return rc;
+		if (!(status & SPI_STATUS_NRDY))
+			return 0;
+		if (signal_pending(current))
+			return -EINTR;
+	}
+	EFX_ERR(efx_mtd->efx, "timed out waiting for %s\n", efx_mtd->name);
+	return -ETIMEDOUT;
+}
+
+/* Enable flash/EEPROM programming (and erasure). */
+static inline int
+efx_spi_write_enable(struct efx_mtd *efx_mtd)
+{
+	struct efx_spi_device *spi = efx_mtd->spi;
+
+	return spi->write(spi, efx_mtd->efx, SPI_WREN, -1, NULL, 0);
+}
+
+/* Remove any write protection on the flash/EEPROM. */
+static int efx_spi_unlock(struct efx_mtd *efx_mtd)
+{
+	struct efx_spi_device *spi = efx_mtd->spi;
+	const u8 unlock_mask = (SPI_STATUS_BP2 | SPI_STATUS_BP1 |
+				     SPI_STATUS_BP0);
+	u8 status;
+	int rc;
+
+	rc = spi->read(spi, efx_mtd->efx, SPI_RDSR, -1, &status,
+		       sizeof(status));
+	if (rc != 0)
+		return rc;
+
+	if (!(status & unlock_mask))
+		return 0; /* already unlocked */
+
+	rc = efx_spi_write_enable(efx_mtd);
+	if (rc != 0)
+		return rc;
+	rc = spi->write(spi, efx_mtd->efx, SPI_SST_EWSR, -1, NULL, 0);
+	if (rc != 0)
+		return rc;
+
+	status &= ~unlock_mask;
+	rc = spi->write(spi, efx_mtd->efx, SPI_WRSR, -1, &status,
+			sizeof(status));
+	if (rc != 0)
+		return rc;
+	rc = efx_spi_fast_wait(efx_mtd);
+	if (rc != 0)
+		return rc;
+
+	return 0;
+}
+
+/* Dummy device used in case of a failed reset. */
+
+static int efx_spi_dummy_read(const struct efx_spi_device *spi,
+			      struct efx_nic *efx, unsigned int command,
+			      int address, void *data, unsigned int len)
+{
+	return -EIO;
+}
+
+static int efx_spi_dummy_write(const struct efx_spi_device *spi,
+			       struct efx_nic *efx, unsigned int command,
+			       int address, const void *data, unsigned int len)
+{
+	return -EIO;
+}
+
+static struct efx_spi_device efx_spi_dummy_device = {
+	.block_size	= 1,
+	.erase_command	= 0xff,
+	.read		= efx_spi_dummy_read,
+	.write		= efx_spi_dummy_write,
+};
+
+/**************************************************************************
+ *
+ * Interface to MTD layer
+ *
+ **************************************************************************/
+
+static int efx_mtd_read(struct mtd_info *mtd, loff_t start, size_t len,
+			size_t *retlen, u8 *buffer)
+{
+	struct efx_mtd *efx_mtd = (struct efx_mtd *)mtd->priv;
+	struct efx_spi_device *spi;
+	unsigned int command;
+	unsigned int block_len;
+	unsigned int pos = 0;
+	int rc;
+
+	rc = down_interruptible(&efx_mtd->access_lock);
+	if (rc != 0)
+		goto out;
+	spi = efx_mtd->spi;
+
+	while (pos < len) {
+		block_len = min((unsigned int)len - pos,
+				efx_spi_read_limit(spi, start + pos));
+		command = efx_spi_munge_command(spi, SPI_READ, start + pos);
+		rc = spi->read(spi, efx_mtd->efx, command, start + pos,
+			       buffer + pos, block_len);
+		if (rc != 0)
+			goto out_up;
+		pos += block_len;
+
+		/* Avoid locking up the system */
+		cond_resched();
+		if (signal_pending(current))
+			return -EINTR;
+	}
+
+out_up:
+	up(&efx_mtd->access_lock);
+out:
+	*retlen = pos;
+	return rc;
+}
+
+/* Check that device contents are as expected.  If buffer is NULL,
+ * contents will be checked to be empty (i.e. all 0xff).
+ */
+static int efx_mtd_verify(struct mtd_info *mtd, loff_t offset,
+			  size_t len, const u8 *buffer)
+{
+	struct efx_mtd *efx_mtd = (struct efx_mtd *)mtd->priv;
+	u8 *verify_buffer = NULL;
+	size_t buf_len;
+	size_t read_len;
+	int i;
+	u8 expected = 0xff;
+	int rc = 0;
+
+	verify_buffer = kmalloc(EFX_MTD_VERIFY_BUF_LEN, GFP_KERNEL);
+	if (!verify_buffer) {
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	/* Check device contents, EFX_MTD_VERIFY_BUF_LEN at a time */
+	while (len > 0) {
+		buf_len = ((len < EFX_MTD_VERIFY_BUF_LEN) ?
+			   len : EFX_MTD_VERIFY_BUF_LEN);
+		rc = efx_mtd_read(mtd, offset, buf_len, &read_len,
+				  verify_buffer);
+		if (rc != 0)
+			goto out;
+		EFX_ASSERT(read_len == buf_len);
+		/* Check contents */
+		for (i = 0; i < buf_len; i++) {
+			if (buffer)
+				expected = buffer[i];
+			if (verify_buffer[i] != expected) {
+				EFX_ERR(efx_mtd->efx, "%s offset %lx contains "
+					"%02x, should be %02x\n", efx_mtd->name,
+					(unsigned long)(offset + i),
+					verify_buffer[i], expected);
+				rc = -EIO;
+				goto out;
+			}
+		}
+
+		if (buffer)
+			buffer += buf_len;
+		offset += buf_len;
+		len -= buf_len;
+	}
+	EFX_ASSERT(len == 0);
+
+out:
+	kfree(verify_buffer);
+
+	return rc;
+}
+
+static int efx_mtd_erase(struct mtd_info *mtd, struct erase_info *erase)
+{
+	struct efx_mtd *efx_mtd = (struct efx_mtd *)mtd->priv;
+	struct efx_spi_device *spi;
+	int rc;
+
+	rc = down_interruptible(&efx_mtd->access_lock);
+	if (rc != 0)
+		goto out;
+	spi = efx_mtd->spi;
+	if (spi->erase_command == 0) {
+		rc = -EOPNOTSUPP;
+		goto out_up;
+	}
+	if (erase->len != efx_mtd->mtd.erasesize) {
+		rc = -EINVAL;
+		goto out_up;
+	}
+
+	rc = efx_spi_unlock(efx_mtd);
+	if (rc != 0)
+		goto out_up;
+	rc = efx_spi_write_enable(efx_mtd);
+	if (rc != 0)
+		goto out_up;
+	rc = spi->write(spi, efx_mtd->efx, spi->erase_command, erase->addr,
+			NULL, 0);
+	if (rc != 0)
+		goto out_up;
+	rc = efx_spi_slow_wait(efx_mtd);
+
+out_up:
+	up(&efx_mtd->access_lock);
+	if (rc == 0)
+		rc = efx_mtd_verify(mtd, erase->addr, erase->len, NULL);
+out:
+	if (rc == 0) {
+		erase->state = MTD_ERASE_DONE;
+	} else {
+		erase->state = MTD_ERASE_FAILED;
+		erase->fail_addr = 0xffffffff;
+	}
+	mtd_erase_callback(erase);
+	return rc;
+}
+
+static int efx_mtd_write(struct mtd_info *mtd, loff_t start,
+			 size_t len, size_t *retlen, const u8 *buffer)
+{
+	struct efx_mtd *efx_mtd = (struct efx_mtd *)mtd->priv;
+	struct efx_spi_device *spi;
+	unsigned int command;
+	unsigned int block_len;
+	unsigned int pos = 0;
+	int rc;
+
+	rc = down_interruptible(&efx_mtd->access_lock);
+	if (rc != 0)
+		goto out;
+	spi = efx_mtd->spi;
+
+	rc = efx_spi_unlock(efx_mtd);
+	if (rc != 0)
+		goto out_up;
+
+	while (pos < len) {
+		rc = efx_spi_write_enable(efx_mtd);
+		if (rc != 0)
+			goto out_up;
+
+		block_len = min((unsigned int)len - pos,
+				efx_spi_write_limit(spi, start + pos));
+		command = efx_spi_munge_command(spi, SPI_WRITE, start + pos);
+		rc = spi->write(spi, efx_mtd->efx, command, start + pos,
+				buffer + pos, block_len);
+		if (rc != 0)
+			goto out_up;
+		pos += block_len;
+
+		rc = efx_spi_fast_wait(efx_mtd);
+		if (rc != 0)
+			goto out_up;
+
+		/* Avoid locking up the system */
+		cond_resched();
+		if (signal_pending(current)) {
+			rc = -EINTR;
+			goto out_up;
+		}
+	}
+
+out_up:
+	up(&efx_mtd->access_lock);
+	if (rc == 0)
+		rc = efx_mtd_verify(mtd, start, len, buffer);
+out:
+	*retlen = pos;
+	return rc;
+}
+
+static void efx_mtd_sync(struct mtd_info *mtd)
+{
+	struct efx_mtd *efx_mtd = (struct efx_mtd *)mtd->priv;
+	int rc;
+
+	down(&efx_mtd->access_lock);
+	rc = efx_spi_slow_wait(efx_mtd);
+	if (rc != 0)
+		EFX_ERR(efx_mtd->efx, "%s sync failed (%d)\n",
+			efx_mtd->name, rc);
+	up(&efx_mtd->access_lock);
+}
+
+/**************************************************************************
+ *
+ * Efx MTD device driver
+ *
+ **************************************************************************/
+
+/* Prepare for device reset */
+static void efx_mtd_reset_suspend(struct efx_dl_device *efx_dev)
+{
+	struct efx_mtd *efx_mtd = efx_dev->priv;
+
+	if (!efx_mtd)
+		return;
+
+	/* Acquire lock to ensure that any in-progress operations have
+	 * completed, and no new ones can start.
+	 */
+	down(&efx_mtd->access_lock);
+}
+
+/* Resume after device reset */
+static void efx_mtd_reset_resume(struct efx_dl_device *efx_dev, int ok)
+{
+	struct efx_mtd *efx_mtd = efx_dev->priv;
+
+	if (!efx_mtd)
+		return;
+
+	/* If device reset failed already, or SPI device doesn't
+	 * become ready, disable device.
+	 */
+	if (!ok || efx_spi_slow_wait(efx_mtd) != 0) {
+		efx_mtd->spi = &efx_spi_dummy_device;
+		EFX_ERR(efx_mtd->efx, "%s disabled after failed reset\n",
+			efx_mtd->name);
+	}
+
+	up(&efx_mtd->access_lock);
+}
+
+static void efx_mtd_remove(struct efx_dl_device *efx_dev)
+{
+	struct efx_mtd *efx_mtd = efx_dev->priv;
+
+	del_mtd_partitions(&efx_mtd->mtd);
+	kfree(efx_mtd);
+	efx_dev->priv = NULL;
+}
+
+static int __devinit
+efx_mtd_probe(struct efx_dl_device *efx_dev, struct efx_nic *efx,
+	      struct efx_spi_device *spi,
+	      const char *mtd_type_name, struct mtd_info *template,
+	      struct mtd_partition *partitions, unsigned int num_partitions)
+{
+	struct efx_mtd *efx_mtd;
+	size_t s = sizeof(efx_mtd->name);
+	int rc;
+	int i;
+
+	efx_mtd = kzalloc(sizeof(*efx_mtd), GFP_KERNEL);
+	if (!efx_mtd)
+		goto err_mem;
+	efx_dev->priv = efx_mtd;
+
+	/* Initialise structure */
+	efx_mtd->efx_dev = efx_dev;
+	efx_mtd->efx = efx;
+	efx_mtd->spi = spi;
+	sema_init(&efx_mtd->access_lock, 1);
+	memcpy(&efx_mtd->mtd, template, sizeof(efx_mtd->mtd));
+	if (snprintf(efx_mtd->name, s, "%s %s", efx_mtd->efx->name,
+		     mtd_type_name) >= s)
+		goto err_len;
+
+	efx_mtd->mtd.priv = efx_mtd;
+	efx_mtd->mtd.name = efx_mtd->name;
+	efx_mtd->mtd.erase = efx_mtd_erase;
+	efx_mtd->mtd.read = efx_mtd_read;
+	efx_mtd->mtd.write = efx_mtd_write;
+	efx_mtd->mtd.sync = efx_mtd_sync;
+
+	EFX_ASSERT(template->numeraseregions == 0);
+
+	EFX_ASSERT(partitions != NULL);
+	EFX_ASSERT(num_partitions > 0);
+	EFX_ASSERT(num_partitions <= EFX_MAX_PARTITIONS);
+	s = sizeof(efx_mtd->part_name[0]);
+
+	for (i = 0; i < num_partitions; i++) {
+		memcpy(&efx_mtd->mtd_part[i], &partitions[i],
+		       sizeof(efx_mtd->mtd_part[i]));
+		if (snprintf(efx_mtd->part_name[i], s, "%s %s",
+			     efx_mtd->efx->name, partitions[i].name) >= s)
+			goto err_len;
+
+		efx_mtd->mtd_part[i].name = efx_mtd->part_name[i];
+		if (efx_allow_nvconfig_writes != 0)
+			efx_mtd->mtd_part[i].mask_flags &= ~MTD_WRITEABLE;
+	}
+
+	rc = add_mtd_partitions(&efx_mtd->mtd, efx_mtd->mtd_part,
+				num_partitions);
+	if (rc != 0)
+		goto err;
+
+	return 0;
+
+ err_mem:
+	rc = -ENOMEM;
+	goto err;
+ err_len:
+	rc = -ENAMETOOLONG;
+ err:
+	efx_mtd_remove(efx_dev);
+	return rc;
+}
+
+static int __devinit
+efx_flash_probe(struct efx_dl_device *efx_dev,
+		const struct net_device *net_dev,
+		const struct efx_dl_device_info *dev_info,
+		const char *silicon_rev)
+{
+	struct efx_nic *efx = efx_dl_get_nic_port(efx_dev)->efx;
+	struct mtd_partition partitions[2] = {};
+	unsigned int num_partitions;
+	struct mtd_info template = {
+		.numeraseregions = 0,
+		.type = MTD_NORFLASH,
+		.flags = MTD_CAP_NORFLASH,
+		.writesize = 1
+	};
+
+	if (!efx->spi_flash)
+		return -EINVAL;
+
+	template.size = efx->spi_flash->size;
+	template.erasesize = efx->spi_flash->erase_size;
+
+	partitions[0].name = "sfc_flash_config";
+	partitions[0].offset = 0;
+	partitions[0].size = min(efx->spi_flash->size,
+				 EFX_FLASH_BOOTROM_OFFSET);
+	partitions[0].mask_flags = MTD_WRITEABLE;
+
+	if (efx->spi_flash->size <= EFX_FLASH_BOOTROM_OFFSET) {
+		num_partitions = 1;
+	} else {
+		/* Expansion ROM image */
+		partitions[1].name = "sfc_flash_bootrom";
+		partitions[1].offset = EFX_FLASH_BOOTROM_OFFSET;
+		partitions[1].size = (efx->spi_flash->size
+				      - EFX_FLASH_BOOTROM_OFFSET);
+		num_partitions = 2;
+	}
+
+	return efx_mtd_probe(efx_dev, efx, efx->spi_flash,
+			     "sfc_flash", &template,
+			     partitions, num_partitions);
+}
+
+static struct efx_dl_driver efx_flash_driver = {
+	.name		= "sfc_flash",
+	.probe		= efx_flash_probe,
+	.remove		= efx_mtd_remove,
+	.reset_suspend	= efx_mtd_reset_suspend,
+	.reset_resume	= efx_mtd_reset_resume,
+};
+
+static int __devinit
+efx_eeprom_probe(struct efx_dl_device *efx_dev,
+		 const struct net_device *net_dev,
+		 const struct efx_dl_device_info *dev_info,
+		 const char *silicon_rev)
+{
+	struct efx_nic *efx = efx_dl_get_nic_port(efx_dev)->efx;
+	struct mtd_partition partitions[1] = {};
+	struct mtd_info template = {
+		.numeraseregions = 0,
+		.type = MTD_DATAFLASH,
+		.flags = MTD_WRITEABLE,
+		.writesize = 1
+	};
+	const char *mtd_type_name;
+
+	if (!efx->spi_eeprom)
+		return -EINVAL;
+
+	template.size = efx->spi_eeprom->size;
+	template.erasesize = efx->spi_eeprom->size;
+
+	partitions[0].offset = 0;
+	partitions[0].size = efx->spi_eeprom->size;
+	partitions[0].mask_flags = MTD_WRITEABLE;
+
+	if (efx->spi_eeprom->size <= 0x200) {
+		mtd_type_name = "sfc_small_eeprom";
+		partitions[0].name = "sfc_small_config";
+	} else {
+		mtd_type_name = "sfc_large_eeprom";
+		partitions[0].name = "sfc_large_config";
+	}
+
+	return efx_mtd_probe(efx_dev, efx, efx->spi_eeprom,
+			     mtd_type_name, &template,
+			     partitions, 1);
+}
+
+static struct efx_dl_driver efx_eeprom_driver = {
+	.name		= "sfc_eeprom",
+	.probe		= efx_eeprom_probe,
+	.remove		= efx_mtd_remove,
+	.reset_suspend	= efx_mtd_reset_suspend,
+	.reset_resume	= efx_mtd_reset_resume,
+};
+
+/**************************************************************************
+ *
+ * Kernel module interface
+ *
+ **************************************************************************
+ *
+ */
+
+static int __init efx_mtd_init_module(void)
+{
+	int rc;
+
+	rc = efx_dl_register_driver(&efx_flash_driver);
+	if (rc != 0)
+		return rc;
+	rc = efx_dl_register_driver(&efx_eeprom_driver);
+	if (rc != 0) {
+		efx_dl_unregister_driver(&efx_flash_driver);
+		return rc;
+	}
+
+	return 0;
+}
+
+static void __exit efx_mtd_exit_module(void)
+{
+	efx_dl_unregister_driver(&efx_eeprom_driver);
+	efx_dl_unregister_driver(&efx_flash_driver);
+}
+
+module_init(efx_mtd_init_module);
+module_exit(efx_mtd_exit_module);
+
+MODULE_AUTHOR("Michael Brown <mbrown@fensystems.co.uk> and "
+	      "Solarflare Communications");
+MODULE_DESCRIPTION("SFC MTD driver");
+MODULE_LICENSE("GPL");
--- /dev/null	2008-01-02 10:46:54.505379063 +0000
+++ drivers/net/sfc/spi.h	2008-01-14 16:32:46.000000000 +0000
@@ -0,0 +1,186 @@
+/****************************************************************************
+ * Driver for Solarflare network controllers
+ *           (including support for SFE4001 10GBT NIC)
+ *
+ * Copyright 2005:      Fen Systems Ltd.
+ * Copyright 2006:      Solarflare Communications Inc,
+ *                      9501 Jeronimo Road, Suite 250,
+ *                      Irvine, CA 92618, USA
+ *
+ * Initially developed by Michael Brown <mbrown@fensystems.co.uk>
+ * Maintained by Solarflare Communications <linux-net-drivers@solarflare.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published
+ * by the Free Software Foundation, incorporated herein by reference.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ ****************************************************************************
+ */
+
+#ifndef EFX_SPI_H
+#define EFX_SPI_H
+
+#include "net_driver.h"
+
+/**************************************************************************
+ *
+ * Basic SPI command set and bit definitions
+ *
+ *************************************************************************/
+
+/*
+ * Commands common to all known devices.
+ *
+ */
+
+/* Write status register */
+#define SPI_WRSR 0x01
+
+/* Write data to memory array */
+#define SPI_WRITE 0x02
+
+/* Read data from memory array */
+#define SPI_READ 0x03
+
+/* Reset write enable latch */
+#define SPI_WRDI 0x04
+
+/* Read status register */
+#define SPI_RDSR 0x05
+
+/* Set write enable latch */
+#define SPI_WREN 0x06
+
+/* SST: Enable write to status register */
+#define SPI_SST_EWSR 0x50
+
+/*
+ * Status register bits.  Not all bits are supported on all devices.
+ *
+ */
+
+/* Write-protect pin enabled */
+#define SPI_STATUS_WPEN 0x80
+
+/* Block protection bit 2 */
+#define SPI_STATUS_BP2 0x10
+
+/* Block protection bit 1 */
+#define SPI_STATUS_BP1 0x08
+
+/* Block protection bit 0 */
+#define SPI_STATUS_BP0 0x04
+
+/* State of the write enable latch */
+#define SPI_STATUS_WEN 0x02
+
+/* Device busy flag */
+#define SPI_STATUS_NRDY 0x01
+
+/**************************************************************************
+ *
+ * Efx SPI devices
+ *
+ **************************************************************************
+ */
+
+/**
+ * struct efx_spi_device - an Efx SPI (Serial Peripheral Interface) device
+ * @device_id:		Controller's id for the device
+ * @size:		Size (in bytes)
+ * @addr_len:		Number of address bytes in read/write commands
+ * @munge_address:	Flag whether addresses should be munged.
+ *	Some devices with 9-bit addresses (e.g. AT25040A EEPROM)
+ *	use bit 3 of the command byte as address bit A8, rather
+ *	than having a two-byte address.  If this flag is set, then
+ *	commands should be munged in this way.
+ * @erase_command:	Erase command (or 0 if sector erase not needed).
+ * @erase_size:		Erase sector size (in bytes)
+ *	Erase commands affect sectors with this size and alignment.
+ *	This must be a power of two.
+ * @block_size:		Write block size (in bytes).
+ *	Write commands are limited to blocks with this size and alignment.
+ * @read:		Read function for the device
+ * @write:		Write function for the device
+ */
+struct efx_spi_device {
+	int device_id;
+	unsigned int size;
+	unsigned int addr_len;
+	unsigned int munge_address:1;
+	u8 erase_command;
+	unsigned int erase_size;
+	unsigned int block_size;
+	int (*read) (const struct efx_spi_device *spi,
+		     struct efx_nic *efx, unsigned int command,
+		     int address, void *data, unsigned int len);
+	int (*write) (const struct efx_spi_device *spi,
+		      struct efx_nic *efx, unsigned int command,
+		      int address, const void *data, unsigned int len);
+};
+
+/* Maximum length for SPI read or write through Falcon */
+#define FALCON_SPI_MAX_LEN 16U
+
+/**
+ * efx_spi_write_limit - calculate maximum permitted length for write
+ * @spi:		SPI device description
+ * @start:		Starting address
+ *
+ * Return the maximum length for a write starting at the given address
+ * in the device.
+ *
+ * SPI writes must not cross block boundaries.  Devices tend
+ * to wrap addresses at block boundaries; e.g. trying to write 5 bytes
+ * starting at offset 14 with a block size of 16 might write
+ * {14,15,0,1,2} rather than {14,15,16,17,18}.
+ */
+static inline unsigned int
+efx_spi_write_limit(const struct efx_spi_device *spi, unsigned int start)
+{
+	return min(FALCON_SPI_MAX_LEN,
+		   (spi->block_size - (start & (spi->block_size - 1))));
+}
+
+/**
+ * efx_spi_read_limit - calculate maximum permitted length for read
+ * @spi:		SPI device description
+ * @start:		Starting address
+ *
+ * Return the maximum length for a read starting at the given address
+ * in the device.
+ */
+static inline unsigned int
+efx_spi_read_limit(const struct efx_spi_device *spi __attribute__ ((unused)),
+		   unsigned int start __attribute__ ((unused)))
+{
+	return FALCON_SPI_MAX_LEN;
+}
+
+/**
+ * efx_spi_munge_command - adjust command as necessary for given address
+ * @spi:		SPI device description
+ * @command:		Normal SPI command
+ * @address:		Address for command
+ *
+ * Some devices with 9-bit addresses (e.g. AT25040A EEPROM) use bit 3
+ * of the command byte as address bit A8, rather than having a
+ * two-byte address.  This function calculates the appropriate command
+ * byte for the device, taking this munging into account.
+ */
+static inline u8 efx_spi_munge_command(const struct efx_spi_device *spi,
+					    const u8 command,
+					    const unsigned int address)
+{
+	return (command | (((address >> 8) & spi->munge_address) << 3));
+}
+
+#endif /* EFX_SPI_H */
--- /dev/null	2008-01-02 10:46:54.505379063 +0000
+++ drivers/net/sfc/driverlink_api.h	2008-01-14 16:32:46.000000000 +0000
@@ -0,0 +1,594 @@
+/****************************************************************************
+ * Driver for Solarflare network controllers
+ *           (including support for SFE4001 10GBT NIC)
+ *
+ * Copyright 2005-2006: Fen Systems Ltd.
+ * Copyright 2005-2008: Solarflare Communications Inc,
+ *                      9501 Jeronimo Road, Suite 250,
+ *                      Irvine, CA 92618, USA
+ *
+ * Initially developed by Michael Brown <mbrown@fensystems.co.uk>
+ * Maintained by Solarflare Communications <linux-net-drivers@solarflare.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published
+ * by the Free Software Foundation, incorporated herein by reference.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ ****************************************************************************
+ */
+
+#ifndef EFX_DRIVERLINK_API_H
+#define EFX_DRIVERLINK_API_H
+
+#include <linux/list.h> /* for struct list_head */
+
+/**
+ * DOC: Efx driverlink API
+ *
+ * This file must be included by any driver that wishes to attach to
+ * devices claimed by the Solarflare nic driver (sfc). It allows separate
+ * kernel modules to expose other functionality offered by the NIC, with
+ * the sfc driver remaining in overall control.
+ *
+ * Overview:
+ *
+ * Driverlink clients define a &struct efx_dl_driver, and register
+ * this structure with the driverlink layer using
+ * efx_dl_register_driver(), which is exported by the sfc driver.
+ *
+ * The probe() routine of each driverlink client driver is called by
+ * the driverlink layer for each physical port in the system, after
+ * the sfc driver has performed start-of-day hardware initialisation
+ * and self-test. If ports are added or removed via pci hotplug then
+ * the &struct efx_dl_driver probe() or remove() routines are called
+ * as appropriate.
+ *
+ * If the port doesn't provide the necessary hardware resources for a
+ * client, then that client can return failure from its probe()
+ * routine. Information provided to the client driver at probe time
+ * includes
+ *
+ * Each probe() routine is given a unique &struct efx_dl_device per
+ * port, which means it can safely use the @priv member to store any
+ * useful state it needs. The probe routine also has the opportunity
+ * to provide a &struct efx_dl_callbacks via
+ * efx_dl_register_callbacks(), which allows the client to intercept
+ * the sfc driver's operations at strategic points.
+ *
+ * Occasionally, the underlying Efx device may need to be reset to
+ * recover from an error condition.  The client's reset_suspend() and
+ * reset_resume() methods [if provided] will be called to enable the
+ * client to suspend operations and preserve any state before the
+ * reset.  The client can itself request a reset using efx_dl_reset()
+ * or efx_dl_schedule_reset(), should it detect an error condition
+ * necessitating a reset.
+ *
+ * Example:
+ *
+ * The MTD driver (mtd.c) uses the driverlink layer.
+ */
+
+/* Forward declarations */
+struct pci_dev;
+struct net_device;
+struct sk_buff;
+struct efx_dl_device;
+struct efx_dl_device_info;
+
+/*
+ * This is used to guard against the registration of driverlink
+ * clients using an incorrect version of the API.
+ */
+#define EFX_DRIVERLINK_API_VERSION 1
+
+
+/**
+ * struct efx_dl_driver - An Efx driverlink device driver
+ *
+ * This is the analogue of a struct pci_driver for a normal PCI
+ * driver.  Driverlink clients should register themselves using
+ * efx_dl_register_driver() at module initialisation, and deregister
+ * themselves using efx_dl_unregister_driver() at module exit.
+ *
+ * All calls to members of efx_dl_driver are serialised by a single
+ * semaphore, so you are allowed to sleep in these functions. Take care
+ * to not call driverlink methods from within these callbacks, otherwise
+ * a deadlock is possible.
+ *
+ * @name: Name of the driver
+ * @probe: Called when device added
+ * @remove: Called when device removed
+ * @reset_suspend: Called before device is reset
+ * @reset_resume: Called after device is reset
+ */
+struct efx_dl_driver {
+	const char *name;
+
+	/*
+	 * probe - Handle device addition.
+	 * @efx_dev:		Efx driverlink device
+	 * @net_dev:		The net_dev relevent to this port
+	 * @dev_info:		A linked list of device information.
+	 * @silicon_rev:	Silicon revision name.
+	 *
+	 * This will be called after driverlink client registration for
+	 * every port on the system, and for every port that appears
+	 * thereafter via hotplug.
+	 *
+	 * The client may use either @efx_dev->pci_dev, the dev_info linked
+	 * list of available driver information, or the silicon revision
+	 * name to determine if they can support this port. If they can,
+	 * they should return 0 to indicate the probe was successful. Any
+	 * other return code indicates that the probe failed, and the
+	 * @efx_dl_dev will be invalidated.
+	 *
+	 * The client should perform whatever initialisation it
+	 * requires, and store a pointer to its private data in
+	 * @efx_dl_dev->priv (which is not shared between clients).
+	 * It may also wish to hook in a callbacks table using
+	 * efx_dl_register_callbacks().
+	 *
+	 * Return a negative error code or 0 on success.
+	 */
+	int (*probe) (struct efx_dl_device *efx_dl_dev,
+		      const struct net_device *net_dev,
+		      const struct efx_dl_device_info *dev_info,
+		      const char *silicon_rev);
+
+	/*
+	 * remove - Handle device removal.
+	 * @efx_dev:		Efx driverlink device
+	 *
+	 * This will be called at driver exit (or hotplug removal) for
+	 * each registered driverlink client.
+	 *
+	 * The client must ensure that it has finished all operations
+	 * using this device before returning from this method.  If it
+	 * has hooked in a callbacks table using
+	 * efx_dl_register_callbacks(), it must unhook it using
+	 * efx_dl_unregister_callbacks(), and then ensure that all
+	 * callback-triggered operations (e.g. scheduled tasklets)
+	 * have completed before returning.  (It does not need to
+	 * explicitly wait for callback methods to finish executing,
+	 * since efx_dl_unregister_callbacks() will sleep until all
+	 * callbacks have returned anyway.)
+	 *
+	 * Note that the device itself may not have been removed; it
+	 * may be simply that the client is being unloaded
+	 * via efx_dl_unregister_driver(). In this case other clients
+	 * (and the sfc driver itself) will still be using the device,
+	 * so the client cannot assume that the device itself is quiescent.
+	 * In particular, callbacks may continue to be triggered at any
+	 * point until efx_dl_unregister_callbacks() is called.
+	 */
+	void (*remove) (struct efx_dl_device *efx_dev);
+
+	/*
+	 * reset_suspend - Suspend ready for reset.
+	 * @efx_dev:		Efx driverlink device
+	 *
+	 * This method will be called immediately before a hardware
+	 * reset (which may or may not have been initiated by the
+	 * driverlink client).  This client must save any state that it
+	 * will need to restore after the reset, and suspend all
+	 * operations that might access the hardware.  It must not
+	 * return until the client can guarantee to have stopped
+	 * touching the hardware.
+	 *
+	 * It is guaranteed that callbacks will be inactive by the
+	 * time this method is called; the driverlink layer will
+	 * already have prevented new callbacks being made and waited
+	 * for all callbacks functions to return before calling
+	 * reset_suspend().  However, any delayed work scheduled by
+	 * the callback functions (e.g. tasklets) may not yet have
+	 * completed.
+	 *
+	 * This method is allowed to sleep, so waiting on tasklets,
+	 * work queues etc. is permitted.  There will always be a
+	 * corresponding call to the reset_resume() method, so it is
+	 * safe to e.g. down a semaphore within reset_suspend() and up
+	 * it within reset_resume().  (However, you obviously cannot
+	 * do the same with a spinlock).
+	 *
+	 * Note that the reset operation may be being carried out in
+	 * the context of scheduled work, so you cannot use
+	 * flush_scheduled_work() to ensure that any work you may have
+	 * scheduled has completed.
+	 *
+	 * During hardware reset, there is a chance of receiving
+	 * spurious interrupts, so the client's ISR (if any) should be
+	 * unhooked or otherwise disabled.
+	 */
+	void (*reset_suspend) (struct efx_dl_device *efx_dev);
+
+	/*
+	 * reset_resume - Restore after a reset.
+	 * @efx_dev:		Efx driverlink device
+	 * @ok:			Reset success indicator
+	 *
+	 * This method will be called after a hardware reset.  There
+	 * will always have been a corresponding call to the
+	 * reset_suspend() method beforehand.
+	 *
+	 * If @ok is non-zero, the client should restore the state
+	 * that it saved during the call to reset_suspend() and resume
+	 * normal operations.
+	 *
+	 * If @ok is zero, the reset operation has failed and the
+	 * hardware is currently in an unusable state.  In this case,
+	 * the client should release any locks taken out by
+	 * reset_suspend(), but should not take any other action; in
+	 * particular, it must not access the hardware, nor resume
+	 * normal operations.  The hardware is effectively dead at
+	 * this point, and our sole aim is to avoid deadlocking or
+	 * crashing the host.
+	 *
+	 * The driverlink layer will still be locked when
+	 * reset_resume() is called, so the client may not call
+	 * driverlink functions.  In particular, if the reset failed,
+	 * the client must not call efx_dl_unregister_callbacks() at
+	 * this point; it should wait until remove() is called.
+	 */
+	void (*reset_resume) (struct efx_dl_device *efx_dev, int ok);
+
+/* private: */
+	struct list_head node;
+	struct list_head device_list;
+};
+
+/**
+ * DOC: Efx driverlink device information
+ *
+ * Each &struct efx_dl_device makes certain hardware resources visible
+ * to driverlink clients, and they describe which resources are
+ * available by passing a linked list of &struct efx_dl_device_info
+ * into the probe() routine.
+ *
+ * The driverlink client's probe function can iterate through the linked list,
+ * and provided that it understands the resources that are exported, it can
+ * choose to make use of them through an external interface.
+ */
+
+/**
+ * enum efx_dl_device_info_type - Device information identifier.
+ *
+ * Each distinct hardware resource API will have a member in this
+ * enumeration.
+ *
+ * @EFX_DL_FALCON_RESOURCES: Information type is &struct efx_dl_falcon_resources
+ */
+enum efx_dl_device_info_type {
+	/** Falcon resources available for export */
+	EFX_DL_FALCON_RESOURCES = 0,
+};
+
+/**
+ * struct efx_dl_device_info - device information structure
+ * @next: Link to next structure, if any
+ * @type: Type code for this structure
+ *
+ * This structure is embedded in other structures provided by the
+ * driverlink device provider, and implements a linked list of
+ * resources pertinent to a driverlink client.
+ *
+ * Example: &struct efx_dl_falcon_resources
+ */
+struct efx_dl_device_info {
+	struct efx_dl_device_info *next;
+	enum efx_dl_device_info_type type;
+};
+
+/**
+ * enum efx_dl_falcon_resource_flags - Falcon resource information flags.
+ *
+ * Flags that describe hardware variations for the described Falcon based port.
+ *
+ * @EFX_DL_FALCON_DUAL_FUNC: Port is dual-function.
+ *	Certain silicon revisions have two pci functions, and require
+ *	certain hardware resources to be accessed via the secondary
+ *	function. See the discussion of @pci_dev in &struct efx_dl_device
+ *	below.
+ * @EFX_DL_FALCON_USE_MSI: Port is initialised to use MSI/MSI-X interrupts.
+ *	Falcon supports traditional legacy interrupts and MSI/MSI-X
+ *	interrupts. Since the sfc driver supports either, as a run
+ *	time configuration, driverlink drivers need to be aware of which
+ *	one to use for their interrupting resources.
+ */
+enum efx_dl_falcon_resource_flags {
+	EFX_DL_FALCON_DUAL_FUNC = 0x1,
+	EFX_DL_FALCON_USE_MSI = 0x2,
+};
+
+/**
+ * struct efx_dl_falcon_resources - Falcon resource information.
+ *
+ * This structure describes Falcon hardware resources available for
+ * use by a driverlink driver.
+ *
+ * @hdr: Resource linked list header
+ * @biu_lock: Register access lock.
+ *	Some Falcon revisions require register access for configuration
+ *	registers to be serialised between ports and PCI functions.
+ *	The sfc driver will provide the appropriate lock semantics for
+ *	the underlying hardware.
+ * @buffer_table_min: First available buffer table entry
+ * @buffer_table_max: Last available buffer table entry + 1
+ * @evq_timer_min: First available event queue with timer
+ * @evq_timer_max: Last available event queue with timer + 1
+ * @evq_int_min: First available event queue with interrupt
+ * @evq_int_max: Last available event queue with interrupt + 1
+ * @rxq_min: First available RX queue
+ * @rxq_max: Last available RX queue + 1
+ * @txq_min: First available TX queue
+ * @txq_max: Last available TX queue + 1
+ * @flags: Hardware variation flags
+ */
+struct efx_dl_falcon_resources {
+	struct efx_dl_device_info hdr;
+	spinlock_t *biu_lock;
+	unsigned buffer_table_min, buffer_table_max;
+	unsigned evq_timer_min, evq_timer_max;
+	unsigned evq_int_min, evq_int_max;
+	unsigned rxq_min, rxq_max;
+	unsigned txq_min, txq_max;
+	enum efx_dl_falcon_resource_flags flags;
+};
+
+/**
+ * struct efx_dl_device - An Efx driverlink device.
+ *
+ * @pci_dev: Underlying PCI device.
+ *	This is the PCI device used by the sfc driver.  It will
+ *	already have been enabled for bus-mastering DMA etc.
+ * @priv: Driver private data
+ *	Driverlink clients can use this to store a pointer to their
+ *	internal per-device data structure. Each (driver, device)
+ *	tuple has a seperate &struct efx_dl_device, so clients can use
+ *	this @priv field independently.
+ * @driver: Efx driverlink driver for this device
+ */
+struct efx_dl_device {
+	struct pci_dev *pci_dev;
+	void *priv;
+	struct efx_dl_driver *driver;
+};
+
+/**
+ * enum efx_veto - Packet veto request flag.
+ *
+ * This is the return type for the rx_packet() and tx_packet() methods
+ * in &struct efx_dl_callbacks.
+ *
+ * @EFX_ALLOW_PACKET: Packet may be transmitted/received
+ * @EFX_VETO_PACKET: Packet must not be transmitted/received
+ */
+enum efx_veto {
+	EFX_ALLOW_PACKET = 0,
+	EFX_VETO_PACKET = 1,
+};
+
+/**
+ * struct efx_dl_callbacks - Efx callbacks
+ *
+ * These methods can be hooked in to the sfc driver via
+ * efx_dl_register_callbacks().  They allow clients to intercept and/or
+ * modify the behaviour of the sfc driver at predetermined points.
+ *
+ * For efficiency, only one client can hook each callback.
+ *
+ * Since these callbacks are called on packet transmit and reception
+ * paths, clients should avoid acquiring locks or allocating memory.
+ *
+ * @tx_packet: Called when packet is about to be transmitted
+ * @rx_packet: Called when packet is received
+ * @link_change: Called when link status has changed
+ * @request_mtu: Called to request MTU change
+ * @mtu_changed: Called when MTU has been changed
+ * @event: Called when NIC event is not handled by the sfc driver
+ */
+struct efx_dl_callbacks {
+	/*
+	 * tx_packet - Packet about to be transmitted.
+	 * @efx_dev:		Efx driverlink device
+	 * @skb:		Socket buffer containing the packet to be sent
+	 *
+	 * This method is called for every packet about to be
+	 * transmitted.  It allows the client to snoop on traffic sent
+	 * via the kernel queues.
+	 *
+	 * The method may return %EFX_VETO_PACKET in order to prevent
+	 * the sfc driver from transmitting the packet.  The net
+	 * driver will then discard the packet.  If the client wishes
+	 * to retain a reference to the packet data after returning
+	 * %EFX_VETO_PACKET, it must obtain its own copy of the
+	 * packet (e.g. by calling skb_get(), or by copying out the
+	 * packet data to an external buffer).
+	 *
+	 * This method must return quickly, since it will have a
+	 * direct performance impact upon the sfc driver.  It will be
+	 * called with interrupts disabled (and may be called in
+	 * interrupt context), so may not sleep. Since the sfc driver
+	 * may have multiple tx queues, running in parallel, please avoid
+	 * the need for locking if it all possible.
+	 */
+	enum efx_veto (*tx_packet) (struct efx_dl_device *efx_dev,
+				    struct sk_buff *skb);
+
+	/*
+	 * rx_packet - Packet received.
+	 * @efx_dev:		Efx driverlink device
+	 * @pkt_hdr:		Pointer to received packet
+	 * @pkt_len:		Length of received packet
+	 *
+	 * This method is called for every received packet.  It allows
+	 * the client to snoop on traffic received by the kernel
+	 * queues.
+	 *
+	 * The method may return %EFX_VETO_PACKET in order to prevent
+	 * the sfc driver from passing the packet to the kernel.  The net
+	 * driver will then discard the packet.
+	 *
+	 * This method must return quickly, since it will have a
+	 * direct performance impact upon the sfc driver.  It is
+	 * called in tasklet context, so may not sleep.  Note that
+	 * there are per-channel tasklets in the sfc driver, so
+	 * rx_packet() may be called simultaneously on different CPUs
+	 * and must lock appropriately.  The design of the sfc driver
+	 * allows for lockless operation between receive channels, so
+	 * please avoid the need for locking if at all possible.
+	 */
+	enum efx_veto (*rx_packet) (struct efx_dl_device *efx_dev,
+				    const char *pkt_hdr, int pkt_len);
+
+	/*
+	 * link_change - Link status change.
+	 * @efx_dev:		Efx driverlink device
+	 * @link_up:		Link up indicator
+	 *
+	 * This method is called to inform the driverlink client
+	 * whenever the PHY link status changes.  By the time this
+	 * function is called, the MAC has already been reconfigured
+	 * with the new autonegotiation settings from the PHY.
+	 *
+	 * This method is called from tasklet context and may not
+	 * sleep.
+	 */
+	void (*link_change) (struct efx_dl_device *efx_dev, int link_up);
+
+	/*
+	 * request_mtu: Request MTU change.
+	 * @efx_dev:		Efx driverlink device
+	 * @new_mtu:		Requested new MTU
+	 *
+	 * This method is called whenever the user requests an MTU
+	 * change on an interface.  The client may return an error, in
+	 * which case the MTU change request will be denied.  If the
+	 * client returns success, the MAC will be reconfigured with a
+	 * new maxmimum frame length equal to
+	 * EFX_MAX_FRAME_LEN(new_mtu).  The client will be notified
+	 * via the mtu_changed() method once the MAC has been
+	 * reconfigured.
+	 *
+	 * The current MTU for the port can be obtained via
+	 * efx_dl_get_netdev(efx_dl_device)->mtu.
+	 *
+	 * The sfc driver guarantees that no other callback functions
+	 * are in progress when this method is called.  This function
+	 * is called in process context and may sleep.
+	 *
+	 * Return a negative error code or 0 on success.
+	 */
+	int (*request_mtu) (struct efx_dl_device *efx_dev, int new_mtu);
+
+	/*
+	 * mtu_changed - MTU has been changed.
+	 * @efx_dev:		Efx driverlink device
+	 * @mtu:		The new MTU
+	 *
+	 * This method is called once the MAC has been reconfigured
+	 * with a new MTU.  There will have been a preceding call to
+	 * request_mtu().
+	 *
+	 * The sfc driver guarantees that no other callback functions
+	 * are in progress when this method is called.  This function
+	 * is called in process context and may sleep.
+	 */
+	void (*mtu_changed) (struct efx_dl_device *efx_dev, int mtu);
+
+	/*
+	 * event - Event callback.
+	 * @efx_dev:		Efx driverlink device
+	 * @p_event:		Pointer to event
+	 *
+	 * This method is called for each event that is not handled by the
+	 * sfc driver.
+	 */
+	void (*event) (struct efx_dl_device *efx_dev, void *p_event);
+};
+
+/* Include API version number in symbol used for efx_dl_register_driver */
+#define efx_dl_stringify_1(x, y) x ## y
+#define efx_dl_stringify_2(x, y) efx_dl_stringify_1(x, y)
+#define efx_dl_register_driver					\
+	efx_dl_stringify_2(efx_dl_register_driver_api_ver_,	\
+			   EFX_DRIVERLINK_API_VERSION)
+
+extern int efx_dl_register_driver(struct efx_dl_driver *driver);
+
+extern void efx_dl_unregister_driver(struct efx_dl_driver *driver);
+
+extern int efx_dl_register_callbacks(struct efx_dl_device *efx_dev,
+				     struct efx_dl_callbacks *callbacks);
+
+extern void efx_dl_unregister_callbacks(struct efx_dl_device *efx_dev,
+					struct efx_dl_callbacks *callbacks);
+
+extern void efx_dl_schedule_reset(struct efx_dl_device *efx_dev);
+
+/**
+ * efx_dl_for_each_device_info_matching - iterate an efx_dl_device_info list
+ * @_dev_info: Pointer to first &struct efx_dl_device_info
+ * @_type: Type code to look for
+ * @_info_type: Structure type corresponding to type code
+ * @_field: Name of &struct efx_dl_device_info field in the type
+ * @_p: Iterator variable
+ *
+ * Example:
+ *
+ * static int driver_dl_probe(... const struct efx_dl_device_info *dev_info ...)
+ * {
+ *        struct efx_dl_falcon_resources *res;
+ *
+ *        efx_dl_for_each_device_info_matching(dev_info,EFX_DL_FALCON_RESOURCES,
+ *                                             struct efx_dl_falcon_resources,
+ *                                             hdr, res) {
+ *                if (res->flags & EFX_DL_FALCON_DUAL_FUNC) {
+ *                          .....
+ *                }
+ *        }
+ * }
+ */
+#define efx_dl_for_each_device_info_matching(_dev_info, _type, _info_type, \
+						_field, _p);		\
+	for ((_p) = container_of((_dev_info), _info_type, _field);	\
+	     (_p) != NULL;						\
+	     (_p) = container_of((_p)->_field.next, _info_type, _field))\
+		if ((_p)->_field.type != _type)				\
+			continue;					\
+		else
+
+/**
+ * efx_dl_search_device_info - search an efx_dl_device_info list
+ * @_dev_info: Pointer to first &struct efx_dl_device_info
+ * @_type: Type code to look for
+ * @_info_type: Structure type corresponding to type code
+ * @_field: Name of &struct efx_dl_device_info member in this type
+ * @_p: Result variable
+ *
+ * Example:
+ *
+ * static int driver_dl_probe(... const struct efx_dl_device_info *dev_info ...)
+ * {
+ *        struct efx_dl_falcon_resources *res;
+ *
+ *        efx_dl_search_device_info(dev_info, EFX_DL_FALCON_RESOURCES,
+ *                                  struct efx_dl_falcon_resources, hdr, res);
+ *        if (res != NULL) {
+ *                 ....
+ *        }
+ * }
+ */
+#define efx_dl_search_device_info(_dev_info, _type, _info_type, _field, _p) \
+	efx_dl_for_each_device_info_matching((_dev_info), (_type),	    \
+					     (_info_type), (_field), (_p))  \
+	     break;
+
+#endif /* EFX_DRIVERLINK_API_H */
--- END ---

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
