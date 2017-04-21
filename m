Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1bSe-0005RS-Mt
 for linux-mtd@lists.infradead.org; Fri, 21 Apr 2017 16:31:10 +0000
Received: by mail-yb0-x244.google.com with SMTP id 19so6082567ybl.2
 for <linux-mtd@lists.infradead.org>; Fri, 21 Apr 2017 09:30:47 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, cphealy@gmail.com,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/6] mtd: dataflash: Replace C99 types with their kernel
 counterparts
Date: Fri, 21 Apr 2017 09:30:21 -0700
Message-Id: <20170421163026.24884-1-andrew.smirnov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No functional change intended.

Cc: cphealy@gmail.com
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-kernel@vger.kernel.org
Acked-by: Marek Vasut <marek.vasut@gmail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

No changes since [v3], [v4]

Changes since [v2]:

	- Re-worded commit message

	- Collected Acked-by from Marek

Not present in v1

[v2]: http://lkml.kernel.org/r/20170418142127.23301-1-andrew.smirnov@gmail.com
[v3]: http://lkml.kernel.org/r/20170419152305.17226-1-andrew.smirnov@gmail.com
[v4]: http://lkml.kernel.org/r/20170420162952.5181-1-andrew.smirnov@gmail.com

 drivers/mtd/devices/mtd_dataflash.c | 40 ++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index f9e9bd1..a566231 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -84,7 +84,7 @@
 
 
 struct dataflash {
-	uint8_t			command[4];
+	u8			command[4];
 	char			name[24];
 
 	unsigned short		page_offset;	/* offset in flash address */
@@ -153,8 +153,8 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
 	struct spi_transfer	x = { };
 	struct spi_message	msg;
 	unsigned		blocksize = priv->page_size << 3;
-	uint8_t			*command;
-	uint32_t		rem;
+	u8			*command;
+	u32			rem;
 
 	pr_debug("%s: erase addr=0x%llx len 0x%llx\n",
 	      dev_name(&spi->dev), (long long)instr->addr,
@@ -187,8 +187,8 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
 		pageaddr = pageaddr << priv->page_offset;
 
 		command[0] = do_block ? OP_ERASE_BLOCK : OP_ERASE_PAGE;
-		command[1] = (uint8_t)(pageaddr >> 16);
-		command[2] = (uint8_t)(pageaddr >> 8);
+		command[1] = (u8)(pageaddr >> 16);
+		command[2] = (u8)(pageaddr >> 8);
 		command[3] = 0;
 
 		pr_debug("ERASE %s: (%x) %x %x %x [%i]\n",
@@ -239,7 +239,7 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 	struct spi_transfer	x[2] = { };
 	struct spi_message	msg;
 	unsigned int		addr;
-	uint8_t			*command;
+	u8			*command;
 	int			status;
 
 	pr_debug("%s: read 0x%x..0x%x\n", dev_name(&priv->spi->dev),
@@ -271,9 +271,9 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 	 * fewer "don't care" bytes.  Both buffers stay unchanged.
 	 */
 	command[0] = OP_READ_CONTINUOUS;
-	command[1] = (uint8_t)(addr >> 16);
-	command[2] = (uint8_t)(addr >> 8);
-	command[3] = (uint8_t)(addr >> 0);
+	command[1] = (u8)(addr >> 16);
+	command[2] = (u8)(addr >> 8);
+	command[3] = (u8)(addr >> 0);
 	/* plus 4 "don't care" bytes */
 
 	status = spi_sync(priv->spi, &msg);
@@ -308,7 +308,7 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 	size_t			remaining = len;
 	u_char			*writebuf = (u_char *) buf;
 	int			status = -EINVAL;
-	uint8_t			*command;
+	u8			*command;
 
 	pr_debug("%s: write 0x%x..0x%x\n",
 		dev_name(&spi->dev), (unsigned)to, (unsigned)(to + len));
@@ -455,11 +455,11 @@ static int dataflash_get_otp_info(struct mtd_info *mtd, size_t len,
 }
 
 static ssize_t otp_read(struct spi_device *spi, unsigned base,
-		uint8_t *buf, loff_t off, size_t len)
+		u8 *buf, loff_t off, size_t len)
 {
 	struct spi_message	m;
 	size_t			l;
-	uint8_t			*scratch;
+	u8			*scratch;
 	struct spi_transfer	t;
 	int			status;
 
@@ -538,7 +538,7 @@ static int dataflash_write_user_otp(struct mtd_info *mtd,
 {
 	struct spi_message	m;
 	const size_t		l = 4 + 64;
-	uint8_t			*scratch;
+	u8			*scratch;
 	struct spi_transfer	t;
 	struct dataflash	*priv = mtd->priv;
 	int			status;
@@ -689,14 +689,14 @@ struct flash_info {
 	/* JEDEC id has a high byte of zero plus three data bytes:
 	 * the manufacturer id, then a two byte device id.
 	 */
-	uint32_t	jedec_id;
+	u32		jedec_id;
 
 	/* The size listed here is what works with OP_ERASE_PAGE. */
 	unsigned	nr_pages;
-	uint16_t	pagesize;
-	uint16_t	pageoffset;
+	u16		pagesize;
+	u16		pageoffset;
 
-	uint16_t	flags;
+	u16		flags;
 #define SUP_POW2PS	0x0002		/* supports 2^N byte pages */
 #define IS_POW2PS	0x0001		/* uses 2^N byte pages */
 };
@@ -739,9 +739,9 @@ static struct flash_info dataflash_data[] = {
 static struct flash_info *jedec_probe(struct spi_device *spi)
 {
 	int			tmp;
-	uint8_t			code = OP_READ_ID;
-	uint8_t			id[3];
-	uint32_t		jedec;
+	u8			code = OP_READ_ID;
+	u8			id[3];
+	u32			jedec;
 	struct flash_info	*info;
 	int status;
 
-- 
2.9.3
