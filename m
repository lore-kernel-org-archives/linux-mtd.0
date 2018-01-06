Received: from mout.web.de ([212.227.15.4])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXq4s-0007rk-BT
 for linux-mtd@lists.infradead.org; Sat, 06 Jan 2018 15:08:08 +0000
Subject: [PATCH 1/5] mtd/rfd_ftl: Delete an error message for a failed memory
 allocation in scan_header()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <a595376a-c343-33ea-8607-370b88e19c61@users.sourceforge.net>
Message-ID: <90d58d5f-73e4-b47e-d013-19cd84c4ccda@users.sourceforge.net>
Date: Sat, 6 Jan 2018 16:07:45 +0100
MIME-Version: 1.0
In-Reply-To: <a595376a-c343-33ea-8607-370b88e19c61@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jan 2018 14:07:31 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/rfd_ftl.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index d1cbf26db2c0..efff25f15d5b 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -190,11 +190,8 @@ static int scan_header(struct partition *part)
 		goto err;
 
 	part->sector_map = vmalloc(part->sector_count * sizeof(u_long));
-	if (!part->sector_map) {
-		printk(KERN_ERR PREFIX "'%s': unable to allocate memory for "
-			"sector map", part->mbd.mtd->name);
+	if (!part->sector_map)
 		goto err;
-	}
 
 	for (i=0; i<part->sector_count; i++)
 		part->sector_map[i] = -1;
-- 
2.15.1
