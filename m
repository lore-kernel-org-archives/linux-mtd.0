Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRedt-0007pm-ER
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:29:05 +0000
Received: by pablf10 with SMTP id lf10so29309529pab.12
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:28:44 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/5] UBI: fix out of bounds write
Date: Sat, 28 Feb 2015 02:23:26 -0800
Message-Id: <1425119009-28634-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
References: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If aeb->len >= vol->reserved_pebs, we should not be writing aeb into the
PEB->LEB mapping.

Caught by Coverity, CID #711212.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/ubi/eba.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index da4c79259f67..6442d3fbcb73 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1418,7 +1418,8 @@ int ubi_eba_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 				 * during re-size.
 				 */
 				ubi_move_aeb_to_list(av, aeb, &ai->erase);
-			vol->eba_tbl[aeb->lnum] = aeb->pnum;
+			else
+				vol->eba_tbl[aeb->lnum] = aeb->pnum;
 		}
 	}
 
-- 
2.1.0
