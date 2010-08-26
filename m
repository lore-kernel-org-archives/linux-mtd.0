Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OoXbm-00057i-KJ
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2010 08:14:53 +0000
Date: Thu, 26 Aug 2010 16:12:01 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: dwmw2@infradead.org, arjan.van.de.ven@intel.com
Subject: [PATCH 1/1]nand/denali: Add runtime pm framework for MRST Denali
	NAND controller
Message-ID: <20100826081201.GA11565@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=46rom 5e28cd55f0e78d55e9fd1e707155ac2e16bb01ac Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Thu, 26 Aug 2010 15:56:41 +0800
Subject: [PATCH] nand/denali: Add runtime pm framework in denali.c

Denali NAND controller has no capability to shut power down
in MRST platform, so now driver do nothing in runtime_suspend/
runtime_resume routine. This patch add a framework to implement
runtime power management

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |  125 +++++++++++++++++++++++++++++++++++++++++=
++++
 drivers/mtd/nand/denali.h |    7 +++
 2 files changed, 132 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 532fe07..ab870a2 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -25,6 +25,10 @@
 #include <linux/pci.h>
 #include <linux/mtd/mtd.h>
 #include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/jiffies.h>
+#include <linux/param.h>
=20
 #include "denali.h"
=20
@@ -119,6 +123,9 @@ static const uint32_t reset_complete[4] =3D {INTR_STATU=
S0__RST_COMP,
 							INTR_STATUS2__RST_COMP,
 							INTR_STATUS3__RST_COMP};
=20
+/* record interrupt jiffies */
+static unsigned long last_intr;
+
 /* forward declarations */
 static void clear_interrupts(struct denali_nand_info *denali);
 static uint32_t wait_for_irq(struct denali_nand_info *denali,
@@ -856,6 +863,91 @@ static int read_data_from_flash_mem(struct denali_nand=
_info *denali,
 	return i*4; /* intent is to return the number of bytes read */
 }
=20
+/* NOW denali NAND controller in MRST has no way to cut power off
+ * once it is power on, so just let these functions be empty
+ * */
+#ifdef CONFIG_PM_RUNTIME
+static int denali_runtime_suspend(struct device *dev)
+{
+	dev_info(dev, "%s: disable_depth %d usage_count %d", __func__,
+			dev->power.disable_depth, dev->power.usage_count.counter);
+	dev_info(dev, "%s called", __func__);
+	/* Denali Controller in MRST doesn't have any capbility
+	 * to shut power down or resume back, no register or GPIO
+	 * can do this, so here do nothing
+	 * */
+	return 0;
+}
+
+static int denali_runtime_resume(struct device *dev)
+{
+	dev_info(dev, "%s: disable_depth %d usage_count %d", __func__,
+			dev->power.disable_depth, dev->power.usage_count.counter);
+	dev_info(dev, "%s called", __func__);
+	/* Denali Controller in MRST doesn't have any capbility
+	 * to shut power down or resume back, no register or GPIO
+	 * can do this, so here do nothing
+	 * */
+	return 0;
+}
+
+static int denali_runtime_idle(struct device *dev)
+{
+	dev_info(dev, "%s: disable_depth %d usage_count %d", __func__,
+			dev->power.disable_depth, dev->power.usage_count.counter);
+	dev_info(dev, "%s called", __func__);
+	/* denali controller will only be resume once during
+	 * read/write/erase operation, so if call runtime idle,
+	 * means device can be suspend
+	 * */
+	return 0;
+}
+
+static struct dev_pm_ops denali_pm =3D {
+	.runtime_suspend =3D denali_runtime_suspend,
+	.runtime_resume =3D denali_runtime_resume,
+	.runtime_idle =3D denali_runtime_idle,
+};
+#define DENALI_PM (&denali_pm)
+/* support denali runtime pm */
+static void denali_timer_add(struct denali_nand_info *denali)
+{
+	int ret;
+	struct device *dev =3D &denali->dev->dev;
+	if (denali->pm_status =3D=3D DENALI_OFF) {
+		ret =3D pm_runtime_get_sync(dev);
+		denali->pm_status =3D DENALI_ON;
+		denali->timer.expires =3D jiffies + 30 * HZ;
+		add_timer(&denali->timer);
+	}
+}
+
+static void denali_timer_func(unsigned long ptr)
+{
+	struct denali_nand_info *denali =3D
+		(struct denali_nand_info *)ptr;
+	struct device *dev =3D &denali->dev->dev;
+	struct nand_chip *chip =3D &denali->nand;
+	int ret;
+
+	if (denali->pm_status =3D=3D DENALI_OFF)
+		BUG();
+
+	if (chip->state !=3D FL_READY ||
+		jiffies - last_intr < 1000) {
+		denali->timer.expires =3D jiffies + 30 * HZ;
+		add_timer(&denali->timer);
+	} else {
+		ret =3D pm_runtime_put_sync(dev);
+		denali->pm_status =3D DENALI_OFF;
+	}
+}
+#else
+#define DENALI_PM NULL
+static inline void denali_timer_add(struct denali_nand_info *denali) {}
+static inline void denali_timer_func(unsigned long ptr) {}
+#endif
+
 /* writes OOB data to the device */
 static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 {
@@ -865,6 +957,8 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t=
 *buf, int page)
 						INTR_STATUS0__PROGRAM_FAIL;
 	int status =3D 0;
=20
+	denali_timer_add(denali);
+
 	denali->page =3D page;
=20
 	if (denali_send_pipeline_cmd(denali, false, false, SPARE_ACCESS,
@@ -892,6 +986,8 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t=
 *buf, int page)
 	uint32_t irq_mask =3D INTR_STATUS0__LOAD_COMP,
 			 irq_status =3D 0, addr =3D 0x0, cmd =3D 0x0;
=20
+	denali_timer_add(denali);
+
 	denali->page =3D page;
=20
 	if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS,
@@ -1054,6 +1150,8 @@ static void write_page(struct mtd_info *mtd, struct n=
and_chip *chip,
 	uint32_t irq_mask =3D INTR_STATUS0__DMA_CMD_COMP |
 						INTR_STATUS0__PROGRAM_FAIL;
=20
+	denali_timer_add(denali);
+
 	/* if it is a raw xfer, we want to disable ecc, and send
 	 * the spare area.
 	 * !raw_xfer - enable ecc
@@ -1149,6 +1247,8 @@ static int denali_read_page(struct mtd_info *mtd, str=
uct nand_chip *chip,
 			    INTR_STATUS0__ECC_ERR;
 	bool check_erased_page =3D false;
=20
+	denali_timer_add(denali);
+
 	if (page !=3D denali->page) {
 		dev_err(&denali->dev->dev, "IN %s: page %d is not"
 				" equal to denali->page %d, investigate!!",
@@ -1200,6 +1300,8 @@ static int denali_read_page_raw(struct mtd_info *mtd,=
 struct nand_chip *chip,
 	uint32_t irq_status =3D 0;
 	uint32_t irq_mask =3D INTR_STATUS0__DMA_CMD_COMP;
=20
+	denali_timer_add(denali);
+
 	if (page !=3D denali->page) {
 		dev_err(&denali->dev->dev, "IN %s: page %d is not"
 				" equal to denali->page %d, investigate!!",
@@ -1263,6 +1365,8 @@ static void denali_erase(struct mtd_info *mtd, int pa=
ge)
=20
 	uint32_t cmd =3D 0x0, irq_status =3D 0;
=20
+	denali_timer_add(denali);
+
 	/* clear interrupts */
 	clear_interrupts(denali);
=20
@@ -1312,6 +1416,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsi=
gned int cmd, int col,
 		denali->page =3D page;
 		break;
 	case NAND_CMD_RESET:
+		denali_timer_add(denali);
 		reset_bank(denali);
 		break;
 	case NAND_CMD_READOOB:
@@ -1435,6 +1540,12 @@ void denali_drv_init(struct denali_nand_info *denali)
=20
 	/* initialize our irq_status variable to indicate no interrupts */
 	denali->irq_status =3D 0;
+
+	/* Initilize denali timer */
+	init_timer(&denali->timer);
+	denali->timer.data =3D (unsigned long)denali;
+	denali->timer.function =3D &denali_timer_func;
+	denali->pm_status =3D DENALI_ON;
 }
=20
 /* driver entry point */
@@ -1669,6 +1780,12 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
 				ret);
 		goto failed_req_irq;
 	}
+
+	/* init pm runtime */
+	denali->pm_status =3D DENALI_OFF;
+	pm_runtime_allow(&dev->dev);
+	pm_runtime_put_noidle(&dev->dev);
+
 	return 0;
=20
 failed_req_irq:
@@ -1694,6 +1811,10 @@ static void denali_pci_remove(struct pci_dev *dev)
 {
 	struct denali_nand_info *denali =3D pci_get_drvdata(dev);
=20
+	del_timer(&denali->timer);
+	if (denali->pm_status =3D=3D DENALI_ON)
+		pm_runtime_put_sync(&dev->dev);
+
 	nand_release(&denali->mtd);
 	del_mtd_device(&denali->mtd);
=20
@@ -1707,11 +1828,15 @@ static void denali_pci_remove(struct pci_dev *dev)
 							PCI_DMA_BIDIRECTIONAL);
 	pci_set_drvdata(dev, NULL);
 	kfree(denali);
+	pm_runtime_get_noresume(&dev->dev);
 }
=20
 MODULE_DEVICE_TABLE(pci, denali_pci_ids);
=20
 static struct pci_driver denali_pci_driver =3D {
+	.driver =3D {
+		.pm =3D DENALI_PM,
+	},
 	.name =3D DENALI_NAND_NAME,
 	.id_table =3D denali_pci_ids,
 	.probe =3D denali_pci_probe,
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 3918bcb..4885944 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -725,6 +725,9 @@ struct nand_buf {
 #define INTEL_CE4100	1
 #define INTEL_MRST	2
=20
+#define DENALI_OFF 0
+#define DENALI_ON 1
+
 struct denali_nand_info {
 	struct mtd_info mtd;
 	struct nand_chip nand;
@@ -751,6 +754,10 @@ struct denali_nand_info {
 	uint32_t totalblks;
 	uint32_t blksperchip;
 	uint32_t bbtskipbytes;
+
+	/* used for runtime pm */
+	struct timer_list timer;
+	uint8_t pm_status;
 };
=20
 #endif /*_LLD_NAND_*/
--=20
1.6.6.1
