Received: from skprod3.natinst.com ([130.164.80.24] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPZzI-00032d-Do
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 19:15:43 +0000
From: Zach Brown <zach.brown@ni.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <dedekind1@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 2/5] mtd: ubi: use 'max_bad_blocks' to compute
 bad_peb_limit if available
Date: Fri, 6 Jan 2017 13:14:43 -0600
Message-ID: <1483730086-26706-3-git-send-email-zach.brown@ni.com>
In-Reply-To: <1483730086-26706-1-git-send-email-zach.brown@ni.com>
References: <1483730086-26706-1-git-send-email-zach.brown@ni.com>
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

If the user has not set max_beb_per1024 using either the cmdline or
Kconfig options for doing so, use the MTD function 'max_bad_blocks' to
compute the UBI bad_peb_limit.

Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
Signed-off-by: Zach Brown <zach.brown@ni.com>
Acked-by: Boris Brezillon <boris.brezillon@free-electron.com>
---
 drivers/mtd/ubi/build.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 85d54f3..3029219 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -584,8 +584,17 @@ static int get_bad_peb_limit(const struct ubi_device *ubi, int max_beb_per1024)
 	int limit, device_pebs;
 	uint64_t device_size;
 
-	if (!max_beb_per1024)
-		return 0;
+	if (!max_beb_per1024) {
+		/*
+		 * Since max_beb_per1024 has not been set by the user in either
+		 * the cmdline or Kconfig, use mtd_max_bad_blocks to set the
+		 * limit if it is supported by the device.
+		 */
+		limit = mtd_max_bad_blocks(ubi->mtd, 0, ubi->mtd->size);
+		if (limit < 0)
+			return 0;
+		return limit;
+	}
 
 	/*
 	 * Here we are using size of the entire flash chip and
-- 
2.7.4
