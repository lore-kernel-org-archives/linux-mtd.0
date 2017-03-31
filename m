Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cu41Q-0005MY-Mj
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 21:23:54 +0000
Date: Fri, 31 Mar 2017 23:23:22 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Richard Weinberger <richard@nod.at>
Cc: Jesper Nilsson <jespern@axis.com>, Marek Vasut <marek.vasut@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] UBI: Make MTD_UBI_FASTMAP non-experimental
Message-ID: <20170331212322.GR29118@axis.com>
References: <20170329153836.GB29118@axis.com>
 <434195d8-d638-240d-8d63-50d033ea453a@nod.at>
 <3f8d0417-5e7d-b7c8-ba83-9a87e774f97f@gmail.com>
 <20170330173944.GJ29118@axis.com>
 <a85d3308-e9c9-b292-b2ad-0005a55d2e6d@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a85d3308-e9c9-b292-b2ad-0005a55d2e6d@nod.at>
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
the on-flash format not being finalized, but add a brief
warning that Fastmap actually makes UBI less robust.

Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
---
Changes in v2:
- Add warning that Fastmap making UBI less robust

 drivers/mtd/ubi/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index f0855ce08ed9..8912943b7142 100644
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
@@ -74,6 +71,10 @@ config MTD_UBI_FASTMAP
 	   images are still usable with UBI implementations without
 	   fastmap support. On typical flash devices the whole fastmap fits
 	   into one PEB. UBI will reserve PEBs to hold two fastmaps.
+	   Note that this feature makes UBI less robust, since Fastmap does not scan
+	   the full flash, which might lead to problems on misbehaving NAND chips.
+	   Only enable this if speedup of the attach time is really important
+	   and you can be sure that the NAND works as expected.
 
 	   If in doubt, say "N".
 
-- 
2.1.4


/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
