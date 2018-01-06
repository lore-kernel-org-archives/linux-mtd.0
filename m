Received: from mout.web.de ([212.227.15.3])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXq6m-0008UW-C1
 for linux-mtd@lists.infradead.org; Sat, 06 Jan 2018 15:10:06 +0000
Subject: [PATCH 3/5] mtd/rfd_ftl: Improve a size determination in two functions
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <a595376a-c343-33ea-8607-370b88e19c61@users.sourceforge.net>
Message-ID: <dc2790d6-6c96-65e4-5407-a2440f5a97e8@users.sourceforge.net>
Date: Sat, 6 Jan 2018 16:09:44 +0100
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
Date: Sat, 6 Jan 2018 15:03:29 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/rfd_ftl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 19e14f909dc6..dcf1b88e1193 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -323,10 +323,9 @@ static void erase_callback(struct erase_info *erase)
 
 static int erase_block(struct partition *part, int block)
 {
-	struct erase_info *erase;
 	int rc = -ENOMEM;
+	struct erase_info *erase = kmalloc(sizeof(*erase), GFP_KERNEL);
 
-	erase = kmalloc(sizeof(struct erase_info), GFP_KERNEL);
 	if (!erase)
 		goto err;
 
@@ -759,7 +758,7 @@ static void rfd_ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	if (mtd->type != MTD_NORFLASH || mtd->size > UINT_MAX)
 		return;
 
-	part = kzalloc(sizeof(struct partition), GFP_KERNEL);
+	part = kzalloc(sizeof(*part), GFP_KERNEL);
 	if (!part)
 		return;
 
-- 
2.15.1
