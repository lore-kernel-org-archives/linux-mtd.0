Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cohed-0006Sn-Pq
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 02:30:13 +0000
From: chenwy <chenwy-fnst@cn.fujitsu.com>
To: <linux-mtd@lists.infradead.org>
CC: <fnstml-fjl@cn.fujitsu.com>, <linux-kernel@vger.kernel.org>, chenwy
 <chenwy-fnst@cn.fujitsu.com>
Subject: [PATCH v2] mtdram: check offs and len where appropriate
Date: Fri, 17 Mar 2017 10:29:39 +0800
Message-ID: <20170317022939.5511-1-chenwy-fnst@cn.fujitsu.com>
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

We should prevent user to operating mtd device with
an illegal offset or length.

Signed-off-by: Chen Wenyong <chenwy-fnst@cn.fujitsu.com>
---
 drivers/mtd/devices/mtdram.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index cbd8547..83e1603 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -58,6 +58,10 @@ static int ram_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	if (check_offs_len(mtd, instr->addr, instr->len))
 		return -EINVAL;
+	if (mtd->size < (instr->len + instr->addr) || instr->addr < 0
+		       	|| instr->len < 0)
+		return -EINVAL;
+
 	memset((char *)mtd->priv + instr->addr, 0xff, instr->len);
 	instr->state = MTD_ERASE_DONE;
 	mtd_erase_callback(instr);
@@ -67,6 +71,9 @@ static int ram_erase(struct mtd_info *mtd, struct erase_info *instr)
 static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, void **virt, resource_size_t *phys)
 {
+	if (mtd->size < (len + from) || from < 0 || len < 0)
+		return -EINVAL;
+
 	*virt = mtd->priv + from;
 	*retlen = len;
 	return 0;
@@ -74,6 +81,9 @@ static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
 
 static int ram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
+	if (mtd->size < (len + from) || from < 0 || len < 0)
+		return -EINVAL;
+
 	return 0;
 }
 
@@ -93,6 +103,9 @@ static unsigned long ram_get_unmapped_area(struct mtd_info *mtd,
 static int ram_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
+	if (mtd->size < (len + from) || from < 0 || len < 0)
+		return -EINVAL;
+
 	memcpy(buf, mtd->priv + from, len);
 	*retlen = len;
 	return 0;
@@ -101,6 +114,9 @@ static int ram_read(struct mtd_info *mtd, loff_t from, size_t len,
 static int ram_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
+	if (mtd->size < (len + to) || to < 0 || len < 0)
+		return -EINVAL;
+
 	memcpy((char *)mtd->priv + to, buf, len);
 	*retlen = len;
 	return 0;
-- 
2.9.3
