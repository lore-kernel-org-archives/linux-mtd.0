Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDK3a-0002q4-Pr
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 17:22:18 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3MHM8Cr025953
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2011 20:22:13 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 11/13] fs-tests: integck: re-mount always if not root fs
Date: Fri, 22 Apr 2011 20:25:22 +0300
Message-Id: <1303493124-7619-12-git-send-email-dedekind1@gmail.com>
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

Commit 08cfd9d7cacc3c0b97530ad7e13fa8db75e99947 introduced a bug:
we do not re-mount the FS before checking at the first iteration.
This patch fixes the issue.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 372a348..9a2f3b4 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -2534,7 +2534,7 @@ static int integck(void)
 	if (ret)
 		return -1;
 
-	if (fsinfo.is_rootfs) {
+	if (!fsinfo.is_rootfs) {
 		close_open_files();
 		ret = remount_tested_fs();
 		if (ret)
-- 
1.7.2.3
