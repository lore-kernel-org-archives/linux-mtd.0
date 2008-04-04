Received: from mu-out-0910.google.com ([209.85.134.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jhe4j-0006W9-PB
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 05:02:54 +0000
Received: by mu-out-0910.google.com with SMTP id w8so5379181mue.1
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Apr 2008 22:02:52 -0700 (PDT)
Subject: [PATCH] mtd_dataflash use command allocated on stack
From: Vitja Makarov <vitja.makarov@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 04 Apr 2008 09:02:40 +0400
Message-Id: <1207285360.10621.8.camel@vitja-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!


Currently mtd_dataflash driver has command in their private structure.
That is only 4 bytes, sometimes actually 8 is needed.
Also it could be accessed twice before lock is taken.

This patch moves command to stack.

vitja.

Signed-off-by: Vitja Makarov <vitja.makarov@gmail.com>
--- mtd_dataflash.c=	2008-03-03 10:30:35.000000000 +0300
+++ mtd_dataflash.c	2008-04-04 08:47:24.000000000 +0400
@@ -82,7 +82,6 @@
 
 
 struct dataflash {
-	u8			command[4];
 	char			name[24];
 
 	unsigned		partitioned:1;
@@ -150,7 +149,7 @@
 	struct spi_transfer	x = { .tx_dma = 0, };
 	struct spi_message	msg;
 	unsigned		blocksize = priv->page_size << 3;
-	u8			*command;
+	u8			command[4];
 
 	DEBUG(MTD_DEBUG_LEVEL2, "%s: erase addr=0x%x len 0x%x\n",
 			spi->dev.bus_id,
@@ -164,7 +163,7 @@
 
 	spi_message_init(&msg);
 
-	x.tx_buf = command = priv->command;
+	x.tx_buf = command;
 	x.len = 4;
 	spi_message_add_tail(&x, &msg);
 
@@ -234,7 +233,7 @@
 	struct spi_transfer	x[2] = { { .tx_dma = 0, }, };
 	struct spi_message	msg;
 	unsigned int		addr;
-	u8			*command;
+	u8			command[8];
 	int			status;
 
 	DEBUG(MTD_DEBUG_LEVEL2, "%s: read 0x%x..0x%x\n",
@@ -252,8 +251,6 @@
 	addr = (((unsigned)from / priv->page_size) << priv->page_offset)
 		+ ((unsigned)from % priv->page_size);
 
-	command = priv->command;
-
 	DEBUG(MTD_DEBUG_LEVEL3, "READ: (%x) %x %x %x\n",
 		command[0], command[1], command[2], command[3]);
 
@@ -311,7 +308,7 @@
 	size_t			remaining = len;
 	u_char			*writebuf = (u_char *) buf;
 	int			status = -EINVAL;
-	u8			*command;
+	u8			command[8];
 
 	DEBUG(MTD_DEBUG_LEVEL2, "%s: write 0x%x..0x%x\n",
 		spi->dev.bus_id, (unsigned)to, (unsigned)(to + len));
@@ -326,7 +323,7 @@
 
 	spi_message_init(&msg);
 
-	x[0].tx_buf = command = priv->command;
+	x[0].tx_buf = command;
 	x[0].len = 4;
 	spi_message_add_tail(&x[0], &msg);
 
