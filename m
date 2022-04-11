Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44174C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kqFTKkr18chH7eS1vwhKurVE1ydXZg/jnmPXnPXtWVE=; b=I8V4woZfKNAefB
	AQqqwk65qydYhTkKFSV5REBsErK//cfpRdZpfh6c8m4+3CTVPSUI6etYkzl4VEMR5ETdezi38brg/
	JUhRFtbPbhL16mdE1XjdykbusLHrkRyHN+1AwV4ztxhN419MRgLbNFUxof8+I8SHYcBXIapOJp9HY
	H+0kGQRRy0oF8N6NRhveauN8aDxevhDAVn6Y9hoR+s/lC01DomBOcu86Lq169vrKb5RuE/4EmH5Vg
	J6Q0HeLMpWqVVpPpL2KJRSA6B5QYtNmm0Yw5cyqIGOICxal8K+SZECVrZyNCVZDBkSK6aWfcwOLCx
	KtMRcffzmNngGWLMiBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndtcj-0094Vv-Bk; Mon, 11 Apr 2022 12:58:29 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndtcg-0094TV-3O
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 12:58:27 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso4552117pjb.5
 for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2022 05:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jvUy3wIA8cnoCdKDgRF9Rlg0AmSDmCIJ2fGS8gSJyKQ=;
 b=I8y5+JbyW76cCP6O8qlJOLg03kSxK+3z369dcJgu9adPP48NC7SmFG6tQjO5xp4YVB
 Jr1wvb+gjTco969BZGPZXf1WDRAvBRUsPoHruBZ7wmfSKBC1ensacAw67p7Q3FWEnpRY
 8/otECbNyY6cnknmopXTi7Prd4bGFv8JSjjAxvKHAYcoqI9imWDSeyyfjpPOVWpIRwmH
 bUYCThkS7Es0rw0kqXKUIhaMysho6Wdo6MWxN6zrBLOmjhN10xQCxBENpN/BfkkaUlKZ
 jEZHE2p1C/zTVt8UQorHTkKfBuavz5M/a7XzIX7HcRkix74Pt6vn8caDLKkKmiO82VEb
 H7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jvUy3wIA8cnoCdKDgRF9Rlg0AmSDmCIJ2fGS8gSJyKQ=;
 b=73xMlAXjnr9evFRh6pNFPBFE2hUE4NTy5cs8gd+gsoaWAOJZHE7EcsliIY4iZY8j3X
 8O9KYFK6fBU2pLIruujAJTBBYdiSRAOlUEAm7k8Rm60SBBkbVLSG96HFbAwo+B8Osh+e
 /1DrRE/p4A3HXSUdwrSXak/GVZQB6llGYN31aBnTJqKwAy8d6aBw+0fFZOKJYF60Zzlb
 ssf5kecs4AYtpcDjQxYw7ZlYaJNLV6FeJ4p+Mxo/NlWI2OOfn3eT34z/wxbGXMjfMzf0
 XCGsOS9TAvbEgbmGJtBKa77d2C/8NVKXAXdQE3mH3VAV3wCmbKmu4H9seV5Ka7Qj+4B1
 nRzg==
X-Gm-Message-State: AOAM530Tba55k8mCgzyhGiICqeSq5ufHP84/wsl8gORRXiH6Fxun8o9V
 +aDbiYo6AjFoarXFVs9Zlg==
X-Google-Smtp-Source: ABdhPJxlriaAILwrx11gZma2WuB92Mcj2z3Z++NBQ6RIWaRXbMxrHv4+XQQTW6MZ4MBxx4n1vGU81Q==
X-Received: by 2002:a17:90a:8591:b0:1b9:da10:2127 with SMTP id
 m17-20020a17090a859100b001b9da102127mr36488496pjn.13.1649681903018; 
 Mon, 11 Apr 2022 05:58:23 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a63aa06000000b00380c8bed5a6sm29314668pgf.46.2022.04.11.05.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 05:58:22 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zheyu Ma <zheyuma97@gmail.com>
Subject: [PATCH v2] mtd: rawnand: denali: Use managed device resources
Date: Mon, 11 Apr 2022 20:58:08 +0800
Message-Id: <20220411125808.958276-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_055826_196852_C5ED7C95 
X-CRM114-Status: GOOD (  13.59  )
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

All of the resources used by this driver has managed interfaces, so use
them. Otherwise we will get the following splat:

[    4.472703] denali-nand-pci 0000:00:05.0: timeout while waiting for irq 0x1000
[    4.474071] denali-nand-pci: probe of 0000:00:05.0 failed with error -5
[    4.473538] nand: No NAND device found
[    4.474068] BUG: unable to handle page fault for address: ffffc90005000410
[    4.475169] #PF: supervisor write access in kernel mode
[    4.475579] #PF: error_code(0x0002) - not-present page
[    4.478362] RIP: 0010:iowrite32+0x9/0x50
[    4.486068] Call Trace:
[    4.486269]  <IRQ>
[    4.486443]  denali_isr+0x15b/0x300 [denali]
[    4.486788]  ? denali_direct_write+0x50/0x50 [denali]
[    4.487189]  __handle_irq_event_percpu+0x161/0x3b0
[    4.487571]  handle_irq_event+0x7d/0x1b0
[    4.487884]  handle_fasteoi_irq+0x2b0/0x770
[    4.488219]  __common_interrupt+0xc8/0x1b0
[    4.488549]  common_interrupt+0x9a/0xc0

Fixes: 93db446a424c ("mtd: nand: move raw NAND related code to the raw/ subdir")
Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
Changes in v2:
    - Change the prefix
    - Delete the extra space
---
 drivers/mtd/nand/raw/denali_pci.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index 20c085a30adc..de7e722d3826 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -74,22 +74,21 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		return ret;
 	}
 
-	denali->reg = ioremap(csr_base, csr_len);
+	denali->reg = devm_ioremap(denali->dev, csr_base, csr_len);
 	if (!denali->reg) {
 		dev_err(&dev->dev, "Spectra: Unable to remap memory region\n");
 		return -ENOMEM;
 	}
 
-	denali->host = ioremap(mem_base, mem_len);
+	denali->host = devm_ioremap(denali->dev, mem_base, mem_len);
 	if (!denali->host) {
 		dev_err(&dev->dev, "Spectra: ioremap failed!");
-		ret = -ENOMEM;
-		goto out_unmap_reg;
+		return -ENOMEM;
 	}
 
 	ret = denali_init(denali);
 	if (ret)
-		goto out_unmap_host;
+		return ret;
 
 	nsels = denali->nbanks;
 
@@ -117,10 +116,6 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 out_remove_denali:
 	denali_remove(denali);
-out_unmap_host:
-	iounmap(denali->host);
-out_unmap_reg:
-	iounmap(denali->reg);
 	return ret;
 }
 
@@ -129,8 +124,6 @@ static void denali_pci_remove(struct pci_dev *dev)
 	struct denali_controller *denali = pci_get_drvdata(dev);
 
 	denali_remove(denali);
-	iounmap(denali->reg);
-	iounmap(denali->host);
 }
 
 static struct pci_driver denali_pci_driver = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
