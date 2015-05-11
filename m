From: Ben Shelton <ben.shelton@ni.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com, richard@nod.at
Subject: [PATCH 3/3] mtd: ubi: use 'max_bad_blocks' to compute bad_peb_limit
Date: Mon, 11 May 2015 10:19:56 -0500
Message-Id: <1431357596-29959-4-git-send-email-ben.shelton@ni.com>
In-Reply-To: <1431357596-29959-1-git-send-email-ben.shelton@ni.com>
References: <1431357596-29959-1-git-send-email-ben.shelton@ni.com>
Cc: Jeff Westfahl <jeff.westfahl@ni.com>
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

Currently, the UBIFS code computes the bad PEB limit based on the
worst-case assumption that all the bad blocks could be in a single
partition.  However, there are cases in which this is too pessimistic,
such as the case of an ONFI-compliant NAND device that specifies the
maximum number of bad blocks per LUN.

Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
---
 drivers/mtd/ubi/build.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index b7f824d..eca8ca6 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -597,6 +597,16 @@ static int get_bad_peb_limit(const struct ubi_device *ubi, int max_beb_per1024)
 	int limit, device_pebs;
 	uint64_t device_size;
 
+	/*
+	 * If the MTD provides a max_bad_blocks function, use that value. Fall
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
2.4.0
