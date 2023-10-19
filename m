Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39C7CDB47E
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 01:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FWYwyJ1jk1uEc2UR2uWPsbDqChxoyijiC1UTL4AHqhg=; b=ygarx+oigVWlAe
	S5LaVQC2DkJm/fwNZ6HzH8n5DqIyNlSqpfDDxbVZ7GM6HloIDaPtE5nToPq3oOL6LB5I/ctzKcAii
	aERPCKjlKdBEWIaCsE/X1LdkWFxaQa42VNCzVaw8lxS4IiZVcC6iCqbd+Mm/ldZAsISs70U3Kmptb
	6bpgO0cL4Sj79B6JD2U58RVr5tNzR6xykzvYLeLjS1Ae3mrJfeeF3kVHNs2O2nqI4fQfK8l0cTIgj
	f1R2GwOwmYElYbd1IhfDcZUyfUyueIzcpGbxqH2hPteuiu4KjX5ybIihiUEPmQeYidWmdYo6gmhim
	ki32hK0qsqr3c4kvrYNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHtf-00G4GB-0t;
	Thu, 19 Oct 2023 01:32:23 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHtY-00G4F3-1T
	for linux-mtd@lists.infradead.org;
	Thu, 19 Oct 2023 01:32:20 +0000
Received: from kwepemm000014.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4S9qnx6hgGzvQBd;
	Thu, 19 Oct 2023 09:27:17 +0800 (CST)
Received: from huawei.com (10.67.174.78) by kwepemm000014.china.huawei.com
 (7.193.23.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 19 Oct
 2023 09:32:02 +0800
From: Yi Yang <yiyang13@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<u.kleine-koenig@pengutronix.de>, <tudor.ambarus@linaro.org>,
	<robh@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2] mtd: powernv_flash: check return value of devm_kasprintf()
Date: Thu, 19 Oct 2023 01:30:50 +0000
Message-ID: <20231019013050.316022-1-yiyang13@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.78]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000014.china.huawei.com (7.193.23.6)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_183216_725426_5D841470 
X-CRM114-Status: UNSURE (   9.10  )
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

devm_kasprintf() returns a pointer to dynamically allocated memory
which can be NULL upon failure. Ensure the allocation was successful by
checking the pointer validity.

Fixes: acfe63ec1c59 ("mtd: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Yi Yang <yiyang13@huawei.com>
---
 drivers/mtd/devices/powernv_flash.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 66044f4f5bad..956a79c739e5 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -207,6 +207,10 @@ static int powernv_flash_set_driver_info(struct device *dev,
 	 * get them
 	 */
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFP", dev->of_node);
+	if (!mtd->name) {
+		dev_err(dev, "failed to allocate mtd->name\n");
+		return -ENOMEM;
+	}
 	mtd->type = MTD_NORFLASH;
 	mtd->flags = MTD_WRITEABLE;
 	mtd->size = size;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
