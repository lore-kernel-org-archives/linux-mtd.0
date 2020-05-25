Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571ACC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:00:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C7F9206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:00:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EBbSYwR+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C7F9206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=63Z7cznqkblDUwqm5iIogBdpJLNKoKcrUq1S5j6li8U=; b=EBbSYwR+ptxiyH
	v7QBc8oQPG72NFUwAFJiWmY2tYsgInEn1uq5h5uEPobU0l3tLvhORN4DGke2FJbZctSlOWV83HgES
	VRfCYeefQmkSRQiilOal9el80KdoaA4jQ0rEs+j729mlbz30lzkDf94fFPz6u5V/3EIqogbXEzgDb
	9RafSfVSEqnKMIl+01jgx+M13xwx3UOPox072hHR6gr4RX6htDFYOVqV8y30noCOrWvTm/3gHOjrN
	Op0DmRbiw3bzKmdEeG9G8i1+hVZLbwzJvLMC5BTWpnIn6JKwbI1x70zBs56sjLUQQ9eGCfQkk0q96
	7TEuXC4b3GF/zbWCrLAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd8y9-0008DJ-7x; Mon, 25 May 2020 09:00:25 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8wn-0004Oj-FT
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 08:59:03 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5250C24001C;
 Mon, 25 May 2020 08:58:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 04/17] mtd: rawnand: nandsim: Clean error handling
Date: Mon, 25 May 2020 10:58:38 +0200
Message-Id: <20200525085851.17682-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525085851.17682-1-miquel.raynal@bootlin.com>
References: <20200525085851.17682-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_015901_853530_3558BCE2 
X-CRM114-Status: GOOD (  14.19  )
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

Many function calls are done this way:

        if ((retval = func()) != 0)
	        return retval;

while we expect in the kernel function calls like:

        retval = func();
	if (retval)
	        return retval;

Apply this change where possible and also use "ret" instead of
"retval" in ns_init_module for consistency, as it is only used in this
function.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nandsim.c | 46 ++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 2c335cc8bcdf..5b427a50bc27 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -739,7 +739,8 @@ static int __init ns_init(struct mtd_info *mtd)
 	printk("sector address bytes: %u\n",    ns->geom.secaddrbytes);
 	printk("options: %#x\n",                ns->options);
 
-	if ((ret = ns_alloc_device(ns)) != 0)
+	ret = ns_alloc_device(ns);
+	if (ret)
 		return ret;
 
 	/* Allocate / initialize the internal buffer */
@@ -1747,7 +1748,7 @@ static void ns_switch_state(struct nandsim *ns)
 
 		NS_DBG("switch_state: operation is unknown, try to find it\n");
 
-		if (ns_find_operation(ns, 0) != 0)
+		if (!ns_find_operation(ns, 0))
 			return;
 
 		if ((ns->state & ACTION_MASK) &&
@@ -2243,7 +2244,7 @@ static int __init ns_init_module(void)
 {
 	struct nand_chip *chip;
 	struct nandsim *ns;
-	int retval = -ENOMEM, i;
+	int ret, i;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -2276,7 +2277,7 @@ static int __init ns_init_module(void)
 		break;
 	default:
 		NS_ERR("bbt has to be 0..2\n");
-		retval = -EINVAL;
+		ret = -EINVAL;
 		goto error;
 	}
 	/*
@@ -2302,21 +2303,24 @@ static int __init ns_init_module(void)
 
 	nsmtd->owner = THIS_MODULE;
 
-	if ((retval = ns_parse_weakblocks()) != 0)
+	ret = ns_parse_weakblocks();
+	if (ret)
 		goto error;
 
-	if ((retval = ns_parse_weakpages()) != 0)
+	ret = ns_parse_weakpages();
+	if (ret)
 		goto error;
 
-	if ((retval = ns_parse_gravepages()) != 0)
+	ret = ns_parse_gravepages();
+	if (ret)
 		goto error;
 
 	nand_controller_init(&ns->base);
 	ns->base.ops = &ns_controller_ops;
 	chip->controller = &ns->base;
 
-	retval = nand_scan(chip, 1);
-	if (retval) {
+	ret = nand_scan(chip, 1);
+	if (ret) {
 		NS_ERR("Could not scan NAND Simulator device\n");
 		goto error;
 	}
@@ -2330,7 +2334,7 @@ static int __init ns_init_module(void)
 
 		if (new_size >> overridesize != nsmtd->erasesize) {
 			NS_ERR("overridesize is too big\n");
-			retval = -EINVAL;
+			ret = -EINVAL;
 			goto err_exit;
 		}
 
@@ -2342,25 +2346,29 @@ static int __init ns_init_module(void)
 		chip->pagemask = (targetsize >> chip->page_shift) - 1;
 	}
 
-	if ((retval = ns_setup_wear_reporting(nsmtd)) != 0)
+	ret = ns_setup_wear_reporting(nsmtd);
+	if (ret)
 		goto err_exit;
 
-	if ((retval = ns_init(nsmtd)) != 0)
+	ret = ns_init(nsmtd);
+	if (ret)
 		goto err_exit;
 
-	if ((retval = nand_create_bbt(chip)) != 0)
+	ret = nand_create_bbt(chip);
+	if (ret)
 		goto err_exit;
 
-	if ((retval = ns_parse_badblocks(ns, nsmtd)) != 0)
+	ret = ns_parse_badblocks(ns, nsmtd);
+	if (ret)
 		goto err_exit;
 
 	/* Register NAND partitions */
-	retval = mtd_device_register(nsmtd, &ns->partitions[0],
-				     ns->nbparts);
-	if (retval != 0)
+	ret = mtd_device_register(nsmtd, &ns->partitions[0], ns->nbparts);
+	if (ret)
 		goto err_exit;
 
-	if ((retval = ns_debugfs_create(ns)) != 0)
+	ret = ns_debugfs_create(ns);
+	if (ret)
 		goto err_exit;
 
         return 0;
@@ -2374,7 +2382,7 @@ static int __init ns_init_module(void)
 	kfree(ns);
 	ns_free_lists();
 
-	return retval;
+	return ret;
 }
 
 module_init(ns_init_module);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
