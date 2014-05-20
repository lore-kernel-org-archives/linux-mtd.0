Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmfkI-0005kT-0N
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 08:50:03 +0000
Message-ID: <537B16CB.9070508@huawei.com>
Date: Tue, 20 May 2014 16:48:11 +0800
From: Zhang Zhen <zhenzhang.zhang@huawei.com>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>, <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2] UBIFS: replace simple_strtoul() with kstrtoint()
References: <1400575582-24841-1-git-send-email-zhenzhang.zhang@huawei.com>
In-Reply-To: <1400575582-24841-1-git-send-email-zhenzhang.zhang@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Hu Jianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

use the newer and more pleasant kstrtoint() to replace simple_strtoul(),
because simple_strtoul() is marked for obsoletion.

Signed-off-by: Zhang Zhen <zhenzhang.zhang@huawei.com>
Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 drivers/mtd/ubi/build.c | 7 +++----
 fs/ubifs/super.c        | 7 ++++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 6e30a3c..77a2884 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1190,11 +1190,10 @@ static struct mtd_info * __init open_mtd_by_chdev(const char *mtd_dev)
 static struct mtd_info * __init open_mtd_device(const char *mtd_dev)
 {
 	struct mtd_info *mtd;
-	int mtd_num;
-	char *endp;
+	int mtd_num, ret;

-	mtd_num = simple_strtoul(mtd_dev, &endp, 0);
-	if (*endp != '\0' || mtd_dev == endp) {
+	ret = kstrtoint(mtd_dev, 0, &mtd_num);
+	if (ret) {
 		/*
 		 * This does not look like an ASCII integer, probably this is
 		 * MTD device name.
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index a81c7b5..d8c71a6 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1903,7 +1903,7 @@ const struct super_operations ubifs_super_operations = {
 static struct ubi_volume_desc *open_ubi(const char *name, int mode)
 {
 	struct ubi_volume_desc *ubi;
-	int dev, vol;
+	int dev, vol, ret;
 	char *endptr;

 	/* First, try to open using the device node path method */
@@ -1922,10 +1922,11 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
 	if (!isdigit(name[3]))
 		return ERR_PTR(-EINVAL);

-	dev = simple_strtoul(name + 3, &endptr, 0);
+	endptr = (char *)name + 3;
+	ret = kstrtoint(endptr, 0, &dev);

 	/* ubiY method */
-	if (*endptr == '\0')
+	if (!ret)
 		return ubi_open_volume(0, dev, mode);

 	/* ubiX_Y method */
-- 
1.8.1.2


.
