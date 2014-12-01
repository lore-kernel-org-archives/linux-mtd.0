Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvOMg-00011f-B8
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 10:37:59 +0000
Received: by mail-wi0-f176.google.com with SMTP id ex7so24067806wid.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2014 02:37:36 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: use IS_ERR_OR_NULL as spi_nor_read_id returns
 ERR_PTR
Date: Mon,  1 Dec 2014 11:37:24 +0100
Message-Id: <1417430244-17924-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
Oh damn, I did wrong in my commit
5986a0d4717bc82af0e69e3c6dd04150eafceabe
mtd: spi-nor: allow NULL as chip name and try to auto detect it

Glad we have Dan & kbuild watching us.
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index afc58da..0f8ec3c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -943,7 +943,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		id = spi_nor_read_id(nor);
 	else
 		id = spi_nor_match_id(name);
-	if (!id)
+	if (IS_ERR_OR_NULL(id))
 		return -ENOENT;
 
 	info = (void *)id->driver_data;
-- 
1.8.4.5
