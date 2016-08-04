Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVJTT-0001SV-Au
 for linux-mtd@lists.infradead.org; Thu, 04 Aug 2016 14:18:16 +0000
From: Sandeep Jain <Sandeep_Jain@mentor.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jim
 Baxter <jim_baxter@mentor.com>, Sandeep Jain <Sandeep_Jain@mentor.com>
Subject: [PATCH v1 2/2] mtd: Add hooks to call get and put on mtd devices.
Date: Thu, 4 Aug 2016 19:46:34 +0530
Message-ID: <1470320194-9602-3-git-send-email-Sandeep_Jain@mentor.com>
In-Reply-To: <1470320194-9602-1-git-send-email-Sandeep_Jain@mentor.com>
References: <Sandeep Jain <Sandeep_Jain@mentor.com>
 <1470320194-9602-1-git-send-email-Sandeep_Jain@mentor.com>
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

From: Jim Baxter <jim_baxter@mentor.com>

Add hooks to mtdpart to call _get_device and _put_device,
this allows the mtd devices to perform internal
reference counting if required.

Signed-off-by: Jim Baxter <jim_baxter@mentor.com>
Signed-off-by: Sandeep Jain <Sandeep_Jain@mentor.com>
---
 drivers/mtd/mtdpart.c |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 1f13e32..adbb1fd 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -338,6 +338,20 @@ static const struct mtd_ooblayout_ops part_ooblayout_ops = {
 	.free = part_ooblayout_free,
 };
 
+static int part_get_device(struct mtd_info *mtd)
+{
+	struct mtd_part *part = mtd_to_part(mtd);
+
+	return part->master->_get_device(part->master);
+}
+
+static void part_put_device(struct mtd_info *mtd)
+{
+	struct mtd_part *part = mtd_to_part(mtd);
+
+	part->master->_put_device(part->master);
+}
+
 static inline void free_partition(struct mtd_part *p)
 {
 	kfree(p->mtd.name);
@@ -463,6 +477,10 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 		slave->mtd._block_isbad = part_block_isbad;
 	if (master->_block_markbad)
 		slave->mtd._block_markbad = part_block_markbad;
+	if (master->_get_device)
+		slave->mtd._get_device = part_get_device;
+	if (master->_put_device)
+		slave->mtd._put_device = part_put_device;
 	slave->mtd._erase = part_erase;
 	slave->master = master;
 	slave->offset = part->offset;
-- 
1.7.9.5
