Return-Path: <SRS0=JkGG=TI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40613C004C9
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 01:17:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 118B320656
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 01:17:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jMzsMK2V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1/k8yxJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 118B320656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylkrrCx5uQURi+GVlLn3kLLhfAm4hwirP6dP15JLRAU=; b=jMzsMK2Voj2UT0
	i5dPM5LJHescVkGcW7vLzsKgdOsSFWGNGVemAefO1h0vAEsDsptTSrCZh3afnu+J/QhEwXS8mYWaq
	ekh4m46K37JpUgLXymftreqhrbOQBnntDXyKhM27biOqgWHRORsHdTnnKbDTlL4Bp4Dahlm+iYpIh
	mYkdMv1HrhA9cfOQxsW1+SOnU5x/45fHqiwwwwavH9/B2E86BiDjAR5+ALrcgR1p6w5uYHC7+HVXh
	o2ApHZT7/Xik6TBGjsutrvSvFK9BUM8y7q3+kqiQ/hu6NVBCGdfEDRqmliD6FsClmczEeZwFUw9W8
	S5yp7c/a7HpaGxSg4CBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOBDU-0002Vt-Br; Wed, 08 May 2019 01:17:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOBDM-0002N2-Hv
 for linux-mtd@lists.infradead.org; Wed, 08 May 2019 01:17:46 +0000
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com
 [70.114.128.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5441A214AE;
 Wed,  8 May 2019 01:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557278264;
 bh=9OMkv/ZBdEnfIAJyqAaLM6xgw/CpTOvjzlJKxqG6Npg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J1/k8yxJeLIWkHyCyt8GULnSmNAh4JE7k0/scyOt2AL7LIe2RAWWMcTOwzVRz/YWr
 hTzSRMeSVMDs5KTV2QOnAE3A+4aalKjX7N2rHLwtIW3+UAD+yQOZ4n0q4LckvcbA6S
 Qm2/pixaiE2YFEq1yZvZCB8MBs1amzUuOcuRIXj4=
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv3 2/2] mtd: spi-nor: cadence-quadspi: add reset control
Date: Tue,  7 May 2019 20:17:34 -0500
Message-Id: <20190508011734.14966-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190508011734.14966-1-dinguyen@kernel.org>
References: <20190508011734.14966-1-dinguyen@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_181744_720596_8FB39EF1 
X-CRM114-Status: GOOD (  11.26  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marex@denx.de, devicetree@vger.kernel.org,
 Tien-Fong Chee <tien.fong.chee@intel.com>, bbrezillon@kernel.org,
 tudor.ambarus@microchip.com, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Get the reset control properties for the QSPI controller and bring them
out of reset. Most will have just one reset bit, but there is an additional
OCP reset bit that is used ECC. The OCP reset bit will also need to get
de-asserted as well. [1]

[1] https://www.intel.com/content/www/us/en/programmable/hps/arria-10/hps.html#reg_soc_top/sfo1429890575955.html

Suggested-by: Tien-Fong Chee <tien.fong.chee@intel.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v3: return full error by using PTR_ERR(rtsc)
    move reset control calls until after the clock enables
    use udelay(2) to be safe
    Add optional OCP(Open Core Protocol) reset signal
v2: use devm_reset_control_get_optional_exclusive
    print an error message
    return -EPROBE_DEFER
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 792628750eec..b9f138767d9e 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -34,6 +34,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/sched.h>
 #include <linux/spi/spi.h>
 #include <linux/timer.h>
@@ -1336,6 +1337,8 @@ static int cqspi_probe(struct platform_device *pdev)
 	struct cqspi_st *cqspi;
 	struct resource *res;
 	struct resource *res_ahb;
+	struct reset_control *rstc;
+	struct reset_control *rstc_ocp;
 	const struct cqspi_driver_platdata *ddata;
 	int ret;
 	int irq;
@@ -1402,6 +1405,33 @@ static int cqspi_probe(struct platform_device *pdev)
 		goto probe_clk_failed;
 	}
 
+	/* Obtain QSPI reset control */
+	rstc = devm_reset_control_get_optional_exclusive(dev, "qspi");
+	if (IS_ERR(rstc)) {
+		dev_err(dev, "Cannot get QSPI reset.\n");
+		if (PTR_ERR(rstc) == -EPROBE_DEFER)
+			return PTR_ERR(rstc);
+	}
+
+	rstc_ocp = devm_reset_control_get_optional_exclusive(dev, "qspi-ocp");
+	if (IS_ERR(rstc_ocp)) {
+		dev_err(dev, "Cannot get QSPI OCP reset.\n");
+		if (PTR_ERR(rstc_ocp) == -EPROBE_DEFER)
+			return PTR_ERR(rstc_ocp);
+	}
+
+	if (rtsc) {
+		reset_control_assert(rstc);
+		udelay(2);
+		reset_control_deassert(rstc);
+	}
+
+	if (rtsc_ocp) {
+		reset_control_assert(rstc_ocp);
+		udelay(2);
+		reset_control_deassert(rstc_ocp);
+	}
+
 	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
 	ddata  = of_device_get_match_data(dev);
 	if (ddata && (ddata->quirks & CQSPI_NEEDS_WR_DELAY))
-- 
2.20.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
