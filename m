Received: from smtp.transmode.se ([31.15.61.139])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQVSH-0003vv-3L
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 10:14:15 +0000
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>, stable@vger.kernel.org
Subject: [PATCH v2 1/4] mtd: cfi_cmdset_0002: Use right chip in do_ppb_xxlock()
Date: Wed,  6 Jun 2018 12:13:27 +0200
Message-Id: <20180606101330.11071-1-joakim.tjernlund@infinera.com>
In-Reply-To: <20180605172607.50acb34f@bbrezillon>
References: <20180605172607.50acb34f@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

do_ppb_xxlock() fails to add chip->start when
quering for lock status(and chip_ready test),
which caused false status reports.
Fix by adding adr += chip->start and adjust call sites accordingly.

Fixes: 1648eaaa1575 ("mtd: cfi_cmdset_0002: Support Persistent Protection Bits (PPB) locking")
Cc: stable@vger.kernel.org
Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---

 v2 - Spilt into several patches
 
 drivers/mtd/chips/cfi_cmdset_0002.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 53a976a8e614..8648b1adccd5 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2554,8 +2554,9 @@ static int __maybe_unused do_ppb_xxlock(struct map_info *map,
 	unsigned long timeo;
 	int ret;
 
+	adr += chip->start;
 	mutex_lock(&chip->mutex);
-	ret = get_chip(map, chip, adr + chip->start, FL_LOCKING);
+	ret = get_chip(map, chip, adr, FL_LOCKING);
 	if (ret) {
 		mutex_unlock(&chip->mutex);
 		return ret;
@@ -2573,8 +2574,8 @@ static int __maybe_unused do_ppb_xxlock(struct map_info *map,
 
 	if (thunk == DO_XXLOCK_ONEBLOCK_LOCK) {
 		chip->state = FL_LOCKING;
-		map_write(map, CMD(0xA0), chip->start + adr);
-		map_write(map, CMD(0x00), chip->start + adr);
+		map_write(map, CMD(0xA0), adr);
+		map_write(map, CMD(0x00), adr);
 	} else if (thunk == DO_XXLOCK_ONEBLOCK_UNLOCK) {
 		/*
 		 * Unlocking of one specific sector is not supported, so we
@@ -2612,7 +2613,7 @@ static int __maybe_unused do_ppb_xxlock(struct map_info *map,
 	map_write(map, CMD(0x00), chip->start);
 
 	chip->state = FL_READY;
-	put_chip(map, chip, adr + chip->start);
+	put_chip(map, chip, adr);
 	mutex_unlock(&chip->mutex);
 
 	return ret;
-- 
2.13.6
