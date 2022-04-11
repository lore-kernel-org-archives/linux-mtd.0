Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45454C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 11:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ts1INYemaPjVvj0nDXKW+wjE7UpwatyU04L919yOUTo=; b=KkTDpd88A5s1UB
	Rx0hgY8u4hQjHHcguxf4eEOVsbAHkItc8erRS+dygXpI5IClTwLHw/PTlbqROLnInS42vgNiRRTVZ
	rzFCOVxlycinDfLZVLUHnnxTcdFCMNEIV51N1Gf0/Ut1BzCI4eeck81Dwn/soyNh0jf4v4vj0oGkC
	pxtMVh9h9L7++5VK3dxyKiDG4687ldr04FvEWLKCpNyEJ9izkgHf7F3+6JWdUOcGTvLVP+9LJBR3p
	3POSHX9FQEyBLPqmiXaiMKBeq66h6To7ntIzAKqHRDfgCE2HgBD2E+dw7kX+JeX/t5LoSOf+9e1Iy
	Admi6g11ndbEaFH1ssCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nds8l-008efk-S7; Mon, 11 Apr 2022 11:23:28 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nds75-008deC-Og
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 11:21:45 +0000
Received: by mail-pf1-x435.google.com with SMTP id p8so14312389pfh.8
 for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2022 04:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ct0KPIwIFBFQvI2RK89Mz30dFbD3GIANQnxanM+V5Hk=;
 b=pIsrbL6usz31jkne7q1tPeu0ne1pxxjoT9uAJd0h3YObyCn1tzb/VLB/xZdUVld6lS
 nNppWDpT6aGeR9pBBW8TIQgIbbS61uE0mv5TMr3iN7jRsITnU0mkdH9BIz8Ty+wjFg6y
 x8syGq/uRIQ4F/KNpRE4sOwmu7HvaNg+Jb/ZEJNCQTiRc1a6IVDotCUiutJnP2kiVnuc
 7VFRyA862wDCxEU5N21FTg3TwaeC6Oynh/oJrndTiubYW/l0WIizvOYjqtZQTblopDU9
 do18EQGK8mjffeEdwBfZX/W8l0g4aE9zgrQ8LSTs9qN2BjDBsYSC3nzqBb7HrbnB46NE
 I04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ct0KPIwIFBFQvI2RK89Mz30dFbD3GIANQnxanM+V5Hk=;
 b=K4EAv78G5cYhvreswv0fkbwVHU23q94KG6v1mTDW4CDrO7xT8RoaYWk+hhChJC8dUQ
 5ad86OrgDjV711Tcer6UwMG0x0aA1jz3s3di6+/UQ47zM8o+48KS5+D4CRmrhBe7Q4RL
 wCWJnQVzRSSJnn2faN6UZAcpscJMDSO1FJCOsMFTeQ1woyH9OnwbQ9b2V3oYLUmQYV6M
 dC8cONwndfVG0zBH/V6psGFMr0k5JlWws7cjhyVFzaIfLjzaIb9HyZGLsRNJF9tSvenY
 /PwkNdyTvfcGfrubq4b+0SmBM9Ks4xZqUBZcF5+nbkxnk4f5tAo2j+dcMWqLEfZAI/nu
 NhFg==
X-Gm-Message-State: AOAM531szyOhrNfcztcuvDXMS2xWLXKlEp1VOhFHMwOfjLWuVqZoyaTH
 ohEH9wNm9HQuL2+rRjxRYA==
X-Google-Smtp-Source: ABdhPJzBOeLgMjpOYtSe2jCq3H+Z3APHHfpZ1ubpgpgwVcb/nNz6K1twzSPaimOwZoj9jFdHzg7vNg==
X-Received: by 2002:a63:5f42:0:b0:39d:4f86:2f59 with SMTP id
 t63-20020a635f42000000b0039d4f862f59mr4132369pgb.181.1649676102588; 
 Mon, 11 Apr 2022 04:21:42 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a63de43000000b0039d1172b90fsm7365844pgi.76.2022.04.11.04.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 04:21:42 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zheyu Ma <zheyuma97@gmail.com>
Subject: [PATCH] mtd: rawnand: Use managed device resources
Date: Mon, 11 Apr 2022 19:21:24 +0800
Message-Id: <20220411112124.3700126-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_042143_861098_F487B3C0 
X-CRM114-Status: GOOD (  12.62  )
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
