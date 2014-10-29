Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjSeN-0006TD-4q
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 12:46:57 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 19/35] UBI: Fastmap: Remove bogus ubi_assert()
Date: Wed, 29 Oct 2014 13:45:42 +0100
Message-Id: <1414586758-9972-20-git-send-email-richard@nod.at>
In-Reply-To: <1414586758-9972-1-git-send-email-richard@nod.at>
References: <1414586758-9972-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is legal to have PEB left in the used list.
This can happen if UBI copies a PEB and a powercut happens
between writing a new fastmap and adding this PEB into the EBA table.
In this case the old PEB will be used.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 1654f95..98d141e 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -879,7 +879,9 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list)
 		list_move_tail(&tmp_aeb->u.list, &ai->free);
 
-	ubi_assert(list_empty(&used));
+	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list)
+		list_move_tail(&tmp_aeb->u.list, &ai->erase);
+
 	ubi_assert(list_empty(&eba_orphans));
 	ubi_assert(list_empty(&free));
 
-- 
1.8.4.5
