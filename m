Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cgkbr-0000cY-TC
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 09:03:33 -0500
Date: Tue, 21 Dec 2004 15:03:22 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221140322.GV22636@wohnheim.fh-wedel.de>
References: <20041221134724.GL22636@wohnheim.fh-wedel.de>
	<20041221134818.GM22636@wohnheim.fh-wedel.de>
	<20041221134901.GN22636@wohnheim.fh-wedel.de>
	<20041221135139.GO22636@wohnheim.fh-wedel.de>
	<20041221135312.GP22636@wohnheim.fh-wedel.de>
	<20041221135405.GQ22636@wohnheim.fh-wedel.de>
	<20041221135530.GR22636@wohnheim.fh-wedel.de>
	<20041221135705.GS22636@wohnheim.fh-wedel.de>
	<20041221140102.GT22636@wohnheim.fh-wedel.de>
	<20041221140219.GU22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221140219.GU22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 16/22] list changes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change some list.h calls.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_list	2004-12-20 22:41:15.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 22:53:00.000000000 +0100
@@ -412,12 +412,11 @@
 	dev->mtd.priv = dev;
 	dev->mtd.owner = THIS_MODULE;
 
-	list_add(&dev->list, &blkmtd_device_list);
 	if (add_mtd_device(&dev->mtd)) {
 		/* Device didnt get added, so free the entry */
-		list_del(&dev->list);
 		goto devinit_err;
 	}
+	list_add(&dev->list, &blkmtd_device_list);
 	INFO("mtd%d: [%s] erase_size = %dKiB [%ld]", dev->mtd.index,
 			dev->mtd.name + strlen("blkmtd: "),
 			dev->mtd.erasesize >> 10, PAGE_SIZE);
@@ -546,12 +545,11 @@
 
 static void __devexit blockmtd_exit(void)
 {
-	struct list_head *temp1, *temp2;
+	struct list_head *pos, *next;
 
 	/* Remove the MTD devices */
-	list_for_each_safe(temp1, temp2, &blkmtd_device_list) {
-		struct blkmtd_dev *dev = list_entry(temp1, struct blkmtd_dev,
-						    list);
+	list_for_each_safe(pos, next, &blkmtd_device_list) {
+		struct blkmtd_dev *dev = list_entry(pos, typeof(*dev), list);
 		blockmtd_sync(&dev->mtd);
 		del_mtd_device(&dev->mtd);
 		INFO("mtd%d: [%s] removed", dev->mtd.index,
