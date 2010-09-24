Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OyxS8-0005TE-4i
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 01:51:57 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 1375F1B4095
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 01:51:54 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.ubifs: use common ARRAY_SIZE
Date: Thu, 23 Sep 2010 21:52:42 -0400
Message-Id: <1285293162-24970-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 mkfs.ubifs/hashtable/hashtable.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/mkfs.ubifs/hashtable/hashtable.c b/mkfs.ubifs/hashtable/hashtable.c
index 763357e..b751c62 100644
--- a/mkfs.ubifs/hashtable/hashtable.c
+++ b/mkfs.ubifs/hashtable/hashtable.c
@@ -1,5 +1,6 @@
 /* Copyright (C) 2004 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */
 
+#include "common.h"
 #include "hashtable.h"
 #include "hashtable_private.h"
 #include <stdlib.h>
@@ -21,7 +22,7 @@ static const unsigned int primes[] = {
 50331653, 100663319, 201326611, 402653189,
 805306457, 1610612741
 };
-const unsigned int prime_table_length = sizeof(primes)/sizeof(primes[0]);
+const unsigned int prime_table_length = ARRAY_SIZE(primes);
 const float max_load_factor = 0.65;
 
 /*****************************************************************************/
-- 
1.7.3
