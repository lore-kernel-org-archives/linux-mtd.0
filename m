Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmwmW-0004lj-PR
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 03:01:30 +0000
Message-ID: <537C16C6.9070904@huawei.com>
Date: Wed, 21 May 2014 11:00:22 +0800
From: Zhang Zhen <zhenzhang.zhang@huawei.com>
MIME-Version: 1.0
To: Adrian Hunter <adrian.hunter@intel.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v3] UBIFS: replace simple_strtoul() with kstrtoint()
References: <1400641191-27877-1-git-send-email-zhenzhang.zhang@huawei.com>
In-Reply-To: <1400641191-27877-1-git-send-email-zhenzhang.zhang@huawei.com>
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
 drivers/mtd/ubi/build.c |  9 +++++----
 fs/ubifs/super.c        | 14 ++++++++++----
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 6e30a3c..489f5ef 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1190,11 +1190,12 @@ static struct mtd_info * __init open_mtd_by_chdev(const char *mtd_dev)
 static struct mtd_info * __init open_mtd_device(const char *mtd_dev)
 {
 	struct mtd_info *mtd;
-	int mtd_num;
-	char *endp;
+	int mtd_num, ret;

-	mtd_num = simple_strtoul(mtd_dev, &endp, 0);
-	if (*endp != '\0' || mtd_dev == endp) {
+	ret = kstrtoint(mtd_dev, 0, &mtd_num);
+	if (ret)
+		return ERR_PTR(-EINVAL);
+	if (*mtd_dev != '\0') {
 		/*
 		 * This does not look like an ASCII integer, probably this is
 		 * MTD device name.
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index a81c7b5..4831b60 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1903,8 +1903,8 @@ const struct super_operations ubifs_super_operations = {
 static struct ubi_volume_desc *open_ubi(const char *name, int mode)
 {
 	struct ubi_volume_desc *ubi;
-	int dev, vol;
-	char *endptr;
+	int dev, vol, ret;
+	const char *endptr;

 	/* First, try to open using the device node path method */
 	ubi = ubi_open_volume_path(name, mode);
@@ -1922,7 +1922,10 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
 	if (!isdigit(name[3]))
 		return ERR_PTR(-EINVAL);

-	dev = simple_strtoul(name + 3, &endptr, 0);
+	endptr = name + 3;
+	ret = kstrtoint(endptr, 0, &dev);
+	if (ret)
+		return ERR_PTR(-EINVAL);

 	/* ubiY method */
 	if (*endptr == '\0')
@@ -1930,7 +1933,10 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)

 	/* ubiX_Y method */
 	if (*endptr == '_' && isdigit(endptr[1])) {
-		vol = simple_strtoul(endptr + 1, &endptr, 0);
+		endptr = endptr + 1;
+		ret = kstrtoint(endptr, 0, &vol);
+		if (ret)
+			return ERR_PTR(-EINVAL);
 		if (*endptr != '\0')
 			return ERR_PTR(-EINVAL);
 		return ubi_open_volume(dev, vol, mode);
-- 
1.8.1.2


.
