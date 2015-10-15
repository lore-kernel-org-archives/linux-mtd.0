Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmZte-0002p3-Nt
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 04:12:07 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <david@sigma-star.at>, <dedekind1@gmail.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 04/27] ubifs: remove the including of mkfs.ubifs.h in lpt.c
Date: Thu, 15 Oct 2015 12:04:27 +0800
Message-ID: <1444881890-4012-5-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1444881890-4012-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1444881890-4012-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

As we have a ubifs_common.h and a seperate io lib, then
remove the including of mkfs.ubifs.h in lpt.c

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/mkfs.ubifs/lpt.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/lpt.c b/ubifs-utils/mkfs.ubifs/lpt.c
index cee221c..100d747 100644
--- a/ubifs-utils/mkfs.ubifs/lpt.c
+++ b/ubifs-utils/mkfs.ubifs/lpt.c
@@ -20,7 +20,16 @@
  *          Artem Bityutskiy
  */
 
-#include "mkfs.ubifs.h"
+#include "ubifs_common.h"
+
+/* common.h requires the PROGRAM_NAME macro */
+#define PROGRAM_NAME "ubifs-lpt"
+#include "common.h"
+
+#include "crc16.h"
+#include "ubifs.h"
+#include "lpt.h"
+#include "io.h"
 
 /**
  * do_calc_lpt_geom - calculate sizes for the LPT area.
-- 
1.8.4.2
