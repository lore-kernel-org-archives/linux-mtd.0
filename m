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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009B9C35242
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:41:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C81152086A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:41:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kkZy/blj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u4VSpkKl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C81152086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2LO1HcdCI3fRJvgQqvCoDnW4LhPBc26CqFUb7O72kbo=; b=kkZy/bljZTXi43
	o2kUA3O2ANB+p5/b2Zk5uDWAFWdhPslxNn7A7zpAM6WDT/WXQjkNcYjvC1qxwlum4Uo9ts7GnfM7y
	1COmZmgeoeUVMlamsPz+iucJAXsAhy6Tez4JQ5Fut/3TlUsimo4At9aomlClmjvdqwW1JJTBtoGJD
	ARJ1+J3BFHDhBLM4SZO2u1hD8OWaGY5Vqk0r9b9JRD+Tv6G3/MAnVUhg2efP3QOGBRgVpDKIMthPE
	TLXyAnuJvxfIHlouNMNcGzaSLHt57cKOnmEGRRMyK8Kscgp9sjY+iMRgLjBWEfsjd1HHLu0/5uTCN
	1o0f+A17TwLhW/91FJwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1g60-00011f-KB; Wed, 12 Feb 2020 00:41:40 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1g4e-0008CL-6i; Wed, 12 Feb 2020 00:40:18 +0000
Received: by mail-lj1-x244.google.com with SMTP id h23so252133ljc.8;
 Tue, 11 Feb 2020 16:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1E6U1KXN6Rcnkdcrq0BPPezEV5qfb7m21AOfkLuyxDo=;
 b=u4VSpkKl40Av+vWVlGDk5M6EJHsC+aP6g1qHFL7Ssr3u+n0QsQjq1srx8PfseuEuIj
 Ps0xrsUWPLUwRPLl9sbUKec3gOfLRj848+Kp8NQAscYPDxKm+yPp+AaOIDeMJ6M6KGz3
 zVZePI+foU/oUER8HIWYYVGp1Ij5wMqSRgPnYDe3IeZHLgHY0PaOsnBSigpaNP6e+hAR
 eTPapSzPtbdjcbCTyh/dUo780PEYHLZ28QWfRaVbRLTNaa3VL8aq6JeoVOT9e8j6bWKh
 mKcKG3P147Is2mRggjc9SiReKD13Rr1ypGWAYR70PV0UvJ8PZ/VIuiWfB/3YvW6NZLWk
 O9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1E6U1KXN6Rcnkdcrq0BPPezEV5qfb7m21AOfkLuyxDo=;
 b=sgQnNmhHksUzG04G4k5tGQlmol6KGjJ6ogHeH6mc7S9SIpZohJ3J57/G8teBKcXDQJ
 hXhLcNKNI/1aknK5N1+3ae0Vf1J7Xogx2ilYadGeF9VVDur4qgMRCzPTLwQjCMaK9jhS
 48sKGcUCFbMg0thVhTT4FdXqwjIxaLtunAPtj0klFAjpRgQbXbDIVs/y4BCq6tojbYir
 CIdk1gBJD61Xdp/N7gJX0mSAy/z4Q81rH7IAYCEg3ajW7a/wM0yd7SZMOSacwK7ptkT/
 aYXjFI/XnhPxajO4ah3YR0AjRS0MsfWcRkddW78j0rgq7BmcjahDwzcrn7ivo8m4crHB
 GHtg==
X-Gm-Message-State: APjAAAUZIuSS7sDaqB4pOLB+dlGDCsWXXzgCqX/IDoq+NU/QihiooxZh
 99ceFWvpqTJfkomjwNw86EY=
X-Google-Smtp-Source: APXvYqyZTguDgRqpwWaZ+6ZgVuWMJkwrup7xgzKvxWnDPUtwVrP2Se7fBz1FzXWoTaCjDRUXa4UV+g==
X-Received: by 2002:a05:651c:2046:: with SMTP id
 t6mr6132637ljo.180.1581468014885; 
 Tue, 11 Feb 2020 16:40:14 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl
 (109241122244.gdansk.vectranet.pl. [109.241.122.244])
 by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 16:40:14 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: [RFC PATCH 02/14] mtd: rawnand: ams-delta: Use struct
 gpio_nand_platdata
Date: Wed, 12 Feb 2020 01:39:17 +0100
Message-Id: <20200212003929.6682-3-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_164016_926045_A35276C8 
X-CRM114-Status: GOOD (  12.94  )
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

In order to be able to move the hardcoded Amstrad Delta partition info
from the driver code to the board file, reuse gpio_nand_platdata
structure owned by "gpio-nand" driver and try to obtain information
on device partitions from device platform data.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 2501cfe00f43..fbab7cc14607 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -19,6 +19,7 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/nand-gpio.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
@@ -220,12 +221,20 @@ static const struct nand_controller_ops ams_delta_ops = {
  */
 static int ams_delta_init(struct platform_device *pdev)
 {
+	struct gpio_nand_platdata *pdata = dev_get_platdata(&pdev->dev);
+	const struct mtd_partition *partitions = partition_info;
+	int num_partitions = ARRAY_SIZE(partition_info);
 	struct ams_delta_nand *priv;
 	struct nand_chip *this;
 	struct mtd_info *mtd;
 	struct gpio_descs *data_gpiods;
 	int err = 0;
 
+	if (pdata) {
+		partitions = pdata->parts;
+		num_partitions = pdata->num_parts;
+	}
+
 	/* Allocate memory for MTD device structure and private data */
 	priv = devm_kzalloc(&pdev->dev, sizeof(struct ams_delta_nand),
 			    GFP_KERNEL);
@@ -326,8 +335,7 @@ static int ams_delta_init(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partition_info,
-				  ARRAY_SIZE(partition_info));
+	err = mtd_device_register(mtd, partitions, num_partitions);
 	if (err)
 		goto err_nand_cleanup;
 
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
