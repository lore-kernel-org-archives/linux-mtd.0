Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jj2Qd-0001Qs-92
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 01:15:15 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.12.11/az33egw02) with ESMTP id
	m381FB06006930 for <linux-mtd@lists.infradead.org>;
	Mon, 7 Apr 2008 18:15:11 -0700 (MST)
From: Trent Piepho <tpiepho@freescale.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] MTD: Read extended device ID from AMD/Spansion CFI flash
	chips
Date: Mon,  7 Apr 2008 18:12:28 -0700
Message-Id: <1207617149-1582-1-git-send-email-tpiepho@freescale.com>
In-Reply-To: <Pine.LNX.4.64.0804071759410.15143@t2.domain.actdsltmp>
References: <Pine.LNX.4.64.0804071759410.15143@t2.domain.actdsltmp>
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
index f651b6e..d9112dd 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -232,6 +232,11 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	cfi->mfr = cfi_read_query16(map, base);
 	cfi->id = cfi_read_query16(map, base + ofs_factor);
 
+	/* Get AMD/Spansion extended JEDEC ID */
+	if (cfi->mfr == CFI_MFR_AMD && (cfi->id & 0xff) == 0x7e)
+		cfi->id = cfi_read_query(map, base + 0xe * ofs_factor) << 8 |
+			  cfi_read_query(map, base + 0xf * ofs_factor);
+
 	/* Put it back into Read Mode */
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 	/* ... even if it's an Intel chip */
-- 
1.5.4.1
