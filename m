Received: from frisell.zx2c4.com ([192.95.5.64])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJqGp-0005Ad-KV
 for linux-mtd@lists.infradead.org; Wed, 21 Dec 2016 23:26:04 +0000
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] mtd/redboot: avoid null pointer deref
Date: Thu, 22 Dec 2016 00:25:28 +0100
Message-Id: <20161221232528.26534-1-Jason@zx2c4.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

By giving a bogus partition name, it's possible to trigger a null
pointer dereference.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/mtd/redboot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/redboot.c b/drivers/mtd/redboot.c
index 7623ac5fc586..53949ef80d36 100644
--- a/drivers/mtd/redboot.c
+++ b/drivers/mtd/redboot.c
@@ -212,6 +212,10 @@ static int parse_redboot_partitions(struct mtd_info *master,
 
 		nrparts++;
 	}
+	if (!fl) {
+		ret = -EINVAL;
+		goto out;
+	}
 #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
 	if (fl->img->flash_base) {
 		nrparts++;
-- 
2.11.0
