Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTdOH-0002vI-5h
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 17:15:01 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 7DCAE1B4010
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Jun 2011 17:14:58 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ignore (FLAT) gdb files
Date: Mon,  6 Jun 2011 13:15:01 -0400
Message-Id: <1307380501-30946-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linux FLAT toolchains produce .gdb files alongside the normal program
for debugging purposes (so linking to "foo" will also produce "foo.gdb").
Ignore these too.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 .gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index 2dbf198..849265d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -6,6 +6,7 @@
 # Normal rules
 #
 .*
+*.gdb
 *.o
 *.a
 *.s
-- 
1.7.5.3
