From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>, Kyungmin Park <kyungmin.park@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 punnaiah choudary kalluri <punnaia@xilinx.com>,
 Priit Laes <plaes@plaes.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-api@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 06/52] mtd: use mtd_ooblayout_xxx() helpers where
 appropriate
Date: Fri, 26 Feb 2016 01:57:14 +0100
Message-Id: <1456448280-27788-7-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1456448280-27788-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1456448280-27788-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtd_ooblayout_xxx() helper functions have been added to avoid direct
accesses to the ecclayout field, and thus ease for future reworks.
Use these helpers in all places where the oobfree[] and eccpos[] arrays
where directly accessed.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/mtdchar.c | 107 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 88 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 6d19835..cd64ab7 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -472,28 +472,101 @@ static int mtdchar_readoob(struct file *file, struct mtd_info *mtd,
  * nand_ecclayout flexibly (i.e. the struct may change size in new
  * releases without requiring major rewrites).
  */
-static int shrink_ecclayout(const struct nand_ecclayout *from,
-		struct nand_ecclayout_user *to)
+static int shrink_ecclayout(struct mtd_info *mtd,
+			    struct nand_ecclayout_user *to)
 {
-	int i;
+	struct mtd_oob_region oobregion;
+	int i, section = 0, ret;
 
-	if (!from || !to)
+	if (!mtd || !to)
 		return -EINVAL;
 
 	memset(to, 0, sizeof(*to));
 
-	to->eccbytes = min((int)from->eccbytes, MTD_MAX_ECCPOS_ENTRIES);
-	for (i = 0; i < to->eccbytes; i++)
-		to->eccpos[i] = from->eccpos[i];
+	to->eccbytes = 0;
+	for (i = 0; i < MTD_MAX_ECCPOS_ENTRIES;) {
+		u32 eccpos;
+
+		ret = mtd_ooblayout_ecc(mtd, section, &oobregion);
+		if (ret < 0) {
+			if (ret != -ERANGE)
+				return ret;
+
+			break;
+		}
+
+		eccpos = oobregion.offset;
+		for (; i < MTD_MAX_ECCPOS_ENTRIES &&
+		       eccpos < oobregion.offset + oobregion.length; i++) {
+			to->eccpos[i] = eccpos++;
+			to->eccbytes++;
+		}
+	}
 
 	for (i = 0; i < MTD_MAX_OOBFREE_ENTRIES; i++) {
-		if (from->oobfree[i].length == 0 &&
-				from->oobfree[i].offset == 0)
+		ret = mtd_ooblayout_free(mtd, i, &oobregion);
+		if (ret < 0) {
+			if (ret != -ERANGE)
+				return ret;
+
+			break;
+		}
+
+		to->oobfree[i].offset = oobregion.offset;
+		to->oobfree[i].length = oobregion.length;
+		to->oobavail += to->oobfree[i].length;
+	}
+
+	return 0;
+}
+
+static int get_oobinfo(struct mtd_info *mtd, struct nand_oobinfo *to)
+{
+	struct mtd_oob_region oobregion;
+	int i, section = 0, ret;
+
+	if (!mtd || !to)
+		return -EINVAL;
+
+	memset(to, 0, sizeof(*to));
+
+	to->eccbytes = 0;
+	for (i = 0; i < ARRAY_SIZE(to->eccpos);) {
+		u32 eccpos;
+
+		ret = mtd_ooblayout_ecc(mtd, section, &oobregion);
+		if (ret < 0) {
+			if (ret != -ERANGE)
+				return ret;
+
 			break;
-		to->oobavail += from->oobfree[i].length;
-		to->oobfree[i] = from->oobfree[i];
+		}
+
+		if (oobregion.length + i > ARRAY_SIZE(to->eccpos))
+			return -EINVAL;
+
+		eccpos = oobregion.offset;
+		for (; eccpos < oobregion.offset + oobregion.length; i++) {
+			to->eccpos[i] = eccpos++;
+			to->eccbytes++;
+		}
 	}
 
+	for (i = 0; i < 8; i++) {
+		ret = mtd_ooblayout_free(mtd, i, &oobregion);
+		if (ret < 0) {
+			if (ret != -ERANGE)
+				return ret;
+
+			break;
+		}
+
+		to->oobfree[i][0] = oobregion.offset;
+		to->oobfree[i][1] = oobregion.length;
+	}
+
+	to->useecc = MTD_NANDECC_AUTOPLACE;
+
 	return 0;
 }
 
@@ -817,14 +890,10 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 
 		if (!mtd->ecclayout)
 			return -EOPNOTSUPP;
-		if (mtd->ecclayout->eccbytes > ARRAY_SIZE(oi.eccpos))
-			return -EINVAL;
 
-		oi.useecc = MTD_NANDECC_AUTOPLACE;
-		memcpy(&oi.eccpos, mtd->ecclayout->eccpos, sizeof(oi.eccpos));
-		memcpy(&oi.oobfree, mtd->ecclayout->oobfree,
-		       sizeof(oi.oobfree));
-		oi.eccbytes = mtd->ecclayout->eccbytes;
+		ret = get_oobinfo(mtd, &oi);
+		if (ret)
+			return ret;
 
 		if (copy_to_user(argp, &oi, sizeof(struct nand_oobinfo)))
 			return -EFAULT;
@@ -920,7 +989,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (!usrlay)
 			return -ENOMEM;
 
-		shrink_ecclayout(mtd->ecclayout, usrlay);
+		shrink_ecclayout(mtd, usrlay);
 
 		if (copy_to_user(argp, usrlay, sizeof(*usrlay)))
 			ret = -EFAULT;
-- 
2.1.4
