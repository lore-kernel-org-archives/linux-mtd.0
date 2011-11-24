Received: from mail.visioncatalog.com ([217.6.246.34] helo=root.phytec.de)
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RTWzk-0007sO-56
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 10:57:33 +0000
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
 by root.phytec.de (Postfix) with ESMTP id 0FE34BF0DC
 for <linux-mtd@lists.infradead.org>; Thu, 24 Nov 2011 12:02:30 +0100 (CET)
From: Jan Weitzel <j.weitzel@phytec.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nandtest: set oldstats.failed
Date: Thu, 24 Nov 2011 11:57:21 +0100
Message-Id: <1322132241-5778-1-git-send-email-j.weitzel@phytec.de>
Cc: Jan Weitzel <j.weitzel@phytec.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

if new ecc failed occures oldstats.corrected is updated not oldstats.failed

Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>
---
 nandtest.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/nandtest.c b/nandtest.c
index dc28d09..db7f427 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -105,7 +105,7 @@ int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 	}
 	if (newstats.failed > oldstats.failed) {
 		printf("\nECC failed at %08x\n", (unsigned) ofs);
-		oldstats.corrected = newstats.corrected;
+		oldstats.failed = newstats.failed;
 	}
 	if (len < meminfo.erasesize)
 		exit(1);
-- 
1.7.0.4
