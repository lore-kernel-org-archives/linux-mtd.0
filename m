Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjVPn-0003wV-KO
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 10:53:40 +0000
Date: Thu, 12 Aug 2010 18:51:08 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v2 1/6]nand/denali: optimize denali irq wait and irq
	handler functions
Message-ID: <20100812105108.GA11634@intel.com>
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

=46rom f2e9d56b9d605dfbca3c703d9252d2b663e296e9 Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Thu, 12 Aug 2010 13:31:20 +0800
Subject: [PATCH 1/6] nand/denali: optimize denali irq wait and irq handler =
functions

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 532fe07..dd32d04 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -660,6 +660,7 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 	uint32_t irq_status =3D 0x0;
 	irqreturn_t result =3D IRQ_NONE;
=20
+	denali_set_intr_modes(denali, false);
 	spin_lock(&denali->irq_lock);
=20
 	/* check to see if a valid NAND chip has
@@ -682,16 +683,16 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 			result =3D IRQ_HANDLED;
 		}
 	}
+
 	spin_unlock(&denali->irq_lock);
+	denali_set_intr_modes(denali, true);
 	return result;
 }
-#define BANK(x) ((x) << 24)
=20
 static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq=
_mask)
 {
 	unsigned long comp_res =3D 0;
 	uint32_t intr_status =3D 0;
-	bool retry =3D false;
 	unsigned long timeout =3D msecs_to_jiffies(1000);
=20
 	do {
@@ -709,7 +710,6 @@ static uint32_t wait_for_irq(struct denali_nand_info *d=
enali, uint32_t irq_mask)
 			/* these are not the interrupts you are looking for -
 			 * need to wait again */
 			spin_unlock_irq(&denali->irq_lock);
-			retry =3D true;
 		}
 	} while (comp_res !=3D 0);
=20
--=20
1.6.6.1
