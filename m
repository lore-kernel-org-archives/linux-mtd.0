Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CC5C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Mar 2022 14:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LoOSu0t/i/iOpDDVCY5R90ipBx4AongZp4SyzF0Yq/o=; b=CGB+ID4EMqG72f
	xfv/6oGfMSLl6LO2uNYmLkDh/JdPyBL71PDOOJJYo2ALBAtlP5ErheeIZy2nZFZLaFh/Uo3AlWjka
	OzBX/v7WiNx26zhCZ0JfxAGdSx02jXaPNEmqr6xEuL8Ej1a1av9/aqmWOhzqWi2RGxZed8t9qk8qP
	un2vCRA0hI8H0I28K8bgs+WD5f8/mFdZul4eZMLwlKGS5vX1o5Jr+uoSguDyDDrsGIacyPQ6Xb9Qv
	y1c+bJ3CuyG3Rbv62F5LgzpMJkM98RZ4MePgwaJqrmSkZhAlbNrgV1nVpz1VUSeV0TEMtEecPWSKl
	BtOLCdDYXXbBp3gENRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZCP7-00CRRg-Eq; Tue, 29 Mar 2022 14:01:04 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZCOv-00CRPA-Ea
 for linux-mtd@lists.infradead.org; Tue, 29 Mar 2022 14:00:50 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
 by baptiste.telenet-ops.be with bizsmtp
 id CE0h2701F49QC4401E0is4; Tue, 29 Mar 2022 16:00:44 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nZCOn-007HIU-Ab; Tue, 29 Mar 2022 16:00:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nZCOm-00CLAZ-Qe; Tue, 29 Mar 2022 16:00:40 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Biju Das <biju.das.jz@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] spi: rpc-if: Fix RPM imbalance in probe error path
Date: Tue, 29 Mar 2022 16:00:39 +0200
Message-Id: <1c78a1f447d019bb66b6e7787f520ae78821e2ae.1648562287.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <d196bb5849843993557a9b10f3bd28a752e5e8e0.1648562287.git.geert+renesas@glider.be>
References: <d196bb5849843993557a9b10f3bd28a752e5e8e0.1648562287.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_070049_689835_95273A17 
X-CRM114-Status: GOOD (  11.71  )
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
---
For the spi tree.

 drivers/spi/spi-rpc-if.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-rpc-if.c b/drivers/spi/spi-rpc-if.c
index fe82f3575df4f386..24ec1c83f379ceec 100644
--- a/drivers/spi/spi-rpc-if.c
+++ b/drivers/spi/spi-rpc-if.c
@@ -158,14 +158,18 @@ static int rpcif_spi_probe(struct platform_device *pdev)
 
 	error = rpcif_hw_init(rpc, false);
 	if (error)
-		return error;
+		goto out_disable_rpm;
 
 	error = spi_register_controller(ctlr);
 	if (error) {
 		dev_err(&pdev->dev, "spi_register_controller failed\n");
-		rpcif_disable_rpm(rpc);
+		goto out_disable_rpm;
 	}
 
+	return 0;
+
+out_disable_rpm:
+	rpcif_disable_rpm(rpc);
 	return error;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
