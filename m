Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED1EC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jun 2022 09:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vHDkQfZpNHT7C0xLRqJSkuddcPYi4wDiVTmGAnHHyVc=; b=UHZv7lZX2EwQgc
	86afxeezKjcvU/mnQEOZ35sFcZrKLoGaYX4Wxkk+7/z0aBya0DEMjeZ7Yd4SM+dKFVJYc77FBiros
	MLGzXDcy1CAWLhhjZ033cU/vpy8SDZ5mgWTlBCUDA2oxlT5k5tTJQyvOLIiP1gAndtZQVhJGSY4MM
	v6leVC3yCO8pC9n4cAoO4jdZMCkOQy3WJflGxDfSkHVY/tSiU/o8r4qW9izi+V0E2Oo1PqiW+iYhi
	PeMSqJHj5eQ8YweUDq29FKQgs9B4sreJvj4BWvif1nnc4bgg7lXOhDRPnFzfp6YVReXaACrrsQjHR
	WK7wE1pP2zjVct+65t5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28Fv-006gCB-JN; Fri, 17 Jun 2022 09:27:07 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28Fr-006gAf-Q8
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2022 09:27:05 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:100b:81f8:e79f:4643])
	by laurent.telenet-ops.be with bizsmtp
	id k9Su270072Lt3zn019SunH; Fri, 17 Jun 2022 11:26:57 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o28Fh-004P52-Ja; Fri, 17 Jun 2022 11:26:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1o28Fg-008ty3-UY; Fri, 17 Jun 2022 11:26:52 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] mtd: hyperbus: rpc-if: Fix RPM imbalance in probe error path
Date: Fri, 17 Jun 2022 11:26:51 +0200
Message-Id: <f3070e1af480cb252ae183d479a593dbbf947685.1655457790.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_022704_019772_B628DB9C 
X-CRM114-Status: UNSURE (   9.97  )
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

If rpcif_hw_init() fails, Runtime PM is left enabled.

Fixes: b04cc0d912eb80d3 ("memory: renesas-rpc-if: Add support for RZ/G2L")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/mtd/hyperbus/rpc-if.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index 6e08ec1d4f098c80..b70d259e48a7c728 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -134,7 +134,7 @@ static int rpcif_hb_probe(struct platform_device *pdev)
 
 	error = rpcif_hw_init(&hyperbus->rpc, true);
 	if (error)
-		return error;
+		goto out_disable_rpm;
 
 	hyperbus->hbdev.map.size = hyperbus->rpc.size;
 	hyperbus->hbdev.map.virt = hyperbus->rpc.dirmap;
@@ -145,8 +145,12 @@ static int rpcif_hb_probe(struct platform_device *pdev)
 	hyperbus->hbdev.np = of_get_next_child(pdev->dev.parent->of_node, NULL);
 	error = hyperbus_register_device(&hyperbus->hbdev);
 	if (error)
-		rpcif_disable_rpm(&hyperbus->rpc);
+		goto out_disable_rpm;
+
+	return 0;
 
+out_disable_rpm:
+	rpcif_disable_rpm(&hyperbus->rpc);
 	return error;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
