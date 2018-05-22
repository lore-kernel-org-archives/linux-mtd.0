Received: from newton.telenet-ops.be ([195.130.132.45])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL8tk-0001gf-Np
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 15:08:26 +0000
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 40qzY01Fx5zMqsHh
 for <linux-mtd@lists.infradead.org>; Tue, 22 May 2018 17:08:04 +0200 (CEST)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mtd: cmdlinepart: Update comment for introduction of
 OFFSET_CONTINUOUS
Date: Tue, 22 May 2018 17:07:53 +0200
Message-Id: <1527001673-16318-1-git-send-email-geert+renesas@glider.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The comment about offset zero was not updated when changing behavior:
  - Automatic offset calculation is indicated by OFFSET_CONTINUOUS,
  - Zero really means offset zero.

Fixes: b175d03dd2072836 ("[PATCH] mtd cmdlinepart: allow zero offset value")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mtd/cmdlinepart.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index fbd5affc0acfe3fe..3ea44cff9b759e3c 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -190,7 +190,10 @@ static struct mtd_partition * newpart(char *s,
 		extra_mem = (unsigned char *)(parts + *num_parts);
 	}
 
-	/* enter this partition (offset will be calculated later if it is zero at this point) */
+	/*
+	 * enter this partition (offset will be calculated later if it is
+	 * OFFSET_CONTINUOUS at this point)
+	 */
 	parts[this_part].size = size;
 	parts[this_part].offset = offset;
 	parts[this_part].mask_flags = mask_flags;
-- 
2.7.4
