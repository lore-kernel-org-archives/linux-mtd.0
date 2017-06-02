Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGoke-0004x5-86
 for linux-mtd@lists.infradead.org; Fri, 02 Jun 2017 15:44:41 +0000
Received: by mail-wm0-x244.google.com with SMTP id d127so19562613wmf.1
 for <linux-mtd@lists.infradead.org>; Fri, 02 Jun 2017 08:44:15 -0700 (PDT)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 4/5] mtd: block2mtd: Add support for deleting block2mtd mapping
Date: Fri,  2 Jun 2017 17:43:41 +0200
Message-Id: <1496418222-23483-5-git-send-email-pali.rohar@gmail.com>
In-Reply-To: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch allows user to delete block2mtd mapping via parameters file
/sys/module/block2mtd/parameters/block2mtd

Syntax is "del=device", e.g.:

$ echo -n del=/dev/loop0 > /sys/module/block2mtd/parameters/block2mtd

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/mtd/devices/block2mtd.c |   35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index ad96937..9b6f7b5 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -355,6 +355,19 @@ static struct block2mtd_dev *add_device(char *devname, uint32_t erase_size,
 	return NULL;
 }
 
+static void del_device(struct block2mtd_dev *dev)
+{
+	if (!dev->ro_mode)
+		block2mtd_sync(&dev->mtd);
+	mtd_device_unregister(&dev->mtd);
+	mutex_destroy(&dev->write_mutex);
+	pr_info("mtd%d: [%s] removed\n",
+		dev->mtd.index,
+		dev->mtd.name + strlen("block2mtd: "));
+	list_del(&dev->list);
+	block2mtd_free_device(dev);
+}
+
 
 /* This function works similar to reguler strtoul.  In addition, it
  * allows some suffixes for a more human-readable number format:
@@ -477,6 +490,19 @@ static int block2mtd_setup2(const char *val)
 		}
 	}
 
+	if (strncmp(name, "del=", strlen("del=")) == 0) {
+		struct list_head *pos, *next;
+		list_for_each_safe(pos, next, &blkmtd_device_list) {
+			struct block2mtd_dev *dev =
+				list_entry(pos, typeof(*dev), list);
+			if (strcmp(dev->mtd.name + strlen("block2mtd: "),
+				name + strlen("del=")) != 0)
+				continue;
+			del_device(dev);
+			return 0;
+		}
+	}
+
 	add_device(name, erase_size, write_size, subpage_sft, timeout);
 
 	return 0;
@@ -536,14 +562,7 @@ static void block2mtd_exit(void)
 	/* Remove the MTD devices */
 	list_for_each_safe(pos, next, &blkmtd_device_list) {
 		struct block2mtd_dev *dev = list_entry(pos, typeof(*dev), list);
-		block2mtd_sync(&dev->mtd);
-		mtd_device_unregister(&dev->mtd);
-		mutex_destroy(&dev->write_mutex);
-		pr_info("mtd%d: [%s] removed\n",
-			dev->mtd.index,
-			dev->mtd.name + strlen("block2mtd: "));
-		list_del(&dev->list);
-		block2mtd_free_device(dev);
+		del_device(dev);
 	}
 }
 
-- 
1.7.9.5
