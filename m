From: mohanlaljangir@gmail.com (Mohan Lal Jangir)
Date: Thu, 3 Sep 2009 22:38:53 +0900
Subject: [PATCH] inappropriate pending block in foldchain
Message-ID: <mailman.1.1251986186.2253.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org


Signed-off-by: Mohan Lal Jangir <mohanlaljangir@gmail.com>
---
 drivers/mtd/inftlcore.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 mode change 100644 => 100755 drivers/mtd/inftlcore.c

diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
old mode 100644
new mode 100755
index d8cf29c..8aca552
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -550,7 +550,7 @@ hitused:
 			 * waiting to be picked up. We're going to have to fold
 			 * a chain to make room.
 			 */
-			thisEUN = INFTL_makefreeblock(inftl, BLOCK_NIL);
+			thisEUN = INFTL_makefreeblock(inftl, block);

 			/*
 			 * Hopefully we free something, lets try again.
-- 
1.6.1.2
