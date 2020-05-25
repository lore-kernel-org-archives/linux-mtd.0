Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08898C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:03:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C668A206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 09:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uwGawT61"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C668A206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nU4swjGAXpY3SPV1OHvIvg1b0iQ5OdNLLrQqTcQ57SU=; b=uwGawT61Mm9oa7
	YXW+G8ZTTqcIcAJjBzAGa7XwTIAhR7KjZsR+xpXwJ/4eOwGGsCpS5iV6r1Bz0lMGvVwmUtZaszL2a
	uq+uQXA+Bzd0Y4aCZyYZ3DHtucL5MwntCLfiumzHMwp8rFz3TUbHlgEWdZwmZBMdtd8RSrM3Rwnc1
	8fFP8Uk8ZootuS4ECFPAgEmIHj+ObquzZs9lwzcvDPYGX7W/TAURQuZUuSd6gDnfw9xyHiZWZRlEw
	naEtmrzY276ulO1Q30BXVR5+/Cqmxm88TVGO9ov0JuLJcz0ujjVpp6RAFyEwqLqT/ZA8Y0r1KeckT
	mrfket2aTITs8yYgV0Dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd91D-0002vt-Mj; Mon, 25 May 2020 09:03:35 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8x5-0004hg-L6
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 08:59:21 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5AE00240012;
 Mon, 25 May 2020 08:59:17 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 17/17] mtd: rawnand: nandsim: Reorganize ns_cleanup_module()
Date: Mon, 25 May 2020 10:58:51 +0200
Message-Id: <20200525085851.17682-18-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525085851.17682-1-miquel.raynal@bootlin.com>
References: <20200525085851.17682-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_015919_883732_DC5415C3 
X-CRM114-Status: GOOD (  10.02  )
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

Reorganize ns_cleanup_module() to fit the reworked exit path of
ns_init_module().

There is no need for a ns_free_lists() function anymore, so drop it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nandsim.c | 44 +++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 7076acfbe0f4..0a5cb77966cc 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -978,24 +978,6 @@ static int ns_read_error(unsigned int page_no)
 	return 0;
 }
 
-static void ns_free_lists(void)
-{
-	struct list_head *pos, *n;
-	list_for_each_safe(pos, n, &weak_blocks) {
-		list_del(pos);
-		kfree(list_entry(pos, struct weak_block, list));
-	}
-	list_for_each_safe(pos, n, &weak_pages) {
-		list_del(pos);
-		kfree(list_entry(pos, struct weak_page, list));
-	}
-	list_for_each_safe(pos, n, &grave_pages) {
-		list_del(pos);
-		kfree(list_entry(pos, struct grave_page, list));
-	}
-	kfree(erase_block_wear);
-}
-
 static int ns_setup_wear_reporting(struct mtd_info *mtd)
 {
 	size_t mem;
@@ -2443,12 +2425,30 @@ static void __exit ns_cleanup_module(void)
 {
 	struct nand_chip *chip = mtd_to_nand(nsmtd);
 	struct nandsim *ns = nand_get_controller_data(chip);
+	struct list_head *pos, *n;
 
 	ns_debugfs_remove(ns);
-	ns_free(ns);    /* Free nandsim private resources */
-	nand_release(chip); /* Unregister driver */
-	kfree(ns);        /* Free other structures */
-	ns_free_lists();
+	WARN_ON(mtd_device_unregister(nsmtd));
+	ns_free(ns);
+	kfree(erase_block_wear);
+	nand_cleanup(chip);
+
+	list_for_each_safe(pos, n, &grave_pages) {
+		list_del(pos);
+		kfree(list_entry(pos, struct grave_page, list));
+	}
+
+	list_for_each_safe(pos, n, &weak_pages) {
+		list_del(pos);
+		kfree(list_entry(pos, struct weak_page, list));
+	}
+
+	list_for_each_safe(pos, n, &weak_blocks) {
+		list_del(pos);
+		kfree(list_entry(pos, struct weak_block, list));
+	}
+
+	kfree(ns);
 }
 
 module_exit(ns_cleanup_module);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
