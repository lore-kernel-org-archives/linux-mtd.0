Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgqjB-0007fg-4h
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 06:48:33 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 3/8] mtd: gpmi: remove the unused line
Date: Thu, 14 Nov 2013 14:25:46 +0800
Message-ID: <1384410351-2169-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1384410351-2169-1-git-send-email-b32955@freescale.com>
References: <1384410351-2169-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We do not use the chip->oob_poi in the mx23_write_transcription_stamp.
So remove the unused line.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 9bce04b..1faf198 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1439,7 +1439,6 @@ static int mx23_write_transcription_stamp(struct gpmi_nand_data *this)
 
 	/* Write the NCB fingerprint into the page buffer. */
 	memset(buffer, ~0, mtd->writesize);
-	memset(chip->oob_poi, ~0, mtd->oobsize);
 	memcpy(buffer + 12, fingerprint, strlen(fingerprint));
 
 	/* Loop through the first search area, writing NCB fingerprints. */
-- 
1.7.2.rc3
