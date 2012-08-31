Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T7Z1f-000115-UE
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2012 21:45:17 +0000
Received: by dajq27 with SMTP id q27so2277319daj.36
 for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2012 14:45:13 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBI: fix trivial typo 'it' => 'is'
Date: Fri, 31 Aug 2012 14:43:41 -0700
Message-Id: <1346449421-22067-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/ubi/attach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index da13215..f7adf53 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -79,7 +79,7 @@
  *     NAND), it is probably a PEB which was being erased when power cut
  *     happened, so this is corruption type 1. However, this is just a guess,
  *     which might be wrong.
- *   o Otherwise this it corruption type 2.
+ *   o Otherwise this is corruption type 2.
  */
 
 #include <linux/err.h>
-- 
1.7.11.3
