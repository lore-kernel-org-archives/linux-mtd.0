Received: from [65.117.135.105] (helo=yoda.timesys)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C83rc-00081n-L3
	for linux-mtd@lists.infradead.org; Thu, 16 Sep 2004 17:32:25 -0400
Date: Thu, 16 Sep 2004 17:32:19 -0400
To: linux-mtd@lists.infradead.org
Message-ID: <20040916213219.GA28903@yoda.timesys>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: Scott Wood <scott@timesys.com>
Cc: manas.saksena@timesys.com
Subject: [PATCH] IXDP425 write16 alignment
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've attached a patch to the ixp4xx.c map file to prevent
ixp4xx_write16() from writing to an unaligned address, which happens
when probing the device width.  Such an access causes a fault handler
to attempt to do the write a byte at a time, which apparently
aggravates the hardware into causing a delayed data abort, which
crashes the system.

With this patch, unaligned writes are ignored, causing the 8-bit
probe to fail and proceed to the 16-bit probe (which succeeds).

Signed-off-by: Scott Wood <scott.wood@timesys.com> under TS0068

--- linux-2.6.8.1/drivers/mtd/maps/ixp4xx.c	2004-08-17 15:22:35.000000000 -0400
+++ linux-ixdp425/drivers/mtd/maps/ixp4xx.c	2004-09-16 17:21:20.000000000 -0400
@@ -71,7 +71,8 @@
 
 static void ixp4xx_write16(struct map_info *map, map_word d, unsigned long adr)
 {
-	*(__u16 *) (map->map_priv_1 + adr) = d.x[0];
+	if (!(adr & 1))
+		*(__u16 *) (map->map_priv_1 + adr) = d.x[0];
 }
 
 struct ixp4xx_flash_info {
