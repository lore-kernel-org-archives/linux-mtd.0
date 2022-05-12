Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D21C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 18:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=paaaFMLhMFhnQOG2ICHaU8e8Fg7evk3m4PwwQHb+fdA=; b=Q8UjYzLVACZMQi
	Fi+wC5tf/twEQ5hqXdIdtjl8TXKq+AHZG/6+cM5M5d9zwyJsWfOtpyKif1RpOYcHWbq6uBSYCnqEo
	yZVu0bPVobnkZr7oJQQWWUn+iXUT54CkUoIG7bRfh1ZM6AhiA+LBcyRqT2Cl4d+h1gblk0S6Pq0fr
	NezvTDUjsi8M9XBtJMfZ/+YdLTqBw9f1MYp36VnNDZpIj/4WBQ+J3EgXfzOmQeajrt49feTYZ7gC7
	+Yndj3LyrhvBm6TCrpg6aYe5Oby0K+MAa2i45JBYzkbSn6vz+Boehi6o/6OLCl7EQr16UG52s4vO+
	vf4shfl5S259EwzfO45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npDpM-00D8OZ-5J; Thu, 12 May 2022 18:46:20 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npDpB-00D8Kw-BK; Thu, 12 May 2022 18:46:11 +0000
X-IronPort-AV: E=Sophos;i="5.91,220,1647270000"; d="scan'208";a="119513527"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 13 May 2022 03:46:04 +0900
Received: from localhost.localdomain (unknown [10.226.93.50])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id A141E400C737;
 Fri, 13 May 2022 03:46:01 +0900 (JST)
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
 Richard Weinberger <richard@nod.at>, Yihao Han <hanyihao@vivo.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH] mtd: rawnand: rockchip: Check before clk_disable_unprepare()
 not needed
Date: Thu, 12 May 2022 19:45:58 +0100
Message-Id: <20220512184558.45966-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_114609_537521_2B0F32C6 
X-CRM114-Status: GOOD (  11.07  )
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

All code in clk_disable_unprepare() already checks the clk ptr using
IS_ERR_OR_NULL so there is no need to check it again before calling it.
A lot of other drivers already rely on this behaviour, so it's safe
to do so here.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
Note: this has not been tested at all
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index cbaa4f1c83da..f133985cc053 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -911,8 +911,7 @@ static int rk_nfc_enable_clks(struct device *dev, struct rk_nfc *nfc)
 	ret = clk_prepare_enable(nfc->ahb_clk);
 	if (ret) {
 		dev_err(dev, "failed to enable ahb clk\n");
-		if (!IS_ERR(nfc->nfc_clk))
-			clk_disable_unprepare(nfc->nfc_clk);
+		clk_disable_unprepare(nfc->nfc_clk);
 		return ret;
 	}
 
@@ -921,8 +920,7 @@ static int rk_nfc_enable_clks(struct device *dev, struct rk_nfc *nfc)
 
 static void rk_nfc_disable_clks(struct rk_nfc *nfc)
 {
-	if (!IS_ERR(nfc->nfc_clk))
-		clk_disable_unprepare(nfc->nfc_clk);
+	clk_disable_unprepare(nfc->nfc_clk);
 	clk_disable_unprepare(nfc->ahb_clk);
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
