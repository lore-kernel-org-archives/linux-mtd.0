Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6hJ0-0006VA-K7
 for linux-mtd@lists.infradead.org; Sat, 28 May 2016 16:41:43 +0000
Received: by mail-pf0-x243.google.com with SMTP id f144so10045922pfa.2
 for <linux-mtd@lists.infradead.org>; Sat, 28 May 2016 09:41:21 -0700 (PDT)
Date: Sat, 28 May 2016 22:11:17 +0530
From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr
Subject: [PATCH] mtd: Replace if and BUG with BUG_ON
Message-ID: <20160528164117.GA31101@amitoj-Inspiron-3542>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace if condition and BUG() with a BUG_ON having the conditional
expression of the if statement as argument.

The Coccinelle semantic patch used to make this change is as follows:
@@ expression E,f; @@

(
  if (<+... f(...) ...+>) { BUG(); }
|
- if (E) { BUG(); }
+ BUG_ON(E);
)

Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
---
 drivers/mtd/ssfdc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index daf82ba..41b13d1 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -380,8 +380,7 @@ static int ssfdcr_readsect(struct mtd_blktrans_dev *dev,
 		" block_addr=%d\n", logic_sect_no, sectors_per_block, offset,
 		block_address);
 
-	if (block_address >= ssfdc->map_len)
-		BUG();
+	BUG_ON(block_address >= ssfdc->map_len);
 
 	block_address = ssfdc->logic_block_map[block_address];
 
-- 
1.9.1
