Received: from rwcrmhc13.comcast.net ([216.148.227.118]
	helo=rwcrmhc12.comcast.net)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EL4Vj-0005Vo-TH
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 15:56:09 -0400
Date: Thu, 29 Sep 2005 12:52:05 -0700
From: Deepak Saxena <dsaxena@plexity.net>
To: Linus Torvalds <torvalds@osdl.org>
Message-ID: <20050929195205.GA30002@plexity.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Fix IXP4xx MTD driver no cast warning
Reply-To: dsaxena@plexity.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Fix following warning:

drivers/mtd/maps/ixp4xx.c: In function 'ixp4xx_flash_probe':
drivers/mtd/maps/ixp4xx.c:199: warning: assignment makes integer from
pointer without a cast

Signed-off-by: Deepak Saxena <dsaxena@plexity.net>

diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
--- a/drivers/mtd/maps/ixp4xx.c
+++ b/drivers/mtd/maps/ixp4xx.c
@@ -196,7 +196,7 @@ static int ixp4xx_flash_probe(struct dev
 		goto Error;
 	}
 
-	info->map.map_priv_1 = ioremap(dev->resource->start,
+	info->map.map_priv_1 = (unsigned long)ioremap(dev->resource->start,
 			    dev->resource->end - dev->resource->start + 1);
 	if (!info->map.map_priv_1) {
 		printk(KERN_ERR "IXP4XXFlash: Failed to ioremap region\n");

-- 
Deepak Saxena - dsaxena@plexity.net - http://www.plexity.net

Even a stopped clock gives the right time twice a day.
