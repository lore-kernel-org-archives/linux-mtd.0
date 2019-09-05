Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD8FC43140
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:20:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B93732137B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uPx4meDy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dr/9HzD6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B93732137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ye13rgg/aLlzOgRGXWt7F/NFwemRS0Er3rW+Ki7Fdpw=; b=uPx4meDytg3yEnk/WROP2W2AAS
	IC8kOHl1iVskChrnjK4C5+EhAZK+2cX+ITJFGo7VlgJyZzM2jLhIGM36VN3oQ0hOAVWzsnleu74ah
	5QFkgDLEUb8hGDWTn/BZVMxveTyHy0fb1xBjMzbEGBSNFIbDVf1F9+E0Pzr/OLt2sSjme2Sy3oqxf
	TCsaQ+WisHVp1km0UZE2CCAsk5hnZ/qlcgWxr2DwsE9WTQf0m17gF5S7v8HpmHKmblRJqHx86peln
	BeQB76Xl2a99UUFnf9Wf0yU+dGhZtQ8n2gQOK/k4QBoQo4XhoOXmGEKZjQMyw0dhN6MaXJ3GoK95/
	NAeZUQnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5uUb-0004lv-HX; Thu, 05 Sep 2019 16:20:17 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5uSb-00013B-V7
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 16:18:15 +0000
Received: by mail-pl1-x641.google.com with SMTP id 4so1515673pld.10
 for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2019 09:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gVFpbnmwR/H0XIcZNgb2GdBzjOFgaobM9Yxc91rkUEw=;
 b=Dr/9HzD6iWPfceKw7JxoqfNkPUkVwEJIvJ6qPHqxv0lvskG3nUTwAbc8W7CdTnpWNZ
 E7/74MJVoS89JAhyqoEzJccajtDV8UlDwLBe8qTFagb2kZG4kmB7cyrIpxAKBzTCNmzu
 paRFo5MSQ8Hzwh37g3MidoLPOqizim/nuyd3ERaPZo1p8+qfX3DuSC9+dQks+Ezp/Lj/
 d9GaXIqusviMB8769avG6rrHw+IRW05Bhx3JuyBbS04PBMIjMsAbUalHeiMMPmdUGQNc
 APry6qeospuB2zMpOCseNSbRDbfzQdeqsw9Wj1F3zJq1Wuh8fO/rKTkiE1tnL3tT+yyv
 YTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gVFpbnmwR/H0XIcZNgb2GdBzjOFgaobM9Yxc91rkUEw=;
 b=AyYSQUK8BeSFJF63871CswZljsuakQEFkBLxGmbo7p+6EaIqMl1Mcgf6cA+sNjauGy
 jdP8PIg8NfzMNPeqAJOLj8diaqzBITEqeD1CoFMzS1MmXKmfW5sPYg8yk7GPKkSKjOV4
 g42eq8HV2iEAFEmRwWKcIV2PAOrW+ywuQfoUklm52WwOt2QVL7Zn+PQ78xk3Q4nSuo6c
 //wpGgtWnGT5N6iW13S6hJsAHCE9r9fLnYLZL+Y6R/9iL/9yxXrElOztaD4qMPL6HS4w
 TWcgcK35P40FE2N3A15eooV5+lQkaI+piNDUHsv9koJuN1w/VHX4B2HBvAq835/AeUkY
 RMMg==
X-Gm-Message-State: APjAAAXUP+ciO1jeNKHiaYmY/FMqnjCN8f58LKguuGsjAtYa/V1nD3qi
 rS/4V+Z+vamlp17T2AgIKqhtXw==
X-Google-Smtp-Source: APXvYqyNIXlJiqwV3V85SK8fy/yhRQoUKe37oa8NmDiqIxSm+9Zd+bnI8Wd3T5ihYqVjjx3jMryqRA==
X-Received: by 2002:a17:902:9f97:: with SMTP id
 g23mr4381121plq.248.1567700293310; 
 Thu, 05 Sep 2019 09:18:13 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:12 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 10/18] PCI: dra7xx: Add shutdown handler to cleanly
 turn off clocks
Date: Thu,  5 Sep 2019 10:17:51 -0600
Message-Id: <20190905161759.28036-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_091814_081939_8183D80A 
X-CRM114-Status: GOOD (  10.05  )
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Keerthy <j-keerthy@ti.com>

commit 9c049bea083fea21373b8baf51fe49acbe24e105 upstream

Add shutdown handler to cleanly turn off clocks.  This will help in cases of
kexec where in a new kernel can boot abruptly.

Signed-off-by: Keerthy <j-keerthy@ti.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/pci/dwc/pci-dra7xx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pci/dwc/pci-dra7xx.c b/drivers/pci/dwc/pci-dra7xx.c
index 7f5dfa169d0f..2e0d0b29cdcb 100644
--- a/drivers/pci/dwc/pci-dra7xx.c
+++ b/drivers/pci/dwc/pci-dra7xx.c
@@ -817,6 +817,22 @@ static int dra7xx_pcie_resume_noirq(struct device *dev)
 }
 #endif
 
+void dra7xx_pcie_shutdown(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dra7xx_pcie *dra7xx = dev_get_drvdata(dev);
+	int ret;
+
+	dra7xx_pcie_stop_link(dra7xx->pci);
+
+	ret = pm_runtime_put_sync(dev);
+	if (ret < 0)
+		dev_dbg(dev, "pm_runtime_put_sync failed\n");
+
+	pm_runtime_disable(dev);
+	dra7xx_pcie_disable_phy(dra7xx);
+}
+
 static const struct dev_pm_ops dra7xx_pcie_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend, dra7xx_pcie_resume)
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(dra7xx_pcie_suspend_noirq,
@@ -830,5 +846,6 @@ static struct platform_driver dra7xx_pcie_driver = {
 		.suppress_bind_attrs = true,
 		.pm	= &dra7xx_pcie_pm_ops,
 	},
+	.shutdown = dra7xx_pcie_shutdown,
 };
 builtin_platform_driver_probe(dra7xx_pcie_driver, dra7xx_pcie_probe);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
