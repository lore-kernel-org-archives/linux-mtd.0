Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nV-0003UF-F5
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:11 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFoZi018749
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:59 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 24/27] fs-tests: integck: do not use global common variables
Date: Wed, 13 Apr 2011 18:19:04 +0300
Message-Id: <1302707947-6143-25-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
References: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
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

Do not use the 'tests_file_system_mount_dir' and 'tests_file_system_type'
variables because we do not depend on them any longer.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index a53be64..5cb7bca 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -2388,10 +2388,6 @@ int main(int argc, char *argv[])
 
 	get_tested_fs_info();
 
-	/* Temporary hack - will be fixed a bit later */
-	tests_file_system_mount_dir = (void *)fsinfo.mount_point;
-	tests_file_system_type = (void *)fsinfo.fstype;
-
 	/* Seed the random generator with out PID */
 	srand(getpid());
 
-- 
1.7.2.3
