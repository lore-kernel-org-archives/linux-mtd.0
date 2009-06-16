Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MGTqx-0001D5-St
	for linux-mtd@lists.infradead.org; Tue, 16 Jun 2009 08:17:21 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: m25p80: add support for AAI programming with SST SPI
	flashes
Date: Tue, 16 Jun 2009 04:16:50 -0400
Message-Id: <1245140211-24589-1-git-send-email-vapier@gentoo.org>
Cc: Graf Yang <graf.yang@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Graf Yang <graf.yang@analog.com>

The SST SPI flashes are a bit non-standard in that they can be programmed
one byte at a time (including address!), or they can be written two bytes
at a time with auto address incrementing (AAI).  The latter form is
obviously much better for performance, so let's use it when possible.

Signed-off-by: Graf Yang <graf.yang@analog.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/devices/m25p80.c |  119 +++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 118 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index cc6369e..9a0788a 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -44,6 +44,11 @@
 #define	OPCODE_SE		0xd8	/* Sector erase (usually 64KiB) */
 #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
 
+/* Used for SST flashes only. */
+#define	OPCODE_BP		0x02	/* Byte program */
+#define	OPCODE_WRDI		0x04	/* Write disable */
+#define	OPCODE_AAI_WP		0xad	/* Auto address increment word program */
+
 /* Status Register bits. */
 #define	SR_WIP			1	/* Write in progress */
 #define	SR_WEL			2	/* Write enable latch */
@@ -132,6 +137,15 @@ static inline int write_enable(struct m25p *flash)
 	return spi_write_then_read(flash->spi, &code, 1, NULL, 0);
 }
 
+/*
+ * Send write disble instruction to the chip.
+ */
+static inline int write_disable(struct m25p *flash)
+{
+	u8	code = OPCODE_WRDI;
+
+	return spi_write_then_read(flash->spi, &code, 1, NULL, 0);
+}
 
 /*
  * Service routine to read status register until ready, or timeout occurs.
@@ -454,6 +468,104 @@ static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return 0;
 }
 
+static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
+		size_t *retlen, const u_char *buf)
+{
+	struct m25p *flash = mtd_to_m25p(mtd);
+	struct spi_transfer t[2];
+	struct spi_message m;
+	size_t actual;
+	int cmd_sz, ret;
+
+	if (retlen)
+		*retlen = 0;
+
+	/* sanity checks */
+	if (!len)
+		return 0;
+
+	if (to + len > flash->mtd.size)
+		return -EINVAL;
+
+	spi_message_init(&m);
+	memset(t, 0, (sizeof t));
+
+	t[0].tx_buf = flash->command;
+	t[0].len = CMD_SIZE;
+	spi_message_add_tail(&t[0], &m);
+
+	t[1].tx_buf = buf;
+	spi_message_add_tail(&t[1], &m);
+
+	mutex_lock(&flash->lock);
+
+	/* Wait until finished previous write command. */
+	ret = wait_till_ready(flash);
+	if (ret)
+		goto time_out;
+
+	write_enable(flash);
+
+	actual = to % 2;
+	/* Start write from odd address. */
+	if (actual) {
+		flash->command[0] = OPCODE_BP;
+		flash->command[1] = to >> 16;
+		flash->command[2] = to >> 8;
+		flash->command[3] = to;
+
+		/* write one byte. */
+		t[1].len = 1;
+		spi_sync(flash->spi, &m);
+		*retlen += m.actual_length - CMD_SIZE;
+	}
+	to += actual;
+
+	flash->command[0] = OPCODE_AAI_WP;
+	flash->command[1] = to >> 16;
+	flash->command[2] = to >> 8;
+	flash->command[3] = to;
+
+	/* Write out most of the data here. */
+	cmd_sz = CMD_SIZE;
+	for (; actual < len - 1; actual += 2) {
+		t[0].len = cmd_sz;
+		/* write two bytes. */
+		t[1].len = 2;
+		t[1].tx_buf = buf + actual;
+		ret = wait_till_ready(flash);
+		if (ret)
+			goto time_out;
+		spi_sync(flash->spi, &m);
+
+		*retlen += m.actual_length - cmd_sz;
+		cmd_sz = 1;
+		to += 2;
+	}
+
+	/* Write out trailing byte if it exists. */
+	if (actual != len) {
+		flash->command[0] = OPCODE_BP;
+		flash->command[1] = to >> 16;
+		flash->command[2] = to >> 8;
+		flash->command[3] = to;
+		t[0].len = CMD_SIZE;
+		t[1].len = 1;
+		t[1].tx_buf = buf + actual;
+		ret = wait_till_ready(flash);
+		if (ret)
+			goto time_out;
+		spi_sync(flash->spi, &m);
+
+		*retlen += m.actual_length - CMD_SIZE;
+	}
+
+	ret = wait_till_ready(flash);
+ time_out:
+	write_disable(flash);
+	mutex_unlock(&flash->lock);
+	return ret;
+}
 
 /****************************************************************************/
 
@@ -663,7 +775,12 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	flash->mtd.size = info->sector_size * info->n_sectors;
 	flash->mtd.erase = m25p80_erase;
 	flash->mtd.read = m25p80_read;
-	flash->mtd.write = m25p80_write;
+
+	/* sst flash chips use AAI word program */
+	if (info->jedec_id >> 16 == 0xbf)
+		flash->mtd.write = sst_write;
+	else
+		flash->mtd.write = m25p80_write;
 
 	/* prefer "small sector" erase if possible */
 	if (info->flags & SECT_4K) {
-- 
1.6.3.1
