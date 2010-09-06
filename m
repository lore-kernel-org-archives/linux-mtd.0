Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OsXTm-0000NP-LY
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 08:55:07 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/13] UBI: fix small 80 characters limit style issue
Date: Mon,  6 Sep 2010 11:54:46 +0300
Message-Id: <1283763293-1882-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1283763293-1882-1-git-send-email-dedekind1@gmail.com>
References: <1283763293-1882-1-git-send-email-dedekind1@gmail.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>,
	"Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

One line was longer than 80 lines, make it shorter.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/build.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 78ae894..f247c4e 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -95,8 +95,8 @@ DEFINE_MUTEX(ubi_devices_mutex);
 static DEFINE_SPINLOCK(ubi_devices_lock);
 
 /* "Show" method for files in '/<sysfs>/class/ubi/' */
-static ssize_t ubi_version_show(struct class *class, struct class_attribute *attr,
-				char *buf)
+static ssize_t ubi_version_show(struct class *class,
+				struct class_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%d\n", UBI_VERSION);
 }
-- 
1.7.1.1
