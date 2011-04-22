Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDK3a-0002q6-RD
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 17:22:20 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3MHM8cM025942
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2011 20:22:13 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 13/13] fs-tests: integck: print a bit less if in power cut mode
Date: Fri, 22 Apr 2011 20:25:24 +0300
Message-Id: <1303493124-7619-14-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303493124-7619-1-git-send-email-dedekind1@gmail.com>
References: <1303493124-7619-1-git-send-email-dedekind1@gmail.com>
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

Do not print extra messages when unable to re-mount - they are
already printed by the recover function.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   25 ++++++++++++-------------
 1 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 55fe8be..63f6956 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -3014,6 +3014,18 @@ int main(int argc, char *argv[])
 
 		free_test_data();
 
+		do {
+			ret = recover_tested_fs();
+			if (ret) {
+				CHECK(errno == EROFS);
+				rpt += 1;
+			}
+			/*
+			 * Mount may also fail due to an emulated power cut
+			 * while mounting - keep re-starting.
+			 */
+		} while (ret);
+
 		/*
 		 * The file-system became read-only and we are in power cut
 		 * testing mode. Re-mount the file-system and re-start the
@@ -3022,19 +3034,6 @@ int main(int argc, char *argv[])
 		if (args.verbose)
 			normsg("re-mount the FS and re-start - count %ld", rpt);
 
-		do {
-			ret = recover_tested_fs();
-			if (ret) {
-				CHECK(errno == EROFS);
-				/*
-				 * Mount may also fail due to an emulated power
-				 * cut while mounting - keep re-starting.
-				 */
-				if (args.verbose)
-					normsg("could not mount, try again - count %ld",
-					       ++rpt);
-			}
-		} while (ret);
 	}
 
 	free_test_data();
-- 
1.7.2.3
