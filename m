Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cgkam-0000ZK-9A
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 09:02:25 -0500
Date: Tue, 21 Dec 2004 15:02:19 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221140219.GU22636@wohnheim.fh-wedel.de>
References: <20041221134511.GK22636@wohnheim.fh-wedel.de>
	<20041221134724.GL22636@wohnheim.fh-wedel.de>
	<20041221134818.GM22636@wohnheim.fh-wedel.de>
	<20041221134901.GN22636@wohnheim.fh-wedel.de>
	<20041221135139.GO22636@wohnheim.fh-wedel.de>
	<20041221135312.GP22636@wohnheim.fh-wedel.de>
	<20041221135405.GQ22636@wohnheim.fh-wedel.de>
	<20041221135530.GR22636@wohnheim.fh-wedel.de>
	<20041221135705.GS22636@wohnheim.fh-wedel.de>
	<20041221140102.GT22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221140102.GT22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 15/22] Rename unreadable mutex
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If I cannot pronounce a name, my reading abilities degrade.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_mutex	2004-12-20 22:38:34.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 22:41:15.000000000 +0100
@@ -46,7 +46,7 @@
 	struct list_head list;
 	struct block_device *blkdev;
 	struct mtd_info mtd;
-	struct semaphore wrbuf_mutex;
+	struct semaphore write_mutex;
 };
 
 
@@ -215,9 +215,9 @@
 	}
 
 	err=0;
-	down(&dev->wrbuf_mutex);
+	down(&dev->write_mutex);
 	err = buf ? my_write() : my_erase();
-	up(&dev->wrbuf_mutex);
+	up(&dev->write_mutex);
 	return err;
 }
 
@@ -388,7 +388,7 @@
 	}
 
 	atomic_set(&bdev->bd_inode->i_mapping->truncate_count, 0);
-	init_MUTEX(&dev->wrbuf_mutex);
+	init_MUTEX(&dev->write_mutex);
 
 	/* Setup the MTD structure */
 	/* make the name contain the block device in */
@@ -566,5 +566,5 @@
 module_exit(blockmtd_exit);
 
 MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Simon Evans <spse@secret.org.uk>");
+MODULE_AUTHOR("Simon Evans <spse@secret.org.uk> and others");
 MODULE_DESCRIPTION("Emulate an MTD using a block device");
