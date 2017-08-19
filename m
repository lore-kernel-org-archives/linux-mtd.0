Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diz5m-0001yW-Te
 for linux-mtd@lists.infradead.org; Sat, 19 Aug 2017 08:26:53 +0000
Received: by mail-pg0-x244.google.com with SMTP id i12so2625637pgr.1
 for <linux-mtd@lists.infradead.org>; Sat, 19 Aug 2017 01:26:31 -0700 (PDT)
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
Subject: [PATCH 11/15] remoteproc: make device_type const
Date: Sat, 19 Aug 2017 13:52:22 +0530
Message-Id: <1503130946-2854-12-git-send-email-bhumirks@gmail.com>
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

Make this const as it is only stored in the type field of a device
structure, which is const.
Done using Coccinelle.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 364ef28..48b2c5d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1360,7 +1360,7 @@ static void rproc_type_release(struct device *dev)
 	kfree(rproc);
 }
 
-static struct device_type rproc_type = {
+static const struct device_type rproc_type = {
 	.name		= "remoteproc",
 	.release	= rproc_type_release,
 };
-- 
1.9.1
