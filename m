Received: from mo-p05-ob6.rzone.de ([2a01:238:20a:202:53f5::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RoBow-0005cf-Mh
 for linux-mtd@lists.infradead.org; Fri, 20 Jan 2012 10:35:52 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org,
	spear--sw-devel@lists.codex.cro.st.com
Subject: [PATCH 1/1] mtd/spear_smi: release memory region during remove
Date: Fri, 20 Jan 2012 11:35:19 +0100
Message-Id: <1327055719-17644-1-git-send-email-sr@denx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Shiraz Hashim <shiraz.hashim@st.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shiraz Hashim <shiraz.hashim@st.com>

Driver must cleanup all held resources during remove. It wasn't
releasing requested memory region.

Signed-off-by: Shiraz Hashim <shiraz.hashim@st.com>
Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
---
Artem, this patch is a recent fixup to the new SMI driver,
thats now sitting in your l2-mtd and linux-next git repo.

Stefan

 drivers/mtd/devices/spear_smi.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index db4b741..fdc5f0b 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -1032,6 +1032,7 @@ static int __devexit spear_smi_remove(struct platform_device *pdev)
 {
 	struct spear_smi *dev;
 	struct spear_snor_flash *flash;
+	struct resource *smi_base;
 	int ret;
 	int i, irq;
 
@@ -1067,6 +1068,9 @@ static int __devexit spear_smi_remove(struct platform_device *pdev)
 	clk_put(dev->clk);
 	iounmap(dev->io_base);
 	kfree(dev);
+
+	smi_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	release_mem_region(smi_base->start, resource_size(smi_base));
 	platform_set_drvdata(pdev, NULL);
 
 	return 0;
-- 
1.7.9.rc0
