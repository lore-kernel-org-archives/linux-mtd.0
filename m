Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTDFV-0004qL-HY
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2018 21:24:15 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 02/14] ubi: Fix assert in ubi_wl_init
Date: Wed, 13 Jun 2018 23:23:32 +0200
Message-Id: <20180613212344.11608-3-richard@nod.at>
In-Reply-To: <20180613212344.11608-1-richard@nod.at>
References: <20180613212344.11608-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When multiple PEBs are used for a fastmap, found_pebs
can be wrong and the assert triggers.

The current approach is broken in two ways:
1. The "continue" in list_for_each_entry() over all fastmap PEBs
   misses the counter at all.
2. When the fastmap changes in size, growing due to a preseeded fastmap
   or shrinking due to new bad blocks, iterating over the current
   fastmap will give wrong numbers. We have to exclude the fastmap size
   at all from the calculation to be able to compare the numbers.
   At this stage we simply have no longer the information whether the
   fastmap changed in size.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index f66b3b22f328..6bbb968fe9da 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1695,11 +1695,19 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			err = erase_aeb(ubi, aeb, sync);
 			if (err)
 				goto out_free;
-		}
 
-		found_pebs++;
+			/*
+			 * If no fastmap is used, all fastmap PEBs will get be
+			 * erased and are member of ai->fastmap.
+			 */
+			if (!ubi->fm)
+				found_pebs++;
+		}
 	}
 
+	if (ubi->fm)
+		found_pebs += ubi->fm->used_blocks;
+
 	dbg_wl("found %i PEBs", found_pebs);
 
 	ubi_assert(ubi->good_peb_count == found_pebs);
-- 
2.13.6
