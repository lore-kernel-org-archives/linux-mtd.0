Received: from lizzard.sbs.de ([194.138.37.39])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwX-0003K1-Pn
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:37 +0000
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id v5CAp8me019980
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:08 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 07/20] mtd-utils: flashcp: Drop exit code defines
Date: Mon, 12 Jun 2017 12:50:48 +0200
Message-Id: <20170612105101.18223-8-daniel.wagner@siemens.com>
In-Reply-To: <20170612105101.18223-1-daniel.wagner@siemens.com>
References: <20170612105101.18223-1-daniel.wagner@siemens.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The EXIT_{FAILURE|SUCCESS} are already defined in stdlib.h.

Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>
---
 misc-utils/flashcp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index af3c88de9ced..a35e6fca9d8d 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -45,9 +45,6 @@
 
 #include "common.h"
 
-#define EXIT_FAILURE 1
-#define EXIT_SUCCESS 0
-
 /* for debugging purposes only */
 #ifdef DEBUG
 #undef DEBUG
-- 
2.9.4
