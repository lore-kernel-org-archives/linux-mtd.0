Received: from out1.zte.com.cn ([202.103.147.172] helo=mxct.zte.com.cn)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1frdQE-0002RZ-Eb
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2018 06:12:16 +0000
From: Liu Song <liu.song11@zte.com.cn>
To: dedekind1@gmail.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 liu.song11@zte.com.cn, jiang.biao2@zte.com.cn, zhong.weidong@zte.com.cn
Subject: [PATCH] mtd/ubi: Make sure to read volume record from LEB 0 or LEB 1
Date: Mon, 20 Aug 2018 14:09:05 +0800
Message-Id: <1534745345-175434-1-git-send-email-liu.song11@zte.com.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: fishland <liu.song11@zte.com.cn>

Even though we protect on-flash data by CRC checksums,
we still don't trust the media. If lnum is not 0 or 1,
access exceed array boundary can lead to bad situation.

Signed-off-by: Liu Song <liu.song11@zte.com.cn>
Reviewed-by: Jiang Biao <jiang.biao2@zte.com.cn>
---
 drivers/mtd/ubi/vtbl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 94d7a86..64a2937 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -410,6 +410,10 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 
 	/* Read both LEB 0 and LEB 1 into memory */
 	ubi_rb_for_each_entry(rb, aeb, &av->root, u.rb) {
+		if (aeb->lnum != 0 && aeb->lnum != 1) {
+			ubi_warn(ubi, "volume store in LEB %d", aeb->lnum);
+			continue;
+		}
 		leb[aeb->lnum] = vzalloc(ubi->vtbl_size);
 		if (!leb[aeb->lnum]) {
 			err = -ENOMEM;
-- 
2.1.0.GIT
