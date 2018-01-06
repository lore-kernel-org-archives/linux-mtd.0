Received: from mout.web.de ([212.227.15.3])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXq5w-0008DM-V6
 for linux-mtd@lists.infradead.org; Sat, 06 Jan 2018 15:09:15 +0000
Subject: [PATCH 2/5] mtd/rfd_ftl: Less function calls in scan_header() after
 error detection
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <a595376a-c343-33ea-8607-370b88e19c61@users.sourceforge.net>
Message-ID: <6f10248e-d2c9-3c48-922c-be95ac5caba9@users.sourceforge.net>
Date: Sat, 6 Jan 2018 16:08:51 +0100
MIME-Version: 1.0
In-Reply-To: <a595376a-c343-33ea-8607-370b88e19c61@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jan 2018 14:50:58 +0100

The functions "kfree" and "vfree" were called in three cases
by the scan_header() function during error handling even if
the passed data structure member contained a null pointer.

Adjust jump targets according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/rfd_ftl.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index efff25f15d5b..19e14f909dc6 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -182,16 +182,16 @@ static int scan_header(struct partition *part)
 
 	part->header_cache = kmalloc(part->header_size, GFP_KERNEL);
 	if (!part->header_cache)
-		goto err;
+		return -ENOMEM;
 
 	part->blocks = kcalloc(part->total_blocks, sizeof(struct block),
 			GFP_KERNEL);
 	if (!part->blocks)
-		goto err;
+		goto free_cache;
 
 	part->sector_map = vmalloc(part->sector_count * sizeof(u_long));
 	if (!part->sector_map)
-		goto err;
+		goto free_blocks;
 
 	for (i=0; i<part->sector_count; i++)
 		part->sector_map[i] = -1;
@@ -229,9 +229,10 @@ static int scan_header(struct partition *part)
 
 err:
 	vfree(part->sector_map);
-	kfree(part->header_cache);
+free_blocks:
 	kfree(part->blocks);
-
+free_cache:
+	kfree(part->header_cache);
 	return rc;
 }
 
-- 
2.15.1
