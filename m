Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S6rA2-0003V0-Sz
 for linux-mtd@lists.infradead.org; Sun, 11 Mar 2012 22:22:45 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] MTD: add ecc_strength fields to mtd structs
Date: Sun, 11 Mar 2012 14:21:10 -0700
Message-Id: <1331500873-9792-2-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds 'ecc_strength' to struct mtd_info.  This stores the maximum number of
bit errors that can be corrected in one writesize region.

For consistency with the nand code, 'strength' is similiarly added to struct
nand_ecc_ctrl.  This stores the maximum number of bit errors that can be
corrected in one ecc step.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 include/linux/mtd/mtd.h  |    3 +++
 include/linux/mtd/nand.h |    2 ++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 726c2d1..cf5ea8c 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -164,6 +164,9 @@ struct mtd_info {
 	/* ECC layout structure pointer - read only! */
 	struct nand_ecclayout *ecclayout;
 
+	/* max number of correctible bit errors per writesize */
+	unsigned int ecc_strength;
+
 	/* Data for variable erase regions. If numeraseregions is zero,
 	 * it means that the whole device has erasesize as given above.
 	 */
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 609868f..1482340 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -324,6 +324,7 @@ struct nand_hw_control {
  * @steps:	number of ECC steps per page
  * @size:	data bytes per ECC step
  * @bytes:	ECC bytes per step
+ * @strength:	max number of correctible bits per ECC step
  * @total:	total number of ECC bytes per page
  * @prepad:	padding information for syndrome based ECC generators
  * @postpad:	padding information for syndrome based ECC generators
@@ -351,6 +352,7 @@ struct nand_ecc_ctrl {
 	int size;
 	int bytes;
 	int total;
+	int strength;
 	int prepad;
 	int postpad;
 	struct nand_ecclayout	*layout;
-- 
1.7.3.4
