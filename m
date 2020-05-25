Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6275AC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:02:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01463206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:02:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZaIjEJgq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01463206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=paul5iHGY5JnZnnPU/nEhefFbQ68UywgF3eG1gZhWGw=; b=ZaIjEJgqo2JpuR
	T87/ikV/6KT7juWU3qTmvaFGUDvfTjmugfmdLD/+Puef+COBJT+g/4fRTi1MPFXbzY679Vd11pMBO
	7kgSzuN7miXampgb4kXBO3gRBsPQw1ghTovUbJSPOlMKooi2iY+ZFVPm4zUIycl8LQo1MqifAT06J
	uocM6aabYq1W0mMf6Z4rgx5WMUvduUpTTwKsfIsmetJWgrqyahyxII8IjjemHRuXoNJe4X08zbAs7
	R9PO+PO3aWhOnhhE2HEqlv9hY8Yq0dPEBlu919L9UgY59hpsHQ2/aNvuR3+vob7X6OdNUExwrpPup
	P3huYK4G21uD6nL9yr2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd8zl-0001ax-Kj; Mon, 25 May 2020 09:02:05 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8wz-0004ae-1o
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 08:59:14 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1D98424000A;
 Mon, 25 May 2020 08:59:10 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 10/17] mtd: rawnand: nandsim: Free the partition names in
 ns_free()
Date: Mon, 25 May 2020 10:58:44 +0200
Message-Id: <20200525085851.17682-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525085851.17682-1-miquel.raynal@bootlin.com>
References: <20200525085851.17682-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_015913_259108_49D40529 
X-CRM114-Status: GOOD (  12.22  )
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

ns_free() is the helper that is called symmetrically to ns_init() and
so should free the same objects, including the partition names.

Now, callers of ns_free() do not need to free this partition names
themselves.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nandsim.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index d6e16ddb5de5..4bc5da3be587 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -786,6 +786,11 @@ static int __init ns_init(struct mtd_info *mtd)
  */
 static void ns_free(struct nandsim *ns)
 {
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ns->partitions); ++i)
+		kfree(ns->partitions[i].name);
+
 	kfree(ns->buf.byte);
 	ns_free_device(ns);
 
@@ -2270,7 +2275,7 @@ static int __init ns_init_module(void)
 {
 	struct nand_chip *chip;
 	struct nandsim *ns;
-	int ret, i;
+	int ret;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -2402,8 +2407,6 @@ static int __init ns_init_module(void)
 err_exit:
 	ns_free(ns);
 	nand_release(chip);
-	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
-		kfree(ns->partitions[i].name);
 error:
 	kfree(ns);
 	ns_free_lists();
@@ -2420,13 +2423,10 @@ static void __exit ns_cleanup_module(void)
 {
 	struct nand_chip *chip = mtd_to_nand(nsmtd);
 	struct nandsim *ns = nand_get_controller_data(chip);
-	int i;
 
 	ns_debugfs_remove(ns);
 	ns_free(ns);    /* Free nandsim private resources */
 	nand_release(chip); /* Unregister driver */
-	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
-		kfree(ns->partitions[i].name);
 	kfree(ns);        /* Free other structures */
 	ns_free_lists();
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
