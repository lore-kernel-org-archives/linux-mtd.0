Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWriC-00030M-Js
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 19:59:21 +0000
Received: by padhy1 with SMTP id hy1so5958366pad.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 12:58:59 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH 05/10] mtd: spi-nor: fixup kernel-doc for flash lock/unlock
 function pointers
Date: Tue,  1 Sep 2015 12:57:10 -0700
Message-Id: <1441137435-52862-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I got the names of these fields wrong.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/spi-nor.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 8558793cc0f7..bd8068f6796a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -174,8 +174,8 @@ struct mtd_info;
  * @write:		[DRIVER-SPECIFIC] write data to the SPI NOR
  * @erase:		[DRIVER-SPECIFIC] erase a sector of the SPI NOR
  *			at the offset @offs
- * @lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR
- * @unlock:		[FLASH-SPECIFIC] unlock a region of the SPI NOR
+ * @flash_lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR
+ * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
  * @priv:		the private data
  */
 struct spi_nor {
-- 
2.5.0.457.gab17608
