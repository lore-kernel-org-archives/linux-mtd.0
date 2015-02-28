Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRedu-0007pw-FZ
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:29:07 +0000
Received: by pdno5 with SMTP id o5so27063543pdn.8
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:28:45 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 3/5] UBI: initialize LEB number variable
Date: Sat, 28 Feb 2015 02:23:27 -0800
Message-Id: <1425119009-28634-4-git-send-email-computersforpeace@gmail.com>
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

In some of the 'out_not_moved' error paths, lnum may be used
uninitialized. Don't ignore the warning; let's fix it.

This uninitialized variable doesn't have much visible effect in the end,
since we just schedule the PEB for erasure, and its LEB number doesn't
really matter (it just gets printed in debug messages). But let's get it
straight anyway.

Coverity CID #113449

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/ubi/wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 8f7bde6a85d6..0bd92d816391 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1002,7 +1002,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 				int shutdown)
 {
 	int err, scrubbing = 0, torture = 0, protect = 0, erroneous = 0;
-	int vol_id = -1, uninitialized_var(lnum);
+	int vol_id = -1, lnum = -1;
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	int anchor = wrk->anchor;
 #endif
-- 
2.1.0
