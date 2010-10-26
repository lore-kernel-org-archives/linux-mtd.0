Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
	helo=AM1EHSOBE006.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PAZir-0007Th-9u
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2010 02:57:14 +0000
Received: from mail61-am1 (localhost.localdomain [127.0.0.1])	by
	mail61-am1-R.bigfish.com (Postfix) with ESMTP id 88F4215E81C9	for
	<linux-mtd@lists.infradead.org>; Tue, 26 Oct 2010 02:57:10 +0000 (UTC)
Received: from AM1EHSMHS002.bigfish.com (unknown [10.3.201.250])	by
	mail61-am1.bigfish.com (Postfix) with ESMTP id 1E2C7E90050	for
	<linux-mtd@lists.infradead.org>; Tue, 26 Oct 2010 02:57:10 +0000 (UTC)
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by de01egw02.freescale.net (8.14.3/8.14.3) with ESMTP id
	o9Q2v7Oj024155	for
	<linux-mtd@lists.infradead.org>; Mon, 25 Oct 2010 19:57:07 -0700 (MST)
Received: from shlinux1.ap.freescale.net (shlinux1.ap.freescale.net
	[10.192.225.216])	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP
	id o9Q3CfCV022885	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 22:12:42 -0500 (CDT)
From: Frank Li <Frank.Li@freescale.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/1] MTD: Fix wrong check register_blkdev return value
Date: Tue, 26 Oct 2010 11:02:19 +0800
Message-ID: <1288062139-2192-1-git-send-email-Frank.Li@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Frank Li <Frank.Li@freescale.com>
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
