Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YT1RT-00061q-FR
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2015 05:01:59 +0000
Received: by iery20 with SMTP id y20so11168244ier.12
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 21:01:34 -0800 (PST)
From: Nicholas Krause <xerofoify@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH 3/3] mtd:Remove the no no longer required function,
 memcmpb in the file inftlmount.c
Date: Wed,  4 Mar 2015 00:01:25 -0500
Message-Id: <1425445285-17678-3-git-send-email-xerofoify@gmail.com>
In-Reply-To: <1425445285-17678-1-git-send-email-xerofoify@gmail.com>
References: <1425445285-17678-1-git-send-email-xerofoify@gmail.com>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Removes the no required function,memcmpd as it's only caller check_free_sectors
as been removed in the previous patch in this patch series.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 drivers/mtd/inftlmount.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index f9f1511..734d318 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -319,16 +319,6 @@ static int find_boot_record(struct INFTLrecord *inftl)
 	return -1;
 }
 
-static int memcmpb(void *a, int c, int n)
-{
-	int i;
-	for (i = 0; i < n; i++) {
-		if (c != ((unsigned char *)a)[i])
-			return 1;
-	}
-	return 0;
-}
-
 int INFTL_formatblock(struct INFTLrecord *inftl, int block)
 {
 	size_t retlen;
-- 
2.1.0
