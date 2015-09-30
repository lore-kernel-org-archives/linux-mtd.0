Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhHSG-0003Sp-VS
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 13:29:57 +0000
Received: by padhy16 with SMTP id hy16so41096029pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 06:29:36 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, lkp@intel.com,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH v2] mtd: mtdram: fix build error
Date: Wed, 30 Sep 2015 18:59:26 +0530
Message-Id: <1443619766-8134-1-git-send-email-sudipm.mukherjee@gmail.com>
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

mips allmodconfig fails with:
ERROR: "__umoddi3" [drivers/mtd/devices/mtdram.ko] undefined!
ERROR: "__moddi3" [drivers/mtd/devices/mtdram.ko] undefined!

The modulus operation is not being supported by these compilers. Use
do_div() instead which returns the remainder.

Fixes: 7827e3acad2d ("mtd: mtdram: check offs and len in mtdram->erase")
Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---

v1 showed build warning with cris and xtensa. I have checked v2 with
arm, cris and xtensa.

 drivers/mtd/devices/mtdram.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 73fa297..21b6a05 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -35,15 +35,21 @@ static struct mtd_info *mtd_info;
 static int check_offs_len(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	int ret = 0;
+	uint64_t temp_len, rem;
 
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
