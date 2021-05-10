Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54072C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:48:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A252861941
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A252861941
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4f0x5JLT9NZGwBxI3VmF18GQVS8Dk1k4bijt5FzOhIU=; b=qOWxu1rA3t8pZoKREbdSykiWU
	M/Wf3Hz910HN7vex1YUZQZFRelf0rCLsgWaJWQOvgErp2uWom4obdJPsbbhKRKf0lyLDTok2bgiLB
	0zsQ7GYXT72YO7ZDMtcWBAbMKyu0G2RZeJq78nMBGiqqe5n1bU4D0BjktqgGtq/QmbDMTOqtjDPan
	ejVvu+RmMKaPmxmB0o0uUoyDjL+7OxuR+S/2+D+0dAeadgDtPYaa/gdiZaVhvDJnOngna2tUox5OT
	rCrquRzob+dkPApmDnh7BOcMU4j3khfwvCqTBWktaeSxrPWnZ2UxCn7hyjJVXZQKjpunJ/xQnd+p0
	4jQi2JiNQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3Rd-00DzcD-IB; Mon, 10 May 2021 10:47:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3LR-00DyUl-IG
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=TdUZ//OgHmn1t2zM0BoDSEJMm2Az5jlqw6kgYaILhmE=; b=4Pcv0wuGudyHSXDkFyGq+ojZri
 tBXQ3xWoQ+yavM/xh+M5Wt+e+6wOGWs1TKVaLrQB3ISWqVT6d9KqWarsEQC7hLJd9SrF0yyWIuVr2
 Lm+pyfkd5WWfCA9qc4mZ0wtC7PRakSiy4qZLAjmSurRrCKc7gogEW/HXuqGrF1pS7aGs9vqiLBaSS
 bcGM+1jIwgQ+DK6n+IxaLgMLLP/VOdGnkmyJffcXt+pHixiE7LCDLwo01W1zrzrwD73ZJjFiYfBGn
 wLGSNSa965G8zfQZEBJzVcRgyJ8zywfonOcJrfdoJ2yhm+UvfkNcBfnR9yooW29Io2pV4Vysy7Tsg
 c5hfJXpw==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3LO-008YZi-LR
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:41:00 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5259F1C0005;
 Mon, 10 May 2021 10:40:56 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 3/5] mtd: rawnand: Add a helper to parse the gpio-cs DT
 property
Date: Mon, 10 May 2021 12:40:49 +0200
Message-Id: <20210510104051.9701-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510104051.9701-1-miquel.raynal@bootlin.com>
References: <20210510104051.9701-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034058_997834_CDD85DA7 
X-CRM114-Status: GOOD (  18.35  )
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
index fb072c444495..ba09d6b6e1ce 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -42,6 +42,7 @@
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
+#include <linux/of_gpio.h>
 #include <linux/gpio/consumer.h>
 
 #include "internals.h"
@@ -5078,6 +5079,43 @@ static int of_get_nand_secure_regions(struct nand_chip *chip)
 	return 0;
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
index 93f5c0196a09..e01255a9e591 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1446,4 +1446,8 @@ static inline void *nand_get_data_buf(struct nand_chip *chip)
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
