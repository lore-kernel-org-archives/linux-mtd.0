Received: from mail-fx0-f49.google.com ([209.85.161.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXaA9-0006rF-7S
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 15:09:02 +0000
Received: by fabs1 with SMTP id s1so1350874fab.36
 for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2011 07:08:59 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/7] MTD: MAPS: bcm963xx-flash: fix word order for spare
 partition
Date: Mon,  5 Dec 2011 16:08:05 +0100
Message-Id: <1323097691-16414-2-git-send-email-jonas.gorski@gmail.com>
In-Reply-To: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
References: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>,
 Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/maps/bcm963xx-flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/bcm963xx-flash.c b/drivers/mtd/maps/bcm963xx-flash.c
index c7d3949..b908d92 100644
--- a/drivers/mtd/maps/bcm963xx-flash.c
+++ b/drivers/mtd/maps/bcm963xx-flash.c
@@ -144,7 +144,7 @@ static int parse_cfe_partitions(struct mtd_info *master,
 					(long unsigned int)(parts[i].offset),
 					(long unsigned int)(parts[i].size));
 
-	printk(KERN_INFO PFX "Spare partition is %x offset and length %x\n",
+	printk(KERN_INFO PFX "Spare partition is offset %x and length %x\n",
 							spareaddr, sparelen);
 	*pparts = parts;
 	vfree(buf);
-- 
1.7.2.5
