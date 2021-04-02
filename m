Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59CEC433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 06:50:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 787646108F
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 06:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 787646108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bG8WBthsLX6e3OXr0Y5V7cBcWEljQUVGBB8uqKArHVg=; b=nz3IOvJUp6yPycntB6kF2w5GR
	Vke0SdasO51uvvpUFcozqWpawz6HHVFYAerypVMciPLQ0PxyX0Ou1kVrorEIwXHJJIED3LoQNEVkE
	uwDcNJVXIkB/MRtVhJ8g6reXa/DQieF0ow6cReYbiBP2jg2nkvt9uB9s34Q+od87uWBSwpncTr+Ti
	WSUNEnQU3q1OZQaRd5bwKluZkpGIgqleTb0jcamGl4DJGKsOr+tbZsrfQ+u94ttiOzkCM+QbUKPWm
	1aNa+f9fdCJgGbbXuXPZAXGM4DbQuPjVc6+kuNJ/0Wpp0DpYUnmG6Spw+ags6vu7DW/Qw6yjZXELc
	JQUeLVgzw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSDd5-00C9B5-Tl; Fri, 02 Apr 2021 06:50:04 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSDcR-00C93i-AG
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 06:49:25 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id F036DC000A;
 Fri,  2 Apr 2021 06:49:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/5] mtd: rawnand: Add a helper to parse the gpio-cs DT
 property
Date: Fri,  2 Apr 2021 08:49:13 +0200
Message-Id: <20210402064915.220781-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402064915.220781-1-miquel.raynal@bootlin.com>
References: <20210402064915.220781-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_074923_802069_860743E8 
X-CRM114-Status: GOOD (  17.78  )
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

New chips may feature a lot of CS because of their extended length. As
many controllers have been designed a decade ago, they usually only
feature just a couple. This does not mean that the entire range of
these chips cannot be accessed: it is just a matter of adding more
GPIO CS in the hardware design. A DT property has been added to
describe the CS array: cs-gpios.

Here is the code parsing it this new property, allocating what needs to
be, requesting the GPIOs and returning an array with the additional
available CS. The first entries of this array are left empty and are
reserved for native CS.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 38 ++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |  4 ++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a984cda86e2d..7e6c7e4fafc8 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -42,6 +42,7 @@
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
+#include <linux/of_gpio.h>
 #include <linux/gpio/consumer.h>
 
 #include "internals.h"
@@ -4996,6 +4997,43 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
 	return of_property_read_bool(np, "nand-on-flash-bbt");
 }
 
+/**
+ * rawnand_dt_parse_gpio_cs - Parse the gpio-cs property of a controller
+ * @dev: Device that will be parsed. Also used for managed allocations.
+ * @cs_array: Array of GPIO desc pointers allocated on success
+ * @ncs_array: Number of entries in @cs_array updated on success.
+ * @return 0 on success, an error otherwise.
+ */
+int rawnand_dt_parse_gpio_cs(struct device *dev, struct gpio_desc ***cs_array,
+			     unsigned int *ncs_array)
+{
+	struct device_node *np = dev->of_node;
+	struct gpio_desc **descs;
+	int ndescs, i;
+
+	ndescs = of_gpio_named_count(np, "cs-gpios");
+	if (ndescs < 0) {
+		dev_dbg(dev, "No valid cs-gpios property\n");
+		return 0;
+	}
+
+	descs = devm_kcalloc(dev, ndescs, sizeof(*descs), GFP_KERNEL);
+	if (!descs)
+		return -ENOMEM;
+
+	for (i = 0; i < ndescs; i++) {
+		descs[i] = gpiod_get_index_optional(dev, "cs", i,
+						    GPIOD_OUT_HIGH);
+		if (IS_ERR(descs[i]))
+			return PTR_ERR(descs[i]);
+	}
+
+	*ncs_array = ndescs;
+	*cs_array = descs;
+
+	return 0;
+}
+
 static int rawnand_dt_init(struct nand_chip *chip)
 {
 	struct nand_device *nand = mtd_to_nanddev(nand_to_mtd(chip));
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 09473d065c94..d9408e066d09 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1432,4 +1432,8 @@ static inline void *nand_get_data_buf(struct nand_chip *chip)
 	return chip->data_buf;
 }
 
+/* Parse the gpio-cs property */
+int rawnand_dt_parse_gpio_cs(struct device *dev, struct gpio_desc ***cs_array,
+			     unsigned int *ncs_array);
+
 #endif /* __LINUX_MTD_RAWNAND_H */
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
