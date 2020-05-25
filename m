Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3926C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:03:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1C79206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:03:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S8hQm6y/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1C79206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sogiLozy8Rnbo8Ox+FDKDsBgUVy5NEDLSr1Fq/57UsI=; b=S8hQm6y/3n3K+H
	LSGzjSZYcEtRdx+ICnY3luG5aJ1M7rjxmcJFM+Ezxb4zV/LKqc50d9BYC8q7IMp68Uj1Sv4Oghm/X
	omnOmaFPXeRMiGLlBVMbX0YbygUpo7s6x4pxFFydHVOyfuQVua3G4JvoCQytZDzHk3pdfdpmo1EDf
	883F5K8EI4OS0AYsMhOBUanqs9IdygUxCVmg48wyag/czJpnBixdi8G57FQnszIUMHbwdVnBlzBPR
	uKEMAE65cs64nrYMm68hXpvavydJMt308N7dU11lZ4WXoiPrw+JhOcgst1Z72Rub+BenmTQGOv/cP
	I0v0ViN+xpKNWkKZDFwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd90x-0002iQ-KH; Mon, 25 May 2020 09:03:19 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8x3-0004ew-Gj
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 08:59:19 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3508524000A;
 Mon, 25 May 2020 08:59:15 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 15/17] mtd: rawnand: nandsim: Manage lists on error in
 ns_init_module()
Date: Mon, 25 May 2020 10:58:49 +0200
Message-Id: <20200525085851.17682-16-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525085851.17682-1-miquel.raynal@bootlin.com>
References: <20200525085851.17682-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_015917_778736_1EF5AE24 
X-CRM114-Status: GOOD (  12.42  )
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

Lists are filled with calls to ns_parse_weakblocks(),
ns_parse_weakpages() and ns_parse_gravepages(). Handle them in the
error path, all at the same time.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nandsim.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 8ffd68321175..4492b9a9962e 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2273,6 +2273,7 @@ static const struct nand_controller_ops ns_controller_ops = {
  */
 static int __init ns_init_module(void)
 {
+	struct list_head *pos, *n;
 	struct nand_chip *chip;
 	struct nandsim *ns;
 	int ret;
@@ -2340,11 +2341,11 @@ static int __init ns_init_module(void)
 
 	ret = ns_parse_weakpages();
 	if (ret)
-		goto error;
+		goto free_wb_list;
 
 	ret = ns_parse_gravepages();
 	if (ret)
-		goto error;
+		goto free_wp_list;
 
 	nand_controller_init(&ns->base);
 	ns->base.ops = &ns_controller_ops;
@@ -2353,7 +2354,7 @@ static int __init ns_init_module(void)
 	ret = nand_scan(chip, 1);
 	if (ret) {
 		NS_ERR("Could not scan NAND Simulator device\n");
-		goto error;
+		goto free_gp_list;
 	}
 
 	if (overridesize) {
@@ -2412,9 +2413,23 @@ static int __init ns_init_module(void)
 	kfree(erase_block_wear);
 cleanup_nand:
 	nand_cleanup(chip);
+free_gp_list:
+	list_for_each_safe(pos, n, &grave_pages) {
+		list_del(pos);
+		kfree(list_entry(pos, struct grave_page, list));
+	}
+free_wp_list:
+	list_for_each_safe(pos, n, &weak_pages) {
+		list_del(pos);
+		kfree(list_entry(pos, struct weak_page, list));
+	}
+free_wb_list:
+	list_for_each_safe(pos, n, &weak_blocks) {
+		list_del(pos);
+		kfree(list_entry(pos, struct weak_block, list));
+	}
 error:
 	kfree(ns);
-	ns_free_lists();
 
 	return ret;
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
