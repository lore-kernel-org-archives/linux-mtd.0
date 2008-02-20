Received: from exprod7og102.obsmtp.com ([64.18.2.157])
	by bombadil.infradead.org with smtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JRqQs-0001Us-Ho
	for linux-mtd@lists.infradead.org; Wed, 20 Feb 2008 15:00:27 +0000
Date: Wed, 20 Feb 2008 15:00:21 +0000
From: Stephane Chazelas <stephane.chazelas@emerson.com>
To: Joern Engel <joern@lazybastard.org>
Subject: [PATCH 2.6.25-rc2] block2mtd: logging typo fixes
Message-ID: <chaz20080220150021.GM4539@artesyncp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi joern,

this patch addresses a number of small issues mainly regarding
the output made by this driver to dmesg:
  - Some of the blkmtd's had not been changed to block2mtd which
    caused display problem
  - the parse_err() macro was displaying "block2mtd: " twice

Signed-off-by: Stephane Chazelas <stephane.chazelas@emerson.com>

--- drivers/mtd/devices/block2mtd.c~	2008-02-20 14:56:56.942145223 +0000
+++ drivers/mtd/devices/block2mtd.c	2008-02-20 14:57:15.802131021 +0000
@@ -305,7 +305,7 @@ static struct block2mtd_dev *add_device(
 	}
 	list_add(&dev->list, &blkmtd_device_list);
 	INFO("mtd%d: [%s] erase_size = %dKiB [%d]", dev->mtd.index,
-			dev->mtd.name + strlen("blkmtd: "),
+			dev->mtd.name + strlen("block2mtd: "),
 			dev->mtd.erasesize >> 10, dev->mtd.erasesize);
 	return dev;
 
@@ -366,9 +366,9 @@ static inline void kill_final_newline(ch
 }
 
 
-#define parse_err(fmt, args...) do {		\
-	ERROR("block2mtd: " fmt "\n", ## args);	\
-	return 0;				\
+#define parse_err(fmt, args...) do {	\
+	ERROR(fmt, ## args);		\
+	return 0;			\
 } while (0)
 
 #ifndef MODULE
@@ -474,7 +474,7 @@ static void __devexit block2mtd_exit(voi
 		block2mtd_sync(&dev->mtd);
 		del_mtd_device(&dev->mtd);
 		INFO("mtd%d: [%s] removed", dev->mtd.index,
-				dev->mtd.name + strlen("blkmtd: "));
+				dev->mtd.name + strlen("block2mtd: "));
 		list_del(&dev->list);
 		block2mtd_free_device(dev);
 	}
