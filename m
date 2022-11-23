Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00D4C4167D
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 14:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBIdnwRJwFWOGsqRngWePKAfGuIPfkMTlOkhNBbOauc=; b=h+4Kt+0biu/zQt
	nhzPnH/7yCfmYQLU7LVRgDlZcPR3eV/SalqKpJYbymGK46/vs/5vE8pPaSgjSCy3JtyTtBL4mMf57
	ACPNG9dnhGaQelBIba+sLz6ewCXlV8d9Yum42OU2kPEXyf75ZA5jZ4P3gqQR89Im0+oyycJPnPggP
	hHid5tH8hrOJmOhffAEfT/TBtpnk8/LrgWcMgipv/dEtnCfRqVypKoqbLEgYRqD0D70a4b0Iiija8
	nx0RohjwwlG+q2LlroLEpcFL5u0nY7W9qdsmrGS8FAcnDhVRJIxE+kyAU7cai/p3mvgp5vS2WiVbP
	dD3CxmWdQhDbVRd6Jbcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqxb-0007mq-Jq; Wed, 23 Nov 2022 14:42:47 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqwR-0007W9-Pd
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2022 14:41:38 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:881b:815b:474d:c3fd])
	by laurent.telenet-ops.be with bizsmtp
	id nqhS2800e49U0Rd01qhSaN; Wed, 23 Nov 2022 15:41:30 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oxqwI-001Rqi-06; Wed, 23 Nov 2022 15:41:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oxqwH-0012HT-3W; Wed, 23 Nov 2022 15:41:25 +0100
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
Subject: [PATCH v2 3/6] memory: renesas-rpc-if: Always use dev in rpcif_probe()
Date: Wed, 23 Nov 2022 15:41:19 +0100
Message-Id: <298009c43ad119703f564c0f1864743914b4beeb.1669213027.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669213027.git.geert+renesas@glider.be>
References: <cover.1669213027.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_064136_091337_027C7E9C 
X-CRM114-Status: GOOD (  12.30  )
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

rpcif_probe() already has a "dev" variable pointing to the right device
structure, so there is no need to take a detour through the platform
device.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Combination of the old "memory: renesas-rpc-if: Always use dev in
    rpcif_sw_init()" and "memory: renesas-rpc-if: Add dev helper to
    rpcif_probe()" after rebasing on top of the two fixes.
---
 drivers/memory/renesas-rpc-if.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 42c5f9f10135b86a..83171242f9514c22 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -688,9 +688,9 @@ static int rpcif_probe(struct platform_device *pdev)
 	const char *name;
 	int ret;
 
-	flash = of_get_next_child(pdev->dev.of_node, NULL);
+	flash = of_get_next_child(dev->of_node, NULL);
 	if (!flash) {
-		dev_warn(&pdev->dev, "no flash node found\n");
+		dev_warn(dev, "no flash node found\n");
 		return -ENODEV;
 	}
 
@@ -700,12 +700,12 @@ static int rpcif_probe(struct platform_device *pdev)
 		name = "rpc-if-hyperflash";
 	} else	{
 		of_node_put(flash);
-		dev_warn(&pdev->dev, "unknown flash type\n");
+		dev_warn(dev, "unknown flash type\n");
 		return -ENODEV;
 	}
 	of_node_put(flash);
 
-	rpc = devm_kzalloc(&pdev->dev, sizeof(*rpc), GFP_KERNEL);
+	rpc = devm_kzalloc(dev, sizeof(*rpc), GFP_KERNEL);
 	if (!rpc)
 		return -ENOMEM;
 
@@ -734,9 +734,9 @@ static int rpcif_probe(struct platform_device *pdev)
 	vdev = platform_device_alloc(name, pdev->id);
 	if (!vdev)
 		return -ENOMEM;
-	vdev->dev.parent = &pdev->dev;
+	vdev->dev.parent = dev;
 
-	rpc->dev = &pdev->dev;
+	rpc->dev = dev;
 	rpc->vdev = vdev;
 	platform_set_drvdata(pdev, rpc);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
