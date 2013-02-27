Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UAies-000724-Of
 for linux-mtd@lists.infradead.org; Wed, 27 Feb 2013 15:11:04 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/nand: don't use {read,write}_buf for 8-bit transfers
Date: Wed, 27 Feb 2013 16:10:52 +0100
Message-Id: <1361977852-18233-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Huang Shijie <b32955@freescale.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to the Open NAND Flash Interface Specification (ONFI) Revision
3.1 "Parameters are always transferred on the lower 8-bits of the data
bus." for the Get Features and Set Features commands.

So using read_buf and write_buf is wrong for 16-bit wide nand chips as
they use I/O[15:0]. The Get Features command is easily fixed using 4
times the read_byte callback. For Set Features error out as there is no
write_byte callback.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

note this is only compile tested and I don't have a 16-bit wide nand, so I
don't even saw a failure.

The problem exists since commit

	7db03ec (mtd: add helpers to set/get features for ONFI nand)

which introduced the two functions.

Still I'd like to know how I can write a byte (or a sequence of bytes) as this
is necessary for locking the otp are of micron chips. Well, I could implement
it for 8-bit chips only, but this isn't very satisfying.

Do we need to add a write_byte callback to struct nand_chip? Or is there
a way to do write a byte that I'm just too blind to see?

Is this patch relevant for stable? Probably not!?

Best regards
Uwe

 drivers/mtd/nand/nand_base.c |   14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4321415..abfd8ca 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2706,7 +2706,7 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 }
 
 /**
- * nand_onfi_set_features- [REPLACEABLE] set features for ONFI nand
+ * nand_onfi_set_features - [REPLACEABLE] set features for ONFI nand
  * @mtd: MTD device structure
  * @chip: nand chip info structure
  * @addr: feature address.
@@ -2720,6 +2720,11 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
 	if (!chip->onfi_version)
 		return -EINVAL;
 
+	if (chip->options & NAND_BUSWIDTH_16) {
+		pr_warn("onfi set feature command buggy for 16-bit chips\n");
+		return -ENOTSUPP;
+	}
+
 	chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, -1);
 	chip->write_buf(mtd, subfeature_param, ONFI_SUBFEATURE_PARAM_LEN);
 	status = chip->waitfunc(mtd, chip);
@@ -2729,7 +2734,7 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_onfi_get_features- [REPLACEABLE] get features for ONFI nand
+ * nand_onfi_get_features - [REPLACEABLE] get features for ONFI nand
  * @mtd: MTD device structure
  * @chip: nand chip info structure
  * @addr: feature address.
@@ -2738,6 +2743,8 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
 static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
 			int addr, uint8_t *subfeature_param)
 {
+	int i;
+
 	if (!chip->onfi_version)
 		return -EINVAL;
 
@@ -2745,7 +2752,8 @@ static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
 	memset(subfeature_param, 0, ONFI_SUBFEATURE_PARAM_LEN);
 
 	chip->cmdfunc(mtd, NAND_CMD_GET_FEATURES, addr, -1);
-	chip->read_buf(mtd, subfeature_param, ONFI_SUBFEATURE_PARAM_LEN);
+	for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
+		*subfeature_param++ = chip->read_byte(mtd);
 	return 0;
 }
 
-- 
1.7.10.4
