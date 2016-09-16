Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkuce-0006wi-2v
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 15:00:17 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 08/18] UBI: fastmap: use ubi_rb_for_each_entry() in
 unmap_peb()
Date: Fri, 16 Sep 2016 16:59:16 +0200
Message-Id: <1474037966-5524-9-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1474037966-5524-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1474037966-5524-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the ubi_rb_for_each_entry() macro instead of open-coding it.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/fastmap.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index bae80699c2f2..1bfb4aeb67d4 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -385,12 +385,8 @@ static void unmap_peb(struct ubi_attach_info *ai, int pnum)
 	struct rb_node *node, *node2;
 	struct ubi_ainf_peb *aeb;
 
-	for (node = rb_first(&ai->volumes); node; node = rb_next(node)) {
-		av = rb_entry(node, struct ubi_ainf_volume, rb);
-
-		for (node2 = rb_first(&av->root); node2;
-		     node2 = rb_next(node2)) {
-			aeb = rb_entry(node2, struct ubi_ainf_peb, u.rb);
+	ubi_rb_for_each_entry(node, av, &ai->volumes, rb) {
+		ubi_rb_for_each_entry(node2, aeb, &av->root, u.rb) {
 			if (aeb->pnum == pnum) {
 				rb_erase(&aeb->u.rb, &av->root);
 				av->leb_count--;
-- 
2.7.4
