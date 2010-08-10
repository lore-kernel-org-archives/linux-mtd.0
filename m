From: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] m25p80: add support for a callback to platform code on
	successful device probe
Date: Tue, 10 Aug 2010 14:35:04 +0530
Message-Id: <1281431104-17546-1-git-send-email-sudhakar.raj@ti.com>
Cc: david-b@pacbell.net, davinci-linux-open-source@linux.davincidsp.com,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On some platforms, MTD device can hold MAC address, calibration
data, serial numbers etc.

On TI's DA850/OMAP-L138/AM18xx EVM, MAC address is stored on
the last sector of the SPI flash, which is exported as an MTD
device. Ethernet driver on this platform needs MAC address to
be passed through platform data. The callback function can be
used to read the MAC address. The callback has to be invoked
after the MTD device is setup.

This patch adds two new members to the 'flash_platform_data'
structure, a function handler which will be called after
add_mtd_device() and an argument to be passed to this function,
for example: offset to read from.

Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
---
Since v1: Updated the changelog

 drivers/mtd/devices/m25p80.c |   15 +++++++++++++--
 include/linux/spi/flash.h    |    2 ++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 81e49a9..b832091 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -765,6 +765,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	struct m25p			*flash;
 	struct flash_info		*info;
 	unsigned			i;
+	int				ret;
 
 	/* Platform data helps sort out which chip type we have, as
 	 * well as how this board partitions it.  If we don't have
@@ -924,13 +925,23 @@ static int __devinit m25p_probe(struct spi_device *spi)
 					(long long)(parts[i].size >> 10));
 			}
 			flash->partitioned = 1;
-			return add_mtd_partitions(&flash->mtd, parts, nr_parts);
+			ret = add_mtd_partitions(&flash->mtd, parts, nr_parts);
+			if (!ret)
+				goto out;
+
+			return ret;
 		}
 	} else if (data && data->nr_parts)
 		dev_warn(&spi->dev, "ignoring %d default partitions on %s\n",
 				data->nr_parts, data->name);
 
-	return add_mtd_device(&flash->mtd) == 1 ? -ENODEV : 0;
+	ret = add_mtd_device(&flash->mtd);
+
+out:
+	if (data->setup && !ret)
+		(data->setup)(&flash->mtd, (void *)data->context);
+
+	return (ret == 1) ? -ENODEV : 0;
 }
 
 
diff --git a/include/linux/spi/flash.h b/include/linux/spi/flash.h
index 3f22932..daa4875 100644
--- a/include/linux/spi/flash.h
+++ b/include/linux/spi/flash.h
@@ -24,6 +24,8 @@ struct flash_platform_data {
 	unsigned int	nr_parts;
 
 	char		*type;
+	void		(*setup)(struct mtd_info *, void *context);
+	void		*context;
 
 	/* we'll likely add more ... use JEDEC IDs, etc */
 };
-- 
1.5.6
