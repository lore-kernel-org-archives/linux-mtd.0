Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE1EC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 13:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4zcfGS7gWAdU6CpyIv5AU42rsYH4CtpPCW6Ilt+3qD0=; b=KQvhbH7utq0tsI
	fFAPeG2eRqfS2G65Tl62WmQbhKsw+PtYP+UyrThrM/UFlkrGK+4zAtatKA5FtWymP1pIa+Ur9FWvM
	z9B5TdxHRPtLXRAm2GFcIwYDV6mDZvn4lJQ4Q0Vrsh0Bxo0idYWSR39wTGs0ZVz9Du84GLQUgBPoe
	AdzNMMlFORj6UPRlVipNtd7JQTNYYRxIHQ9JfDkoYKWztPjErb2I72BflAJ3yDewZT7HDXRFLaxHS
	t3uw0/EpE2G4i2k9aG8auS0xvwIFxGGZrSEMTtRFwQFjXDRSRWz88j+myXQSMddpHcX1H6h0A9nRb
	yd3i4LIhrOwOb5wOaPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbirP-0012or-7O; Tue, 05 Apr 2022 13:04:39 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbiqq-0012dr-9D
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2022 13:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1649163844;
 x=1680699844; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SRDguBSs1Y1J0kKrsj8H5WlSWoje+dTygZTrpaj2/6I=;
 b=U5l84HokFqCTk5weYgWIOXBuJ7jI6vlt7YepUxsGlnh9qXseJroPz55W
 JXC4KXEsBpWNwyvY9/nLmc11gaM2t67W2XLt8qInSeBB+lDZ2obLdhwnd
 C/0SBjV6jHbqCZI5pNzxRDEKAigEgXzrVkdzkZ1qRspejsvezrk4I6KCp
 9aaMLdiAR1+5U8srw73Fp1gS4ffwzsCjr2VjeEtwrpu6VGkvo5nSth1rm
 7LotBKC0RYVS/gmfYB09NP2ruwDAeM+qylQt/rPVi1uKLBIxVOYyCMZqe
 EuvOUFGXvssePakNSqpSwxSx79Y0/pxsKZfoiyNdAJhWiKJUuaX98KI1T g==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <joern@lazybastard.org>
CC: <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <krzk+dt@kernel.org>, <frowand.list@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] mtd: phram: Allow probing via reserved-memory
Date: Tue, 5 Apr 2022 15:03:49 +0200
Message-ID: <20220405130350.1640985-4-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405130350.1640985-1-vincent.whitchurch@axis.com>
References: <20220405130350.1640985-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_060404_675061_C7A1353E 
X-CRM114-Status: GOOD (  17.19  )
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

Allow phram to be probed from the devicetree.  It expects to be in a
reserved-memory node as documented by the bindings.  This allows things
like partitioning to be specified via the devicetree.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/mtd/devices/phram.c | 67 ++++++++++++++++++++++++++++++++++---
 drivers/of/platform.c       |  1 +
 2 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index d503821a3e60..6dfe9401a3c5 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -27,6 +27,9 @@
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include <asm/div64.h>
+#include <linux/platform_device.h>
+#include <linux/of_address.h>
+#include <linux/of.h>
 
 struct phram_mtd_list {
 	struct mtd_info mtd;
@@ -89,8 +92,10 @@ static void unregister_devices(void)
 	}
 }
 
-static int register_device(char *name, phys_addr_t start, size_t len, uint32_t erasesize)
+static int register_device(struct platform_device *pdev, const char *name,
+			   phys_addr_t start, size_t len, uint32_t erasesize)
 {
+	struct device_node *np = pdev ? pdev->dev.of_node : NULL;
 	struct phram_mtd_list *new;
 	int ret = -ENOMEM;
 
@@ -119,13 +124,19 @@ static int register_device(char *name, phys_addr_t start, size_t len, uint32_t e
 	new->mtd.erasesize = erasesize;
 	new->mtd.writesize = 1;
 
+	mtd_set_of_node(&new->mtd, np);
+
 	ret = -EAGAIN;
 	if (mtd_device_register(&new->mtd, NULL, 0)) {
 		pr_err("Failed to register new device\n");
 		goto out2;
 	}
 
-	list_add_tail(&new->list, &phram_list);
+	if (pdev)
+		platform_set_drvdata(pdev, new);
+	else
+		list_add_tail(&new->list, &phram_list);
+
 	return 0;
 
 out2:
@@ -278,7 +289,7 @@ static int phram_setup(const char *val)
 		goto error;
 	}
 
-	ret = register_device(name, start, len, (uint32_t)erasesize);
+	ret = register_device(NULL, name, start, len, (uint32_t)erasesize);
 	if (ret)
 		goto error;
 
@@ -325,10 +336,54 @@ static int phram_param_call(const char *val, const struct kernel_param *kp)
 module_param_call(phram, phram_param_call, NULL, NULL, 0200);
 MODULE_PARM_DESC(phram, "Memory region to map. \"phram=<name>,<start>,<length>[,<erasesize>]\"");
 
+#ifdef CONFIG_OF
+static const struct of_device_id phram_of_match[] = {
+	{ .compatible = "phram" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, phram_of_match)
+#endif
+
+static int phram_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENOMEM;
+
+	/* mtd_set_of_node() reads name from "label" */
+	return register_device(pdev, NULL, res->start, resource_size(res),
+			       PAGE_SIZE);
+}
+
+static int phram_remove(struct platform_device *pdev)
+{
+	struct phram_mtd_list *phram = platform_get_drvdata(pdev);
+
+	mtd_device_unregister(&phram->mtd);
+	iounmap(phram->mtd.priv);
+	kfree(phram);
+
+	return 0;
+}
+
+static struct platform_driver phram_driver = {
+	.probe		= phram_probe,
+	.remove		= phram_remove,
+	.driver		= {
+		.name		= "phram",
+		.of_match_table	= of_match_ptr(phram_of_match),
+	},
+};
 
 static int __init init_phram(void)
 {
-	int ret = 0;
+	int ret;
+
+	ret = platform_driver_register(&phram_driver);
+	if (ret)
+		return ret;
 
 #ifndef MODULE
 	if (phram_paramline[0])
@@ -336,12 +391,16 @@ static int __init init_phram(void)
 	phram_init_called = 1;
 #endif
 
+	if (ret)
+		platform_driver_unregister(&phram_driver);
+
 	return ret;
 }
 
 static void __exit cleanup_phram(void)
 {
 	unregister_devices();
+	platform_driver_unregister(&phram_driver);
 }
 
 module_init(init_phram);
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index a16b74f32aa9..55d62b82c650 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -509,6 +509,7 @@ EXPORT_SYMBOL_GPL(of_platform_default_populate);
 
 #ifndef CONFIG_PPC
 static const struct of_device_id reserved_mem_matches[] = {
+	{ .compatible = "phram" },
 	{ .compatible = "qcom,rmtfs-mem" },
 	{ .compatible = "qcom,cmd-db" },
 	{ .compatible = "qcom,smem" },
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
