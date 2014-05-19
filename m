Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmEEj-0003yf-Cl
 for linux-mtd@lists.infradead.org; Mon, 19 May 2014 03:27:40 +0000
Message-ID: <537979E9.3060209@huawei.com>
Date: Mon, 19 May 2014 11:26:33 +0800
From: Zhang Zhen <zhenzhang.zhang@huawei.com>
MIME-Version: 1.0
To: <adrian.hunter@intel.com>, <dedekind1@gmail.com>
Subject: [PATCH] ubifs: replace simple_strtoul() with kstrtoul()
References: <1400469756-18212-1-git-send-email-zhenzhang.zhang@huawei.com>
In-Reply-To: <1400469756-18212-1-git-send-email-zhenzhang.zhang@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
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
---
 fs/ubifs/super.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index a81c7b5..a30f297 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1905,6 +1905,7 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
 	struct ubi_volume_desc *ubi;
 	int dev, vol;
 	char *endptr;
+	int ret;

 	/* First, try to open using the device node path method */
 	ubi = ubi_open_volume_path(name, mode);
@@ -1922,7 +1923,10 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
 	if (!isdigit(name[3]))
 		return ERR_PTR(-EINVAL);

-	dev = simple_strtoul(name + 3, &endptr, 0);
+	endptr = (char *)name + 3;
+	ret = kstrtoul(endptr, 0, (unsigned long *)&dev);
+	if (ret)
+		return ERR_PTR(-EINVAL);

 	/* ubiY method */
 	if (*endptr == '\0')
@@ -1930,7 +1934,10 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)

 	/* ubiX_Y method */
 	if (*endptr == '_' && isdigit(endptr[1])) {
-		vol = simple_strtoul(endptr + 1, &endptr, 0);
+		endptr = endptr + 1;
+		ret = kstrtoul(endptr, 0, (unsigned long *)&vol);
+		if (ret)
+			return ERR_PTR(-EINVAL);
 		if (*endptr != '\0')
 			return ERR_PTR(-EINVAL);
 		return ubi_open_volume(dev, vol, mode);
-- 
1.8.1.2


.
