Received: from cam-admin0.cambridge.arm.com ([217.140.96.50])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti8mg-0002Y1-So
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 19:13:00 +0000
From: Will Deacon <will.deacon@arm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] mtd: nand/gpio: use io{read,write}*_rep accessors
Date: Mon, 10 Dec 2012 19:12:39 +0000
Message-Id: <1355166762-15133-8-git-send-email-will.deacon@arm.com>
In-Reply-To: <1355166762-15133-1-git-send-email-will.deacon@arm.com>
References: <1355166762-15133-1-git-send-email-will.deacon@arm.com>
Cc: linux-arch@vger.kernel.org, Matthew Leach <matthew@mattleach.net>,
 james.hogan@imgtec.com, arnd@arndb.de, benh@kernel.crashing.org,
 Will Deacon <will.deacon@arm.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Matthew Leach <matthew@mattleach.net>

The {read,write}s{b,w,l} operations are not defined by all
architectures and are being removed from the asm-generic/io.h
interface.

This patch replaces the usage of these string functions in the mtd
gpio accessors with io{read,write}{8,16,32}_rep calls instead.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Ben Herrenschmidt <benh@kernel.crashing.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Matthew Leach <matthew@mattleach.net>
Signed-off-by: Will Deacon <will.deacon@arm.com>
---
 drivers/mtd/nand/gpio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index bc73bc5..0d233e9 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -90,14 +90,14 @@ static void gpio_nand_writebuf(struct mtd_info *mtd, const u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
 
-	writesb(this->IO_ADDR_W, buf, len);
+	iowrite8_rep(this->IO_ADDR_W, buf, len);
 }
 
 static void gpio_nand_readbuf(struct mtd_info *mtd, u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
 
-	readsb(this->IO_ADDR_R, buf, len);
+	ioread8_rep(this->IO_ADDR_R, buf, len);
 }
 
 static void gpio_nand_writebuf16(struct mtd_info *mtd, const u_char *buf,
@@ -106,7 +106,7 @@ static void gpio_nand_writebuf16(struct mtd_info *mtd, const u_char *buf,
 	struct nand_chip *this = mtd->priv;
 
 	if (IS_ALIGNED((unsigned long)buf, 2)) {
-		writesw(this->IO_ADDR_W, buf, len>>1);
+		iowrite16_rep(this->IO_ADDR_W, buf, len>>1);
 	} else {
 		int i;
 		unsigned short *ptr = (unsigned short *)buf;
@@ -121,7 +121,7 @@ static void gpio_nand_readbuf16(struct mtd_info *mtd, u_char *buf, int len)
 	struct nand_chip *this = mtd->priv;
 
 	if (IS_ALIGNED((unsigned long)buf, 2)) {
-		readsw(this->IO_ADDR_R, buf, len>>1);
+		ioread16_rep(this->IO_ADDR_R, buf, len>>1);
 	} else {
 		int i;
 		unsigned short *ptr = (unsigned short *)buf;
-- 
1.8.0
