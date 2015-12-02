From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 1/3] mtd: nand: add NAND_NEED_SCRAMBLING option flag
Date: Wed,  2 Dec 2015 12:01:05 +0100
Message-Id: <1449054067-16751-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1449054067-16751-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1449054067-16751-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some MLC NANDs are sensitive to repeated patterns and require data to be
scrambled in order to limit the number of bitflips.
Add a new flag to let the NAND controller know about this constraint.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 include/linux/mtd/nand.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index fad634e..0203b15 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -160,6 +160,12 @@ typedef enum {
 /* Device supports subpage reads */
 #define NAND_SUBPAGE_READ	0x00001000
 
+/*
+ * Some MLC NANDs need data scrambling to limit bitflips caused by repeated
+ * patterns.
+ */
+#define NAND_NEED_SCRAMBLING	0x00002000
+
 /* Options valid for Samsung large page devices */
 #define NAND_SAMSUNG_LP_OPTIONS NAND_CACHEPRG
 
-- 
2.1.4
