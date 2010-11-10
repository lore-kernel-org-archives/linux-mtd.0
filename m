Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE007.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PG82v-0005qL-Ee
	for linux-mtd@lists.infradead.org; Wed, 10 Nov 2010 10:36:55 +0000
Received: from mail45-tx2 (localhost.localdomain [127.0.0.1])	by
	mail45-tx2-R.bigfish.com (Postfix) with ESMTP id 60A69970400	for
	<linux-mtd@lists.infradead.org>; Wed, 10 Nov 2010 10:36:50 +0000 (UTC)
Received: from TX2EHSMHS014.bigfish.com (unknown [10.9.14.242])	by
	mail45-tx2.bigfish.com (Postfix) with ESMTP id EFEC46A8052	for
	<linux-mtd@lists.infradead.org>; Wed, 10 Nov 2010 10:36:49 +0000 (UTC)
Received: from az33smr01.freescale.net (az33smr01.freescale.net
	[10.64.34.199])	by az33egw01.freescale.net (8.14.3/8.14.3) with ESMTP
	id oAAAaE87022954	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Nov 2010 03:36:14 -0700 (MST)
Received: from shlinux (shlinux.ap.freescale.net [10.192.224.203])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	oAAAaDW1015722	for
	<linux-mtd@lists.infradead.org>; Wed, 10 Nov 2010 04:36:14 -0600 (CST)
From: Frank Li <Frank.Li@freescale.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/1] [MTD]:CORE Fix wrong check register_blkdev return value
Date: Wed, 10 Nov 2010 18:52:29 +0800
Message-ID: <1289386349-29033-1-git-send-email-Frank.Li@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Frank Li <Frank.Li@freescale.com>, dwmw2@infradead.org,
	linux-kernel.vger.kernel.org@shlinux.ap.freescale.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

register_blkdev return 1..255 when major = 0.

if (ret ) {
	printk(KERN_WARNING "Unable to register %s block device on major %d: %d\n",
		tr->name, tr->major, ret);
	      mutex_unlock(&mtd_table_mutex);
	return ret;
}

Above code will return fail when register_blkdev return allocated major number.

Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
 drivers/mtd/mtd_blkdevs.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index a919587..63790e9 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -502,13 +502,16 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	mutex_lock(&mtd_table_mutex);
 
 	ret = register_blkdev(tr->major, tr->name);
-	if (ret) {
+	if (ret < 0) {
 		printk(KERN_WARNING "Unable to register %s block device on major %d: %d\n",
 		       tr->name, tr->major, ret);
 		mutex_unlock(&mtd_table_mutex);
 		return ret;
 	}
 
+	if (ret)
+		tr->major = ret;
+
 	tr->blkshift = ffs(tr->blksize) - 1;
 
 	INIT_LIST_HEAD(&tr->devs);
-- 
1.7.1
