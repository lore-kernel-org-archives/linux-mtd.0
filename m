From: zengzhaoxiu@163.com
To: kgene@kernel.org, k.kozlowski@samsung.com,
 boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>
Subject: [PATCH] mtd: nand: s3c2410: fix bug in s3c2410_nand_correct_data()
Date: Fri,  8 Apr 2016 00:48:17 +0800
Message-Id: <1460047697-72830-1-git-send-email-zengzhaoxiu@163.com>
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

From: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>

If there is only one bit difference in the ECC, the function should return 1.
The result of "diff0 & ~(1<<fls(diff0))" is equal to diff0, so the function
actually returns -1.

Here, we can use the simple expression "(diff0 & (diff0 - 1)) == 0" to determine
whether the diff0 has only one 1-bit.
---
 drivers/mtd/nand/s3c2410.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 9c9397b..c9698cf 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -542,7 +542,7 @@ static int s3c2410_nand_correct_data(struct mtd_info *mtd, u_char *dat,
 	diff0 |= (diff1 << 8);
 	diff0 |= (diff2 << 16);
 
-	if ((diff0 & ~(1<<fls(diff0))) == 0)
+	if ((diff0 & (diff0 - 1)) == 0)
 		return 1;
 
 	return -1;
-- 
2.5.5
