Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36A360A2604
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zWI22/Dy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Eip8SmAy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VAauFhrmtPN5pxap/6YL6LFaXCNnMayUGDbl9UdpDlQ=; b=zWI22/DyWuMB6AbmIXSBIaHyMV
	ZQfGLow2vBf7EQ3aN7Liq7ohZVAvlGUreMz3URzXjIfd83pKpKZ+DpZ2yRB8k7EflNtyzAm/6/JLI
	yPsFn3HvAoeHw1TRD2hYo5EHxPP1o4Xw6jds3cKaNaVg3TllJlbKAIlbZmGtUijSayHxn1NtfIfVk
	OKI6GPvB3CW2ilqTCuAp7TMx8vyRoevwjcqjTeU3bjU5o2/IsP3WHOG/Aa2azPZ/I+9VlxiveBC+Z
	Bo0r5dX3x7nNR4fG8PY+7U0+0360/y7plzYJZdXYMXT99juCpUfUPNmFqH36MdehC+1PpboKZA5U9
	vw73aDvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR71R-00000006av1-2Y6S;
	Wed, 11 Nov 2026 12:01:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR71O-00000006atU-43y5
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 12:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794398507; x=1825934507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KTLjJ/O9RGML8gPs2j1q9JRI0snXsHLPfjX2nh5CoaE=;
  b=Eip8SmAyncWKNKaShlxZR9VOwg3S7ixYG7W7bH4h+aXb/kVCMTLMxt/j
   U6ee92zrVOtdauDSTt7QvEucwyKUpj3qS19eihxnXGHCyXU8e9UK5/6T0
   Mn242Aw7DjXQv6M63/sjleRc2WH+YMM+jJ4cuenPm5cIeIu0JUvjhcMAl
   n7mP2BDaOGk1g93P2+NMWZYiBDfSy76VhkXRAnIUxVJsPELPWBnnRjjfq
   XWM+JbZEZtLdGbt0T1DSAv4mM9UjaPDCF2cAVqwfiD/S/+Q2lJjwe+CqS
   LeREt38JIuQ4xrkFUP+aj30QjV1Tbdh0RIIvlA3FDYcB+WTiIa9IWlzH3
   A==;
X-CSE-ConnectionGUID: kEGzk551RXSGkOP0Z8YbkA==
X-CSE-MsgGUID: qmNVNd98THqoHMWeynT9Iw==
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="66350402"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Nov 2026 05:01:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 11 Nov 2026 05:01:45 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Nov 2026 05:01:42 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <srini@kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 1/2] mtd: spi-nor: drop fw_devlink suppliers below a flash that failed to probe
Date: Wed, 11 Nov 2026 17:31:31 +0530
Message-ID: <7917c70c24cf072bb5f3bd0b2ef2c72e41b7c6e1.1794391847.git.manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794391847.git.manikandan.m@microchip.com>
References: <cover.1794391847.git.manikandan.m@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_040147_021201_742A39D1 
X-CRM114-Status: GOOD (  19.38  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a SPI NOR flash is not populated or not reachable, spi_nor_scan()
fails and nothing described below the flash node (the SFDP NVMEM device,
its nvmem-layout, partitions) is ever registered. fw_devlink still holds
links from consumers of those nodes, so a consumer such as an Ethernet
MAC whose "nvmem-cells" points at the SFDP EUI-48 cell waits for its
supplier forever and is never probed:

  platform f8008000.ethernet: deferred probe pending: platform: wait for
  supplier /ahb/apb/spi@f0024000/flash@0/sfdp/nvmem-layout/mac-address

On a permanent spi_nor_scan() failure, call
fw_devlink_purge_absent_suppliers() on each child of the flash node. It
marks the nodes that never became devices with FWNODE_FLAG_NOT_DEVICE
and drops their consumer links, so the consumer is probed.

The consumer then probes, but of_nvmem_cell_get() still returns
-EPROBE_DEFER because nvmem_device_match() does not find a device for
the SFDP node. When fw_devlink has marked that node FWNODE_FLAG_NOT_DEVICE,
it will never become a device, so return -ENOENT instead. The consumer
can then fall back, e.g. macb uses a random MAC address.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 26 +++++++++++++++++++++++++-
 drivers/nvmem/core.c       | 13 ++++++++++++-
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a034dce7c839..57faab89f5af 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/fwnode.h>
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
@@ -3624,6 +3625,25 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 	return PTR_ERR_OR_ZERO(nor->dirmap.wdesc);
 }
 
+/**
+ * spi_nor_purge_absent_suppliers() - drop fw_devlink links below a missing
+ * flash
+ * @dev:	pointer to the flash 'struct device'
+ *
+ * When the flash cannot be probed (e.g. it is not populated or not
+ * reachable), nothing described below its node, such as the SFDP NVMEM
+ * device or the partitions, is ever registered. Mark those nodes as never
+ * becoming devices and drop their consumer links, so that consumers such as
+ * an Ethernet MAC using an NVMEM cell are not deferred forever.
+ */
+static void spi_nor_purge_absent_suppliers(struct device *dev)
+{
+	struct fwnode_handle *child;
+
+	device_for_each_child_node(dev, child)
+		fw_devlink_purge_absent_suppliers(child);
+}
+
 static int spi_nor_probe(struct spi_mem *spimem)
 {
 	struct spi_device *spi = spimem->spi;
@@ -3672,8 +3692,12 @@ static int spi_nor_probe(struct spi_mem *spimem)
 		flash_name = spi->modalias;
 
 	ret = spi_nor_scan(nor, flash_name, &hwcaps);
-	if (ret)
+	if (ret) {
+		/* A deferred probe (e.g. on the reset GPIO) may still succeed. */
+		if (ret != -EPROBE_DEFER)
+			spi_nor_purge_absent_suppliers(dev);
 		return ret;
+	}
 
 	spi_nor_debugfs_register(nor);
 
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 2e07f95de7ff..be3a05150085 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/export.h>
 #include <linux/fs.h>
+#include <linux/fwnode.h>
 #include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/kref.h>
@@ -1458,11 +1459,21 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
 	}
 
 	nvmem = nvmem_device_match(nvmem_np, device_match_of_node);
-	of_node_put(nvmem_np);
 	if (IS_ERR(nvmem)) {
+		/*
+		 * fw_devlink marks a node that will never become a device,
+		 * either because its parent failed to probe or because the
+		 * parent bound without registering it. Don't defer for it.
+		 */
+		if (PTR_ERR(nvmem) == -EPROBE_DEFER &&
+		    fwnode_test_flag(of_fwnode_handle(nvmem_np),
+				     FWNODE_FLAG_NOT_DEVICE))
+			nvmem = ERR_PTR(-ENOENT);
+		of_node_put(nvmem_np);
 		of_node_put(cell_np);
 		return ERR_CAST(nvmem);
 	}
+	of_node_put(nvmem_np);
 
 	ret = nvmem_layout_module_get_optional(nvmem);
 	if (ret) {
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
