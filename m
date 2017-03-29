Received: from bes.se.axis.com ([195.60.68.10])
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctFgZ-00057Y-Jq
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 15:39:02 +0000
Date: Wed, 29 Mar 2017 17:38:36 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC][PATCH] UBI: Make MTD_UBI_FASTMAP non-experimental
Message-ID: <20170329153836.GB29118@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD_UBI_FASTMAP has been set as experimental since it
was merged back in 2012.

There hasn't been much change in the format,
so we can consider the feature stable and start
being careful about breaking the format.
(This is somewhat of a pre-requisite for anyone actually
using the feature in the real world and depending on it)

Drop the experimental note and the warning text about
the on-flash format not being finalized.

Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
---
 drivers/mtd/ubi/Kconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index f0855ce..019e261 100644
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
-- 
2.1.4


/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
