Received: from rwcrmhc11.comcast.net ([204.127.198.35])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKldb-0003qY-L2
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 19:47:09 -0400
Date: Wed, 28 Sep 2005 16:42:54 -0700
From: Deepak Saxena <dsaxena@plexity.net>
To: Linus Torvalds <torvalds@osdl.org>
Message-ID: <20050928234254.GA21547@plexity.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Fix ixp4xx MTD driver module build
Reply-To: dsaxena@plexity.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Missing ';' breaks module build.

Signed-off-by: Deepak Saxena <dsaxena@plexity.net>

diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
--- a/drivers/mtd/maps/ixp4xx.c
+++ b/drivers/mtd/maps/ixp4xx.c
@@ -254,6 +255,6 @@ module_init(ixp4xx_flash_init);
 module_exit(ixp4xx_flash_exit);
 
 MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("MTD map driver for Intel IXP4xx systems")
+MODULE_DESCRIPTION("MTD map driver for Intel IXP4xx systems");
 MODULE_AUTHOR("Deepak Saxena");
 
