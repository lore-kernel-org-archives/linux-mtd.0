Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diz59-0001uA-Sk
 for linux-mtd@lists.infradead.org; Sat, 19 Aug 2017 08:26:13 +0000
Received: by mail-pf0-x242.google.com with SMTP id z3so630917pfk.0
 for <linux-mtd@lists.infradead.org>; Sat, 19 Aug 2017 01:25:51 -0700 (PDT)
From: Bhumika Goyal <bhumirks@gmail.com>
To: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org,
 daniel.vetter@intel.com, jani.nikula@linux.intel.com,
 seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de,
 tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com,
 bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 dvhart@infradead.org, andy@infradead.org, ohad@wizery.com,
 bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com,
 heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com,
 martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org,
 linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-usb@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH 09/15] phy: tegra: make device_type const
Date: Sat, 19 Aug 2017 13:52:20 +0530
Message-Id: <1503130946-2854-10-git-send-email-bhumirks@gmail.com>
In-Reply-To: <1503130946-2854-1-git-send-email-bhumirks@gmail.com>
References: <1503130946-2854-1-git-send-email-bhumirks@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make these const as they are only stored in the type field of a device
structure, which is const.
Done using Coccinelle.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/phy/tegra/xusb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 3cbcb25..bd3f1b6 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -155,7 +155,7 @@ static void tegra_xusb_pad_release(struct device *dev)
 	pad->soc->ops->remove(pad);
 }
 
-static struct device_type tegra_xusb_pad_type = {
+static const struct device_type tegra_xusb_pad_type = {
 	.release = tegra_xusb_pad_release,
 };
 
@@ -512,7 +512,7 @@ static void tegra_xusb_port_release(struct device *dev)
 {
 }
 
-static struct device_type tegra_xusb_port_type = {
+static const struct device_type tegra_xusb_port_type = {
 	.release = tegra_xusb_port_release,
 };
 
-- 
1.9.1
