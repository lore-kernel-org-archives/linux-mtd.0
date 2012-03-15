Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S87lx-0007aR-25
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2012 10:19:05 +0000
Received: by yhjj52 with SMTP id j52so3217821yhj.36
 for <linux-mtd@lists.infradead.org>; Thu, 15 Mar 2012 03:19:04 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 15 Mar 2012 19:19:03 +0900
Message-ID: <CADTWAOL7aBi64yimwPubAJ22=4AQ1BRjzQCahUXUsbSa1oJ59A@mail.gmail.com>
Subject: [RESEND PATCH] mtd: fix section mismatch for doc_probe_device
From: Ryosuke Saito <raitosyo@gmail.com>
To: dwmw2@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: mikedunn@newsguy.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ivan.djelic@parrot.com, robert.jarzmik@free.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

doc_probe_device() is only called from docg3_probe() which is in .init.text,
so it must be in the same section to avoid a section mismatch warning.

Signed-off-by: Ryosuke Saito <raitosyo@gmail.com>
---
 drivers/mtd/devices/docg3.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 25f688c..db9a4b7 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1846,8 +1846,8 @@ static void __init doc_set_driver_info(int
chip_id, struct mtd_info *mtd)
  * if a memory allocation failed. If floor 0 is checked, a reset of the ASIC is
  * launched.
  */
-static struct mtd_info *doc_probe_device(void __iomem *base, int floor,
-					 struct device *dev)
+static struct mtd_info * __init
+doc_probe_device(void __iomem *base, int floor, struct device *dev)
 {
 	int ret, bbt_nbpages;
 	u16 chip_id, chip_id_inv;
