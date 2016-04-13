Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqOWX-0001G2-7R
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 17:24:18 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH RFC 2/8] mtd: spi-nor: allow different flash_info entries to
 share the same JEDEC ID
Date: Wed, 13 Apr 2016 19:23:34 +0200
Message-ID: <71b06d847f5e19143beb50ce56ed7d13e9998583.1460567255.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1460567255.git.cyrille.pitchen@atmel.com>
References: <cover.1460567255.git.cyrille.pitchen@atmel.com>
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

Some SPI memories like Macronix MX25L25635E and MX25L25673G share the very
same JEDEC ID with no ext ID but provide different hardware capabilities.
For instance, the 35E revision doesn't support the dedicated 4byte address
opcodes for (Fast) Read, Page Program and Sector Erase operations whereas
the 73G does.

The 'name' argument of spi_nor_scan() is used by spi_nor_match_id() to look
the right entry up. Later, spi_nor_read_id() is called to check whether the
actual JEDEC ID read from the hardware matches the one associated with the
struct flash_info pointer returned by spi_nor_match_id().
However this check was done by comparing the jinfo and info struct
flash_info pointers. Since these pointer values might be different now,
the updated code checks the values of the id_len and id fields, which
should be the same for all entries associated to the same JEDEC ID.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 4606eac237fe..aac291a590e1 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1359,7 +1359,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		jinfo = spi_nor_read_id(nor);
 		if (IS_ERR(jinfo)) {
 			return PTR_ERR(jinfo);
-		} else if (jinfo != info) {
+		} else if (jinfo->id_len != info->id_len ||
+			   memcmp(jinfo->id, info->id, info->id_len)) {
 			/*
 			 * JEDEC knows better, so overwrite platform ID. We
 			 * can't trust partitions any longer, but we'll let
-- 
1.8.2.2
