Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkOA-0000Vf-99
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:49:23 -0500
Date: Tue, 21 Dec 2004 14:49:01 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221134901.GN22636@wohnheim.fh-wedel.de>
References: <20041218181100.GD4147@wohnheim.fh-wedel.de>
	<1103402930.10792.20.camel@squizzey.bult.co.uk>
	<20041221133035.GE22636@wohnheim.fh-wedel.de>
	<20041221133935.GG22636@wohnheim.fh-wedel.de>
	<20041221134120.GH22636@wohnheim.fh-wedel.de>
	<20041221134258.GI22636@wohnheim.fh-wedel.de>
	<20041221134408.GJ22636@wohnheim.fh-wedel.de>
	<20041221134511.GK22636@wohnheim.fh-wedel.de>
	<20041221134724.GL22636@wohnheim.fh-wedel.de>
	<20041221134818.GM22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221134818.GM22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 8/22] Remove sync interface
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The sync interface was unused.  Not it's gone.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |   13 -------------
 1 files changed, 13 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_sync	2004-12-20 19:10:28.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 21:38:46.000000000 +0100
@@ -55,14 +55,11 @@
 /* Static info about the MTD, used in cleanup_module */
 static LIST_HEAD(blkmtd_device_list);
 
-static void blkmtd_sync(struct mtd_info *mtd);
-
 #define MAX_DEVICES 4
 
 /* Module parameters passed by insmod/modprobe */
 char *device[MAX_DEVICES];    /* the block device to use */
 int erasesz[MAX_DEVICES];     /* optional default erase size */
-int sync;
 
 
 MODULE_LICENSE("GPL");
@@ -72,8 +69,6 @@
 MODULE_PARM_DESC(device, "block device to use");
 MODULE_PARM(erasesz, "1-4i");
 MODULE_PARM_DESC(erasesz, "optional erase size to use in KiB. eg 4=4KiB.");
-MODULE_PARM(sync, "i");
-MODULE_PARM_DESC(sync, "1=Synchronous writes");
 
 #define PAGE_READAHEAD 64
 
@@ -551,16 +546,8 @@
 }
 
 
-static int __init param_blkmtd_sync(char *str)
-{
-	if (str[0] == '1')
-		sync = 1;
-	return 1;
-}
-
 __setup("blkmtd_device=", param_blkmtd_device);
 __setup("blkmtd_erasesz=", param_blkmtd_erasesz);
-__setup("blkmtd_sync=", param_blkmtd_sync);
 
 #endif
 
