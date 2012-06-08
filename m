Received: from [194.90.113.100] (helo=mx1.jungo.com)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sd1Vh-0005nE-Go
 for linux-mtd@lists.infradead.org; Fri, 08 Jun 2012 15:54:02 +0000
Date: Fri, 8 Jun 2012 18:29:06 +0300
From: Shmulik Ladkani <shmulik@jungo.com>
To: David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>
Subject: [PATCH] mtd: nand: Properly initialize 'mtd->bitflip_threshold'
 prior 'scan_bbt()' is invoked
Message-ID: <20120608182906.57b4844a@halley>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Mike Dunn <mikedunn@newsguy.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ivan Djelic <ivan.djelic@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As of edbc454 [mtd: driver _read() returns max_bitflips; mtd_read()
returns -EUCLEAN], 'mtd->bitflip_threshold' must be set for mtd devices
having ECC, prior any 'mtd_read()' call.
Otherwise, 'mtd_read()' will falsely return -EUCLEAN.

Normally, 'mtd->bitflip_threshold' is initialized when the MTD is added.

However, this is too late for NAND MTDs, as 'scan_bbt()' is invoked
prior the existing initialization of 'mtd->bitflip_threshold'.

This is a problem since 'scan_bbt()' calls 'mtd_read()', in the case
of a flash-based bad block table.
It resulted in a falsely reported bitflips indication during BBT read,
which lead to constant scrubbing of the flash BBT blocks.

Initialize 'mtd->bitflip_threshold' to its default value (if not already
set by the driver), prior invocation of 'scan_bbt()'.

Reported-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
- The issue was introduced in 3.5-rc1 and needs to be merged before 3.5
- Sascha, I've credited you as the reporter, is that ok?
- Sascha, care to test and verify it works for your system?

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 61805e7..0a8724e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3484,6 +3484,13 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* propagate ecc info to mtd_info */
 	mtd->ecclayout = chip->ecc.layout;
 	mtd->ecc_strength = chip->ecc.strength;
+	/*
+	 * Initialize bitflip_threshold to its default prior scan_bbt() call.
+	 * scan_bbt() might invoke mtd_read(), thus bitflip_threshold must be
+	 * properly set.
+	 */
+	if (!mtd->bitflip_threshold)
+		mtd->bitflip_threshold = mtd->ecc_strength;
 
 	/* Check, if we should skip the bad block table scan */
 	if (chip->options & NAND_SKIP_BBTSCAN)
-- 
1.7.5.4
