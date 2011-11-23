Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
 helo=VA3EHSOBE001.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RT3Y2-0004tl-9L
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2011 03:30:59 +0000
Received: from mail155-va3 (localhost [127.0.0.1])	by
 mail155-va3-R.bigfish.com (Postfix) with ESMTP id 018B862044C	for
 <linux-mtd@lists.infradead.org>; Wed, 23 Nov 2011 03:30:22 +0000 (UTC)
Received: from VA3EHSMHS023.bigfish.com (unknown [10.7.14.236])	by
 mail155-va3.bigfish.com (Postfix) with ESMTP id C56A2600047	for
 <linux-mtd@lists.infradead.org>; Wed, 23 Nov 2011 03:30:21 +0000 (UTC)
From: Shengzhou Liu <Shengzhou.Liu@freescale.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd/nand: Add NAND chip ID to support Micron 4k pagesize NAND
 chip
Date: Wed, 23 Nov 2011 10:59:13 +0800
Message-ID: <1322017153-6783-1-git-send-email-Shengzhou.Liu@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Shengzhou Liu <Shengzhou.Liu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add NAND chip ID 0x38 in ids table to support Micron 4k large-page NAND chip.

Signed-off-by: Shengzhou Liu <Shengzhou.Liu@freescale.com>
---
 drivers/mtd/nand/nand_ids.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 00cf1b0..23ed1d2 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -106,6 +106,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 	/* 8 Gigabit */
 	{"NAND 1GiB 1,8V 8-bit",	0xA3, 0, 1024, 0, LP_OPTIONS},
 	{"NAND 1GiB 3,3V 8-bit",	0xD3, 0, 1024, 0, LP_OPTIONS},
+	{"NAND 1GiB 3,3V 8-bit",	0x38, 0, 1024, 0, LP_OPTIONS},
 	{"NAND 1GiB 1,8V 16-bit",	0xB3, 0, 1024, 0, LP_OPTIONS16},
 	{"NAND 1GiB 3,3V 16-bit",	0xC3, 0, 1024, 0, LP_OPTIONS16},
 
-- 
1.6.4
