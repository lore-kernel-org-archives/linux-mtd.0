Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69927C52D7B
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2024 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KtLU1wk5PNREI2zwzRYCCUrMiki9Eie7VcUkAqpl8RA=; b=DeUyoM6QnBoc33
	yvZ4TaLxkQs3j6XKRjSSs0VQyUf0H3BKdaB6n3T/rqWoZT6p6FJClZ3c17P/xIviMEqbfAJ6RWGUc
	0owbYS+SOZAfJEVasLLCtxaCmahDZTNVGeSxZepsD4T02Gxpcfs45j8dsMTkqdMtdlAxx1Aagr4Tv
	GHli6gj+EDT9cjTIz7s4g1Sgva6u9V57jU81s1y1gjVP7BhxQcfjvTdrqq+AS6BfgXL4f/8mYITKd
	fwL/4GxM642vDnNdcaKXESjhg6NIzt5b7u5zKTWqe3idjHHIKJdAzvLYGXxQZYT4nsWpQihXUS8qU
	k26/NR/6TBL3pq34jn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seCRk-00000006pS6-2neb;
	Wed, 14 Aug 2024 11:45:44 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAQx-00000006QKn-0FRE
	for linux-mtd@lists.infradead.org;
	Wed, 14 Aug 2024 09:36:48 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WkNNT39tJz1HGSC;
	Wed, 14 Aug 2024 17:33:29 +0800 (CST)
Received: from kwepemd100013.china.huawei.com (unknown [7.221.188.163])
	by mail.maildlp.com (Postfix) with ESMTPS id BA4C31A016C;
	Wed, 14 Aug 2024 17:36:33 +0800 (CST)
Received: from huawei.com (10.67.174.121) by kwepemd100013.china.huawei.com
 (7.221.188.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 14 Aug
 2024 17:36:33 +0800
From: Chen Ridong <chenridong@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH -next] denali_pci: Fix missing pci_release_regions in probe and remove
Date: Wed, 14 Aug 2024 09:28:54 +0000
Message-ID: <20240814092854.3109192-1-chenridong@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.121]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd100013.china.huawei.com (7.221.188.163)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_023647_380631_03BFD53F 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

The pci_release_regions was miss at error case, just add it.

Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 drivers/mtd/nand/raw/denali_pci.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index de7e722d3826..e22094e39546 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -77,18 +77,20 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	denali->reg = devm_ioremap(denali->dev, csr_base, csr_len);
 	if (!denali->reg) {
 		dev_err(&dev->dev, "Spectra: Unable to remap memory region\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto regions_release;
 	}
 
 	denali->host = devm_ioremap(denali->dev, mem_base, mem_len);
 	if (!denali->host) {
 		dev_err(&dev->dev, "Spectra: ioremap failed!");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto regions_release;
 	}
 
 	ret = denali_init(denali);
 	if (ret)
-		return ret;
+		goto regions_release;
 
 	nsels = denali->nbanks;
 
@@ -116,6 +118,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 out_remove_denali:
 	denali_remove(denali);
+regions_release:
+	pci_release_regions(dev);
 	return ret;
 }
 
@@ -123,6 +127,7 @@ static void denali_pci_remove(struct pci_dev *dev)
 {
 	struct denali_controller *denali = pci_get_drvdata(dev);
 
+	pci_release_regions(dev);
 	denali_remove(denali);
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
