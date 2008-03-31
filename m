Received: from az33egw01.freescale.net ([192.88.158.102])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JgBXp-0000rQ-R4
	for linux-mtd@lists.infradead.org; Mon, 31 Mar 2008 04:22:54 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw01.freescale.net (8.12.11/az33egw01) with ESMTP id
	m2V4MolX005867 for <linux-mtd@lists.infradead.org>;
	Sun, 30 Mar 2008 21:22:51 -0700 (MST)
From: Trent Piepho <tpiepho@freescale.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] MTD: Read extended device ID from AMD/Spansion CFI flash
	chips
Date: Sun, 30 Mar 2008 21:19:29 -0700
Message-Id: <1206937170-26930-1-git-send-email-tpiepho@freescale.com>
In-Reply-To: <Pine.LNX.4.64.0803302101060.16066@t2.domain.actdsltmp>
References: <Pine.LNX.4.64.0803302101060.16066@t2.domain.actdsltmp>
Cc: Trent Piepho <tpiepho@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

AMD/Spansion use a device id of 0x7e to indicate an extended device is
present at offset 0xe and 0xf in the query data.

I've verified with Spansion that all their chips (mfr == 0x01) with an id
of 0x7e use it to indicate an extended id is present.  What's more, there
are no chips with a NON-extended id that is the same as a different chip's
extended id.  In other words, when the extended ID is present, one can
replace the normal id with the extended id without losing any information.
Which is what I've done.

Signed-off-by: Trent Piepho <tpiepho@freescale.com>
---
 drivers/mtd/chips/cfi_probe.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index 60e11a0..0b69034 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -231,6 +231,11 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
 	cfi->mfr = cfi_read_query16(map, base);
 	cfi->id = cfi_read_query16(map, base + ofs_factor);
+	
+	/* Get AMD/Spansion extended JEDEC ID */
+	if (cfi->mfr == CFI_MFR_AMD && (cfi->id & 0xff) == 0x7e)
+		cfi->id = cfi_read_query(map, base + 0xe * ofs_factor) << 8 |
+			  cfi_read_query(map, base + 0xf * ofs_factor);
 
 	/* Put it back into Read Mode */
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
-- 
1.5.4.1
