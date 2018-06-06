Received: from smtp.transmode.se ([31.15.61.139])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQVSI-0005qx-13
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 10:14:20 +0000
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>, stable@vger.kernel.org
Subject: [PATCH v2 3/4] mtd: cfi_cmdset_0002: Avoid point less
 unlocking/locking
Date: Wed,  6 Jun 2018 12:13:29 +0200
Message-Id: <20180606101330.11071-3-joakim.tjernlund@infinera.com>
In-Reply-To: <20180606101330.11071-1-joakim.tjernlund@infinera.com>
References: <20180605172607.50acb34f@bbrezillon>
 <20180606101330.11071-1-joakim.tjernlund@infinera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

cfi_ppb_unlock() walks all flash chips when unlocking sectors.
testing lock status on each chip which causes relocking of already
locked sectors. Test against offset to aviod this aliasing.

Fixes: 1648eaaa1575 ("mtd: cfi_cmdset_0002: Support Persistent Protection Bits (PPB) locking")
Cc: stable@vger.kernel.org
Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---

 v2 - Spilt into several patches


 drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index cb85cccc48c1..b6273ce83de7 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2670,7 +2670,7 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
 		 * sectors shall be unlocked, so lets keep their locking
 		 * status at "unlocked" (locked=0) for the final re-locking.
 		 */
-		if ((adr < ofs) || (adr >= (ofs + len))) {
+		if ((offset < ofs) || (offset >= (ofs + len))) {
 			sect[sectors].chip = &cfi->chips[chipnum];
 			sect[sectors].adr = adr;
 			sect[sectors].locked = do_ppb_xxlock(
-- 
2.13.6
