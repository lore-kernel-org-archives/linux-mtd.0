Received: from smtp118.sbc.mail.sp1.yahoo.com ([69.147.64.91])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KD9vo-0002aK-V7
	for linux-mtd@lists.infradead.org; Mon, 30 Jun 2008 03:19:57 +0000
From: David Brownell <david-b@pacbell.net>
To: Bryan Wu <cooloney@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>
Subject: [patch 2.6.26-rc8+] mtd:  dataflash OTP support
Date: Sun, 29 Jun 2008 20:19:53 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200806292019.53376.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that we can tell when we have one of the newer DataFlash chips,
optionally expose the 128 bytes of OTP memory they provide.  Tested
on at45db642 revision B and D chips and latest mtd-utils.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
This goes on top of the patch I sent earlier, "v3" based on "v2"
from Michael, teaching this driver to use the JEDEC query command
to detect new chip revisions which may be using binary page sizes.

 drivers/mtd/devices/Kconfig         |   10 +
 drivers/mtd/devices/mtd_dataflash.c |  206 ++++++++++++++++++++++++++++++++--
 drivers/mtd/mtdchar.c               |   16 ++
 3 files changed, 223 insertions(+), 9 deletions(-)

--- a/drivers/mtd/devices/Kconfig	2008-04-28 10:48:25.000000000 -0700
+++ b/drivers/mtd/devices/Kconfig	2008-06-29 13:54:08.000000000 -0700
@@ -60,6 +60,16 @@ config MTD_DATAFLASH
 	  Sometimes DataFlash chips are packaged inside MMC-format
 	  cards; at this writing, the MMC stack won't handle those.
 
+config MTD_DATAFLASH_OTP
+	bool "DataFlash OTP support (Security Register)"
+	depends on MTD_DATAFLASH
+	help
+	  Newer DataFlash chips (revisions C and D) support 128 bytes of
+	  one-time-programmable (OTP) data.  The first half may be written
+	  (once) with up to 64 bytes of data, such as a serial number or
+	  other key product data.  The second half is programmed with a
+	  unique-to-each-chip bit pattern at the factory.
+
 config MTD_M25P80
 	tristate "Support most SPI Flash chips (AT26DF, M25P, W25X, ...)"
 	depends on SPI_MASTER && EXPERIMENTAL
--- a/drivers/mtd/devices/mtd_dataflash.c	2008-06-28 22:55:36.000000000 -0700
+++ b/drivers/mtd/devices/mtd_dataflash.c	2008-06-29 15:05:12.000000000 -0700
@@ -80,7 +80,8 @@
  */
 #define OP_READ_ID		0x9F
 #define OP_READ_SECURITY	0x77
-#define OP_WRITE_SECURITY	0x9A	/* OTP bits */
+#define OP_WRITE_SECURITY_REVC	0x9A
+#define OP_WRITE_SECURITY	0x9B	/* revision D */
 
 
 struct dataflash {
@@ -451,16 +452,192 @@ static int dataflash_write(struct mtd_in
 
 /* ......................................................................... */
 
+#ifdef CONFIG_MTD_DATAFLASH_OTP
+
+static int dataflash_get_otp_info(struct mtd_info *mtd,
+		struct otp_info *info, size_t len)
+{
+	/* Report both blocks as identical:  bytes 0..64, locked.
+	 * Unless the user block changed from all-ones, we can't
+	 * tell whether it's still writable; so we assume it isn't.
+	 */
+	info->start = 0;
+	info->length = 64;
+	info->locked = 1;
+	return sizeof(*info);
+}
+
+static ssize_t otp_read(struct spi_device *spi, unsigned base,
+		u8 *buf, loff_t off, size_t len)
+{
+	struct spi_message	m;
+	size_t			l;
+	u8			*scratch;
+	struct spi_transfer	t;
+	int			status;
+
+	if (off > 64)
+		return -EINVAL;
+
+	if ((off + len) > 64)
+		len = 64 - off;
+	if (len == 0)
+		return len;
+
+	spi_message_init(&m);
+
+	l = 4 + base + off + len;
+	scratch = kzalloc(l, GFP_KERNEL);
+	if (!scratch)
+		return -ENOMEM;
+
+	/* OUT: OP_READ_SECURITY, 3 don't-care bytes, zeroes
+	 * IN:  ignore 4 bytes, data bytes 0..N (max 127)
+	 */
+	scratch[0] = OP_READ_SECURITY;
+
+	memset(&t, 0, sizeof t);
+	t.tx_buf = scratch;
+	t.rx_buf = scratch;
+	t.len = l;
+	spi_message_add_tail(&t, &m);
+
+	dataflash_waitready(spi);
+
+	status = spi_sync(spi, &m);
+	if (status >= 0) {
+		memcpy(buf, scratch + 4 + base + off, len);
+		status = len;
+	}
+
+	kfree(scratch);
+	return status;
+}
+
+static int dataflash_read_fact_otp(struct mtd_info *mtd,
+		loff_t from, size_t len, size_t *retlen, u_char *buf)
+{
+	struct dataflash	*priv = (struct dataflash *)mtd->priv;
+	int			status;
+
+	/* 64 bytes, from 0..63 ... start at 64 on-chip */
+	mutex_lock(&priv->lock);
+	status = otp_read(priv->spi, 64, buf, from, len);
+	mutex_unlock(&priv->lock);
+
+	if (status < 0)
+		return status;
+	*retlen = status;
+	return 0;
+}
+
+static int dataflash_read_user_otp(struct mtd_info *mtd,
+		loff_t from, size_t len, size_t *retlen, u_char *buf)
+{
+	struct dataflash	*priv = (struct dataflash *)mtd->priv;
+	int			status;
+
+	/* 64 bytes, from 0..63 ... start at 0 on-chip */
+	mutex_lock(&priv->lock);
+	status = otp_read(priv->spi, 0, buf, from, len);
+	mutex_unlock(&priv->lock);
+
+	if (status < 0)
+		return status;
+	*retlen = status;
+	return 0;
+}
+
+static int dataflash_write_user_otp(struct mtd_info *mtd,
+		loff_t from, size_t len, size_t *retlen, u_char *buf)
+{
+	struct spi_message	m;
+	const size_t		l = 4 + 64;
+	u8			*scratch;
+	struct spi_transfer	t;
+	struct dataflash	*priv = (struct dataflash *)mtd->priv;
+	int			status;
+
+	if (len > 64)
+		return -EINVAL;
+
+	/* Strictly speaking, we *could* truncate the write ... but
+	 * let's not do that for the only write that's ever possible.
+	 */
+	if ((from + len) > 64)
+		return -EINVAL;
+
+	/* OUT: OP_WRITE_SECURITY, 3 zeroes, 64 data-or-zero bytes
+	 * IN:  ignore all
+	 */
+	scratch = kzalloc(l, GFP_KERNEL);
+	if (!scratch)
+		return -ENOMEM;
+	scratch[0] = OP_WRITE_SECURITY;
+	memcpy(scratch + 4 + from, buf, len);
+
+	spi_message_init(&m);
+
+	memset(&t, 0, sizeof t);
+	t.tx_buf = scratch;
+	t.len = l;
+	spi_message_add_tail(&t, &m);
+
+	/* Write the OTP bits, if they've not yet been written.
+	 * This modifies SRAM buffer1.
+	 */
+	mutex_lock(&priv->lock);
+	dataflash_waitready(priv->spi);
+	status = spi_sync(priv->spi, &m);
+	mutex_unlock(&priv->lock);
+
+	kfree(scratch);
+
+	if (status >= 0) {
+		status = 0;
+		*retlen = len;
+	}
+	return status;
+}
+
+static char *otp_setup(struct mtd_info *device, char revision)
+{
+	device->get_fact_prot_info = dataflash_get_otp_info;
+	device->read_fact_prot_reg = dataflash_read_fact_otp;
+	device->get_user_prot_info = dataflash_get_otp_info;
+	device->read_user_prot_reg = dataflash_read_user_otp;
+
+	/* rev c parts (at45db321c and at45db1281 only!) use a
+	 * different write procedure; not (yet?) implemented.
+	 */
+	if (revision > 'c')
+		device->write_user_prot_reg = dataflash_write_user_otp;
+
+	return ", OTP";
+}
+
+#else
+
+static char *otp_setup(struct mtd_info *device)
+{
+	return " (OTP)";
+}
+
+#endif
+
+/* ......................................................................... */
+
 /*
  * Register DataFlash device with MTD subsystem.
  */
 static int __devinit
-add_dataflash(struct spi_device *spi, char *name,
-		int nr_pages, int pagesize, int pageoffset)
+add_dataflash_otp(struct spi_device *spi, char *name,
+		int nr_pages, int pagesize, int pageoffset, char revision)
 {
 	struct dataflash		*priv;
 	struct mtd_info			*device;
 	struct flash_platform_data	*pdata = spi->dev.platform_data;
+	char				*otp_tag = "";
 
 	priv = kzalloc(sizeof *priv, GFP_KERNEL);
 	if (!priv)
@@ -489,8 +666,12 @@ add_dataflash(struct spi_device *spi, ch
 	device->write = dataflash_write;
 	device->priv = priv;
 
-	dev_info(&spi->dev, "%s (%d KBytes) pagesize %d bytes\n",
-			name, DIV_ROUND_UP(device->size, 1024), pagesize);
+	if (revision >= 'c')
+		otp_tag = otp_setup(device, revision);
+
+	dev_info(&spi->dev, "%s (%d KBytes) pagesize %d bytes%s\n",
+			name, DIV_ROUND_UP(device->size, 1024),
+			pagesize, otp_tag);
 	dev_set_drvdata(&spi->dev, priv);
 
 	if (mtd_has_partitions()) {
@@ -519,6 +700,14 @@ add_dataflash(struct spi_device *spi, ch
 	return add_mtd_device(device) == 1 ? -ENODEV : 0;
 }
 
+static inline int __devinit
+add_dataflash(struct spi_device *spi, char *name,
+		int nr_pages, int pagesize, int pageoffset)
+{
+	return add_dataflash_otp(spi, name, nr_pages, pagesize,
+			pageoffset, 0);
+}
+
 struct flash_info {
 	char		*name;
 
@@ -665,13 +854,16 @@ static int __devinit dataflash_probe(str
 	/*
 	 * Try to detect dataflash by JEDEC ID.  If it succeeds, we
 	 * have either a C or D part.  D supports pagesize options.
+	 * Both support the security register, though with different
+	 * write procedures.
 	 */
 	info = jedec_probe(spi);
 	if (IS_ERR(info))
 		return PTR_ERR(info);
 	if (info != NULL)
-		return add_dataflash(spi, info->name, info->nr_pages,
-				 info->pagesize, info->pageoffset);
+		return add_dataflash_otp(spi, info->name, info->nr_pages,
+				info->pagesize, info->pageoffset,
+				(info->flags & SUP_POW2PS) ? 'd' : 'c');
 
 	/*
 	 * Older chips support only legacy commands, identifing
--- a/drivers/mtd/mtdchar.c	2008-02-10 15:48:25.000000000 -0800
+++ b/drivers/mtd/mtdchar.c	2008-06-29 09:23:39.000000000 -0700
@@ -20,6 +20,18 @@
 
 #include <asm/uaccess.h>
 
+#ifdef CONFIG_MTD_OTP
+#define HAVE_OTP
+#endif
+
+#ifdef CONFIG_MTD_ONENAND_OTP
+#define HAVE_OTP
+#endif
+
+#ifdef CONFIG_MTD_DATAFLASH_OTP
+#define HAVE_OTP
+#endif
+
 static struct class *mtd_class;
 
 static void mtd_notify_add(struct mtd_info* mtd)
@@ -339,7 +351,7 @@ static void mtdchar_erase_callback (stru
 	wake_up((wait_queue_head_t *)instr->priv);
 }
 
-#if defined(CONFIG_MTD_OTP) || defined(CONFIG_MTD_ONENAND_OTP)
+#ifdef HAVE_OTP
 static int otp_select_filemode(struct mtd_file_info *mfi, int mode)
 {
 	struct mtd_info *mtd = mfi->mtd;
@@ -652,7 +664,7 @@ static int mtd_ioctl(struct inode *inode
 		break;
 	}
 
-#if defined(CONFIG_MTD_OTP) || defined(CONFIG_MTD_ONENAND_OTP)
+#ifdef HAVE_OTP
 	case OTPSELECT:
 	{
 		int mode;
