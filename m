Received: from ti-out-0910.google.com ([209.85.142.185])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KMPFE-0003lE-9m
	for linux-mtd@lists.infradead.org; Fri, 25 Jul 2008 15:30:12 +0000
Received: by ti-out-0910.google.com with SMTP id a21so1751173tia.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Jul 2008 08:30:09 -0700 (PDT)
Date: Fri, 25 Jul 2008 23:30:07 +0800
From: Huang Weiyi <weiyi.huang@gmail.com>
To: dwmw2@infradead.org
Subject: fs/jffs2/compr_rubin.c: Removed duplicated include
Message-Id: <20080725213253.9134.WEIYI.HUANG@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Removed duplicated include file <linux/errno.h> in 
fs/jffs2/compr_rubin.c.

Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>

diff --git a/fs/jffs2/compr_rubin.c b/fs/jffs2/compr_rubin.c
index c73fa89..6584eb3 100644
--- a/fs/jffs2/compr_rubin.c
+++ b/fs/jffs2/compr_rubin.c
@@ -24,8 +24,6 @@
 #define BIT_DIVIDER_MIPS 1043
 static int bits_mips[8] = { 277,249,290,267,229,341,212,241}; /* mips32 */

-#include <linux/errno.h>
-
 struct pushpull {
        unsigned char *buf;
        unsigned int buflen;
