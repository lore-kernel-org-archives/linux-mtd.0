Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D814C43458
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2026 09:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atv2P0lSjTtKPDkV5Pc/aybVd8jfWrcwpqjNgLrU2rU=; b=YRsO08k7H1syFy
	Ki4oOT2Fs7T5M7JakNavgF12CPjPzrkcRxnzoHH8rIeh80Z8IAkG3/XDQ37xMN2Uve5lAXcWkeiBx
	/84/ObCSkkvFHheWv5tsCwUyvPAN/2KlYKGIeEVKeNnzJ1Bl7mghf/KEpGbBVFf5zzYp8QIRoYcmH
	da52xpPiUgUL/U34oF6jN8YlqH6oj+0WlQ4LHQPbxodMjtve2tDVlUalPvgpFRpkB+8OEd/hLp+8M
	2pGqDWMVdlpDaSRb/v7PLcAFYfWMbL3YYEWjo0qZuT5P5CfJNrOxLLzf0O5lATiq9eF9p6IAirmAF
	dNJQOf6wAKOIxoxU6qjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUim-0000000GOuJ-1Uwo;
	Tue, 30 Jun 2026 09:25:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUik-0000000GOsL-2WH1;
	Tue, 30 Jun 2026 09:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=3Ahf9UC8zaPzlJNEc/mloAbSeEH+Y1Uh9JkuCIegt10=; b=meJaRBgLQGuW0S1365pR8/KjJY
	eTkheTUuB2XHSBhjG9KifSXhkCXsUSdtwxvhQ6ibVKCKXdBmKgcsL4xb186Gx6DO+zGUrcexjsvGg
	A8C4kFL6MM+FKCN4evoBid/IgNqLi+ZKNr02eSPFb1Mw6qZ5fjZZbki/LccQndMvO7YkqZFpfTYGj
	r3Vhid6/pdyy3M5Izm6PoOnAkVdVT44IPEuKEpUfQKNkTRASx6reomBpIwZpMV6mPmna3pLfnZYX6
	9znTFA+Frk4Mrrk3TJzW9x8BcjlausBcL4M28OTdQbUe7tjFDSU54jY1pNevhu7+pf7dXC3AezT/p
	7zyT6pGQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUig-00000004hyA-3Xww;
	Tue, 30 Jun 2026 09:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782811530; x=1814347530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CATfLh2qcwvtEt0xhGS/F+244C0U3vHC+rHChgYecfU=;
  b=e9V/3p8uipEAZ+7oDXfSmboN0z0ZPhjJxd5leQ8MG4eSBqd5jDD/dn++
   CpZ6uTItEhZvb/lDyY0jW8upSfkxoGz/S2Nu3quaV5gfi3kG5SHIOzo8O
   LUIlO7fHNyUdlL1MbdRyuRHIN9KiEDKrLB8U1iG7gKCWFgVBIGlaGAwFv
   +BjpjXzG2P8E5ZxCfevj2dhjlvOWfpzrXV2iWynFtAEXQMEfOLQQfq/T8
   Q/++F7ZDv26jO6oWpm4zA9fO0zJF4wzBfCocGisHhOLZOWygX86F6sk0f
   3UuSnPs7GwEBeVvTCnsV2Kb4XZqaPnxDxTIaulpi/BTaMbdGyb5W+j2NV
   g==;
X-CSE-ConnectionGUID: fhnAmLc5T9+l/mBXxyHOag==
X-CSE-MsgGUID: o1CCMN6FQwSFWfK3NS64nw==
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="69114548"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 02:25:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Tue, 30 Jun 2026 02:25:23 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 30 Jun 2026 02:25:14 -0700
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
Subject: [PATCH v4 3/7] mtd: spi-nor: sfdp: expose the SFDP as a read-only NVMEM device
Date: Tue, 30 Jun 2026 14:54:02 +0530
Message-ID: <20260630092406.150587-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092406.150587-1-manikandan.m@microchip.com>
References: <20260630092406.150587-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_102531_382946_C3362701 
X-CRM114-Status: GOOD (  18.61  )
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

Register the cached SFDP as a read-only NVMEM device rooted at the
flash's "sfdp" child node, exposing it in on-flash byte order. This lets
NVMEM cells reference any SFDP data: a fixed-layout for parameters at a
known offset, or an nvmem-layout parser for vendor data whose location
must be discovered at runtime. The device is only registered when an
"sfdp" node is present in the device tree.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/mtd/spi-nor/core.c |  5 +++
 drivers/mtd/spi-nor/core.h |  1 +
 drivers/mtd/spi-nor/sfdp.c | 83 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..e04ba3e3dee9 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3204,6 +3204,11 @@ static int spi_nor_init_params(struct spi_nor *nor)
 		spi_nor_init_params_deprecated(nor);
 	}
 
+	/* Expose the SFDP as an NVMEM device. */
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
index 4600983cb579..2df818bca6b5 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -6,6 +6,8 @@
 
 #include <linux/bitfield.h>
 #include <linux/mtd/spi-nor.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
 
@@ -1612,3 +1614,84 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	kfree(param_headers);
 	return err;
 }
+
+static int spi_nor_sfdp_nvmem_read(void *priv, unsigned int offset,
+				   void *val, size_t bytes)
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
+ * rooted at the flash's "sfdp" child node. This lets generic (fixed-layout) or
+ * vendor (nvmem-layout) cells reference any SFDP data. The device is only
+ * registered when an "sfdp" node is described in the device tree.
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
+	np = of_get_child_by_name(dev_of_node(dev), "sfdp");
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
+	config.reg_read = spi_nor_sfdp_nvmem_read;
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
