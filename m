Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cjhgo-0006q2-MG
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 07:31:48 +0000
From: chenwy <chenwy-fnst@cn.fujitsu.com>
To: <linux-mtd@lists.infradead.org>
CC: <fnstml-fjl@cn.fujitsu.com>, <linux-kernel@vger.kernel.org>, chenwy
 <chenwy-fnst@cn.fujitsu.com>
Subject: [PATCH] mtd: mtdram: check offs and len in mtdram->point
 madram->unpoint, mtdram->write and mtdram->read
Date: Fri, 3 Mar 2017 15:31:00 +0800
Message-ID: <20170303073100.27590-1-chenwy-fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

    We should prevent user to erasing mtd device with
    an unaligned offset or length.

Signed-off-by: Chen  Wenyong <chenwy-fnst@cn.fujitsu.com>
---
 drivers/mtd/devices/mtdram.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index cbd8547..b0468c1 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -67,6 +67,8 @@ static int ram_erase(struct mtd_info *mtd, struct erase_info *instr)
 static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, void **virt, resource_size_t *phys)
 {
+	if (check_offs_len(mtd, from, len))
+		return -EINVAL;
 	*virt = mtd->priv + from;
 	*retlen = len;
 	return 0;
@@ -74,6 +76,8 @@ static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
 
 static int ram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
+	if (check_offs_len(mtd, from, len))
+		return -EINVAL;
 	return 0;
 }
 
@@ -93,6 +97,8 @@ static unsigned long ram_get_unmapped_area(struct mtd_info *mtd,
 static int ram_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
+	if (check_offs_len(mtd, from, len))
+		return -EINVAL;
 	memcpy(buf, mtd->priv + from, len);
 	*retlen = len;
 	return 0;
@@ -101,6 +107,8 @@ static int ram_read(struct mtd_info *mtd, loff_t from, size_t len,
 static int ram_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
+	if (check_offs_len(mtd, to, len))
+		return -EINVAL;
 	memcpy((char *)mtd->priv + to, buf, len);
 	*retlen = len;
 	return 0;
-- 
2.9.3
