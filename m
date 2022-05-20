Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82CAC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 20 May 2022 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OGu42tYD0xxbS74UwzggBW6vp4AK3KPHIC6D2S9Pgzg=; b=AGdTjk9RykUFef
	bD/6KXN9TeMV1ZNMz9jj1t1htD3gbXJ0t5Un1RYw0VfwYHF3FlMZXwZgb7V5Hr3CL4oAT8+wbHyI/
	5iRrgSYcBc33ZDulAD3RXNCDvuTPNWbcMdLrreYrC5+M99oaPMYfI+NJDNq1huvRpigOHLX2X9byJ
	Twzqrd8OhCfhpFEm225VvJ8HeqXD7E58ICu5T3HcJbnxLubmd30Mupri1boJmeMEolC4B2bAloREg
	yr/FDId1c5ZTAZoGw8sLbdc5SHRdacyO8q5HfWgz23p/D0+GTrRDY2TrB1EudOMM5OjjbZSDe5CcH
	IgYgJlh5StH/QKNs//aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nryK4-00BMnr-M4; Fri, 20 May 2022 08:49:24 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nryJz-00BMlw-TZ
 for linux-mtd@lists.infradead.org; Fri, 20 May 2022 08:49:22 +0000
Received: from kwepemi500023.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4L4L2w3fBTz1J9jS;
 Fri, 20 May 2022 16:47:52 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemi500023.china.huawei.com
 (7.221.188.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 20 May
 2022 16:49:15 +0800
From: Peng Wu <wupeng58@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <christophe.jaillet@wanadoo.fr>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, <liwei391@huawei.com>, <wupeng58@huawei.com>
Subject: [PATCH v2] mtd: rawnand: cafe: fix drivers probe/remove methods
Date: Fri, 20 May 2022 08:44:25 +0000
Message-ID: <20220520084425.116686-1-wupeng58@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500023.china.huawei.com (7.221.188.76)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_014920_154158_80CDB0A4 
X-CRM114-Status: UNSURE (   9.85  )
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

Driver should call pci_disable_device() if it returns from
cafe_nand_probe() with error.

Meanwhile, the driver calls pci_enable_device() in
cafe_nand_probe(), but never calls pci_disable_device()
during removal.

Signed-off-by: Peng Wu <wupeng58@huawei.com>
---
v2:
- fix the subject prefix with "mtd: ranwnand: cafe:"
---
 drivers/mtd/nand/raw/cafe_nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 9dbf031716a6..af119e376352 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -679,8 +679,10 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	pci_set_master(pdev);
 
 	cafe = kzalloc(sizeof(*cafe), GFP_KERNEL);
-	if (!cafe)
-		return  -ENOMEM;
+	if (!cafe) {
+		err = -ENOMEM;
+		goto out_disable_device;
+	}
 
 	mtd = nand_to_mtd(&cafe->nand);
 	mtd->dev.parent = &pdev->dev;
@@ -801,6 +803,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	pci_iounmap(pdev, cafe->mmio);
  out_free_mtd:
 	kfree(cafe);
+ out_disable_device:
+	pci_disable_device(pdev);
  out:
 	return err;
 }
@@ -822,6 +826,7 @@ static void cafe_nand_remove(struct pci_dev *pdev)
 	pci_iounmap(pdev, cafe->mmio);
 	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
 	kfree(cafe);
+	pci_disable_device(pdev);
 }
 
 static const struct pci_device_id cafe_nand_tbl[] = {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
