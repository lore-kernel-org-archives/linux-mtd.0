Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449A7C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 14:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2c7bHglxgdLUjj/Oycw59AMt7h6X5teXCY8CBQ60/wc=; b=10xfQqM/poJpqy
	QNOwDq+/Y96iFc0M95oFSFnrvoBeutv8i/8QFA65jNTf731GP1RaqmQRfoWvjcN81scL/tsp0pVbG
	/dMzjpZ7SHxofPRfsKrnq7j0ttx6iuTYPO04GMkbZHYbVmeV9z6hALmV4prk3guwB4bPnpA4Mcaea
	OVmgQ6zjAJ+ZMIECr68q4JKHGEaoT/+HILtIiXAG+7SIyWGu0Bk6tsORe781R79J307e27s7xfrkH
	g484I69YvGPjVVDqkkWcb2mO9Z/EJ/PWl4oF3KMKD1EwSaweFh0+rPiQL/MaYDwy/QruDzZzJX2fj
	p1DZgKr7sXoisDuUp5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqws-0007aX-2w; Wed, 23 Nov 2022 14:42:02 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqwR-0007W2-Pa
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2022 14:41:38 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:881b:815b:474d:c3fd])
	by michel.telenet-ops.be with bizsmtp
	id nqhS2800R49U0Rd06qhSXG; Wed, 23 Nov 2022 15:41:30 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oxqwH-001Rqj-SD; Wed, 23 Nov 2022 15:41:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oxqwH-0012Hb-4O; Wed, 23 Nov 2022 15:41:25 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Mark Brown <broonie@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 4/6] memory: renesas-rpc-if: Improve Runtime PM handling
Date: Wed, 23 Nov 2022 15:41:20 +0100
Message-Id: <6f2bd3b2b3d98c5bed541d969900b2ad04f93943.1669213027.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669213027.git.geert+renesas@glider.be>
References: <cover.1669213027.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_064136_114781_46960CF4 
X-CRM114-Status: GOOD (  12.17  )
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

Convert from the deprecated pm_runtime_get_sync() to the new
pm_runtime_resume_and_get(), and add error checking.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/memory/renesas-rpc-if.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 83171242f9514c22..9346dcc29a36662e 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -304,12 +304,13 @@ int rpcif_hw_init(struct rpcif *rpcif, bool hyperflash)
 {
 	struct rpcif_priv *rpc = dev_get_drvdata(rpcif->dev);
 	u32 dummy;
+	int ret;
 
-	pm_runtime_get_sync(rpc->dev);
+	ret = pm_runtime_resume_and_get(rpc->dev);
+	if (ret)
+		return ret;
 
 	if (rpc->type == RPCIF_RZ_G2L) {
-		int ret;
-
 		ret = reset_control_reset(rpc->rstc);
 		if (ret)
 			return ret;
@@ -482,7 +483,9 @@ int rpcif_manual_xfer(struct rpcif *rpcif)
 	u32 smenr, smcr, pos = 0, max = rpc->bus_size == 2 ? 8 : 4;
 	int ret = 0;
 
-	pm_runtime_get_sync(rpc->dev);
+	ret = pm_runtime_resume_and_get(rpc->dev);
+	if (ret < 0)
+		return ret;
 
 	regmap_update_bits(rpc->regmap, RPCIF_PHYCNT,
 			   RPCIF_PHYCNT_CAL, RPCIF_PHYCNT_CAL);
@@ -650,11 +653,14 @@ ssize_t rpcif_dirmap_read(struct rpcif *rpcif, u64 offs, size_t len, void *buf)
 	struct rpcif_priv *rpc = dev_get_drvdata(rpcif->dev);
 	loff_t from = offs & (rpc->size - 1);
 	size_t size = rpc->size - from;
+	int ret;
 
 	if (len > size)
 		len = size;
 
-	pm_runtime_get_sync(rpc->dev);
+	ret = pm_runtime_resume_and_get(rpc->dev);
+	if (ret < 0)
+		return ret;
 
 	regmap_update_bits(rpc->regmap, RPCIF_CMNCR, RPCIF_CMNCR_MD, 0);
 	regmap_write(rpc->regmap, RPCIF_DRCR, 0);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
