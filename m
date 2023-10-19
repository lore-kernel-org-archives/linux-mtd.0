Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EEBCDB482
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w2BMgva8p+w/akTYJLozTjKWhI6oC7QzJnIDhNcBeEg=; b=Zf7sK+4LSXMW5j
	z844UWIAQFHTc3f7Exu+DY3wuGFkAzLjNlS3p82XNodrm6ch26BHK1sXA4GSSikynka+UK/aQnOZr
	op967W1AfWC3UDbKlWzjujHy3vCQb/+vk1HTugY1QoaTebKigPpqjzyedBnX2FyZiO3UeOoz5CO2Z
	zvS6oCgeD/N5YPU5f0yzJrHxWIknjbkxC7G23czSKmptwJ7ewC2thsaFci8/7hNPlvx90Y69P+8yA
	dMq4sHZ4xRtCd3OjDJzk+Hb0o3vzJ6RFb3rp4nlfkDJbSL6uT8Hklr2p+zRuSlzpkHo7x/iib/QUm
	Gemrv6aeS69NBLbdI6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMy1-00GXw8-01;
	Thu, 19 Oct 2023 06:57:13 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMxv-00GXtO-2S;
	Thu, 19 Oct 2023 06:57:09 +0000
Received: from kwepemm000014.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4S9z1d0835zLpGY;
	Thu, 19 Oct 2023 14:52:52 +0800 (CST)
Received: from huawei.com (10.67.174.78) by kwepemm000014.china.huawei.com
 (7.193.23.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 19 Oct
 2023 14:56:58 +0800
From: Yi Yang <yiyang13@huawei.com>
To: <liang.yang@amlogic.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>
Subject: [PATCH v3] mtd: rawnand: meson: check return value of devm_kasprintf()
Date: Thu, 19 Oct 2023 06:55:48 +0000
Message-ID: <20231019065548.318443-1-yiyang13@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.78]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000014.china.huawei.com (7.193.23.6)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_235708_009778_71845DAC 
X-CRM114-Status: UNSURE (   7.38  )
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

Fixes: 1e4d3ba66888 ("mtd: rawnand: meson: fix the clock")
Signed-off-by: Yi Yang <yiyang13@huawei.com>
---
v2:Change commit log, and fix error check code.
v3:No need for error messages upon memory allocation failures.
---
 drivers/mtd/nand/raw/meson_nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 378f28ce6a74..71ec4052e52a 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1134,6 +1134,9 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
 	init.name = devm_kasprintf(nfc->dev,
 				   GFP_KERNEL, "%s#div",
 				   dev_name(nfc->dev));
+	if (!init.name)
+		return -ENOMEM;
+
 	init.ops = &clk_divider_ops;
 	nfc_divider_parent_data[0].fw_name = "device";
 	init.parent_data = nfc_divider_parent_data;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
