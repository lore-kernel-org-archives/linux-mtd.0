Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OyxS3-0005Pb-El
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 01:51:52 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 7306D1B40BB
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 01:51:50 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: punt duplicate normsg_cont define
Date: Thu, 23 Sep 2010 21:52:38 -0400
Message-Id: <1285293158-24931-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Looks like someone copied & pasted it twice by accident.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 include/common.h |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/include/common.h b/include/common.h
index f2b7b6b..e87b215 100644
--- a/include/common.h
+++ b/include/common.h
@@ -47,9 +47,6 @@ extern "C" {
 #define normsg(fmt, ...) do {                              \
 	printf(PROGRAM_NAME ": " fmt "\n", ##__VA_ARGS__); \
 } while(0)
-#define normsg_cont(fmt, ...) do {                    \
-	printf(PROGRAM_NAME ": " fmt, ##__VA_ARGS__); \
-} while(0)
 #define normsg_cont(fmt, ...) do {                         \
 	printf(PROGRAM_NAME ": " fmt, ##__VA_ARGS__);      \
 } while(0)
-- 
1.7.3
