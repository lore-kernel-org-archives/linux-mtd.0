Return-Path: <SRS0=nfTR=6X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12298C28CBC
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 19:19:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF0B9214D8
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 19:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rv1xIK0O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF0B9214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUsicEaYy4kVfgv9v6Pxm7gOT0Uh8uMYJ5xTPqK21mU=; b=rv1xIK0OJBX0Ad
	g8hrKsXFWKYaP4Z/hkcBhwhp+PMHRe3o4AFMBWV+pEkQCvg55o0NL4vmr6O6llJb2uIPG77hE+3PI
	XpQO4t7eVHAWtZDpW0qsKL1X0oUqI5glOos9+2trzj4K3JqMerIP4VPqvargD+6cDOf2GLuzumX0F
	aZNSkWtmGLQVjy7Le/BPVjTPpr7ttTSwMAmP7fLFEciHyBCG/ywt2m7xdBdEnkB8EeT4WpSIGxU5j
	yyN5XqMKiZ8RkUtnzkGi5+ITr4bfrYUDDyI1BtJcN+zakIWnIhuIE9xlDb5GgjTkq23/Q6i8fhIU0
	BDDOlj5CbhIfb3c8r94Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXV0F-0008Hd-0R; Sat, 09 May 2020 19:19:15 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXUvy-0001x9-52
 for linux-mtd@lists.infradead.org; Sat, 09 May 2020 19:14:51 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id D78FC100004;
 Sat,  9 May 2020 19:14:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 17/17] mtd: rawnand: nandsim: Reorganize ns_cleanup_module()
Date: Sat,  9 May 2020 21:14:30 +0200
Message-Id: <20200509191431.15862-18-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509191431.15862-1-miquel.raynal@bootlin.com>
References: <20200509191431.15862-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_121450_327022_6E71BFF0 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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
Cc: dedekind@infradead.org, Boris Brezillon <boris.brezillon@collabora.com>,
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
 drivers/mtd/nand/raw/nandsim.c | 40 +++++++++++++++-------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fa84f373b4e9..744de767cdc3 100644
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
@@ -2443,12 +2425,26 @@ static void __exit ns_cleanup_module(void)
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
+	list_for_each_safe(pos, n, &grave_pages) {
+		kfree(list_entry(pos, struct grave_page, list));
+		list_del(pos);
+	}
+	list_for_each_safe(pos, n, &weak_pages) {
+		kfree(list_entry(pos, struct weak_page, list));
+		list_del(pos);
+	}
+	list_for_each_safe(pos, n, &weak_blocks) {
+		kfree(list_entry(pos, struct weak_block, list));
+		list_del(pos);
+	}
+	kfree(ns);
 }
 
 module_exit(ns_cleanup_module);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
