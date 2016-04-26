Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av9DW-00083t-01
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 20:04:18 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>
Subject: [PATCH] flash_eraseall: Remove warning
Date: Tue, 26 Apr 2016 22:03:42 +0200
Message-Id: <1461701022-21023-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Well, flash_erase <mtddev> 0 0 is the same as flash_eraseall <mtddev>.
But flash_eraseall is still more handy to use.
Let's keep flash_eraseall as short cut and don't force users to
use a less handy user interface.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 misc-utils/flash_eraseall | 1 -
 1 file changed, 1 deletion(-)

diff --git a/misc-utils/flash_eraseall b/misc-utils/flash_eraseall
index c5539b3..65a85cc 100755
--- a/misc-utils/flash_eraseall
+++ b/misc-utils/flash_eraseall
@@ -1,4 +1,3 @@
 #!/bin/sh
-echo "${0##*/} has been replaced by \`flash_erase <mtddev> 0 0\`; please use it" 1>&2
 [ $# -ne 0 ] && set -- "$@" 0 0
 exec flash_erase "$@"
-- 
2.7.3
