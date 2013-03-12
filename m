Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFN36-0007Td-WA
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2013 11:07:18 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/9] ssb: driver_mipscore: add a const qualifier
Date: Tue, 12 Mar 2013 13:08:24 +0200
Message-Id: <1363086508-2405-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363086508-2405-1-git-send-email-dedekind1@gmail.com>
References: <1363086508-2405-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Michael Buesch <m@bues.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Be a bit stricter and add few more 'const' qualifiers.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: Michael Buesch <m@bues.ch>
---
 drivers/ssb/driver_mipscore.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ssb/driver_mipscore.c b/drivers/ssb/driver_mipscore.c
index 33b37da..8b64f82 100644
--- a/drivers/ssb/driver_mipscore.c
+++ b/drivers/ssb/driver_mipscore.c
@@ -18,7 +18,7 @@
 
 #include "ssb_private.h"
 
-static const char *part_probes[] = { "bcm47xxpart", NULL };
+static const char * const part_probes[] = { "bcm47xxpart", NULL };
 
 static struct physmap_flash_data ssb_pflash_data = {
 	.part_probe_types	= part_probes,
-- 
1.7.10.4
