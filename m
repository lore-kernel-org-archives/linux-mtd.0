Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KSriu-0000pj-I7
	for linux-mtd@lists.infradead.org; Tue, 12 Aug 2008 11:07:32 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx09.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m7CB4HvP020247
	for <linux-mtd@lists.infradead.org>; Tue, 12 Aug 2008 06:07:30 -0500
Message-ID: <48A16F1E.6000800@nokia.com>
Date: Tue, 12 Aug 2008 14:08:14 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/3] [MTD-UTILS] fs-tests: allow for symlink name too long
	in integrity test
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 8cdbfb4..145557f 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1664,8 +1664,9 @@ static void symlink_new(struct dir_info *dir, const char *name_)
 	path = dir_path(dir, name);
 	target = pick_symlink_target(path);
 	if (symlink(target, path) == -1) {
-		CHECK(errno == ENOSPC);
-		full = 1;
+		CHECK(errno == ENOSPC || errno == ENAMETOOLONG);
+		if (errno == ENOSPC)
+			full = 1;
 		free(target);
 		free(path);
 		free(name);
-- 
1.5.4.3
