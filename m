Received: from alephnull.demon.nl ([83.160.184.112] helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FtsuV-0002sL-2a
	for linux-mtd@lists.infradead.org; Fri, 23 Jun 2006 17:09:57 -0400
Date: Fri, 23 Jun 2006 23:09:44 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH] remove unused 'nr_banks' variable from ixp2000 map driver
Message-ID: <20060623210944.GA4802@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>

Index: linux-2.6.16-rc5/drivers/mtd/maps/ixp2000.c
===================================================================
--- linux-2.6.16-rc5.orig/drivers/mtd/maps/ixp2000.c
+++ linux-2.6.16-rc5/drivers/mtd/maps/ixp2000.c
@@ -42,7 +42,6 @@ struct ixp2000_flash_info {
 	struct		map_info map;
 	struct		mtd_partition *partitions;
 	struct		resource *res;
-	int		nr_banks;
 };
 
 static inline unsigned long flash_bank_setup(struct map_info *map, unsigned long ofs)
@@ -183,7 +182,6 @@ static int ixp2000_flash_probe(struct pl
 	 */
 	info->map.phys = NO_XIP;
 
-	info->nr_banks = ixp_data->nr_banks;
 	info->map.size = ixp_data->nr_banks * window_size;
 	info->map.bankwidth = 1;
