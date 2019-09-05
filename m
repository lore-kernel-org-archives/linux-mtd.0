Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E302C43331
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:20:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD13C2137B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:20:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N76gM9YE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K5DiiY2F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD13C2137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fl7uVcmyOtyItyzbUcdr617lr1wye8UTYfDQAaZveJw=; b=N76gM9YE+JSbJNF7lnxV2JsQtm
	NATZ2yxl28jaujGJ+LNtv59XkbA9Qm7pKCabsn5sEDn3RLM+SftbEklP+cM8v5EFRhDi0ZdbCzcFl
	ZARh2J9OzCwW+TuyPwkQOSdrJ0iTLavN6/1BZtczwsI1eodWFoKKYHz8db3zJXgsH1dmY1933JB77
	SNxR3xM3gK5O4mecU32S9aUJhWplP9s74gCoRy6oin14HFjlTw1acjcHy3UZghvbi2XNGnd74tZ5r
	MmuP2C75awaW0m+KM6bEMMQP11DKCo260GqypRqtl9JCOQOPZK+JcwqnJ/GPy1wLBWBJVDFAUbxeH
	5+JRy73w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5uUl-00050E-In; Thu, 05 Sep 2019 16:20:27 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5uSc-00014j-Q6
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 16:18:16 +0000
Received: by mail-pf1-x444.google.com with SMTP id s12so2071790pfe.6
 for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2019 09:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tpqdWISBmI7/K+eXW/BM3B61WGwPfixYNx9jyTHk1dU=;
 b=K5DiiY2Fgz6MUrPKTtz10HsJkolwwVvGrdqBD69mgIMaQbkMXiTRCgCbb2ZyUxaTSS
 TsurgVMOb8XwbIXgdyeF+rfzsvnXsAM1sHLEQ4y5Ke840f0eEdtxvvN3Pb5ZdVwNLiXE
 UV+r4cWr5AN6DgFXtNn2GrDrgfsbA6uZcFqrnHfIbgan0lx/1+ZKIyh6gDp63fdh/v9I
 KCxMrdpVzkF4eB9dCxcnzu4IORv5zjU09dggJmJTVefvcrHEGmUqyNXgA3hCndJldZef
 81oH34LbhykA0VcHebAOIDd2RLBykltXAikm9fusMU2Bx4GGt+Kmw89s92q1rKZ+QSBQ
 hcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tpqdWISBmI7/K+eXW/BM3B61WGwPfixYNx9jyTHk1dU=;
 b=jLXCsatU/F75n0tKHauOSJCqo0PFwb0XGjLRnmbtQYzCHtnZaWG1MATvJrFKSmNyJD
 HqHnb7h3YJR+RbxJdRO5yJOr4L80sh8wPwzqcDcbKoXl0RWKZ7dDAdqA3fTCfg9dGiY5
 TVtujXrS4TZXN+3ik06sMMCSnLJLxzM4f7uRK9yEVa0Y7bRLaVEbrA+4VAqJ1pPSDWAy
 nTD8y9BM1nxh0SHRjVCgqG1cT58lPjMETshClOnO6T/O40m1BqL6mUflC+TPsdj5ySFL
 jWJATWNRWJFAfZxzf7WeA7w6lVFQARON0ADpHpo05n9iIlqznRwE9+JATuLgiTKWXwzl
 mRnw==
X-Gm-Message-State: APjAAAXpnDO9MxUCvhcLpNe3jG8OiTMERy++uqtZKtCh/oiDPtnAJ3Hc
 geKw2fKfQFwuGs9qO2QuKMdWVg==
X-Google-Smtp-Source: APXvYqzLPzIYaG0mi1vPeoIIvWEzHscZk32TWtoUUzrIK69h3pf7m60GZNfheMkCm5xxBpsI0LrElA==
X-Received: by 2002:aa7:8e08:: with SMTP id c8mr849847pfr.238.1567700294324;
 Thu, 05 Sep 2019 09:18:14 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:13 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 11/18] misc: pci_endpoint_test: Fix BUG_ON error
 during pci_disable_msi()
Date: Thu,  5 Sep 2019 10:17:52 -0600
Message-Id: <20190905161759.28036-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_091814_951208_4C8C9FA9 
X-CRM114-Status: GOOD (  10.86  )
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

From: Kishon Vijay Abraham I <kishon@ti.com>

commit b7636e816adcb52bc96b6fb7bc9d141cbfd17ddb upstream

pci_disable_msi() throws a Kernel BUG if the driver has successfully
requested an IRQ and not released it. Fix it here by freeing IRQs before
invoking pci_disable_msi().

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/misc/pci_endpoint_test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index 504fa680825d..230f1e8538dc 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -92,6 +92,7 @@ struct pci_endpoint_test {
 	void __iomem	*bar[6];
 	struct completion irq_raised;
 	int		last_irq;
+	int		num_irqs;
 	/* mutex to protect the ioctls */
 	struct mutex	mutex;
 	struct miscdevice miscdev;
@@ -514,6 +515,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 		irq = pci_alloc_irq_vectors(pdev, 1, 32, PCI_IRQ_MSI);
 		if (irq < 0)
 			dev_err(dev, "failed to get MSI interrupts\n");
+		test->num_irqs = irq;
 	}
 
 	err = devm_request_irq(dev, pdev->irq, pci_endpoint_test_irqhandler,
@@ -581,6 +583,9 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 			pci_iounmap(pdev, test->bar[bar]);
 	}
 
+	for (i = 0; i < irq; i++)
+		devm_free_irq(dev, pdev->irq + i, test);
+
 err_disable_msi:
 	pci_disable_msi(pdev);
 	pci_release_regions(pdev);
@@ -594,6 +599,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 static void pci_endpoint_test_remove(struct pci_dev *pdev)
 {
 	int id;
+	int i;
 	enum pci_barno bar;
 	struct pci_endpoint_test *test = pci_get_drvdata(pdev);
 	struct miscdevice *misc_device = &test->miscdev;
@@ -609,6 +615,8 @@ static void pci_endpoint_test_remove(struct pci_dev *pdev)
 		if (test->bar[bar])
 			pci_iounmap(pdev, test->bar[bar]);
 	}
+	for (i = 0; i < test->num_irqs; i++)
+		devm_free_irq(&pdev->dev, pdev->irq + i, test);
 	pci_disable_msi(pdev);
 	pci_release_regions(pdev);
 	pci_disable_device(pdev);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
