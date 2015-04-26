From: Baruch Siach <baruch@tkos.co.il>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 3/4] mtd: mxc_nand: fix truncate of unaligned oob copying
Date: Sun, 26 Apr 2015 11:16:50 +0300
Message-Id: <1f8e85fd8e75170e1005473c075942cb3d4479fe.1430034929.git.baruch@tkos.co.il>
In-Reply-To: <cover.1430034929.git.baruch@tkos.co.il>
References: <cover.1430034929.git.baruch@tkos.co.il>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Copy to/from oob io area might not be aligned to 4 bytes. When 8 bit ECC is
used, the buffer size is 26. Make sure we pass 4 bytes aligned buffer size to
memcpy32_{to,from}io to avoid truncating the buffer.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/nand/mxc_nand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index c650f0950b20..c05f5e8fef17 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -840,22 +840,22 @@ static void copy_spare(struct mtd_info *mtd, bool bfrom)
 		for (i = 0; i < num_chunks - 1; i++)
 			memcpy32_fromio(d + i * oob_chunk_size,
 					s + i * sparebuf_size,
-					oob_chunk_size);
+					ALIGN(oob_chunk_size, 4));
 
 		/* the last chunk */
 		memcpy32_fromio(d + i * oob_chunk_size,
 				s + i * sparebuf_size,
-				used_oobsize - i * oob_chunk_size);
+				ALIGN(used_oobsize - i * oob_chunk_size, 4));
 	} else {
 		for (i = 0; i < num_chunks - 1; i++)
 			memcpy32_toio(&s[i * sparebuf_size],
 				      &d[i * oob_chunk_size],
-				      oob_chunk_size);
+				      ALIGN(oob_chunk_size, 4));
 
 		/* the last chunk */
 		memcpy32_toio(&s[oob_chunk_size * sparebuf_size],
 			      &d[i * oob_chunk_size],
-			      used_oobsize - i * oob_chunk_size);
+			      ALIGN(used_oobsize - i * oob_chunk_size, 4));
 	}
 }
 
-- 
2.1.4
