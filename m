Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F867C32789
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Aug 2022 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERJZxtIZDDLcm5g8x5WOaI2Bz6BfjmZZqG3xSM9kgFs=; b=0cWiGursPt3jAw
	2xAmQ3EzzyBgxP8Cft+zIlKw3ZGGmwUFdBNdTBW6zJNiDaUdGA/ZBxXGey4BoxVF2Kls7lZl5OxKl
	BhaRnBLksWMPhmgMhToxgwLGnFoCEOheD3hBLSysrp8ZcQ50fDUnJFCno3b4Qnuy5ET324JtqFlcm
	dUHYMYfz84T3avPQegToQOH/r0hA9iGx9+/uaxiW+Slpjf538Kw3VBv/DM/SBYmyh0JNohYaN8/le
	t8Y2xZnbfNC7G5VsjZMWvS7l7ya5HQZ7UQfVQPdg46xhrKJ5c7u2I+oH+VtvrxutmGqpbLKKBc3Xy
	DdslTH/TQsvZV1c2032w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ3cX-006x1b-2Q; Mon, 22 Aug 2022 09:21:21 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ3bP-006w4Q-9m; Mon, 22 Aug 2022 09:20:12 +0000
Received: from droid11-sz.amlogic.com (10.28.8.21) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2507.6; Mon, 22 Aug 2022
 17:19:48 +0800
From: Liang Yang <liang.yang@amlogic.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
CC: Liang Yang <liang.yang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	Victor Wan <victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng
	<bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v8 3/5] mtd: rawnand: meson: refine resource getting in probe
Date: Mon, 22 Aug 2022 17:18:35 +0800
Message-ID: <20220822091838.18528-4-liang.yang@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822091838.18528-1-liang.yang@amlogic.com>
References: <20220822091838.18528-1-liang.yang@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.21]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_022011_458500_A4AD572D 
X-CRM114-Status: UNSURE (   9.49  )
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

simply use devm_platform_ioremap_resource_byname() instead of two steps:
res = platform_get_resource(pdev, IORESOURCE_MEM, 0) and
reg_base = devm_ioremap_resource(dev, res)

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Liang Yang <liang.yang@amlogic.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index cc93667a1e7f..6e50387475bb 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1378,7 +1378,6 @@ static int meson_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_nfc *nfc;
-	struct resource *res;
 	int ret, irq;
 
 	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
@@ -1395,8 +1394,7 @@ static int meson_nfc_probe(struct platform_device *pdev)
 
 	nfc->dev = dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	nfc->reg_base = devm_ioremap_resource(dev, res);
+	nfc->reg_base = devm_platform_ioremap_resource_byname(pdev, "nfc");
 	if (IS_ERR(nfc->reg_base))
 		return PTR_ERR(nfc->reg_base);
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
