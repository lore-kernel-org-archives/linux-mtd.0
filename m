Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhCsG-0000Q3-1S
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 08:36:28 +0000
Received: by pablk4 with SMTP id lk4so33541230pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 01:36:07 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] mtd: mtdram: fix build error
Date: Wed, 30 Sep 2015 14:05:58 +0530
Message-Id: <1443602158-631-1-git-send-email-sudipm.mukherjee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

i386 allmodconfig fails with:
ERROR: "__umoddi3" [drivers/mtd/devices/mtdram.ko] undefined!
ERROR: "__moddi3" [drivers/mtd/devices/mtdram.ko] undefined!

arm allmodconfig fails with:
ERROR: "__aeabi_uldivmod" [drivers/mtd/devices/mtdram.ko] undefined!
ERROR: "__aeabi_ldivmod" [drivers/mtd/devices/mtdram.ko] undefined!

The modulus operation is not being supported by these compilers. Use
do_div() instead which returns the remainder.

Fixes: 7827e3acad2d ("mtd: mtdram: check offs and len in mtdram->erase")
Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 drivers/mtd/devices/mtdram.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 73fa297..d085167 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -35,15 +35,21 @@ static struct mtd_info *mtd_info;
 static int check_offs_len(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	int ret = 0;
+	unsigned long temp_len, rem;
 
 	/* Start address must align on block boundary */
-	if (ofs % mtd->erasesize) {
+	temp_len = ofs;
+	rem = do_div(temp_len, mtd->erasesize);
+	if (rem) {
 		pr_debug("%s: unaligned address\n", __func__);
 		ret = -EINVAL;
 	}
 
 	/* Length must align on block boundary */
-	if (len % mtd->erasesize) {
+	temp_len = len;
+	rem = do_div(temp_len, mtd->erasesize);
+
+	if (rem) {
 		pr_debug("%s: length not block aligned\n", __func__);
 		ret = -EINVAL;
 	}
-- 
1.9.1
