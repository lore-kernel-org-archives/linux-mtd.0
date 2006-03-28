Received: from xenotime.net ([66.160.160.81])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FO1oQ-0005yc-2d
	for linux-mtd@lists.infradead.org; Mon, 27 Mar 2006 19:11:56 -0500
Received: from midway.site ([71.111.157.99]) by xenotime.net for
	<linux-mtd@lists.infradead.org>; Mon, 27 Mar 2006 16:11:46 -0800
Date: Mon, 27 Mar 2006 16:14:02 -0800
From: "Randy.Dunlap" <rdunlap@xenotime.net>
To: dwmw2@infradead.org, akpm <akpm@osdl.org>
Message-Id: <20060327161402.06eaa84b.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] MTD: m25p80: fix printk format warning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix printk format warning:
drivers/mtd/devices/m25p80.c:189: warning: format '%zd' expects type 'signed size_t', but argument 6 has type 'u_int32_t'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 drivers/mtd/devices/m25p80.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

--- linux-2616-g13.orig/drivers/mtd/devices/m25p80.c
+++ linux-2616-g13/drivers/mtd/devices/m25p80.c
@@ -186,7 +186,7 @@ static int m25p80_erase(struct mtd_info 
 	struct m25p *flash = mtd_to_m25p(mtd);
 	u32 addr,len;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%08x, len %zd\n",
+	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%08x, len %d\n",
 			flash->spi->dev.bus_id, __FUNCTION__, "at",
 			(u32)instr->addr, instr->len);
 


---
