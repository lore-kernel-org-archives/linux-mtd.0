Received: from mailout.stusta.mhn.de ([141.84.69.5] helo=mailhub.stusta.mhn.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IFAG8-0005tK-FR
	for linux-mtd@lists.infradead.org; Sun, 29 Jul 2007 11:00:42 -0400
Date: Sun, 29 Jul 2007 16:58:12 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Andrew Morton <akpm@linux-foundation.org>,
	Kyungmin Park <kyungmin.park@samsung.com>, dwmw2@infradead.org
Subject: [-mm patch] MTD onenand_sim.c: make struct info static
Message-ID: <20070729145812.GW16817@stusta.de>
References: <20070725040304.111550f4.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20070725040304.111550f4.akpm@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 25, 2007 at 04:03:04AM -0700, Andrew Morton wrote:
>...
> Changes since 2.6.22-rc6-mm1:
>...
>  git-mtd.patch
>...
>  git trees
>...

This patch makes the needlessly global struct info static.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

---
--- linux-2.6.23-rc1-mm1/drivers/mtd/onenand/onenand_sim.c.old	2007-07-26 16:11:57.000000000 +0200
+++ linux-2.6.23-rc1-mm1/drivers/mtd/onenand/onenand_sim.c	2007-07-26 16:12:19.000000000 +0200
@@ -78,7 +78,7 @@
 	struct onenand_flash	flash;
 };
 
-struct onenand_info *info;
+static struct onenand_info *info;
 
 #define DPRINTK(format, args...)					\
 do {									\
