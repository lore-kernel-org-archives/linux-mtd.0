Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08546C00144
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Aug 2022 08:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iqyb/SV3G+O7WbPEuAp2rcwGEthf7Todk7bTufihdI4=; b=C/NJ8xpntuz/Ip
	o3ENznZ3YINAYRuX+xRelCed03ndulG4azlAg5f0e/O5R2X3t08KEXYExVSXpgFyVuRdsn4rngXaR
	1JcyCMz/KhVhjzIHkSAdFtwEUYVgYoTQEJtZJXZF5zQJSQRLD96DxoQivg3XIz6hWFOQGCnaXmfvF
	+YgHcC6ydjhqDepcZoxst1N+TQhsjsF/9CZop1yaKoMoWx1TynbtdBH/YwEmkrpaUlq64fHkq/cXa
	PV35az31rIE8evYUIS8Zu38uhPwHnUib7o0Ave5KvuS2Qg+uMNojYjKjSXCtgFp3GchKuux8866LH
	oDJYpZxCwFyRo/aE77PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIQNh-003jXa-Ak; Mon, 01 Aug 2022 08:02:29 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIQNd-003jRk-Bg
	for linux-mtd@lists.infradead.org; Mon, 01 Aug 2022 08:02:27 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Lx9W80CNJzjXnv;
	Mon,  1 Aug 2022 15:59:16 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 1 Aug 2022 16:02:15 +0800
Received: from huawei.com (10.67.174.33) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 1 Aug
 2022 16:02:15 +0800
From: "GONG, Ruiqi" <gongruiqi1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangweiyang2@huawei.com>, <gongruiqi1@huawei.com>
Subject: [PATCH] mtd: rawnand: denali: Fix a possible resource leak in denali_pci_probe
Date: Mon, 1 Aug 2022 16:03:15 +0800
Message-ID: <20220801080315.1713934-1-gongruiqi1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.33]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_010225_613360_9FB8F5C4 
X-CRM114-Status: UNSURE (   9.04  )
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

Call pci_release_regions() to retrieve the allocated resource when
devm_ioremap() or denali_init() failed.

Signed-off-by: GONG, Ruiqi <gongruiqi1@huawei.com>
---
 drivers/mtd/nand/raw/denali_pci.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index de7e722d3826..40943cda0914 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -74,21 +74,22 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		return ret;
 	}
 
+	ret = -ENOMEM;
 	denali->reg = devm_ioremap(denali->dev, csr_base, csr_len);
 	if (!denali->reg) {
 		dev_err(&dev->dev, "Spectra: Unable to remap memory region\n");
-		return -ENOMEM;
+		goto out_release_pci;
 	}
 
 	denali->host = devm_ioremap(denali->dev, mem_base, mem_len);
 	if (!denali->host) {
 		dev_err(&dev->dev, "Spectra: ioremap failed!");
-		return -ENOMEM;
+		goto out_release_pci;
 	}
 
 	ret = denali_init(denali);
 	if (ret)
-		return ret;
+		goto out_release_pci;
 
 	nsels = denali->nbanks;
 
@@ -116,6 +117,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 out_remove_denali:
 	denali_remove(denali);
+out_release_pci:
+	pci_release_regions(dev);
 	return ret;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
