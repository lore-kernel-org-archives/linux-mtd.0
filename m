Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ABAC3DA64
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2024 08:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sf4gAPQ/LRTOcI/M+OyWmmzSLRPF8UCeV4ahJDVxNaI=; b=BWQiXE/iRFvDEh
	CdVICr+9392lNnCOUI3cZCvKSeD0gW0XQn7QH1jh2Nt3JWISZpXLBlaf2aInNaqE4/o5HXTXpf5Js
	pqBRM0DanGCNkcsPyAmLLqsGh10JCEWKcwyyRnb15NPfAq1mJFB7OOd2wU1joIhtf8XU2ub8muOi5
	GlBI/7oHnVXb6oV3Cry/BHKfcOgh0sJ2iOfmYH1Vz6CF1I5lFH4MXr4r7RxPmXVb5BaShAEN98xZE
	a41yz2pPgTnc3Mh2K86E4oL3V5gOwqfNAY8WRma993CrP/0ifL8Zm5Yi0GkIjF7nx897e46IxXfWq
	J5Atge06++XT64Ru6W4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4OO-00000000Fxo-35Hz;
	Wed, 31 Jul 2024 08:09:04 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4OK-00000000Fwn-2tne
	for linux-mtd@lists.infradead.org;
	Wed, 31 Jul 2024 08:09:02 +0000
X-IronPort-AV: E=Sophos;i="6.09,250,1716217200"; 
   d="scan'208";a="214210295"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Jul 2024 17:08:53 +0900
Received: from localhost.localdomain (unknown [10.226.93.39])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B6E4041BF42C;
	Wed, 31 Jul 2024 17:08:50 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-mtd@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mtd: hyperbus: rpc-if: Add missing MODULE_DEVICE_TABLE
Date: Wed, 31 Jul 2024 09:08:40 +0100
Message-ID: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_010900_862985_CF42D9E0 
X-CRM114-Status: UNSURE (   9.54  )
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

The rpc-if-hyperflash driver can be compiled as a module, but lacks
MODULE_DEVICE_TABLE() and will therefore not be loaded automatically.
Fix this.

Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 Only compile tested. Changes are similar to [1]
 [1] https://lore.kernel.org/all/20240731072955.224125-1-biju.das.jz@bp.renesas.com/
---
 drivers/mtd/hyperbus/rpc-if.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index b22aa57119f2..e7a28f3316c3 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -163,9 +163,16 @@ static void rpcif_hb_remove(struct platform_device *pdev)
 	pm_runtime_disable(hyperbus->rpc.dev);
 }
 
+static const struct platform_device_id rpc_if_hyperflash_id_table[] = {
+	{ .name = "rpc-if-hyperflash" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, rpc_if_hyperflash_id_table);
+
 static struct platform_driver rpcif_platform_driver = {
 	.probe	= rpcif_hb_probe,
 	.remove_new = rpcif_hb_remove,
+	.id_table = rpc_if_hyperflash_id_table,
 	.driver	= {
 		.name	= "rpc-if-hyperflash",
 	},
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
