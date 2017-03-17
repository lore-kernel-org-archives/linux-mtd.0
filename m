Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1corGT-0004Bw-TC
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 12:45:58 +0000
From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rahul Bedarkar <rahul.bedarkar@imgtec.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [RFC 3/6] mtd: m25p80: don't pass spi_nor to helper methods
Date: Fri, 17 Mar 2017 18:13:53 +0530
Message-ID: <1489754636-21461-4-git-send-email-rahul.bedarkar@imgtec.com>
In-Reply-To: <1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Helper methods m25p_addr2cmd, m25p80_rx_nbits and m25p_cmdsz accepts
spi_nor. But with upcoming implementation of read_xfer and write_xfer,
we need to pass addr_width and flash_read from cfg.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/devices/m25p80.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c4df3b1..8368249 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -47,18 +47,18 @@ static int m25p80_read_reg(struct spi_nor *nor, u8 code, u8 *val, int len)
 	return ret;
 }
 
-static void m25p_addr2cmd(struct spi_nor *nor, unsigned int addr, u8 *cmd)
+static void m25p_addr2cmd(unsigned int addr, u8 addr_width, u8 *cmd)
 {
 	/* opcode is in cmd[0] */
-	cmd[1] = addr >> (nor->addr_width * 8 -  8);
-	cmd[2] = addr >> (nor->addr_width * 8 - 16);
-	cmd[3] = addr >> (nor->addr_width * 8 - 24);
-	cmd[4] = addr >> (nor->addr_width * 8 - 32);
+	cmd[1] = addr >> (addr_width * 8 -  8);
+	cmd[2] = addr >> (addr_width * 8 - 16);
+	cmd[3] = addr >> (addr_width * 8 - 24);
+	cmd[4] = addr >> (addr_width * 8 - 32);
 }
 
-static int m25p_cmdsz(struct spi_nor *nor)
+static int m25p_cmdsz(u8 addr_width)
 {
-	return 1 + nor->addr_width;
+	return 1 + addr_width;
 }
 
 static int m25p80_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
@@ -80,7 +80,7 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 	struct spi_device *spi = flash->spi;
 	struct spi_transfer t[2] = {};
 	struct spi_message m;
-	int cmd_sz = m25p_cmdsz(nor);
+	int cmd_sz = m25p_cmdsz(nor->addr_width);
 	ssize_t ret;
 
 	spi_message_init(&m);
@@ -89,7 +89,7 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 		cmd_sz = 1;
 
 	flash->command[0] = nor->program_opcode;
-	m25p_addr2cmd(nor, to, flash->command);
+	m25p_addr2cmd(to, nor->addr_width, flash->command);
 
 	t[0].tx_buf = flash->command;
 	t[0].len = cmd_sz;
@@ -109,9 +109,9 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 	return ret;
 }
 
-static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
+static inline unsigned int m25p80_rx_nbits(enum read_mode flash_read)
 {
-	switch (nor->flash_read) {
+	switch (flash_read) {
 	case SPI_NOR_DUAL:
 		return 2;
 	case SPI_NOR_QUAD:
@@ -152,7 +152,7 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 		/* TODO: Support other combinations */
 		msg.opcode_nbits = SPI_NBITS_SINGLE;
 		msg.addr_nbits = SPI_NBITS_SINGLE;
-		msg.data_nbits = m25p80_rx_nbits(nor);
+		msg.data_nbits = m25p80_rx_nbits(nor->flash_read);
 
 		ret = spi_flash_read(spi, &msg);
 		if (ret < 0)
@@ -164,14 +164,14 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	memset(t, 0, (sizeof t));
 
 	flash->command[0] = nor->read_opcode;
-	m25p_addr2cmd(nor, from, flash->command);
+	m25p_addr2cmd(from, nor->addr_width, flash->command);
 
 	t[0].tx_buf = flash->command;
-	t[0].len = m25p_cmdsz(nor) + dummy;
+	t[0].len = m25p_cmdsz(nor->addr_width) + dummy;
 	spi_message_add_tail(&t[0], &m);
 
 	t[1].rx_buf = buf;
-	t[1].rx_nbits = m25p80_rx_nbits(nor);
+	t[1].rx_nbits = m25p80_rx_nbits(nor->flash_read);
 	t[1].len = min3(len, spi_max_transfer_size(spi),
 			spi_max_message_size(spi) - t[0].len);
 	spi_message_add_tail(&t[1], &m);
@@ -180,7 +180,7 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	if (ret)
 		return ret;
 
-	ret = m.actual_length - m25p_cmdsz(nor) - dummy;
+	ret = m.actual_length - m25p_cmdsz(nor->addr_width) - dummy;
 	if (ret < 0)
 		return -EIO;
 	return ret;
-- 
2.6.2
