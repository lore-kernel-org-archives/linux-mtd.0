Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGnYY-0003MV-Lc
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 09:05:23 +0000
Received: by bkwj4 with SMTP id j4so154603bkw.36
 for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2012 02:05:19 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd: sh_flctl: Probe SNAND_E flag from NAND chip
Date: Wed, 26 Sep 2012 11:05:04 +0200
Message-Id: <1348650306-15492-1-git-send-email-hechtb@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SNAND_E indicates whether we deal with 512kB or 2048kB page sizes. We
can probe this from the NAND chip itself and don't need to specify it in
the platform data anymore.

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
Based on l2-mtd with reverted commit e26c113b4130aefa1d8446602bb5b05cfd646bfe
and the 2 patches posted 3 days ago (09/23)
mtd: sh_flctl: Setup and release DMA channels
and
mtd: sh_flctl: Use DMA for data fifo FLTDFIFO when available

 drivers/mtd/nand/sh_flctl.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 0d90af8..8f0bed1 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -970,6 +970,7 @@ static int flctl_chip_init_tail(struct mtd_info *mtd)
 		}
 	} else {
 		flctl->page_size = 1;
+		flctl->flcmncr_base |= SNAND_E;
 		if (chip->chipsize > (128 << 20)) {
 			/* big than 128MB */
 			flctl->rw_ADRCNT = ADRCNT2_E;
-- 
1.7.5.4
