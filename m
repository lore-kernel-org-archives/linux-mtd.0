Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LA133-00069w-CC
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 11:46:42 +0000
Message-ID: <428823053.23007@cqu.edu.cn>
Subject: [PATCH 4/4] UBI WL-Subsys: Improvement in prot tree
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 09 Dec 2008 19:46:03 +0800
Message-Id: <1228823163.2753.18.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From e3af46580d374fc5da79212c17ef9f0179299bd0 Mon Sep 17 00:00:00 2001
From: Xiaochuan-Xu <xiaochuan-xu@cqu.edu.cn>
Date: Tue, 9 Dec 2008 19:27:40 +0800
Subject: [PATCH] Adjust severial macros

In order to fulfill the identical function of the currenty
prot RB-tree. *_PROTECTION macros are increased respectively

Signed-off-by: Xiaochuan-Xu <xiaochuan-xu@cqu.edu.cn>
---
 drivers/mtd/ubi/wl.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 0b1e8c7..603435f 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -130,9 +130,9 @@
  * How many erase cycles are short term, unknown, and long term physical
  * eraseblocks protected.
  */
-#define ST_PROTECTION 16
-#define U_PROTECTION  10
-#define LT_PROTECTION 4
+#define ST_PROTECTION 17
+#define U_PROTECTION  11
+#define LT_PROTECTION 5
 
 /* Number of prot lists, must be bigger than 'ST_PROTECTION' */
 #define PROT_LISTS_LEN (ST_PROTECTION+1)
-- 
1.5.3.2


-- 
Yours sincerely
xiaochuan-xu(cqu.edu.cn)
