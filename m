Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm5-0002Ya-PA
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:33:03 +0000
Received: by mail-pf0-x242.google.com with SMTP id 66so7810540pfe.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:44 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 10/17] drivers:mtd:ubi:enable bakvol function for fastmap
 operation
Date: Tue,  2 Feb 2016 02:30:45 +0000
Message-Id: <1454380252-16170-11-git-send-email-jackyard88@gmail.com>
In-Reply-To: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
References: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bean Huo <beanhuo@micron.com>

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 drivers/mtd/ubi/fastmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 4aa2fd8..d32148b 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1313,7 +1313,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 
 	for (i = 0; i < new_fm->used_blocks; i++) {
 		ret = ubi_io_write(ubi, fm_raw + (i * ubi->leb_size),
-			new_fm->e[i]->pnum, ubi->leb_start, ubi->leb_size);
+			new_fm->e[i]->pnum, ubi->leb_start, ubi->leb_size, 1);
 		if (ret) {
 			ubi_err(ubi, "unable to write fastmap to PEB %i!",
 				new_fm->e[i]->pnum);
-- 
1.9.1
