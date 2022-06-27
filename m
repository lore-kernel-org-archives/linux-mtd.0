Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16055CCA473
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jun 2022 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yx38mQ494zOR6O/CVtZ6OfsTPyjUKyUn0ZH8SUVC81o=; b=SAnZ6KhtZ5oXnQ
	7Bj/rTCj14o29SudT4GUADXwnYeZRK92/3mpMBY9xccoHKRh4fbcEUq+J6O15YMae5+tks2EfcWkd
	rIe5GKE0ZZI/uToYITNWgnlzE/fIgmMWQXvdULy4/8Zg1vcGbPd+45waIrXu2bQHYT9jZZFXZAAvc
	NnSaXLsRnqlIUHvAFiO95j+7Cd4fyRLt0Tn/bxpjm3/lzKyvYEn0FhB6dZv1Qh6Hl+Xd55nAgQKYE
	JIuLuhy5abLneFvC0BsjS0TRJdaI6bOlDHEkjgXN8x+EBiM0T/W71I8YF6u/dsEe4Gs1jPl2GbYq3
	/ms8b49mRMqPKnCc2/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5qiB-001efZ-5a; Mon, 27 Jun 2022 15:31:39 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5qi0-001eXg-F6
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2022 15:31:31 +0000
Received: from ramsan.of.borg ([84.195.186.194])
	by xavier.telenet-ops.be with bizsmtp
	id oFXH2700S4C55Sk01FXHaj; Mon, 27 Jun 2022 17:31:23 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o5qhp-0014ye-0o; Mon, 27 Jun 2022 17:31:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o5qho-004jF0-J1; Mon, 27 Jun 2022 17:31:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Cc: Mark Brown <broonie@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/7] memory: renesas-rpc-if: Reinitialize registers during system resume
Date: Mon, 27 Jun 2022 17:31:14 +0200
Message-Id: <923c057c77b146710a82d486f89ce3a8ebda7ccd.1656341824.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656341824.git.geert+renesas@glider.be>
References: <cover.1656341824.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_083128_671714_5B7226FC 
X-CRM114-Status: GOOD (  14.76  )
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

During PSCI system suspend, R-Car Gen3 SoCs may be powered down, and
thus the RPC-IF register state may be lost.  Consequently, when using
the RPC-IF after system resume, data corruption may happen.

Fix this by reinitializing the hardware state during system resume.
As this requires resuming the RPC-IF core device, this can only be done
when the device is under active control of the HyperBus or SPI child
driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/memory/renesas-rpc-if.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index ec76e603ad24d214..2a49d4511c8296c5 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -757,6 +757,20 @@ static int rpcif_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int rpcif_resume(struct device *dev)
+{
+	struct rpcif_priv *rpc = dev_get_drvdata(dev);
+
+	if (!pm_runtime_enabled(dev)) {
+		/* Not yet activated or deactivated by child device */
+		return 0;
+	}
+
+	return rpcif_hw_init(dev, rpc->bus_size == 2);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rpcif_pm_ops, NULL, rpcif_resume);
+
 static const struct of_device_id rpcif_of_match[] = {
 	{ .compatible = "renesas,rcar-gen3-rpc-if", .data = (void *)RPCIF_RCAR_GEN3 },
 	{ .compatible = "renesas,rzg2l-rpc-if", .data = (void *)RPCIF_RZ_G2L },
@@ -770,6 +784,7 @@ static struct platform_driver rpcif_driver = {
 	.driver = {
 		.name =	"rpc-if",
 		.of_match_table = rpcif_of_match,
+		.pm = pm_sleep_ptr(&rpcif_pm_ops),
 	},
 };
 module_platform_driver(rpcif_driver);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
