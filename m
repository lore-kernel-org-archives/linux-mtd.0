Received: from smtp.transmode.se ([31.15.61.139])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQVSH-0003vu-3N
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 10:14:15 +0000
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>, stable@vger.kernel.org
Subject: [PATCH v2 4/4] mtd: cfi_cmdset_0002: Avoid walking all chips when
 unlocking.
Date: Wed,  6 Jun 2018 12:13:30 +0200
Message-Id: <20180606101330.11071-4-joakim.tjernlund@infinera.com>
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

cfi_ppb_unlock() walks all flash chips when unlocking sectors,
avoid walking chips unaffected by the unlock operation.

Fixes: 1648eaaa1575 ("mtd: cfi_cmdset_0002: Support Persistent Protection Bits (PPB) locking")
Cc: stable@vger.kernel.org
Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
 v2 - Spilt into several patches

 drivers/mtd/chips/cfi_cmdset_0002.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index b6273ce83de7..62cd4ee280b3 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2686,6 +2686,8 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
 			i++;
 
 		if (adr >> cfi->chipshift) {
+			if (offset >= (ofs + len))
+				break;
 			adr = 0;
 			chipnum++;
 
-- 
2.13.6
