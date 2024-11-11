Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8B5D2E9D8
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 11:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYg6BZlCxq+tm0fXfbDqIRWP0O08voR1wI93RZXLZ3U=; b=pc27Wn3YE3f1g6
	fRthIZ4kC5pC9xEWR1m73D9Me6Tw5NV2FQKQ/GMaIHskZXLPvSnD2tQLnAh4foFe0Fd1vRWjeryjG
	MIX4m0iYlN+gQHfQdrYz+54dNiM06cPq9NQwT1/OL45ml1Zp2zaUsbXQ/n/4RIlL50qdZdXsl4Pyt
	POiB0wlsuafJP1eb1rFaUSlFtBSNWgpaizdYBuWPsewuZ5Oe5i84X9MWYkmDYdrEE/Js46LYnhY15
	bJ9vnAw6cZS8BMbL72UsN+pVpoc18Hzc+3yqv9z7LaYnco3aRkLM701sigyEGzt71+5IZ/ND2ulQ0
	f7Zup7cuEeZG4b7butwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tASY0-0000000HRmX-0LFE;
	Mon, 11 Nov 2024 11:25:32 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tASSb-0000000HQFF-3DDC
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 11:20:01 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso746603966b.3
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 03:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731323996; x=1731928796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fu/BrO8IXX6alWkTb0GYjGoZx8cl1iROqgITASLHOag=;
        b=em5OAZlpo1CbxNuxijs50Jmc3TpGKQTMFzOtTsGZ4j2XTNZNJ897iDC9WPfi/Oy2TJ
         qjwPbrh3Wb6ERzK5ETtbOPVykYLYkqbgmYngtQTw0nMAk0kfVmeqMu0u9qkMUGCtkCAr
         C0ewrldnSFEXZdmtxP/vX9YJCsCk/5ZggTZeR4l5dIoP/Y+3qmFc9QFalZKrV9spQd2k
         OfCJox+YA15GMn1HIvYSjmux58Uiw+aHruH5y106McNwlr7YWNzMeIFEPpzOonLWJ1FZ
         fpJF/c8ZwwMTw72JqqJUZYpgIKjnRT4GFwGSJePLhSYsIBn7PUONHwAef+ltGNPoLS+3
         WFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323996; x=1731928796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fu/BrO8IXX6alWkTb0GYjGoZx8cl1iROqgITASLHOag=;
        b=NipUExo8r7Nh7UvmU9QJuibQlsFIgJPoVTyf75AOHiA1ykLEhuJdzDr2cBT483DLsx
         LQa0sT39d2Aasz/C6dab2J//1JPUi0zWKtRrWgq65beCxFQfhVY8O1jMCoMQxInpkBLN
         8Ny+mnaDygi8BUnYPZWChG6XGVaFyzaj+/KmnuA3UfqU4SnBRCobdFwXU/XN6a7JNjB8
         TwYr5zgMWnUTIhAnP2hLq1h8FVWxXeeG45tdtw0x2pHYCUWBx5UPZy8AYexi3aAZhghX
         dJZ5er9B/yARI42KLcqJ7EpcKzdbOXpx1ZDi5Mvy7oZ5El/XG0LJ0yBdg3W91cXHYRD/
         z5gg==
X-Forwarded-Encrypted: i=1; AJvYcCXlmoNtBYikUQB0kp+tL4e+sh4jXjEGyfjQgDkYrLV/D6jbP96CognhnRSr2a8qCeWYLKobWtZwTuI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrCc1qRGfdiGcnR8Xu+/unAhqMs8m1AliJ/3sV12J/BYsFZ2IM
	93BqeMF8UcpAN0h7ehkpyH4HVqNlAxxkRnO6fpI3jLWUsEVh1mH2A2VZagvF0Ms=
X-Google-Smtp-Source: AGHT+IETD0TTRXcK0fhtRcdkx1FK3e/NgS7iCgkGzVtCtOmSV30aF2EybWWflcXrw2+dh5CJKbTS3Q==
X-Received: by 2002:a17:907:1c0f:b0:a8a:8d81:97ac with SMTP id a640c23a62f3a-a9eefeaf352mr1148302166b.4.1731323995661;
        Mon, 11 Nov 2024 03:19:55 -0800 (PST)
Received: from 1.. ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2e922sm582530866b.193.2024.11.11.03.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:19:55 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peng.fan@oss.nxp.com,
	m.felsch@pengutronix.de
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 3/3] mtd: spi-nor: support vcc-supply regulator
Date: Mon, 11 Nov 2024 13:19:46 +0200
Message-Id: <20241111111946.9048-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111111946.9048-1-tudor.ambarus@linaro.org>
References: <20241111111946.9048-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447; i=tudor.ambarus@linaro.org; h=from:subject; bh=/f04QIpiuRXQZGFnfAnaIXlKFecFw5Gb/Nj7YVsESQI=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnMehSiUznsRKk7icK+iHmW5tJsygFpLEVcVVqy gWwSLj6VbSJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZzHoUgAKCRBLVU9HpY0U 6ZCHB/9VoXfZlG0zTmKUX6uOfKEiomBJ3tfQ08Fz7JZbY9HNkY8ASnC7D3i/ne0kDCkVXmDdN/t truMWEiWIE1aEqbqieiySwIsqcizG8Ng8aLiNPni4zPgm6lAMLGq9pGPkvgQ+cFq+o3sEqK6ju1 teBSW2iQF+1ZFN/yIjDe8egf9CAcfouomGbsT3ezLCWmfzGyknfgU+SZm2MuI020jVlawX/8u3/ SdG44Hz6HjnrJkYXQyvKOVYGgxNXcow+G5b/UAbgcUNo9rVXbPNFG6etyN+bN2C9AgYC5BJaPb8 ApAAcl8bVmIqGIMm7hll4kkRejUfWBnUCOp+r6Vxabk66hCF
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_031957_879652_851E463E 
X-CRM114-Status: GOOD (  12.80  )
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

From: Peng Fan <peng.fan@nxp.com>

SPI NOR flashes needs power supply to work properly. The power supply
maybe software controllable per board design. So add the support
for an vcc-supply regulator.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
[ta: move devm_regulator_get_enable() to spi_nor_probe().]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v5: introduce the local dev variable to its own patch
v4: move the devm_regulator_get_enable() call from spi_nor_scan to
spi_nor_probe(). We no longer add support for the drivers under
drivers/mtd/spi-nor/controllers/. Those drivers shall be moved under
drivers/spi.

 drivers/mtd/spi-nor/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2a329084505c..19eb98bd6821 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -17,6 +17,7 @@
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/sched/task_stack.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -3587,6 +3588,10 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	char *flash_name;
 	int ret;
 
+	ret = devm_regulator_get_enable(dev, "vcc");
+	if (ret)
+		return ret;
+
 	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
 	if (!nor)
 		return -ENOMEM;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
