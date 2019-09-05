Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B79FC43331
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:18:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 048CB20CC7
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:18:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bBtN3/5J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O3tNCt/W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 048CB20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/XaHFOIo/TbzCv12WcAzspOCirY4HjKwtxjVWgdE4qI=; b=bBtN3/5JI16G1YCxPW1484P9mw
	1Iyfj8pFbSfXGp8CMNgb+7a8I7S4JuVFdDOXb8Zw1kbEgA/co739Io8V1rvbpK68QbJMLXSddM0n8
	iWfdtjJY4NqMmpnW9TCpNQvYOz9OFe42BGO5hcf5ThW+cwFQGaU1XT77kjdvYmm2wRrCAov9PXDV4
	YvWt/8/E2pzGXJ/JSnExzbDrHlU8CDzkopCx9762snuHA4NRrQ29Z3luMVSWeFhQQFzbIrIh9Ako8
	n8VBiHOcVRgrBvNFY7FZLh3SPcuMwoXHL5XvHUQ4rhn51jFGl5C2KywDwYeffDkr5LuFMTl/WYNN7
	9K3Y3ryA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5uSp-0001MV-CY; Thu, 05 Sep 2019 16:18:27 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5uSS-0000pe-70
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 16:18:05 +0000
Received: by mail-pg1-x541.google.com with SMTP id 4so1661989pgm.12
 for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2019 09:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MSiwBcSQD+D+YdS5Q0qHybng0VxB5Rm8vXeXQFjLMZc=;
 b=O3tNCt/W9wLVtkbdnd5ZHoteegcojqCr7hKVqHkZxaUlxVn/YzfA6HZZ40nBdnkoAO
 ZhrB0iw1Uc7D91gKUNEFUts4aaIwRfLc9HFFMibqH7dcc8fRUXz52KMfGwZDlccDJJiE
 RKX9AyFqS2JsIHjGGXMBX/BZ1YMB9oSdcvYb1l/YwNtkOv1/bY7a0taZGatIUTZLB8B5
 qoHjnHc9HvsJyTbTAEzBV36syWkgm7Xqp77PJV2mZ8WayBu5mJr3U5qaAjISS8G7GYPD
 EdmiI92amAdqbvyv4IrbpfYnerC9XFLioXTmFRbJMwAJ7YCYhVi9YGHLHFzUt0cn8dd8
 c2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MSiwBcSQD+D+YdS5Q0qHybng0VxB5Rm8vXeXQFjLMZc=;
 b=aoEW3FKdu5xE7HpL+66CQmqqqFWn/CVDRrur0OnScgPRetvrf0Dw8SdJ80BECB04LK
 Y9dk0Xe1+slRqQkm+/E3lQI9ymC8KM9A5XC64oRfvSwPoBRJj2cMaUYZ0IM4dhZ8JIIH
 fUZ5ngWU8j3iwEclG1rtzmNU7ODbv0IJtT1UH3N0qP5YO/rHWH/A+SRYGTO344iEmvAp
 ANFQ7rMlv7EwgH6jYJggJ29Rep90AZFOPbBfYZMtAXbQAsBw9ikmPHTqYzYQxmzNc1Zs
 IrNnGgrjgCcL7V85oZJEXha1Iim5EKJioOj3BSANLIZ0Gmg1/8F/63EdRDH1OqCXeDNn
 F6iA==
X-Gm-Message-State: APjAAAWDSbovcSaUhTlxZ2URrZV9xxvQN/EUwhom9slq7FvjftTRslzV
 Gvi77GC7mGjsOA9YtYIt93Ei4UwBAPw=
X-Google-Smtp-Source: APXvYqwx6+407C9x94FJoPzSVHCP0t2Zdj+mPwGij0zS69UFxmlYHwYXWRRcMX8TRc0mw6jEYgImGw==
X-Received: by 2002:a65:684c:: with SMTP id q12mr3654124pgt.405.1567700283561; 
 Thu, 05 Sep 2019 09:18:03 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:03 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 02/18] PCI: dra7xx: Fix legacy INTD IRQ handling
Date: Thu,  5 Sep 2019 10:17:43 -0600
Message-Id: <20190905161759.28036-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_091804_252907_2D16F3F1 
X-CRM114-Status: GOOD (  12.09  )
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

From: Vignesh R <vigneshr@ti.com>

commit 524d59f6e30aab5b618da55e604c802ccd83e708 upstream

Legacy INTD IRQ handling is broken on dra7xx due to fact that driver
uses hwirq in range of 1-4 for INTA, INTD whereas IRQ domain is of size
4 which is numbered 0-3. Therefore when INTD IRQ line is used with
pci-dra7xx driver following warning is seen:

       WARNING: CPU: 0 PID: 1 at kernel/irq/irqdomain.c:342 irq_domain_associate+0x12c/0x1c4
       error: hwirq 0x4 is too large for dummy

Fix this by using pci_irqd_intx_xlate() helper to translate the INTx 1-4
range into the 0-3 as done in other PCIe drivers.

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Reported-by: Chris Welch <Chris.Welch@viavisolutions.com>
Signed-off-by: Vignesh R <vigneshr@ti.com>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/pci/dwc/pci-dra7xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/dwc/pci-dra7xx.c b/drivers/pci/dwc/pci-dra7xx.c
index 63052c5e5f82..7f5dfa169d0f 100644
--- a/drivers/pci/dwc/pci-dra7xx.c
+++ b/drivers/pci/dwc/pci-dra7xx.c
@@ -227,6 +227,7 @@ static int dra7xx_pcie_intx_map(struct irq_domain *domain, unsigned int irq,
 
 static const struct irq_domain_ops intx_domain_ops = {
 	.map = dra7xx_pcie_intx_map,
+	.xlate = pci_irqd_intx_xlate,
 };
 
 static int dra7xx_pcie_init_irq_domain(struct pcie_port *pp)
@@ -270,7 +271,7 @@ static irqreturn_t dra7xx_pcie_msi_irq_handler(int irq, void *arg)
 	case INTC:
 	case INTD:
 		generic_handle_irq(irq_find_mapping(dra7xx->irq_domain,
-						    ffs(reg)));
+						    ffs(reg) - 1));
 		break;
 	}
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
