Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E42CDB47E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 09:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SEb2k+9LNGuQZ5LKlDpT3HP0GnFhVdYde1P8T/XX7u8=; b=CBW70DQtBLHYw3
	x9TP0aI+fGJGFMrBEHYq8qdiQSvVRw479VWAHsqjRBM53LIqeKH3bx0dIhSKNrnQon1xqReisZxC3
	Yxk/2PdFXd64A9XTqz8qYBfmvaFJWUbvalYCooO8mi4cr8f33kLqWAk3XfJ34BIm71HTM5vAavJCN
	ozv8W47eud/WHEJcMdLA0UfAU9ASlk28sN4r7z/UpCicMXsfaWjPBibJRmoXbkaMaWLJZkoRqrrd2
	GmUnGb1omlVWZqhUTZ5sUCdkAhipoDztU52KKpoN1Q9yadanC2a4RncXEXOqRkwjBSLnd9itE8Ker
	/vVHyIyrRoZgj/fPU0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt2ki-00EGQC-3D;
	Wed, 18 Oct 2023 09:22:08 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt2ke-00EGPK-2g;
	Wed, 18 Oct 2023 09:22:06 +0000
Received: from kwepemm000014.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S9QHs3s06zRt5p;
	Wed, 18 Oct 2023 17:18:17 +0800 (CST)
Received: from huawei.com (10.67.174.78) by kwepemm000014.china.huawei.com
 (7.193.23.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 18 Oct
 2023 17:21:57 +0800
From: Yi Yang <yiyang13@huawei.com>
To: <liang.yang@amlogic.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>
Subject: [PATCH] mtd: rawnand: meson: check return value of devm_kasprintf()
Date: Wed, 18 Oct 2023 09:20:47 +0000
Message-ID: <20231018092047.314860-1-yiyang13@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.78]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000014.china.huawei.com (7.193.23.6)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_022205_109145_DE2ABA0D 
X-CRM114-Status: UNSURE (   7.73  )
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

Fixes: 1e4d3ba66888 ("mtd: rawnand: meson: fix the clock")
Signed-off-by: Yi Yang <yiyang13@huawei.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 378f28ce6a74..2c6ae781bb0c 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1134,6 +1134,11 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
 	init.name = devm_kasprintf(nfc->dev,
 				   GFP_KERNEL, "%s#div",
 				   dev_name(nfc->dev));
+	if (init.name) {
+		dev_err(nfc->dev, "failed to allocate init.name\n");
+		return -ENOMEM;
+	}
+
 	init.ops = &clk_divider_ops;
 	nfc_divider_parent_data[0].fw_name = "device";
 	init.parent_data = nfc_divider_parent_data;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
