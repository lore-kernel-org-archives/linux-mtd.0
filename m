Received: from lgeamrelo13.lge.com ([156.147.23.53])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cnxnO-0007eP-Sk
 for linux-mtd@lists.infradead.org; Wed, 15 Mar 2017 01:32:12 +0000
From: Hyunchul Lee <cheol.lee@lge.com>
To: Richard Weinberger <richard@nod.at>
CC: <kernel-team@lge.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 <adrian.hunter@intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Hyunchul
 Lee <hyc.lee@gmail.com>, Hyunchul Lee <cheol.lee@lge.com>
Subject: [PATCH 2/3] ubifs: fix debug messages for an invalid filename in
 ubifs_dump_node
Date: Wed, 15 Mar 2017 10:31:04 +0900
Message-ID: <1489541465-25663-2-git-send-email-cheol.lee@lge.com>
In-Reply-To: <1489541465-25663-1-git-send-email-cheol.lee@lge.com>
References: <1489541465-25663-1-git-send-email-cheol.lee@lge.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

if a character is not printable, print '?' instead of that.

Signed-off-by: Hyunchul Lee <cheol.lee@lge.com>
---
 fs/ubifs/debug.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 1e712a36..b14c06f 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -32,6 +32,7 @@
 #include <linux/math64.h>
 #include <linux/uaccess.h>
 #include <linux/random.h>
+#include <linux/ctype.h>
 #include "ubifs.h"
 
 static DEFINE_SPINLOCK(dbg_lock);
@@ -464,7 +465,8 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node)
 			pr_err("(bad name length, not printing, bad or corrupted node)");
 		else {
 			for (i = 0; i < nlen && dent->name[i]; i++)
-				pr_cont("%c", dent->name[i]);
+				pr_cont("%c", isprint(dent->name[i]) ?
+					dent->name[i] : '?');
 		}
 		pr_cont("\n");
 
-- 
1.9.1
