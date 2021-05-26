Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA609C47082
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 11:28:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B60E6113D
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 11:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B60E6113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgSaAjHI9wQibyoTGKnVAalJQzi3dd+qa77gC1Rpd7k=; b=B0CYax4ABEk9Et
	p6WDg/qY8kxhRU3mDHV+slsdN+ACTwd7EhLnuJnzXeh5ALRqJjxUx4lGAhjWOK7+FKviPBbCXy4U3
	sn7PfiRLrfZXVQd61/cbCioPVd1fOziGVD2NX6NsBIWDD6mHzbo/XsWAcbK4EPAGAb7KTYU80k44e
	pAW887rl9rAw2aDO4k0L7paAebY7DkWcll7KYAGyT1BzhlIupApJ7I5TzMuz4IV1DzG3cjGn+5qhO
	DjGpA9J1faYfyAuImtDFD3c9Ri0JqaKtBNlci6B31IoEUNGjwr8EEel4vfhxDUKSzNdCgF8ZzOSu3
	5uNx627+f0Enx7jO1IgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llrhZ-00DYKI-Os; Wed, 26 May 2021 11:27:54 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpuA-00CufQ-AI
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:32:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id F311C60004;
 Wed, 26 May 2021 09:32:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RESEND v3 2/4] mtd: rawnand: Add a helper to parse the gpio-cs DT
 property
Date: Wed, 26 May 2021 11:32:40 +0200
Message-Id: <20210526093242.183847-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526093242.183847-1-miquel.raynal@bootlin.com>
References: <20210526093242.183847-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_023246_564493_54BD6955 
X-CRM114-Status: GOOD (  17.59  )
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
 drivers/mtd/nand/raw/nand_base.c | 39 ++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |  4 ++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index fb072c444495..aad687b587a5 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -42,6 +42,7 @@
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
+#include <linux/of_gpio.h>
 #include <linux/gpio/consumer.h>
 
 #include "internals.h"
@@ -5078,6 +5079,44 @@ static int of_get_nand_secure_regions(struct nand_chip *chip)
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
+EXPORT_SYMBOL(rawnand_dt_parse_gpio_cs);
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
