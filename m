Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bvRNy-0008DP-AS
 for linux-mtd@lists.infradead.org; Sat, 15 Oct 2016 16:00:34 +0000
From: Colin King <colin.king@canonical.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH][V2] ubi: fix swapped arguments to call to ubi_alloc_aeb
Date: Sat, 15 Oct 2016 17:00:11 +0100
Message-Id: <20161015160011.27600-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

Static analysis by CoverityScan detected the ec and pnum
arguments are in the wrong order on a call to ubi_alloc_aeb.
Swap the order to fix this.

Fixes: 91f4285fe389a27 ("UBI: provide helpers to allocate and free aeb elements")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/ubi/fastmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index d6384d9..4eed546 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -287,7 +287,7 @@ static int update_vol(struct ubi_device *ubi, struct ubi_attach_info *ai,
 
 		/* new_aeb is newer */
 		if (cmp_res & 1) {
-			victim = ubi_alloc_aeb(ai, aeb->ec, aeb->pnum);
+			victim = ubi_alloc_aeb(ai, aeb->pnum, aeb->ec);
 			if (!victim)
 				return -ENOMEM;
 
-- 
2.9.3
