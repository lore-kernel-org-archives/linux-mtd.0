Received: from mail01.prevas.se ([62.95.78.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e4Lln-0002Mg-Ci
 for linux-mtd@lists.infradead.org; Tue, 17 Oct 2017 06:54:33 +0000
From: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
To: <linux-mtd@lists.infradead.org>
CC: Sean Nyekjaer <sean.nyekjaer@prevas.dk>, <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH 2/2] mtd: spi-nor: indent issi section
Date: Tue, 17 Oct 2017 08:53:12 +0200
Message-ID: <20171017065312.24779-2-sean.nyekjaer@prevas.dk>
In-Reply-To: <20171017065312.24779-1-sean.nyekjaer@prevas.dk>
References: <20171017065312.24779-1-sean.nyekjaer@prevas.dk>
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

Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 37810eb6e713..e481f545d22f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1019,7 +1019,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
 
 	/* ISSI */
-	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
+	{ "is25cd512",  INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
 	{ "is25lq040b", INFO(0x9d4013, 0, 64 * 1024,  64, SECT_4K) },
 
 	/* Macronix */
-- 
2.14.2
