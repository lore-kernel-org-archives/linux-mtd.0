Received: from mail-qk0-f171.google.com ([209.85.220.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZnVmN-00041U-8h
 for linux-mtd@lists.infradead.org; Sat, 17 Oct 2015 18:00:27 +0000
Received: by qkfm62 with SMTP id m62so65558645qkf.1
 for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2015 11:00:05 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>
Cc: Richard Weinberger <richard@nod.at>, hs@denx.de,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH] UBI: Fastmap: Fix PEB array type
Date: Sat, 17 Oct 2015 14:55:55 -0300
Message-Id: <1445104555-30509-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The PEB array is an array of __be32, so let's fix the
scan_pool() prototype accordingly.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/ubi/fastmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index db3defdfc3c0..c867707a1d04 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -383,7 +383,7 @@ static void unmap_peb(struct ubi_attach_info *ai, int pnum)
  * < 0 indicates an internal error.
  */
 static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
-		     int *pebs, int pool_size, unsigned long long *max_sqnum,
+		     __be32 *pebs, int pool_size, unsigned long long *max_sqnum,
 		     struct list_head *eba_orphans, struct list_head *free)
 {
 	struct ubi_vid_hdr *vh;
-- 
2.5.2
