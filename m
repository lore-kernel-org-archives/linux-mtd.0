Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvSl-00084V-D9
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:05:32 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 04/17] UBI: fastmap: scrub PEB when bitflips are detected
 in a free PEB EC header
Date: Mon,  5 Sep 2016 17:04:55 +0200
Message-Id: <1473087908-27862-5-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

scan_pool() does not mark the PEB for scrubing when bitflips are
detected in the EC header of a free PEB (VID header region left to
0xff).
Make sure we scrub the PEB in this case.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Fixes: dbb7d2a88d2a ("UBI: Add fastmap core")
---
 drivers/mtd/ubi/fastmap.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index ebb65ac6980f..a6ed78d14055 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -498,10 +498,11 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			unsigned long long ec = be64_to_cpu(ech->ec);
 			unmap_peb(ai, pnum);
 			dbg_bld("Adding PEB to free: %i", pnum);
+
 			if (err == UBI_IO_FF_BITFLIPS)
-				add_aeb(ai, free, pnum, ec, 1);
-			else
-				add_aeb(ai, free, pnum, ec, 0);
+				scrub = 1;
+
+			add_aeb(ai, free, pnum, ec, scrub);
 			continue;
 		} else if (err == 0 || err == UBI_IO_BITFLIPS) {
 			dbg_bld("Found non empty PEB:%i in pool", pnum);
-- 
2.7.4
