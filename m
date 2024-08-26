Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF394C5321E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 02:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KtLU1wk5PNREI2zwzRYCCUrMiki9Eie7VcUkAqpl8RA=; b=KseeiWqrMTdw7Q
	hnsikouZxpKBfkh4KP/NLWcayel19RquCgXUn/LbugQNcj+oFOTOIaZYu7mWpzPCiBxodHVyuqkAk
	3oZYZ9lcfqzyY36qXYZlunPQk7Y5CzHKWYancYtCyIg9K6ivkOJwvLLOGRaogFigBJllnJMVtbJ8a
	HZ/GPUegkhLu715Zt/nqGiRaB04wHKG6NPivFZ8CTdmQzrTr57JDK3uuW9S/mKowGjuDtxREDCilY
	aRtWJGN7LN+zDw4tBUSJdDPXeh4QTIcyVV/10j2MNVk087JIMbbCTXtPLWaI7RAL0RYTlxDuuCeBC
	3ukrgMl/g8QvjKBuIMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siPpL-00000005aGa-48Ym;
	Mon, 26 Aug 2024 02:51:32 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siPpJ-00000005aFs-2Lzu
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 02:51:31 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WsZtr4WDbz2CnXt;
	Mon, 26 Aug 2024 10:51:16 +0800 (CST)
Received: from kwepemd100013.china.huawei.com (unknown [7.221.188.163])
	by mail.maildlp.com (Postfix) with ESMTPS id E8AE8180043;
	Mon, 26 Aug 2024 10:51:24 +0800 (CST)
Received: from huawei.com (10.67.174.121) by kwepemd100013.china.huawei.com
 (7.221.188.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 26 Aug
 2024 10:51:24 +0800
From: Chen Ridong <chenridong@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<chenridong@huaweicloud.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 -next] mtd: rawnand: denali: Fix missing pci_release_regions in probe and remove
Date: Mon, 26 Aug 2024 02:43:39 +0000
Message-ID: <20240826024339.476921-1-chenridong@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.121]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd100013.china.huawei.com (7.221.188.163)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_195129_864243_D69D26D9 
X-CRM114-Status: UNSURE (   8.99  )
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
