Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3254BECAAA3
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 21:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GfwYeDxjfOMAE7muKkkE5i+olzZA6eirVtd480XcVI=; b=luDGZ1AoCHLW6n
	BRQgAMHjKGXbl43v1Rpldr0yhtmgvH52yOtSILyPy/ECmVtXOtQB8BstEO/PKPPRP0ZCsHXjydZtb
	+gRbKlMidvO0++nXqBLGBhh7pyokPotOTGJC3Sv0gKMEr94UR6s5sddVtkVGZzCm7w5c0LXwBjIYh
	py1fC/0in0Sad0ZsJlt6PPTGIaN+Kd+fPjitJ25kA4Yip7uRSdnhnKmcq3y4Yw0TDZ12p0kvUR5ea
	/K9awMYa+NDShURMnHq8tYGoRPtp4v3mCEM7UpMWusUULbGWzx16gXv2eblR3sOX7KyP+ECDfhsIy
	UoqjOTQGOsr/9FHqM21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKo2-003cqK-UR; Thu, 25 Aug 2022 21:54:31 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKeb-003XVy-BH; Thu, 25 Aug 2022 21:44:48 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 6FBB09A85;
	Thu, 25 Aug 2022 23:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661463882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nth7meiA2xr5pQl/XbPzao+ZyDgzCDmZKYRlc5VVO/s=;
	b=eytzSDjsqNF/AtrKIpLHPc64+/1RcJpJZsXUd6+UDVIwHUGDq0YKl1YkfEU1fmGSDAqc9Z
	xVgQaHH1VyWOgoDcKlox+a9zSJBOefmPk0Z9JhpXtXSD9BXZE2PO/hGOp5tPSTrtAPkrR8
	sdCgUYFwNlDA8QHHnUW5r6DQMpV8bXkvUP/DRN4RFsyyNHO8UFzcGe5tYiHriwWfO7ZP8P
	Chc+o3yWSo92MrlShk92VomI5fZ/UFVeSg/UA/Rsd7ALwFgeyZX5AZ6OAYrn9cJA4IQpZ7
	RUCHCvAIRZUPbEFRKej/yOogdyJDGXU07or0kO4ifAQLmwHFO44Uz5VyMJVrJQ==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Michael Walle <michael@walle.cc>
Subject: [RFC PATCH v1 13/14] nvmem: layouts: u-boot-env: add device node
Date: Thu, 25 Aug 2022 23:44:22 +0200
Message-Id: <20220825214423.903672-14-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825214423.903672-1-michael@walle.cc>
References: <20220825214423.903672-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_144445_630481_9BF18FAA 
X-CRM114-Status: GOOD (  12.23  )
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

Register the device node so we can actually make use of the cells from
within the device tree.

This obviously only works if the environment variable name can be mapped
to the device node, which isn't always the case. Think of "_" vs "-".
But for simple things like ethaddr, this will work.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/nvmem/layouts/u-boot-env.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
index 40b7e9a778c4..0901cc1f5acd 100644
--- a/drivers/nvmem/layouts/u-boot-env.c
+++ b/drivers/nvmem/layouts/u-boot-env.c
@@ -5,9 +5,11 @@
 
 #include <linux/crc32.h>
 #include <linux/dev_printk.h>
+#include <linux/device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 
 enum u_boot_env_format {
@@ -26,7 +28,8 @@ struct u_boot_env_image_redundant {
 	u8 data[];
 } __packed;
 
-static int u_boot_env_add_cells(struct nvmem_device *nvmem, uint8_t *buf,
+static int u_boot_env_add_cells(struct device *dev,
+				struct nvmem_device *nvmem, uint8_t *buf,
 				size_t data_offset, size_t data_len)
 {
 	struct nvmem_cell_info info = {0};
@@ -46,6 +49,7 @@ static int u_boot_env_add_cells(struct nvmem_device *nvmem, uint8_t *buf,
 		info.name = var;
 		info.offset = data_offset + value - data;
 		info.bytes = strlen(value);
+		info.np = of_get_child_by_name(dev->of_node, var);
 
 		err = nvmem_add_one_cell(nvmem, &info);
 		if (err)
@@ -113,7 +117,7 @@ static int u_boot_add_cells(struct device *dev, struct nvmem_device *nvmem,
 	}
 
 	buf[size - 1] = '\0';
-	err = u_boot_env_add_cells(nvmem, buf, data_offset, data_len);
+	err = u_boot_env_add_cells(dev, nvmem, buf, data_offset, data_len);
 	if (err)
 		dev_err(dev, "Failed to add cells: %d\n", err);
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
