Received: from vps.korsgaard.com ([64.79.194.204] helo=nanv.dk)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1IpM5c-0007pj-98
	for linux-mtd@lists.infradead.org; Tue, 06 Nov 2007 05:55:31 -0500
From: Peter Korsgaard <jacmet@sunsite.dk>
To: rpurdie@openedhand.com, linux-mtd@lists.infradead.org
Subject: [PATCH] [PATCH] mtdoops: Document usage in Kconfig
Date: Tue, 06 Nov 2007 11:55:00 +0100
Message-ID: <871wb3wsmz.fsf@nanv.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add usage instructions to Kconfig for mtdoops driver.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 drivers/mtd/Kconfig |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 8848e8a..661eac0 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -286,6 +286,9 @@ config MTD_OOPS
 	  buffer in a flash partition where it can be read back at some
 	  later point.
 
+	  To use, add console=ttyMTDx to the kernel command line,
+	  where x is the MTD device number to use.
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
-- 
1.5.3.4


-- 
Bye, Peter Korsgaard
