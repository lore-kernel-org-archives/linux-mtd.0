Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTDFi-0004zr-Qy
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2018 21:24:47 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 14/14] ubi: Remove experimental stigma from Fastmap
Date: Wed, 13 Jun 2018 23:23:44 +0200
Message-Id: <20180613212344.11608-15-richard@nod.at>
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

I've hold up this a way too long. Over the last two years Fastmap gained
many users which made it possible to sort out the last issues.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/Kconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 43d131f5ae10..4de5e4e8d4ab 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -57,12 +57,9 @@ config MTD_UBI_BEB_LIMIT
 	  Leave the default value if unsure.
 
 config MTD_UBI_FASTMAP
-	bool "UBI Fastmap (Experimental feature)"
+	bool "UBI Fastmap"
 	default n
 	help
-	   Important: this feature is experimental so far and the on-flash
-	   format for fastmap may change in the next kernel versions
-
 	   Fastmap is a mechanism which allows attaching an UBI device
 	   in nearly constant time. Instead of scanning the whole MTD device it
 	   only has to locate a checkpoint (called fastmap) on the device.
@@ -74,6 +71,8 @@ config MTD_UBI_FASTMAP
 	   images are still usable with UBI implementations without
 	   fastmap support. On typical flash devices the whole fastmap fits
 	   into one PEB. UBI will reserve PEBs to hold two fastmaps.
+	   While Fastmap is considered correct it weakens UBI wrt. robustness,
+	   a full scan of the MTD allows UBI to react better to bad flashes.
 
 	   If in doubt, say "N".
 
-- 
2.13.6
