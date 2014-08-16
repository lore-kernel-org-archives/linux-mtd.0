From: Colin King <colin.king@canonical.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: block: fix dereference on uninitialized dev
Date: Sat, 16 Aug 2014 17:49:53 +0100
Message-Id: <1408207793-11536-1-git-send-email-colin.king@canonical.com>
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

commit 4df38926f337 ("UBI: block: Avoid disk size integer overflow")
introduced a dereference on dev (which is not initialized at that
point) when printing a warning message.  Remove the reference to
the dev's disk_name.

Found by cppcheck:
 [drivers/mtd/ubi/block.c:509]: (error) Uninitialized variable: dev

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/ubi/block.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 33c6495..944bdbd 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -505,8 +505,8 @@ static int ubiblock_resize(struct ubi_volume_info *vi)
 	u64 disk_capacity = ((u64)vi->size * vi->usable_leb_size) >> 9;
 
 	if ((sector_t)disk_capacity != disk_capacity) {
-		ubi_warn("%s: the volume is too big, cannot resize (%d LEBs)",
-			 dev->gd->disk_name, vi->size);
+		ubi_warn("block: the volume is too big, cannot resize (%d LEBs)",
+			vi->size);
 		return -EFBIG;
 	}
 	/*
-- 
2.1.0.rc1
