Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPv0H-0003YC-GY
 for linux-mtd@lists.infradead.org; Sat, 28 Sep 2013 13:56:14 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 7/7] UBI: Add some asserts to ubi_attach_fastmap()
Date: Sat, 28 Sep 2013 15:55:16 +0200
Message-Id: <1380376516-30144-8-git-send-email-richard@nod.at>
In-Reply-To: <1380376516-30144-1-git-send-email-richard@nod.at>
References: <1380376516-30144-1-git-send-email-richard@nod.at>
Cc: richard.genoud@gmail.com, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add more paranioa asserts to make it easier to detect
implementation errors.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 4cfc8da..ead8613 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -826,6 +826,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list)
 		list_move_tail(&tmp_aeb->u.list, &ai->free);
 
+	ubi_assert(list_empty(&used));
+	ubi_assert(list_empty(&eba_orphans));
+	ubi_assert(list_empty(&free));
+
 	/*
 	 * If fastmap is leaking PEBs (must not happen), raise a
 	 * fat warning and fall back to scanning mode.
-- 
1.8.3.1
