Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ObsB2-000344-7i
	for linux-mtd@lists.infradead.org; Thu, 22 Jul 2010 09:34:53 +0000
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Woodhouse, David" <david.woodhouse@intel.com>
Date: Thu, 22 Jul 2010 17:34:47 +0800
Subject: [PATCH] [MTD] include/linux/mtd/blktrans.h: fix wrong #blocks value
	reported by /proc/partitions
Message-ID: <5D8008F58939784290FAB48F549751981D10D58969@shsmsx502.ccr.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Gao, Yunpeng" <yunpeng.gao@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
I found /proc/partitions file will report a wrong block numbers when I use =
a 8G
NAND which has a larger than 4G partition. So here is a patch to fix this p=
roblem.
Details are in below comments.
Please review it.
Thanks all.

>From 270149e67728f26553a22b0381963bc43147b468 Mon Sep 17 00:00:00 2001
From: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Thu, 22 Jul 2010 17:24:41 +0800
Subject: [PATCH] include/linux/mtd/blktrans.h fix wrong #blocks value repor=
ted by /proc/partitions

type of "size" in mtd_blktrans_dev structure is changed
from unsigned long to uint64_t

When nand has a partition whose size is larger than 0x100000000,
mtd_blkdev will lose the capcity when calling

	"348    set_capcity(gd, (new->size * tr->blksize) >> 9)"

in "add_mtd_blktrans_dev" function.

The result of "(new->size * tr->blksize)" will be limited to be a 32bits va=
lue
if the nand partition size is larger than 0x100000000.
So change the type of "size" to be uint64_t to support large nand.

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 include/linux/mtd/blktrans.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index b481ccd..bdae196 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -24,7 +24,7 @@ struct mtd_blktrans_dev {
 	struct mtd_info *mtd;
 	struct mutex lock;
 	int devnum;
-	unsigned long size;
+	uint64_t size;
 	int readonly;
 	int open;
 	struct kref ref;
--=20
1.6.6.1
