Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv3UW-0006mj-4n
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 12:20:42 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 6/6] UBI: Fastmap: Remove else after return.
Date: Sun, 30 Nov 2014 13:19:48 +0100
Message-Id: <1417349988-9238-7-git-send-email-richard@nod.at>
In-Reply-To: <1417349988-9238-1-git-send-email-richard@nod.at>
References: <1417349988-9238-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

checkpatch.pl complains:
WARNING: else is not generally useful after a break or return

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap-wl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index c471753..7a72af2 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -260,10 +260,10 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 			schedule_work(&ubi->fm_work);
 		}
 		return NULL;
-	} else {
-		pnum = pool->pebs[pool->used++];
-		return ubi->lookuptbl[pnum];
 	}
+
+	pnum = pool->pebs[pool->used++];
+	return ubi->lookuptbl[pnum];
 }
 
 /**
-- 
1.8.4.5
