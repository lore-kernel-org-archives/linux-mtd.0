Received: from skprod3.natinst.com ([130.164.80.24] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8udh-0008RE-HF
 for linux-mtd@lists.infradead.org; Mon, 21 Nov 2016 19:52:31 +0000
From: Zach Brown <zach.brown@ni.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <dedekind1@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v5 2/5] mtd: ubi: use 'max_bad_blocks' to compute
 bad_peb_limit if available
Date: Mon, 21 Nov 2016 13:51:36 -0600
Message-ID: <1479757899-6849-3-git-send-email-zach.brown@ni.com>
In-Reply-To: <1479757899-6849-1-git-send-email-zach.brown@ni.com>
References: <1479757899-6849-1-git-send-email-zach.brown@ni.com>
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

From: Jeff Westfahl <jeff.westfahl@ni.com>

Use the MTD function 'max_bad_blocks' to compute the UBI bad_peb_limit,
if the function is implemented for an MTD and doesn't return an error.

Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
Signed-off-by: Zach Brown <zach.brown@ni.com>
Acked-by: Boris Brezillon <boris.brezillon@free-electron.com>
---
 drivers/mtd/ubi/build.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 85d54f3..e9940a9 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -584,6 +584,10 @@ static int get_bad_peb_limit(const struct ubi_device *ubi, int max_beb_per1024)
 	int limit, device_pebs;
 	uint64_t device_size;
 
+	limit = mtd_max_bad_blocks(ubi->mtd, 0, ubi->mtd->size);
+	if (limit > 0)
+		return limit;
+
 	if (!max_beb_per1024)
 		return 0;
 
-- 
2.7.4
