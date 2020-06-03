Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CA9C433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:50:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1486206A2
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:50:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="alSXZRyo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1486206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDGNHohIRImIllmHTt5PobpsZTWLUYRR4+EEeEUajbg=; b=alSXZRyocCzELK
	a5bOqvje09GEtFxKUcm6Oovgw9XpL2d41wvvWpQAuR2uNzhJW9svgzBftcQUzlVX3B17X9QL4XQZr
	gSQ1Iq+S8mnFrrQK+0l2+Z/cyShqOgYV6mYlF8Mxs2H7t9u0gJMbfisdDdQAbzNeJyulZP2xQq31G
	MpTp4EOHkZd9+Fp3NuwZ6IRDZt8n9ukEYragoeZF6Jn/szZV7X+E7K8BcuUf+7mYthesEiiMnwSks
	B+VvB5rRo09oMCJhYaLl4CYitus8N9l0xiTZ1SJvwDH9NwAyIziyrGOWf4cNndJ9iD34veB7lDnTe
	f1PqTox3GFnLPJ3BMpow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgTmv-00052t-4T; Wed, 03 Jun 2020 13:50:37 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgTlo-0001ii-Q7
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 13:49:30 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 202BF2A3D69;
 Wed,  3 Jun 2020 14:49:27 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Anton Vorontsov <anton@enomsg.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 03/10] mtd: rawnand: fsl_upm: Allocate the fsl_upm_nand object
 using devm_kzalloc()
Date: Wed,  3 Jun 2020 15:49:15 +0200
Message-Id: <20200603134922.1352340-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200603134922.1352340-1-boris.brezillon@collabora.com>
References: <20200603134922.1352340-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_064928_969395_83FE403D 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This simplifies the init error patch and remove function.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index 6eba2f4a2f5a..9cf79c62ef22 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -205,36 +205,34 @@ static int fun_probe(struct platform_device *ofdev)
 	int size;
 	int i;
 
-	fun = kzalloc(sizeof(*fun), GFP_KERNEL);
+	fun = devm_kzalloc(&ofdev->dev, sizeof(*fun), GFP_KERNEL);
 	if (!fun)
 		return -ENOMEM;
 
 	ret = of_address_to_resource(ofdev->dev.of_node, 0, &io_res);
 	if (ret) {
 		dev_err(&ofdev->dev, "can't get IO base\n");
-		goto err1;
+		return ret;
 	}
 
 	ret = fsl_upm_find(io_res.start, &fun->upm);
 	if (ret) {
 		dev_err(&ofdev->dev, "can't find UPM\n");
-		goto err1;
+		return ret;
 	}
 
 	prop = of_get_property(ofdev->dev.of_node, "fsl,upm-addr-offset",
 			       &size);
 	if (!prop || size != sizeof(uint32_t)) {
 		dev_err(&ofdev->dev, "can't get UPM address offset\n");
-		ret = -EINVAL;
-		goto err1;
+		return -EINVAL;
 	}
 	fun->upm_addr_offset = *prop;
 
 	prop = of_get_property(ofdev->dev.of_node, "fsl,upm-cmd-offset", &size);
 	if (!prop || size != sizeof(uint32_t)) {
 		dev_err(&ofdev->dev, "can't get UPM command offset\n");
-		ret = -EINVAL;
-		goto err1;
+		return -EINVAL;
 	}
 	fun->upm_cmd_offset = *prop;
 
@@ -244,7 +242,7 @@ static int fun_probe(struct platform_device *ofdev)
 		fun->mchip_count = size / sizeof(uint32_t);
 		if (fun->mchip_count >= NAND_MAX_CHIPS) {
 			dev_err(&ofdev->dev, "too much multiple chips\n");
-			goto err1;
+			return -EINVAL;
 		}
 		for (i = 0; i < fun->mchip_count; i++)
 			fun->mchip_offsets[i] = be32_to_cpu(prop[i]);
@@ -306,8 +304,6 @@ static int fun_probe(struct platform_device *ofdev)
 			break;
 		gpio_free(fun->rnb_gpio[i]);
 	}
-err1:
-	kfree(fun);
 
 	return ret;
 }
@@ -330,8 +326,6 @@ static int fun_remove(struct platform_device *ofdev)
 		gpio_free(fun->rnb_gpio[i]);
 	}
 
-	kfree(fun);
-
 	return 0;
 }
 
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
