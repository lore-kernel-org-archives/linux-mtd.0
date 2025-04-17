Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E89CC369C7
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Apr 2025 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FrSpbtjc92AM9zatYu27/J2fIpVM/jRt/hQVBALSt6o=; b=4F9nhePKxfLV2g
	ZBc4RHjIJkCPpruH6/cOMBY9BUtOEMsQohDTigFjdCITdqXobKiyJYRUgBA+hWEUW3bUNHUyeZnqM
	Ut9qpVhR2dRiDh5GrKbIPdDqNbRgWHvT4OLJopoQyJKXTJlz4NiuaDGCtmaFv8DOiJ0ivlGSvccmD
	OXY2J5CKD0OgQoXJZGhCSCB+d3D9MRDdY+FGatYYj6P/BwsS3z3uYA3Zqn2sFbZ1u3XoJfwyS29M/
	BoyZ3PpNP3npisaHrzSEvkaZA23SU4EBizKLdljnhYsTilh8z/iVkFb1XqqG/WhbYFOaGucprjNeI
	UdGUKj+GfsFQ4kWaiOcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Le8-0000000CU3u-1HWB;
	Thu, 17 Apr 2025 09:35:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Le5-0000000CU38-1IsS
	for linux-mtd@lists.infradead.org;
	Thu, 17 Apr 2025 09:34:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE83149B9F;
	Thu, 17 Apr 2025 09:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6F3C4CEE4;
	Thu, 17 Apr 2025 09:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744882496;
	bh=SLuUfDIO7cZe92f/PvJjXwcgVz9jB9iB3ae1mxy5siQ=;
	h=From:To:Cc:Subject:Date:From;
	b=E2OdS8bSDxd5VSj9ScQQOgsRSBzc2FyB1mUrToGDK9cXd8p7EPd3vMQEITpnJCEiJ
	 87GzxIneRIS8LrLmhspkNF4Uim1sv6No7eLB053OS5y5pbQWVYELeJHODRx9zIm6la
	 SF7Mwg84GQkPhGTrurAQM0ntEusher9uOjBy31JDDoUfu/5gujv6WOeNIhoVDoKiyX
	 1yU0jOiE8jxCtqpawqMQnyN7vPjdGIBf+HdoDhsNzWvqVkIHlqnndfevspYbZH//29
	 gNw+bRJanl+P8HroROu8fFwGvfg5QG7R82RNbi+9/d48NvgNE8fei7Xyj1pGQVKyrn
	 hmeaZAf0HQg1g==
From: Philipp Stanner <phasta@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Philipp Stanner <phasta@kernel.org>,
	Chen Ridong <chenridong@huawei.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: Use non-hybrid PCI devres API
Date: Thu, 17 Apr 2025 11:34:29 +0200
Message-ID: <20250417093428.28571-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_023457_365983_F69B1AFC 
X-CRM114-Status: GOOD (  12.21  )
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

denali_pci.c enables a PCI device with pcim_enable_device(). This,
implicitly, switches the function pci_request_regions() into managed
mode, where it becomes a devres function.

The PCI subsystem wants to remove this hybrid nature from its
interfaces. To do so, users of the aforementioned combination of
functions must be ported to non-hybrid functions.

Moreover, since both functions are already managed in this driver, the
calls to pci_release_regions() are unnecessary.

Remove the calls to pci_release_regions().

Replace the call to sometimes-managed pci_request_regions() with one to
the always-managed pcim_request_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/mtd/nand/raw/denali_pci.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index e22094e39546..97fa32d73441 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -68,7 +68,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	denali->clk_rate = 50000000;		/* 50 MHz */
 	denali->clk_x_rate = 200000000;		/* 200 MHz */
 
-	ret = pci_request_regions(dev, DENALI_NAND_NAME);
+	ret = pcim_request_all_regions(dev, DENALI_NAND_NAME);
 	if (ret) {
 		dev_err(&dev->dev, "Spectra: Unable to request memory regions\n");
 		return ret;
@@ -77,20 +77,18 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	denali->reg = devm_ioremap(denali->dev, csr_base, csr_len);
 	if (!denali->reg) {
 		dev_err(&dev->dev, "Spectra: Unable to remap memory region\n");
-		ret = -ENOMEM;
-		goto regions_release;
+		return -ENOMEM;
 	}
 
 	denali->host = devm_ioremap(denali->dev, mem_base, mem_len);
 	if (!denali->host) {
 		dev_err(&dev->dev, "Spectra: ioremap failed!");
-		ret = -ENOMEM;
-		goto regions_release;
+		return -ENOMEM;
 	}
 
 	ret = denali_init(denali);
 	if (ret)
-		goto regions_release;
+		return ret;
 
 	nsels = denali->nbanks;
 
@@ -118,8 +116,6 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 out_remove_denali:
 	denali_remove(denali);
-regions_release:
-	pci_release_regions(dev);
 	return ret;
 }
 
@@ -127,7 +123,6 @@ static void denali_pci_remove(struct pci_dev *dev)
 {
 	struct denali_controller *denali = pci_get_drvdata(dev);
 
-	pci_release_regions(dev);
 	denali_remove(denali);
 }
 
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
