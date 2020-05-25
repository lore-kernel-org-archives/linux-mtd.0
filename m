Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37ADC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:03:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E506206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:03:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IYx4D7Fg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E506206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YG+BLxOmRZcynM/lZgIGanK88RD++FV2l1EvfLdDQLM=; b=IYx4D7Fg4lKQSc
	h/g5XyEs5Ds7joiYZTlaTrxZ1UOaytjzjqlUmGc6jqAC4ToMYY2lZ2o7r5fI+AkCTC7e3Wx52lK82
	Gv8PPvOiFKZOlpso4S6Qb1m0qDrKJ36d+re5zEUeVJB6eouFZ3LG+gKC28mjGk7yZDzsWLNpHcmWq
	2LGvVzMlE01aGO7rJZet3nCaU1vrzbBxA4Op9xofa/ErkrHsKf+3i98iy1AyvPq75TYeiSCaPHX4Z
	u46ietiOvYPZ2Zl4dZtbiARg/w7rqsw8QPRPU5LVSyMOGV/OZL4li0heK1PqOxnGSnTA1YD2AM8a+
	JdBJnuPiMTnSRhGS2b4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd90g-0002TE-IY; Mon, 25 May 2020 09:03:02 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8x2-0004eR-If
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 08:59:18 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 14A7324000B;
 Mon, 25 May 2020 08:59:13 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 14/17] mtd: rawnand: nandsim: Fix the label pointing on
 nand_cleanup()
Date: Mon, 25 May 2020 10:58:48 +0200
Message-Id: <20200525085851.17682-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525085851.17682-1-miquel.raynal@bootlin.com>
References: <20200525085851.17682-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_015916_806210_DDD80684 
X-CRM114-Status: GOOD (  12.44  )
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

Drop the generic err_exit.

The remaining operation to do from this goto statement is to cleanup
the NAND allocations, so rename it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nandsim.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 8511e70ca1e9..8ffd68321175 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2366,7 +2366,7 @@ static int __init ns_init_module(void)
 		if (new_size >> overridesize != nsmtd->erasesize) {
 			NS_ERR("overridesize is too big\n");
 			ret = -EINVAL;
-			goto err_exit;
+			goto cleanup_nand;
 		}
 
 		/* N.B. This relies on nand_scan not doing anything with the size before we change it */
@@ -2379,7 +2379,7 @@ static int __init ns_init_module(void)
 
 	ret = ns_setup_wear_reporting(nsmtd);
 	if (ret)
-		goto err_exit;
+		goto cleanup_nand;
 
 	ret = ns_init(nsmtd);
 	if (ret)
@@ -2406,11 +2406,11 @@ static int __init ns_init_module(void)
 
 unregister_mtd:
 	WARN_ON(mtd_device_unregister(nsmtd));
-err_exit:
 free_ns_object:
 	ns_free(ns);
 free_ebw:
 	kfree(erase_block_wear);
+cleanup_nand:
 	nand_cleanup(chip);
 error:
 	kfree(ns);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
