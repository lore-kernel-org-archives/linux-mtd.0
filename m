Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTyl7-0008TI-Gk
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 13:55:02 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n6NDsQ03009936
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jul 2009 16:54:47 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: eliminate possible undefined behaviour
Date: Thu, 23 Jul 2009 18:46:23 +0300
Message-Id: <1248363983-29596-1-git-send-email-dedekind@infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Phil Carmody <ext-phil.2.carmody@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Phil Carmody <ext-phil.2.carmody@nokia.com>

The assignment to pos when rb is finally NULL is undefined behaviour.
Upon seeing that assignment, GCC may assume that rb is not NULL, and
the loop condition ``rb'' may be optimised away.

Signed-off-by: Phil Carmody <ext-phil.2.carmody@nokia.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/ubi.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 6a5fe96..c290f51 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -579,7 +579,8 @@ void ubi_do_get_volume_info(struct ubi_device *ubi, struct ubi_volume *vol,
 	for (rb = rb_first(root),                                            \
 	     pos = (rb ? container_of(rb, typeof(*pos), member) : NULL);     \
 	     rb;                                                             \
-	     rb = rb_next(rb), pos = container_of(rb, typeof(*pos), member))
+	     rb = rb_next(rb),                                               \
+	     pos = (rb ? container_of(rb, typeof(*pos), member) : NULL))
 
 /**
  * ubi_zalloc_vid_hdr - allocate a volume identifier header object.
-- 
1.6.0.6
