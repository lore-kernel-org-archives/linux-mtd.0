Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c039u-0001P0-Lw
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 09:09:07 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH] UBI: fastmap: Fix add_vol() return value test in
 ubi_attach_fastmap()
Date: Fri, 28 Oct 2016 11:08:44 +0200
Message-Id: <1477645724-17654-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit e96a8a3bb671 ("UBI: Fastmap: Do not add vol if it already
exists") introduced a bug by changing the possible error codes returned
by add_vol():
- this functions no longer returns NULL in case of allocation failure
  but return ERR_PTR(-ENOMEM)
- when a duplicate entry in the volume RB tree is found it returns
  ERR_PTR(-EEXIST) instead of ERR_PTR(-EINVAL)

Fix the tests done of add_vol() return value accordingly.

Fixes: e96a8a3bb671 ("UBI: Fastmap: Do not add vol if it already exists")
Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Sheng Yong <shengyong1@huawei.com>
---
 drivers/mtd/ubi/fastmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index d6384d965788..eb39c44726e3 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -707,11 +707,11 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			     fmvhdr->vol_type,
 			     be32_to_cpu(fmvhdr->last_eb_bytes));
 
-		if (!av)
-			goto fail_bad;
-		if (PTR_ERR(av) == -EINVAL) {
-			ubi_err(ubi, "volume (ID %i) already exists",
-				fmvhdr->vol_id);
+		if (IS_ERR(av)) {
+			if (PTR_ERR(av) == -EEXIST)
+				ubi_err(ubi, "volume (ID %i) already exists",
+					fmvhdr->vol_id);
+
 			goto fail_bad;
 		}
 
-- 
2.7.4
