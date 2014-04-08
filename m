Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXZh8-0002Cu-Dp
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 17:20:23 +0000
Received: by mail-wg0-f50.google.com with SMTP id x13so1315906wgg.9
 for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2014 10:19:59 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20Poggi?= <poggi.raph@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: add line feed to pr_err
Date: Tue,  8 Apr 2014 10:19:48 -0700
Message-Id: <1396977588-49131-1-git-send-email-poggi.raph@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rapha=C3=ABl=20Poggi?= <poggi.raph@gmail.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add line feed to pr_err.

Signed-off-by: Raphaël Poggi <poggi.raph@gmail.com>
---
 drivers/mtd/nand/nand_ecc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index 053c9a2..97c4c02 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -506,7 +506,7 @@ int __nand_correct_data(unsigned char *buf,
 	if ((bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2]) == 1)
 		return 1;	/* error in ECC data; no action needed */
 
-	pr_err("%s: uncorrectable ECC error", __func__);
+	pr_err("%s: uncorrectable ECC error\n", __func__);
 	return -1;
 }
 EXPORT_SYMBOL(__nand_correct_data);
-- 
1.8.3.2
