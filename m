Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FBAC44529
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2026 05:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZgUa1yh7iCDCksIzthcFHx+hAIHDIvnlq4cmaywpeA=; b=aveWk+jEbPcYMy
	7YKVuvVPJaaSjti9iJw9yi+KstpO0qvba4y+sDFDhisxrTMmNYXyeRfndP3Aa/fwoV+7/LuVRl9/K
	Uga1o0zht/GVhECMzZQSTe31MaJh7+pIFkCFePSN42THSRwskJofgfBg97Fcp2b7Ales7tTV35/BC
	DOSsJyw2n2oIbUcJJJdbGZ1Bz1LvQcW2kCbA38OnS+3VDsioHxw14JcWcasTdUOf6PlqlddQ4Vldi
	WZHsOjPQ1whnQd3hm02PdNK0FCUOUl/+Urf+EL+OeyvffAAKaIwL4/PLXm7Bbo5cIxHkCo37ooT8l
	i9/b2Qe7z4OEiwUpTkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm33J-00000008RJM-2cgZ;
	Tue, 21 Jul 2026 05:30:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm33H-00000008RHi-0XNp;
	Tue, 21 Jul 2026 05:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1784611799; x=1816147799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U6+vQcPNtOv7hr1iaRTwprg4+yDTG6L5wbZnlafW3Vw=;
  b=dLNpQWk2A73f/GdlzVHDHXdN39oW3SZekjDlR13Uc/N2OhhDYJpF05bC
   GALEmZMkwaJTL15g03hub674fqLZ+N/PADcZn8zBvtCFLGKFWbt72S4qh
   wH6NHWNoaUFhVedT75LjVG/8Vwq1vM2zMttgQiJ6E8LbmhoNzqBAHD7ci
   UuXpDdDvgicFO0Ip8g1QTbZVKTpNFYamRUpJXTS9WQFXc+QX01UrJpieD
   +SndzzQ6wJAxrGtgLbm3uFu/GJvI1FLU6fxMGvXJh4BwdqsVdoPvI7if1
   gXwpJ7tYSolSX401+3zukwh/4F/bv8VlwJIk6PB1vm0hmd62pHm5Ig0zs
   g==;
X-CSE-ConnectionGUID: dCQ5BIDbQQee5nQAsAC7Hg==
X-CSE-MsgGUID: LfxyubazSkuxGoCBj2b4cQ==
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="228074678"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 22:29:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Mon, 20 Jul 2026 22:29:57 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 20 Jul 2026 22:29:48 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v5 3/7] mtd: spi-nor: sfdp: expose the SFDP as a read-only NVMEM device
Date: Tue, 21 Jul 2026 10:58:55 +0530
Message-ID: <20260721052859.171341-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721052859.171341-1-manikandan.m@microchip.com>
References: <20260721052859.171341-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_222959_226919_8EE4C2B5 
X-CRM114-Status: GOOD (  19.09  )
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
whose location must be discovered at runtime.The device is only registered
when an "sfdp" node is present in the device tree.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/mtd/spi-nor/core.c |  8 ++++
 drivers/mtd/spi-nor/core.h |  1 +
 drivers/mtd/spi-nor/sfdp.c | 86 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..b833d8ec2d65 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3204,6 +3204,14 @@ static int spi_nor_init_params(struct spi_nor *nor)
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
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index ba2d1a862c9d..0a6484298c5c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -698,6 +698,7 @@ int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
 
 int spi_nor_check_sfdp_signature(struct spi_nor *nor);
 int spi_nor_parse_sfdp(struct spi_nor *nor);
+int spi_nor_register_sfdp_nvmem(struct spi_nor *nor);
 
 static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 {
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 4600983cb579..704799fe92ae 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -6,6 +6,8 @@
 
 #include <linux/bitfield.h>
 #include <linux/mtd/spi-nor.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
 
@@ -1612,3 +1614,87 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	kfree(param_headers);
 	return err;
 }
+
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
+static void spi_nor_sfdp_nvmem_put_np(void *data)
+{
+	of_node_put(data);
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
+int spi_nor_register_sfdp_nvmem(struct spi_nor *nor)
+{
+	struct device *dev = nor->dev;
+	struct nvmem_config config = { };
+	struct nvmem_device *nvmem;
+	struct device_node *np;
+	int ret;
+
+	if (!nor->sfdp)
+		return 0;
+
+	for_each_available_child_of_node(dev_of_node(dev), np)
+		if (of_device_is_compatible(np, "jedec,sfdp"))
+			break;
+	if (!np)
+		return 0;
+
+	/*
+	 * Register the put before devm_nvmem_register() so it runs last on
+	 * detach, after the NVMEM device that uses the node is gone.
+	 */
+	ret = devm_add_action_or_reset(dev, spi_nor_sfdp_nvmem_put_np, np);
+	if (ret)
+		return ret;
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
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
