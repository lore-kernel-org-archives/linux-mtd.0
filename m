Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkJM-0000TH-8J
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:44:25 -0500
Date: Tue, 21 Dec 2004 14:44:08 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221134408.GJ22636@wohnheim.fh-wedel.de>
References: <1103233669.15929.81.camel@squizzey.bult.co.uk>
	<20041218161923.GD1083@wohnheim.fh-wedel.de>
	<1103391155.10788.13.camel@squizzey.bult.co.uk>
	<20041218175222.GB4147@wohnheim.fh-wedel.de>
	<20041218181100.GD4147@wohnheim.fh-wedel.de>
	<1103402930.10792.20.camel@squizzey.bult.co.uk>
	<20041221133035.GE22636@wohnheim.fh-wedel.de>
	<20041221133935.GG22636@wohnheim.fh-wedel.de>
	<20041221134120.GH22636@wohnheim.fh-wedel.de>
	<20041221134258.GI22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221134258.GI22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/22] Change init/exit functions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move/change the init and exit functions.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |   53 ++++++++++++++++++++++++++---------------------------
 1 files changed, 26 insertions(+), 27 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_init_exit	2004-12-20 18:37:15.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 18:39:30.000000000 +0100
@@ -534,25 +534,6 @@
 	return NULL;
 }
 
-
-/* Cleanup and exit - sync the device and kill of the kernel thread */
-static void __devexit cleanup_blkmtd(void)
-{
-	struct list_head *temp1, *temp2;
-
-	/* Remove the MTD devices */
-	list_for_each_safe(temp1, temp2, &blkmtd_device_list) {
-		struct blkmtd_dev *dev = list_entry(temp1, struct blkmtd_dev,
-						    list);
-		blkmtd_sync(&dev->mtd_info);
-		del_mtd_device(&dev->mtd_info);
-		info("mtd%d: [%s] removed", dev->mtd_info.index,
-		     dev->mtd_info.name + strlen("blkmtd: "));
-		list_del(&dev->list);
-		free_device(dev);
-	}
-}
-
 #ifndef MODULE
 
 /* Handle kernel boot params */
@@ -599,26 +580,44 @@
 #endif
 
 
-/* Startup */
-static int __init init_blkmtd(void)
+static int __init blockmtd_init(void)
 {
 	int i;
 
 	info("version " VERSION);
-	/* Check args - device[0] is the bare minimum*/
-	if(!device[0]) {
+	/* Check args - device[0] is the bare minimum */
+	if (!device[0]) {
 		err("error: missing `device' name\n");
 		return -EINVAL;
 	}
 
-	for(i = 0; i < MAX_DEVICES; i++)
+	for (i = 0; i < MAX_DEVICES; i++)
 		add_device(device[i], erasesz[i] << 10);
 
-	if(list_empty(&blkmtd_device_list))
+	if (list_empty(&blkmtd_device_list))
 		return -EINVAL;
 
 	return 0;
 }
 
-module_init(init_blkmtd);
-module_exit(cleanup_blkmtd);
+
+static void __devexit blockmtd_exit(void)
+{
+	struct list_head *temp1, *temp2;
+
+	/* Remove the MTD devices */
+	list_for_each_safe(temp1, temp2, &blkmtd_device_list) {
+		struct blkmtd_dev *dev = list_entry(temp1, struct blkmtd_dev,
+						    list);
+		blkmtd_sync(&dev->mtd_info);
+		del_mtd_device(&dev->mtd_info);
+		info("mtd%d: [%s] removed", dev->mtd_info.index,
+				dev->mtd_info.name + strlen("blkmtd: "));
+		list_del(&dev->list);
+		free_device(dev);
+	}
+}
+
+
+module_init(blockmtd_init);
+module_exit(blockmtd_exit);
