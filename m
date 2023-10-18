Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFADCDB47E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 09:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lTVL2JodVSP8GN3LL9Bh6LbwmVoS84MbhUksPFix4n8=; b=A9GlSg2cTWTWhK
	9ErOUhbEw3pvddZ6PfV7+Jl8b0U25UhTlkbQg+60GLGrucag+OpcLNidvGewPOPudO+H6sJc95ggL
	it5PvOZNjyJ0hvcBUUxJRWI+3llFGUd0Ko14sHzrQ1ZAbQyF4VmcxayGzNKLAUhkgogO8TO+iputr
	zAjauz8YFNdKqXwmBAxLzaEXVJJGrMt91RmFLvLa2jq7hnHI1+S/0BzlnkLE5OY2jstbnbcFSnxM6
	tN/l+MpwGXeWU/UrXQi2iPjfaDvrGxU8v32RIc5BqR6lNxPJ/wXqETdeRfDEgh3aWzP8nE9sWTzjA
	isbFPAQPOcNEBS4KwEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt2r8-00EH8u-2l;
	Wed, 18 Oct 2023 09:28:46 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt2r6-00EH8S-0u
	for linux-mtd@lists.infradead.org;
	Wed, 18 Oct 2023 09:28:45 +0000
Received: from kwepemm000014.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4S9QR44ZHmzLp25;
	Wed, 18 Oct 2023 17:24:32 +0800 (CST)
Received: from huawei.com (10.67.174.78) by kwepemm000014.china.huawei.com
 (7.193.23.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 18 Oct
 2023 17:28:37 +0800
From: Yi Yang <yiyang13@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<u.kleine-koenig@pengutronix.de>, <tudor.ambarus@linaro.org>,
	<robh@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] mtd: powernv_flash: check return value of devm_kasprintf()
Date: Wed, 18 Oct 2023 09:27:28 +0000
Message-ID: <20231018092728.315071-1-yiyang13@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.78]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000014.china.huawei.com (7.193.23.6)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_022844_506413_78DBFB28 
X-CRM114-Status: UNSURE (   8.36  )
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

The devm_kasprintf() returns a pointer to dynamically allocated memory.
that will return NULL when allocate failed.
Fix it by check return value of devm_kasprintf().

Fixes: acfe63ec1c59 ("mtd: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Yi Yang <yiyang13@huawei.com>
---
 drivers/mtd/devices/powernv_flash.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 66044f4f5bad..b305e555ddbf 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -207,6 +207,10 @@ static int powernv_flash_set_driver_info(struct device *dev,
 	 * get them
 	 */
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFP", dev->of_node);
+	if (mtd->name) {
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
