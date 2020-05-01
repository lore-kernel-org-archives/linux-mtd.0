Return-Path: <SRS0=+Ogn=6P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D9CC47253
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 14:41:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 566A520708
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 14:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mXiFA7nF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 566A520708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hKb9+FdPNNV6EPjOYEpFOipWldv+vBQixm1mOJ6IE8I=; b=mXiFA7nFJJwajV
	5o/Vb+Our3wARYf4Z8ECGPk7OISbh72Y5xSRrlBm+C0K+PWYNPmiuuVhYurUIx2eNPVM45wIMLvTZ
	pTzSVbf2iYlSO8rmLtiaViQXxsce+uPKMQc8XsSPwsfAaRd/HLlQevfbHSRUJaf2sp4+XzXVnyAU3
	ga9BzcqNxj0wf2e1f6PTtZlQpUoEbbQGEvSYYq328cQEz10fABWkr6dvbQrGmoZJ2vrUu1jWQD051
	oIF0TDOkV9NFDYQlRJfBzNZr6FAim2UPbal2DU42EbbMOk16O7lDs/kVrSg8+NgVSvyV02VKIs47Q
	c7ru3/6gui7w/UOIHPQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUWqc-0004fW-9s; Fri, 01 May 2020 14:41:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUWp5-0000qG-W3
 for linux-mtd@lists.infradead.org; Fri, 01 May 2020 14:39:30 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8DA9B2A30CC;
 Fri,  1 May 2020 15:39:24 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 3/5] mtd: rawnand: diskonchip: Inherit from nand_controller
Date: Fri,  1 May 2020 16:39:15 +0200
Message-Id: <20200501143917.1388957-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200501143917.1388957-1-boris.brezillon@collabora.com>
References: <20200501143917.1388957-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_073928_161756_D4FDDE19 
X-CRM114-Status: GOOD (  12.27  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Stop relying on the dummy controller object embedded in nand_chip.legacy
and explicitly inherit from nand_controller.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 7d9542de37a7..b670b2a3d719 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -58,6 +58,7 @@ static unsigned long doc_locations[] __initdata = {
 static struct mtd_info *doclist = NULL;
 
 struct doc_priv {
+	struct nand_controller base;
 	void __iomem *virtadr;
 	unsigned long physadr;
 	u_char ChipID;
@@ -1550,6 +1551,7 @@ static int __init doc_probe(unsigned long physadr)
 		goto fail;
 	}
 
+	nand_controller_init(&doc->base);
 	mtd			= nand_to_mtd(nand);
 	nand->bbt_td		= (struct nand_bbt_descr *) (doc + 1);
 	nand->bbt_md		= nand->bbt_td + 1;
@@ -1557,6 +1559,7 @@ static int __init doc_probe(unsigned long physadr)
 	mtd->owner		= THIS_MODULE;
 	mtd_set_ooblayout(mtd, &doc200x_ooblayout_ops);
 
+	nand->controller	= &doc->base;
 	nand_set_controller_data(nand, doc);
 	nand->legacy.select_chip	= doc200x_select_chip;
 	nand->legacy.cmd_ctrl		= doc200x_hwcontrol;
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
