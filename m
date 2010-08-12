Received: from mga03.intel.com ([143.182.124.21])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjNVM-00018J-Hw
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 02:26:53 +0000
Date: Thu, 12 Aug 2010 10:23:24 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v1 3/5]nand/denali: use cpu_relax() while waiting for
	hardware interrupt
Message-ID: <20100812022324.GC25657@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


=46rom 4c0c46694b0d69e840295524bc8261e217ea0bf1 Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Wed, 11 Aug 2010 17:53:29 +0800
Subject: [PATCH 3/5] nand/denali: use cpu_relax() while waiting for hardwar=
e interrupt

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 975a893..5f7c8c8 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -211,9 +211,9 @@ static uint16_t denali_nand_reset(struct denali_nand_in=
fo *denali)
 		iowrite32(device_reset_banks[i],
 				denali->flash_reg + DEVICE_RESET);
 		while (!(ioread32(denali->flash_reg +
-						intr_status_addresses[i]) &
+				intr_status_addresses[i]) &
 			(reset_complete[i] | operation_timeout[i])))
-			;
+			cpu_relax();
 		if (ioread32(denali->flash_reg + intr_status_addresses[i]) &
 			operation_timeout[i])
 			dev_dbg(&denali->dev->dev,
--=20
1.6.6.1
