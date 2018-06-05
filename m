Received: from smtp.transmode.se ([31.15.61.139])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQClG-0006Hu-Mf
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2018 14:16:35 +0000
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [PATCH 2/2] mtd: cfi_cmdset_0002: Avoid point less unlocking/locking
Date: Tue,  5 Jun 2018 16:07:10 +0200
Message-Id: <20180605140710.8624-2-joakim.tjernlund@infinera.com>
In-Reply-To: <20180605140710.8624-1-joakim.tjernlund@infinera.com>
References: <20180605140710.8624-1-joakim.tjernlund@infinera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

cfi_ppb_unlock() walks all flash chips when unlocking sectors.
This is a waste when crossing chip boundaris unaffected
by the unlock operation.

Fixes: 1648eaaa1575e
Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index c74c53b886be..ee8b70e54298 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2669,7 +2669,7 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
 		 * sectors shall be unlocked, so lets keep their locking
 		 * status at "unlocked" (locked=0) for the final re-locking.
 		 */
-		if ((adr < ofs) || (adr >= (ofs + len))) {
+		if ((offset < ofs) || (offset >= (ofs + len))) {
 			sect[sectors].chip = &cfi->chips[chipnum];
 			sect[sectors].adr = adr;
 			sect[sectors].locked = do_ppb_xxlock(
@@ -2685,6 +2685,8 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
 			i++;
 
 		if (adr >> cfi->chipshift) {
+			if (offset >= (ofs + len))
+				break;
 			adr = 0;
 			chipnum++;
 			if (chipnum >= cfi->numchips)
-- 
2.13.6
