Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6491CCC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 06:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2LzdLHY+0gYgf+CI+IwUKhqhNFCukXKm0HAOhVByds=; b=UXsU5QQ4Hv+o+G
	YIFQ7SevwcBE0NoNEwjVRlFlJAScFJYtVLH9RTkvBLDCyrSEiqa9IYiYhhmobQ11mUPU5/M6QHO3S
	iDz1H1FRDhAzO7p2dvGI/xOMuH7SapHhRXEmq3Dfl/83aGA1ygiyaA9X4MjHuPNvMnaLfK4U4wgbS
	6yWM4SKTp2qSqeic8vOvYxyeahtKQWLrMZtiLMxoj6LmdqDhY+PxEOE+5xipphL9TVrQQtg8V5i6J
	Bc2SsWost40+CDQwHlbsdo2zAHi8HkcN64t8WVKhfu+MqlkpZGvC4Sn1ZWxJ9QFTrGYmnUHFG0gey
	unyOhrVIhP4FSENsFolw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsg2-0000000EcsO-2hbH;
	Wed, 14 Oct 2026 06:41:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsfx-0000000Ecnx-3MjI;
	Wed, 14 Oct 2026 06:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791960081; x=1823496081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7TZib+f/as+GdEvahZGxF0OZFyn7Mkkh4KJyPfJCo2U=;
  b=iAwyZknhVNAho0BtDKO5hJPth4vfn0eNBEcpBtcd04JIABCAiOdNxwgq
   brk5kGpqFRM1EC270jbtPnzknkMWW5NLyZeDwx3KYvEwcrUxSzR76CBgT
   X8INg/bhZXzrIaaIWjvOR2kvZca6mvJ/t8TNh4C8uykwxZsFxImXhRkTp
   PO/8g4h2vcS7ErJPvquxDxrdfXv76Rs6FABctEcBK5mUa8jGNNycUQBig
   6sWZhcsNwFxjAXtjFlG95ZOcXpOEAcKQS0n5GHmUyBYvY882tboa7M/13
   hB5o90qckj5ubPs5c7Q9TmBwGNcb96FsWFQR02oMhTftorjnm9Qy0b/Jq
   Q==;
X-CSE-ConnectionGUID: fElzlNT3SvWZ+sjmV6A6zw==
X-CSE-MsgGUID: 0KPszsrXR4WyufAHBKQc4Q==
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="65288678"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 23:41:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Tue, 13 Oct 2026 23:41:20 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Oct 2026 23:41:12 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <aaro.koskinen@iki.fi>, <gregkh@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v8 4/8] mtd: spi-nor: sfdp: expose the SFDP as a read-only NVMEM device
Date: Wed, 14 Oct 2026 12:10:08 +0530
Message-ID: <093672d183a06dc2f37366b2f9ff144316850863.1790847519.git.manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790847519.git.manikandan.m@microchip.com>
References: <cover.1790847519.git.manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_234121_978424_B11E40EB 
X-CRM114-Status: GOOD (  17.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The SPI NOR core already reads the SFDP tables during enumeration and
caches them in nor->sfdp->dwords (see spi_nor_parse_sfdp()). Re-expose
that cached data as a read-only NVMEM device, in on-flash byte order,
rooted at the flash's SFDP child node (compatible "jedec,sfdp").

This lets NVMEM cells reference any SFDP data: a fixed-layout for
parameters at a known offset, or an nvmem-layout parser for vendor data
whose location must be discovered at runtime. The device is only registered
when an "sfdp" node is present in the device tree.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 78 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8bc117b46e02..4e47459b1679 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -17,6 +17,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched/task_stack.h>
@@ -3001,6 +3002,75 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
 }
 
+static int spi_nor_sfdp_reg_read(void *priv, unsigned int offset,
+				 void *val, size_t bytes)
+{
+	struct spi_nor *nor = priv;
+	struct sfdp *sfdp = nor->sfdp;
+	size_t sfdp_size = sfdp->num_dwords * sizeof(*sfdp->dwords);
+
+	if (offset >= sfdp_size || bytes > sfdp_size - offset)
+		return -EINVAL;
+
+	/* The cached SFDP is kept in on-flash (little-endian) byte order. */
+	memcpy(val, (u8 *)sfdp->dwords + offset, bytes);
+
+	return 0;
+}
+
+/**
+ * spi_nor_register_sfdp_nvmem() - expose the SFDP as a read-only NVMEM device
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Expose the whole SFDP, in on-flash byte order, as a read-only NVMEM device
+ * rooted at the flash's SFDP child node (compatible "jedec,sfdp"). This lets
+ * generic (fixed-layout) or vendor (nvmem-layout) cells reference any SFDP
+ * data. The device is only registered when a child node with the "jedec,sfdp"
+ * compatible is described in the device tree.
+ *
+ * Return: 0 on success or if there is nothing to do, -errno otherwise.
+ */
+static int spi_nor_register_sfdp_nvmem(struct spi_nor *nor)
+{
+	struct device *dev = nor->dev;
+	struct nvmem_config config = { };
+	struct nvmem_device *nvmem;
+	struct device_node *np;
+
+	if (!nor->sfdp)
+		return 0;
+
+	np = of_get_compatible_child(dev_of_node(dev), "jedec,sfdp");
+	if (!np)
+		return 0;
+
+	config.dev = dev;
+	config.of_node = np;
+	config.name = "sfdp";
+	config.id = NVMEM_DEVID_AUTO;
+	config.owner = THIS_MODULE;
+	config.read_only = true;
+	config.word_size = 1;
+	config.stride = 1;
+	config.size = (int)(nor->sfdp->num_dwords * sizeof(*nor->sfdp->dwords));
+	config.reg_read = spi_nor_sfdp_reg_read;
+	config.priv = nor;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	of_node_put(np);
+	if (IS_ERR(nvmem)) {
+		/* NVMEM support is optional. */
+		if (PTR_ERR(nvmem) == -EOPNOTSUPP)
+			return 0;
+		return dev_err_probe(dev, PTR_ERR(nvmem),
+				     "failed to register SFDP NVMEM device\n");
+	}
+
+	dev_dbg(dev, "exposed %d-byte SFDP as an NVMEM device\n", config.size);
+
+	return 0;
+}
+
 /**
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
@@ -3204,6 +3274,14 @@ static int spi_nor_init_params(struct spi_nor *nor)
 		spi_nor_init_params_deprecated(nor);
 	}
 
+	/*
+	 * Expose the SFDP table as an NVMEM device only when
+	 * the flash actually provides one
+	 */
+	ret = spi_nor_register_sfdp_nvmem(nor);
+	if (ret)
+		return ret;
+
 	ret = spi_nor_late_init_params(nor);
 	if (ret)
 		return ret;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
