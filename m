Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C0CCCA473
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jun 2022 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Wb4Y5AX+1k/YgnV6mobZS7dHGWc9BzFqUEJcomiObg=; b=gQBThwqo3dSHCj
	bjGQMfQwjeg+fFhhdnog90Zm9r16eVbGXm4pabv5DJIRAihRB/wfE24mBIjzU6n28I6n4KWIvKcLL
	Bs8tks95rUKEQNyw6KYG9meYS7pna8P4I9pa+nDEiHXRey3A74eUNXawWxUaq42CH0hjGoakHX8fG
	UTwHNCaxDq6n16fSTImKAo5VY4wzpnVMPG+cBXK6HY0pTiWBZf+hVE7NCzNhYrWgb930fcQ7uQBLF
	fuqLkd7qpFxvJxyGh6ULY3tK8lgzcBp/N2Pr5ymLhn2Ux0KCjuaeTNOhCyUHAGC2QcnpeskdMlDTn
	T/89Wm5/O9tKSJKk7uMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5qiJ-001enh-V2; Mon, 27 Jun 2022 15:31:48 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5qi0-001eXj-FP
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2022 15:31:32 +0000
Received: from ramsan.of.borg ([84.195.186.194])
	by baptiste.telenet-ops.be with bizsmtp
	id oFXH2700d4C55Sk01FXHZH; Mon, 27 Jun 2022 17:31:23 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o5qho-0014ya-WF; Mon, 27 Jun 2022 17:31:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o5qho-004jEZ-GC; Mon, 27 Jun 2022 17:31:16 +0200
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
Subject: [PATCH 3/7] memory: renesas-rpc-if: Improve Runtime PM handling
Date: Mon, 27 Jun 2022 17:31:10 +0200
Message-Id: <88fa4252bb685e9a9eb6e70fe2df32bb6243d405.1656341824.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656341824.git.geert+renesas@glider.be>
References: <cover.1656341824.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_083128_688487_13DD3572 
X-CRM114-Status: GOOD (  12.12  )
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
 drivers/memory/renesas-rpc-if.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 2421a820e3c5880c..55dbb3854b09ad43 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -300,12 +300,13 @@ static void rpcif_rzg2l_timing_adjust_sdr(struct rpcif *rpc)
 int rpcif_hw_init(struct rpcif *rpc, bool hyperflash)
 {
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
@@ -469,7 +470,9 @@ int rpcif_manual_xfer(struct rpcif *rpc)
 	u32 smenr, smcr, pos = 0, max = rpc->bus_size == 2 ? 8 : 4;
 	int ret = 0;
 
-	pm_runtime_get_sync(rpc->dev);
+	ret = pm_runtime_resume_and_get(rpc->dev);
+	if (ret < 0)
+		return ret;
 
 	regmap_update_bits(rpc->regmap, RPCIF_PHYCNT,
 			   RPCIF_PHYCNT_CAL, RPCIF_PHYCNT_CAL);
@@ -636,11 +639,14 @@ ssize_t rpcif_dirmap_read(struct rpcif *rpc, u64 offs, size_t len, void *buf)
 {
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
