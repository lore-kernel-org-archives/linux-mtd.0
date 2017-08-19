Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diz6P-00037Q-DN
 for linux-mtd@lists.infradead.org; Sat, 19 Aug 2017 08:28:05 +0000
Received: by mail-pg0-x243.google.com with SMTP id y129so17932873pgy.3
 for <linux-mtd@lists.infradead.org>; Sat, 19 Aug 2017 01:27:08 -0700 (PDT)
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
Subject: [PATCH 13/15] scsi: make device_type const
Date: Sat, 19 Aug 2017 13:52:24 +0530
Message-Id: <1503130946-2854-14-git-send-email-bhumirks@gmail.com>
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
 drivers/scsi/fcoe/fcoe_sysfs.c      | 4 ++--
 drivers/scsi/scsi_transport_iscsi.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/fcoe/fcoe_sysfs.c b/drivers/scsi/fcoe/fcoe_sysfs.c
index 9cf3d56..5c8310b 100644
--- a/drivers/scsi/fcoe/fcoe_sysfs.c
+++ b/drivers/scsi/fcoe/fcoe_sysfs.c
@@ -659,13 +659,13 @@ static void fcoe_fcf_device_release(struct device *dev)
 	kfree(fcf);
 }
 
-static struct device_type fcoe_ctlr_device_type = {
+static const struct device_type fcoe_ctlr_device_type = {
 	.name = "fcoe_ctlr",
 	.groups = fcoe_ctlr_attr_groups,
 	.release = fcoe_ctlr_device_release,
 };
 
-static struct device_type fcoe_fcf_device_type = {
+static const struct device_type fcoe_fcf_device_type = {
 	.name = "fcoe_fcf",
 	.groups = fcoe_fcf_attr_groups,
 	.release = fcoe_fcf_device_release,
diff --git a/drivers/scsi/scsi_transport_iscsi.c b/drivers/scsi/scsi_transport_iscsi.c
index a424eae..b9513f8 100644
--- a/drivers/scsi/scsi_transport_iscsi.c
+++ b/drivers/scsi/scsi_transport_iscsi.c
@@ -1009,7 +1009,7 @@ static void iscsi_flashnode_sess_release(struct device *dev)
 	kfree(fnode_sess);
 }
 
-static struct device_type iscsi_flashnode_sess_dev_type = {
+static const struct device_type iscsi_flashnode_sess_dev_type = {
 	.name = "iscsi_flashnode_sess_dev_type",
 	.groups = iscsi_flashnode_sess_attr_groups,
 	.release = iscsi_flashnode_sess_release,
@@ -1195,7 +1195,7 @@ static void iscsi_flashnode_conn_release(struct device *dev)
 	kfree(fnode_conn);
 }
 
-static struct device_type iscsi_flashnode_conn_dev_type = {
+static const struct device_type iscsi_flashnode_conn_dev_type = {
 	.name = "iscsi_flashnode_conn_dev_type",
 	.groups = iscsi_flashnode_conn_attr_groups,
 	.release = iscsi_flashnode_conn_release,
-- 
1.9.1
