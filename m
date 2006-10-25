Received: from mo30.po.2iij.net ([210.128.50.53])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GcjlY-0001sl-M5
	for linux-mtd@lists.infradead.org; Wed, 25 Oct 2006 15:30:01 +0100
Date: Wed, 25 Oct 2006 23:29:17 +0900
From: Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>
To: dwmw2@infradead.org
Subject: [PATCH] fix map probe name for cstm_mips_ixx
Message-Id: <20061025232917.466b18ee.yoichi_yuasa@tripeaks.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, yoichi_yuasa@tripeaks.co.jp
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch has fixed name of map probe for cstm_mips_ixx.c .

Yoichi

Signed-off-by: Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>

diff -pruN -X mtd/Documentation/dontdiff mtd-orig/drivers/mtd/maps/cstm_mips_ixx.c mtd/drivers/mtd/maps/cstm_mips_ixx.c
--- mtd-orig/drivers/mtd/maps/cstm_mips_ixx.c	2006-10-25 10:35:03.616951250 +0900
+++ mtd/drivers/mtd/maps/cstm_mips_ixx.c	2006-10-25 10:37:19.973473000 +0900
@@ -115,7 +115,7 @@ int __init init_cstm_mips_ixx(void)
 		//printk(KERN_NOTICE "phymap %d cfi_probe: mymtd is %x\n",i,(unsigned int)mymtd);
 		if (!mymtd) {
 			jedec = 1;
-			mymtd = (struct mtd_info *)do_map_probe("jedec", &cstm_mips_ixx_map[i]);
+			mymtd = (struct mtd_info *)do_map_probe("jedec_probe", &cstm_mips_ixx_map[i]);
 		        printk(KERN_NOTICE "cstm_mips_ixx %d jedec: mymtd is %x\n",i,(unsigned int)mymtd);
 		}
 		if (mymtd) {
