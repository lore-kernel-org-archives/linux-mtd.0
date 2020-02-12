Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A88C35242
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92B5220724
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:46:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OdvgzmY7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXy+baYR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92B5220724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4YnxgfwWSnWordUUeAvhws/DQFg1UrhnS/VX9gsxLs=; b=OdvgzmY7yTRyIH
	+JxkNnKnUpk5Kh5Ruc6PPTR7nnXf66gy2BeOWItThZa48VuzjCHdo9ZV871WYXZwsG0r0gzSsrUql
	VO/MlcPL3g+oNbBP0YRdFzDcSR2b/XqETQy4cs4vhz8dk+7woeiaOSmW6bLji1IqmYfpkVltgQq4L
	JnsS6onY+Bc2I6zRFmfP4xN4wsb3Aj3P+FVnA6D1fHuJTPDgJg6mKlvU7yXEdllhV3QXLZCrwHIxG
	XQjAUTYxms1RE4AlFe7x7AtlZe/mNpMJkkAs/nMrjE5rZUvyDnfOyDv3s0Fw2HlAE/8Ih64hcbAtI
	HKRuVsa6w6BGMxdvETzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1gAo-0006mI-I8; Wed, 12 Feb 2020 00:46:38 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1g4r-0008LD-C9; Wed, 12 Feb 2020 00:40:31 +0000
Received: by mail-lf1-x141.google.com with SMTP id r14so275179lfm.5;
 Tue, 11 Feb 2020 16:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/6tTpO3ty9Ickxrg60llaPHKJlLlwszXGl2q4ZEWdA=;
 b=XXy+baYR3VmU8+0MGUBmeB6Ufp/HhTXjpTNcm302ZvTcMx1EevlSI36N7AfkUkFY+L
 hikN/KF45d4Z3VpgD4ep9+f5bnN6R9yOvtZD6IKtW6JF30+QsQdYKL6ANu3J23pA2zPC
 vMQdRiXUl7QMICn0fkSYS4MjnkQ9yGjELAbk761xAGcGiTv5ew4ysYqRn60qsjpToxZp
 LdP4g+dkLb2RagCz7Srr7VCQBngZBot1UyOaQ/WSyyXpNmSVXCy6qUaKuJrhOHfOetnx
 +nI6CWdxR8IatlCyIFlRpeJ+xQEWEj9sCVcSc1FKF4cqaFeyYI/kEQKixttD8PiMxyIe
 HjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v/6tTpO3ty9Ickxrg60llaPHKJlLlwszXGl2q4ZEWdA=;
 b=Dxk4U1xzFoKO9qZt8AFeEiB1XsADuLZSSq70bouPfyEoX/LWFwyNHqTiN+6J0QI4mV
 u4IE0tfo+V1iNlUsvdl4U04AUHWVnMTiaZhoQXug6jAyQMWKfMR7EwQuxJphGa4HEAd2
 ro3chNzbjFyJcCfpiwtvK0hcPC1hvkAUQUqTuvteBPgss6yHR1lUNCfrZo3xZ+j8RgHr
 rADYySnrNehu1MAtEL5y9QxdsYMHQM7Ycr+P8hlklx0MZlVe7z3vK1hTf1JsxC80TTIH
 5+JKIPNvMF/tiwPgcCes4xvxiqRqMnyELQ3Irtx7OJMnpk7vLI+Bu86MEmw2IHa6HA/d
 bMig==
X-Gm-Message-State: APjAAAX1z5RGt9xZsx9ICLT+km39Ql5/1+ZnwNxDdcAenOHuElGX3xvL
 HPPdA8wOdGAwVkB/EISuzPc=
X-Google-Smtp-Source: APXvYqzJQMZWjP7I8oQrWw3hIto+GJNhsSDnYXYqbb56cNLMkwksMbMcf+Z2BxWEJFVtQsbKN+icfg==
X-Received: by 2002:ac2:5f74:: with SMTP id c20mr5161323lfc.15.1581468026840; 
 Tue, 11 Feb 2020 16:40:26 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl
 (109241122244.gdansk.vectranet.pl. [109.241.122.244])
 by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 16:40:26 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: [RFC PATCH 11/14] mtd: rawnand: ams-delta: Support custom driver
 initialisation
Date: Wed, 12 Feb 2020 01:39:26 +0100
Message-Id: <20200212003929.6682-12-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_164029_447478_E5310F5E 
X-CRM114-Status: GOOD (  11.10  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In preparation for extending the driver with custom I/O support, try to
obtain device specific initialisation routine from a matching device
table entry and run it as an additional step of device probe.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 9857ce25debf..97e3b6629c72 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -22,6 +22,7 @@
 #include <linux/mtd/nand-gpio.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 
@@ -230,6 +231,7 @@ static int ams_delta_init(struct platform_device *pdev)
 	struct nand_chip *this;
 	struct mtd_info *mtd;
 	struct gpio_descs *data_gpiods;
+	int (*probe)(struct platform_device *pdev, struct ams_delta_nand *priv);
 	int err = 0;
 
 	if (pdata) {
@@ -319,6 +321,15 @@ static int ams_delta_init(struct platform_device *pdev)
 	priv->data_gpiods = data_gpiods;
 	priv->data_in = true;
 
+	if (pdev->id_entry)
+		probe = (void *) pdev->id_entry->driver_data;
+	else
+		probe = of_device_get_match_data(&pdev->dev);
+	if (probe)
+		err = probe(pdev, priv);
+	if (err)
+		return err;
+
 	/* Initialize the NAND controller object embedded in ams_delta_nand. */
 	priv->base.ops = &ams_delta_ops;
 	nand_controller_init(&priv->base);
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
