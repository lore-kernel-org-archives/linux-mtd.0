Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAE3C38A2A
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 12:23:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DA702082E
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 12:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W00D/OMR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DA702082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=veX1sukmHY520Irkj8StrB1gVM7E+STbppOWyVQSaN0=; b=W00D/OMRM/ump4
	Zh1Otvaf1ruZnT5ffR2tkASidOvNxkouASWmILZis2SITsQ1qQs1tGr3rSB/7If0UtDuRWMDZKvp4
	XhUr4K8GFWb9xaVc5Gi/t+4a0zKYvLZeqUPmGC3DyEOZZlXGRcF7dXaMCeop22j1Y5Qzvtzg8gd7m
	ORXmCEXSwxlAyrskciG1sY9Hoj7/HEF+3eTbJhMpnxwDaea7Mm6us7ROnAuAGEN00GEUEFQZL9lZh
	o6zdl3E46NKOOQnsYxcFdG7rAN4pKc/KW8szX9XyweSeA+X/dSFh4hWA2B9L+zuOc+6T1xShAykyR
	klFZdHkyDCHaDc/o0nqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXkzF-0002Zj-1f; Sun, 10 May 2020 12:23:17 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXkpK-0005Sc-2z
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 12:13:03 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A000F2000F;
 Sun, 10 May 2020 12:12:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 37/62] mtd: rawnand: oxnas: Unregister all devices on error
Date: Sun, 10 May 2020 14:11:55 +0200
Message-Id: <20200510121220.18042-38-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510121220.18042-1-miquel.raynal@bootlin.com>
References: <20200510121220.18042-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_051302_288540_E5B0BC63 
X-CRM114-Status: GOOD (  10.70  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On error, the oxnas probe path just frees the device which failed and
aborts the probe, leaving unreleased resources.

Fix this situation by calling mtd_device_unregister()/nand_cleanup()
on these.

Fixes: 668592492409 ("mtd: nand: Add OX820 NAND Support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/oxnas_nand.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/raw/oxnas_nand.c b/drivers/mtd/nand/raw/oxnas_nand.c
index 4fadfa118582..25862d62f994 100644
--- a/drivers/mtd/nand/raw/oxnas_nand.c
+++ b/drivers/mtd/nand/raw/oxnas_nand.c
@@ -82,6 +82,7 @@ static int oxnas_nand_probe(struct platform_device *pdev)
 	struct resource *res;
 	int count = 0;
 	int err = 0;
+	int i;
 
 	/* Allocate memory for the device structure (and zero it) */
 	oxnas = devm_kzalloc(&pdev->dev, sizeof(*oxnas),
@@ -161,6 +162,13 @@ static int oxnas_nand_probe(struct platform_device *pdev)
 	nand_cleanup(chip);
 err_release_child:
 	of_node_put(nand_np);
+
+	for (i = 0; i < oxnas->nchips; i++) {
+		chip = oxnas->chips[i];
+		WARN_ON(mtd_device_unregister(nand_to_mtd(chip)));
+		nand_cleanup(chip);
+	}
+
 err_clk_unprepare:
 	clk_disable_unprepare(oxnas->clk);
 	return err;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
