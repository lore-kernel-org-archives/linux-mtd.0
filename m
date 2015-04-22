Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yktr2-0000rp-Rl
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2015 12:34:13 +0000
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: block: Add missing cache flushes
Date: Wed, 22 Apr 2015 09:30:53 -0300
Message-ID: <1429705853-23872-1-git-send-email-ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Richard Weinberger <richard@nod.at>,
 Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 Kevin Cernekee <cernekee@chromium.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kevin Cernekee <cernekee@chromium.org>

Block drivers are responsible for calling flush_dcache_page() on each
BIO request. This operation keeps the I$ coherent with the D$ on
architectures that don't have hardware coherency support. Without this
flush, random crashes are seen when executing user programs from an ext4
filesystem backed by a ubiblock device.

This patch is based on the change implemented in commit 2d4dc890b5c8
("block: add helpers to run flush_dcache_page() against a bio and a
request's pages").

Fixes: 9d54c8a33eec ("UBI: R/O block driver on top of UBI volumes")
Signed-off-by: Kevin Cernekee <cernekee@chromium.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 drivers/mtd/ubi/block.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index db2c05b..c9eb78f 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -310,6 +310,8 @@ static void ubiblock_do_work(struct work_struct *work)
 	blk_rq_map_sg(req->q, req, pdu->usgl.sg);
 
 	ret = ubiblock_read(pdu);
+	rq_flush_dcache_pages(req);
+
 	blk_mq_end_request(req, ret);
 }
 
-- 
2.3.3
