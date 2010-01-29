Received: from exchange.solarflare.com ([216.237.3.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Naxu6-0007M6-4d
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 20:57:26 +0000
Subject: [PATCHv3 2/9] mtd: Use get_mtd_device_nm() to find named device in
	get_sb_mtd()
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
References: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain
Date: Fri, 29 Jan 2010 20:57:18 +0000
Message-Id: <1264798638.2785.28.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This removes the need to know the number of MTD devices.

Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
---
 drivers/mtd/mtdsuper.c |   18 ++++++------------
 1 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index af8b42e..d257052 100644
--- a/drivers/mtd/mtdsuper.c
+++ b/drivers/mtd/mtdsuper.c
@@ -150,18 +150,12 @@ int get_sb_mtd(struct file_system_type *fs_type, int flags,
 			DEBUG(1, "MTDSB: mtd:%%s, name \"%s\"\n",
 			      dev_name + 4);
 
-			for (mtdnr = 0; mtdnr < MAX_MTD_DEVICES; mtdnr++) {
-				mtd = get_mtd_device(NULL, mtdnr);
-				if (!IS_ERR(mtd)) {
-					if (!strcmp(mtd->name, dev_name + 4))
-						return get_sb_mtd_aux(
-							fs_type, flags,
-							dev_name, data, mtd,
-							fill_super, mnt);
-
-					put_mtd_device(mtd);
-				}
-			}
+			mtd = get_mtd_device_nm(dev_name + 4);
+			if (!IS_ERR(mtd))
+				return get_sb_mtd_aux(
+					fs_type, flags,
+					dev_name, data, mtd,
+					fill_super, mnt);
 
 			printk(KERN_NOTICE "MTD:"
 			       " MTD device with name \"%s\" not found.\n",
-- 
1.5.5


-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
