Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CB8C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 11:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DTFhyNTkQLOuLuKQVmz+OtlG+jqcCTrs9LGEOSSiq4=; b=mcmL2sDn1mmodM
	CRdhQvBcPaQbQCEb8EzMP7T7WNRZbTcXA6meL5ZY/C93qyloSlhI2lT4pinZgl4wcgqkKdHh4EgVq
	2lsutkNB5QiQBoeINOtZnbqB7ouhwmFTtrVm8lGr1VF+jaSmdYN6vJUN3sviO/wHFeorSWSu82fvQ
	CCwyTkXwJCyuHc1VnaoqaDmFPtF+N9RB8t7wMdgu7LzAMkZ3B+A8vSEti5TwrWbNgFRW6U+US168n
	NjqbbNkcH4WGlUMRp5x8AR9qQi7Mt0KdCUM3pKuMKZXjN7pqDkVhThTAc3TkLPBymRkYntNZJg1MF
	CXBbv4A1s6NtuMRYe05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcex-00CtSX-GT; Thu, 17 Nov 2022 11:02:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcW5-00CoHg-KI; Thu, 17 Nov 2022 10:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668682390; x=1700218390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PTd3Xp7lnmGYxmQRmdmHm6G+V0PfC+jWfJFuvF44HB8=;
  b=agGVfERUa0k7L1lE5RoJGOdzRSPbkGdZULWaH/1IVfNTCiriRGOjOMrd
   Ft9oFWPv+nGZxhKGtr32V32Y5kReE3JRmyB8jvvfWeYSsYr8KimZkvAmu
   CUJmoAni6PEePmZLTFwYtuFWehDpA4rSdKd6lhG3t/SQAGZmwcfBeumX/
   TOYOtVT1T23rrj4TdZRpncVlDr1XwqqYk3mhCKVxSF73it2eNva5WVGD+
   RTHaOkUCUaW3QXWfE4trU87zkP3PhWAHJ6gzzp14RyU+vODsxHAuE00Dt
   24Ai1fRH4Fz+vXYRXjvRiUjcICWSgASB51mFD2xTCSeTmpKFYjRzkFUs4
   A==;
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="183965621"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Nov 2022 03:53:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 17 Nov 2022 03:53:02 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 17 Nov 2022 03:52:59 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 3/8] spi: Reintroduce spi_set_cs_timing()
Date: Thu, 17 Nov 2022 12:52:44 +0200
Message-ID: <20221117105249.115649-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117105249.115649-1-tudor.ambarus@microchip.com>
References: <20221117105249.115649-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_025309_779229_9C2770E1 
X-CRM114-Status: GOOD (  16.61  )
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

commit 4ccf359849ce ("spi: remove spi_set_cs_timing()"), removed the
method as noboby used it. Nobody used it probably because some SPI
controllers use some default large cs-setup time that covers the usual
cs-setup time required by the spi devices. There are though SPI controllers
that have a smaller granularity for the cs-setup time and their default
value can't fulfill the spi device requirements. That's the case for the
at91 QSPI IPs where the default cs-setup time is half of the QSPI clock
period. This was observed when using an sst26vf064b SPI NOR flash which
needs a spi-cs-setup-ns = <7>; in order to be operated close to its maximum
104 MHz frequency.

Call spi_set_cs_timing() in spi_setup() just before calling spi_set_cs(),
as the latter needs the CS timings already set.
If spi->controller->set_cs_timing is not set, the method will return 0.
There's no functional impact expected for the existing drivers. Even if the
spi-mt65xx.c and spi-tegra114.c drivers set the set_cs_timing method,
there's no user for them as of now. The only tested user of this support
will be a SPI NOR flash that comunicates with the Atmel QSPI controller for
which the support follows in the next patches.

One will notice that this support is a bit different from the one that was
removed in commit 4ccf359849ce ("spi: remove spi_set_cs_timing()"),
because this patch adapts to the changes done after the removal: the move
of the cs delays to the spi device, the retirement of the lelgacy GPIO
handling. The mutex handling was removed from spi_set_cs_timing() because
we now always call spi_set_cs_timing() in spi_setup(), which already
handles the spi->controller->io_mutex, so use the mutex handling from
spi_setup().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/spi/spi.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index b93a6085d9a0..3cc7bb4d03de 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3621,6 +3621,37 @@ static int __spi_validate_bits_per_word(struct spi_controller *ctlr,
 	return 0;
 }
 
+/**
+ * spi_set_cs_timing - configure CS setup, hold, and inactive delays
+ * @spi: the device that requires specific CS timing configuration
+ *
+ * Return: zero on success, else a negative error code.
+ */
+static int spi_set_cs_timing(struct spi_device *spi)
+{
+	struct device *parent = spi->controller->dev.parent;
+	int status = 0;
+
+	if (spi->controller->set_cs_timing && !spi->cs_gpiod) {
+		if (spi->controller->auto_runtime_pm) {
+			status = pm_runtime_get_sync(parent);
+			if (status < 0) {
+				pm_runtime_put_noidle(parent);
+				dev_err(&spi->controller->dev, "Failed to power device: %d\n",
+					status);
+				return status;
+			}
+
+			status = spi->controller->set_cs_timing(spi);
+			pm_runtime_mark_last_busy(parent);
+			pm_runtime_put_autosuspend(parent);
+		} else {
+			status = spi->controller->set_cs_timing(spi);
+		}
+	}
+	return status;
+}
+
 /**
  * spi_setup - setup SPI mode and clock rate
  * @spi: the device whose settings are being modified
@@ -3717,6 +3748,12 @@ int spi_setup(struct spi_device *spi)
 		}
 	}
 
+	status = spi_set_cs_timing(spi);
+	if (status) {
+		mutex_unlock(&spi->controller->io_mutex);
+		return status;
+	}
+
 	if (spi->controller->auto_runtime_pm && spi->controller->set_cs) {
 		status = pm_runtime_resume_and_get(spi->controller->dev.parent);
 		if (status < 0) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
