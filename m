Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjSeK-0006TB-KJ
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 12:46:53 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 12/35] UBI: Fastmap: Notify user in case of an
 ubi_update_fastmap() failure
Date: Wed, 29 Oct 2014 13:45:35 +0100
Message-Id: <1414586758-9972-13-git-send-email-richard@nod.at>
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

If ubi_update_fastmap() fails notify the user.
This is not a hard error as ubi_update_fastmap() makes sure upon failure that
the current on-flash fastmap will no be used upon next UBI attach.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index ac19f75..44ebefd 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -640,7 +640,11 @@ again:
 	if (!pool->size || !wl_pool->size || pool->used >= pool->size ||
 	    wl_pool->used >= wl_pool->size) {
 		spin_unlock(&ubi->wl_lock);
-		ubi_update_fastmap(ubi);
+		ret = ubi_update_fastmap(ubi);
+		if (ret) {
+			ubi_msg("Unable to write a new fastmap: %i", ret);
+			return -ENOSPC;
+		}
 		spin_lock(&ubi->wl_lock);
 	}
 
-- 
1.8.4.5
