Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCjSs-0007BK-Vn
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 08:12:53 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 3/7] ubi: Fix whitespace issue in count_fastmap_pebs()
Date: Tue, 14 Jun 2016 10:12:14 +0200
Message-Id: <1465891938-4063-3-git-send-email-richard@nod.at>
In-Reply-To: <1465891938-4063-1-git-send-email-richard@nod.at>
References: <1465891938-4063-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 990898b..ab337e6 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -578,7 +578,7 @@ static int count_fastmap_pebs(struct ubi_attach_info *ai)
 	list_for_each_entry(aeb, &ai->free, u.list)
 		n++;
 
-	 ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb)
+	ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb)
 		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb)
 			n++;
 
-- 
2.7.3
