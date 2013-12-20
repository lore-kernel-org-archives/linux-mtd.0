Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VturT-0001Tu-OD
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 07:51:10 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 2/5] mtd: nand: omap: ecc.correct: omap_elm_correct_data:
 rename eccsize and ecc_vector_size to avoid confusion
Date: Fri, 20 Dec 2013 13:20:17 +0530
Message-ID: <1387525820-25709-3-git-send-email-pekon@ti.com>
In-Reply-To: <1387525820-25709-1-git-send-email-pekon@ti.com>
References: <1387525820-25709-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: avinashphilipk@gmail.com, Felipe Balbi <balbi@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

renaming following variables as they cause confusion due to resemblence to
another similar field in 'struct nand_ecc_ctrl'  (nand_chip->ecc.size).
  ecc_vector_size = info->nand.ecc.bytes  ---> eccbytes = info->nand.ecc.bytes;
  eccsize = ecc_vector_size - 1;          ---> eccbytes - 1;

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 42a290b..0fefff9 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1359,9 +1359,10 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 {
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 			mtd);
+	int eccbytes	= info->nand.ecc.bytes;
 	int eccsteps = info->nand.ecc.steps;
 	int i , j, stat = 0;
-	int eccsize, eccflag, ecc_vector_size;
+	int eccflag;
 	struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
 	u_char *ecc_vec = calc_ecc;
 	u_char *spare_ecc = read_ecc;
@@ -1380,23 +1381,16 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 		erased_ecc_vec = bch4_vector;
 	}
 
-	ecc_vector_size = info->nand.ecc.bytes;
-
-	/*
-	 * Remove extra byte padding for BCH8 RBL
-	 * compatibility and erased page handling
-	 */
-	eccsize = ecc_vector_size - 1;
-
 	for (i = 0; i < eccsteps ; i++) {
 		eccflag = 0;	/* initialize eccflag */
 
 		/*
 		 * Check any error reported,
 		 * In case of error, non zero ecc reported.
+		 *  - BCH4_HW: omit  7th ECC byte reserved as 0x0
+		 *  - BCH8_HW: omit 14th ECC byte reserved as 0x0
 		 */
-
-		for (j = 0; (j < eccsize); j++) {
+		for (j = 0; j < (eccbytes - 1); j++) {
 			if (calc_ecc[j] != 0) {
 				eccflag = 1; /* non zero ecc, error present */
 				break;
@@ -1421,7 +1415,7 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 			 * zeros are more than threshold erased page, either
 			 * case page reported as uncorrectable.
 			 */
-			if (hweight8(~read_ecc[eccsize]) >= threshold) {
+			if (hweight8(~read_ecc[eccbytes - 1]) >= threshold) {
 				/*
 				 * Update elm error vector as
 				 * data area is programmed
@@ -1433,7 +1427,8 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 				int bitflip_count;
 				u_char *buf = &data[info->nand.ecc.size * i];
 
-				if (memcmp(calc_ecc, erased_ecc_vec, eccsize)) {
+				if (memcmp(calc_ecc, erased_ecc_vec,
+							 (eccbytes - 1))) {
 					bitflip_count = erased_sector_bitflips(
 							buf, read_ecc, info);
 
@@ -1446,8 +1441,8 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 		}
 
 		/* Update the ecc vector */
-		calc_ecc += ecc_vector_size;
-		read_ecc += ecc_vector_size;
+		calc_ecc += eccbytes;
+		read_ecc += eccbytes;
 	}
 
 	/* Check if any error reported */
@@ -1496,7 +1491,7 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 
 		/* Update page data with sector size */
 		data += info->nand.ecc.size;
-		spare_ecc += ecc_vector_size;
+		spare_ecc += eccbytes;
 	}
 
 	for (i = 0; i < eccsteps; i++)
-- 
1.8.1
