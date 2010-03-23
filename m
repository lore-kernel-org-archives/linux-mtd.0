Received: from tac.ki.iif.hu ([2001:738:0:401:20c:6eff:fe71:b2db])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nu7bQ-00051T-6s
	for linux-mtd@lists.infradead.org; Tue, 23 Mar 2010 17:09:24 +0000
From: Ferenc Wagner <wferi@niif.hu>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Replace the dangerous mtd_to_flctl macro with an inline
	function
Date: Tue, 23 Mar 2010 18:09:09 +0100
Message-ID: <87eijb0xu2.fsf@tac.ki.iif.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The original macro worked only when applied to variables named 'mtd'.
While this could have been fixed by simply renaming the macro argument,
a more type-safe replacement is preferred.

Signed-off-by: Ferenc Wagner <wferi@niif.hu>
---
 include/linux/mtd/sh_flctl.h |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/sh_flctl.h b/include/linux/mtd/sh_flctl.h
index ab77609..1278465 100644
--- a/include/linux/mtd/sh_flctl.h
+++ b/include/linux/mtd/sh_flctl.h
@@ -93,7 +93,10 @@
 #define INIT_FL4ECCRESULT_VAL	0x03FF03FF
 #define LOOP_TIMEOUT_MAX	0x00010000
 
-#define mtd_to_flctl(mtd)	container_of(mtd, struct sh_flctl, mtd)
+inline struct sh_flctl *mtd_to_flctl(struct mtd_info *mtdinfo)
+{
+	return container_of(mtdinfo, struct sh_flctl, mtd);
+}
 
 struct sh_flctl {
 	struct mtd_info		mtd;
-- 
1.5.6.5
