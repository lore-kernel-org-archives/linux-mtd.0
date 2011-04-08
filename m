Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8CLy-0000dH-JZ
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 14:08:03 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p38E7xPF018336
	for <linux-mtd@lists.infradead.org>; Fri, 8 Apr 2011 17:07:59 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] fs_tests: make the test-suite finish faster
Date: Fri,  8 Apr 2011 17:10:56 +0300
Message-Id: <1302271856-8386-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Currently the stress tests may run up to 1 hour, make the limit
to be 10 minutes instead.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/run_all.sh |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/fs-tests/run_all.sh b/tests/fs-tests/run_all.sh
index e79993a..7c82921 100755
--- a/tests/fs-tests/run_all.sh
+++ b/tests/fs-tests/run_all.sh
@@ -42,8 +42,8 @@ rm -rf ${TEST_DIR}/*
 
 cd stress || exit 1
 
-./stress00.sh 3600 || exit 1
+./stress00.sh 360 || exit 1
 
-./stress01.sh 3600 || exit 1
+./stress01.sh 360 || exit 1
 
 cd .. || exit 1
-- 
1.7.2.3
