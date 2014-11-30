Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv3Wq-0008Oi-57
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 12:23:04 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 4/4] UBI: Fastmap: Optimize anchor PEB search
Date: Sun, 30 Nov 2014 13:22:37 +0100
Message-Id: <1417350157-9373-5-git-send-email-richard@nod.at>
In-Reply-To: <1417350157-9373-1-git-send-email-richard@nod.at>
References: <1417350157-9373-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The UBI RB trees are sorted by the PEB number, hence
we don't have to traverse the whole tree because ubi_rb_for_each_entry()
walks the tree in sort order.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap-wl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index b2a6653..c7ad2a7 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -39,7 +39,10 @@ static struct ubi_wl_entry *find_anchor_wl_entry(struct rb_root *root)
 	int max_ec = UBI_MAX_ERASECOUNTER;
 
 	ubi_rb_for_each_entry(p, e, root, u.rb) {
-		if (e->pnum < UBI_FM_MAX_START && e->ec < max_ec) {
+		if (e->pnum >= UBI_FM_MAX_START)
+			break;
+
+		if (e->ec < max_ec) {
 			victim = e;
 			max_ec = e->ec;
 		}
@@ -74,6 +77,8 @@ static int anchor_pebs_avalible(struct rb_root *root)
 	ubi_rb_for_each_entry(p, e, root, u.rb)
 		if (e->pnum < UBI_FM_MAX_START)
 			return 1;
+		else
+			break;
 
 	return 0;
 }
-- 
1.8.4.5
