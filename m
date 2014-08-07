Received: from mail-wg0-x22d.google.com ([2a00:1450:400c:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFIQb-0002Dw-Lq
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 07:48:02 +0000
Received: by mail-wg0-f45.google.com with SMTP id x12so3759227wgg.16
 for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2014 00:47:38 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/2] mtd: spi-nor: drop jedec_probe /helper/ function
Date: Thu,  7 Aug 2014 09:47:02 +0200
Message-Id: <1407397622-9252-2-git-send-email-zajec5@gmail.com>
In-Reply-To: <1407397622-9252-1-git-send-email-zajec5@gmail.com>
References: <1407397622-9252-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's a one-liner doing no magic and its name may be confusing because
it does not have to use JEDEC (e.g. when using alternative read_id).

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 06fe959..ef45177 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -660,11 +660,6 @@ static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
 	return ERR_PTR(-ENODEV);
 }
 
-static const struct spi_device_id *jedec_probe(struct spi_nor *nor)
-{
-	return nor->read_id(nor);
-}
-
 static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, u_char *buf)
 {
@@ -939,7 +934,7 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 	if (info->jedec_id) {
 		const struct spi_device_id *jid;
 
-		jid = jedec_probe(nor);
+		jid = nor->read_id(nor);
 		if (IS_ERR(jid)) {
 			return PTR_ERR(jid);
 		} else if (jid != id) {
-- 
1.8.4.5
