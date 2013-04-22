Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UULO7-0007Rs-VD
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 18:22:52 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: docg4: add udelay(1) to polling loop
Date: Mon, 22 Apr 2013 11:23:10 -0700
Message-Id: <1366654990-15392-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add call to udelay(1) in the busy-wait loop that polls the device status
register.  This will make the timeout independent of cpu clock rate. This
sloppiness came back to bite me when I increased the cpu clock rate, and
timeouts started occurring during long block erasure operations.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/nand/docg4.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 18fa448..fd353d2 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -279,6 +279,7 @@ static int poll_status(struct docg4_priv *doc)
 
 	timeo = 1000;
 	do {
+		udelay(1);
 		cpu_relax();
 		flash_status = readb(docptr + DOC_FLASHCONTROL);
 	} while (!(flash_status & DOC_CTRL_FLASHREADY) && --timeo);
-- 
1.7.8.6
