Received: from mail-lf0-x22d.google.com ([2a00:1450:4010:c07::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiVCd-00028L-21
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2016 22:55:08 +0000
Received: by mail-lf0-x22d.google.com with SMTP id d82so75497712lfe.3
 for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2016 15:54:46 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 1/3] mtd: nand: add new enum for storing ECC algorithm
Date: Tue, 22 Mar 2016 23:54:12 +0100
Message-Id: <1458687254-26181-2-git-send-email-zajec5@gmail.com>
In-Reply-To: <1458687254-26181-1-git-send-email-zajec5@gmail.com>
References: <1458687254-26181-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Our nand_ecc_modes_t is already a bit abused by value NAND_ECC_SOFT_BCH.
This enum should store ECC mode only and putting algorithm details there
is a bit idea. It would result in too many values impossible to support
in a sane way.

To solve this problem let's add a new enum. We'll have to modify all
drivers to set it properly but once it's done it'll be possible to drop
NAND_ECC_SOFT_BCH. That will result in a cleaner design and more
possibilities like setting ECC algorithm for hardware ECC mode.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 include/linux/mtd/nand.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 7604f4b..b818eb3 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -119,6 +119,12 @@ typedef enum {
 	NAND_ECC_SOFT_BCH,
 } nand_ecc_modes_t;
 
+enum nand_ecc_algo {
+	NAND_ECC_UNKNOWN,
+	NAND_ECC_HAMMING,
+	NAND_ECC_BCH,
+};
+
 /*
  * Constants for Hardware ECC
  */
@@ -508,6 +514,7 @@ struct nand_hw_control {
  */
 struct nand_ecc_ctrl {
 	nand_ecc_modes_t mode;
+	enum nand_ecc_algo algo;
 	int steps;
 	int size;
 	int bytes;
-- 
1.8.4.5
