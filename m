Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzq8c-0004D4-3S
 for linux-mtd@lists.infradead.org; Thu, 27 Oct 2016 19:14:56 +0000
From: Zach Brown <zach.brown@ni.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <dedekind1@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v2 3/3] mtd: ubi: use 'max_bad_blocks' to compute
 bad_peb_limit if available
Date: Thu, 27 Oct 2016 14:14:02 -0500
Message-ID: <1477595642-11454-4-git-send-email-zach.brown@ni.com>
In-Reply-To: <1477595642-11454-1-git-send-email-zach.brown@ni.com>
References: <1477595642-11454-1-git-send-email-zach.brown@ni.com>
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
---
 drivers/mtd/ubi/build.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 85d54f3..0648863 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -584,6 +584,15 @@ static int get_bad_peb_limit(const struct ubi_device *ubi, int max_beb_per1024)
 	int limit, device_pebs;
 	uint64_t device_size;
 
+	/* If the MTD provides a max_bad_blocks function, use that value. Fall
+	 * back to max_beb_per1024 if that function returns an error.
+	 */
+	if (ubi->mtd->_max_bad_blocks) {
+		limit = ubi->mtd->_max_bad_blocks(ubi->mtd, 0, ubi->mtd->size);
+		if (limit > 0)
+			return limit;
+	}
+
 	if (!max_beb_per1024)
 		return 0;
 
-- 
2.7.4
