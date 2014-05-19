Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmJ6I-0004xV-3Z
 for linux-mtd@lists.infradead.org; Mon, 19 May 2014 08:39:15 +0000
Message-ID: <5379C2E8.5040000@huawei.com>
Date: Mon, 19 May 2014 16:38:00 +0800
From: Zhang Zhen <zhenzhang.zhang@huawei.com>
MIME-Version: 1.0
To: <adrian.hunter@intel.com>, <dedekind1@gmail.com>
Subject: [PATCH] ubi: replace simple_strtoul() with kstrtoul()
References: <1400488570-20288-1-git-send-email-zhenzhang.zhang@huawei.com>
In-Reply-To: <1400488570-20288-1-git-send-email-zhenzhang.zhang@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Hu Jianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

use the newer and more pleasant kstrtoul() to replace simple_strtoul(),
because simple_strtoul() is marked for obsoletion.

Signed-off-by: Zhang Zhen <zhenzhang.zhang@huawei.com>
Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 drivers/mtd/ubi/build.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 6e30a3c..80c539c 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1190,10 +1190,13 @@ static struct mtd_info * __init open_mtd_by_chdev(const char *mtd_dev)
 static struct mtd_info * __init open_mtd_device(const char *mtd_dev)
 {
 	struct mtd_info *mtd;
-	int mtd_num;
+	int mtd_num, ret;
 	char *endp;

-	mtd_num = simple_strtoul(mtd_dev, &endp, 0);
+	endp = (char *)mtd_dev;
+	ret = kstrtoul(endp, 0, (unsigned long *)&mtd_num);
+	if (ret)
+		return ERR_PTR(-EINVAL);
 	if (*endp != '\0' || mtd_dev == endp) {
 		/*
 		 * This does not look like an ASCII integer, probably this is
@@ -1362,8 +1365,12 @@ static int __init bytes_str_to_int(const char *str)
 {
 	char *endp;
 	unsigned long result;
+	int ret;

-	result = simple_strtoul(str, &endp, 0);
+	endp = (char *)str;
+	ret = kstrtoul(endp, 0, &result);
+	if (ret)
+		return -EINVAL;
 	if (str == endp || result >= INT_MAX) {
 		ubi_err("incorrect bytes count: \"%s\"\n", str);
 		return -EINVAL;
-- 
1.8.1.2


.
