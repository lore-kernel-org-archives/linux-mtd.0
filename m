Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F391AC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 08:59:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9F9E2071A
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 08:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="syCUSJHw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9F9E2071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Yzm8tYveomZ3zndKPr0QGxqFsZBptZS2EG20de3kWU=; b=syCUSJHwUHGjax
	JLOahUVMSUzFsVISNQ4DT6rIc49dQ/2OtggHE3XV1jDrjNFLxe6j3d3iInP4ZCMhuvgFy1nZil9bN
	XV2eDjBtK3d/6PTuFsvWwPD7jgY/zYq0/emmFwikzp8h9Lw642TtP5YAVANtvrGxRjmZiLN9Ft820
	GwBmqDZSBFLq+5dFbJ6r4ItPxnzbACdYur9OqQ0nvLGcGRg8dRxK6BYSzSGuHiE1isEIluK/oQvQu
	bVotrHWZvTRO9uDrObxBGSE3EP8yDR4LQiKb8U3cwfvfGQZPA7LrYNnTHCHR4pf9o+2Jqau/opkr+
	LNmi7h0eqOrvLCMViMyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd8wm-0004Ol-R5; Mon, 25 May 2020 08:59:00 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8wk-0004NY-HW
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 08:59:00 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 94AF2240009;
 Mon, 25 May 2020 08:58:55 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 01/17] mtd: rawnand: nandsim: Consistent use of 'ns'
 instead of 'dev'
Date: Mon, 25 May 2020 10:58:35 +0200
Message-Id: <20200525085851.17682-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525085851.17682-1-miquel.raynal@bootlin.com>
References: <20200525085851.17682-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_015858_717139_55C33D7E 
X-CRM114-Status: GOOD (  11.17  )
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

The nandsim object is called 'ns' almost everywhere, keep it that way
everywhere for consistency.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nandsim.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 23cda67a3f53..0062e4fedcc0 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -487,12 +487,12 @@ DEFINE_SHOW_ATTRIBUTE(nandsim);
 
 /**
  * nandsim_debugfs_create - initialize debugfs
- * @dev: nandsim device description object
+ * @ns: nandsim device description object
  *
  * This function creates all debugfs files for UBI device @ubi. Returns zero in
  * case of success and a negative error code in case of failure.
  */
-static int nandsim_debugfs_create(struct nandsim *dev)
+static int nandsim_debugfs_create(struct nandsim *ns)
 {
 	struct dentry *root = nsmtd->dbg.dfs_dir;
 	struct dentry *dent;
@@ -508,8 +508,8 @@ static int nandsim_debugfs_create(struct nandsim *dev)
 		return 0;
 	}
 
-	dent = debugfs_create_file("nandsim_wear_report", S_IRUSR,
-				   root, dev, &nandsim_fops);
+	dent = debugfs_create_file("nandsim_wear_report", S_IRUSR, root, ns,
+				   &nandsim_fops);
 	if (IS_ERR_OR_NULL(dent)) {
 		NS_ERR("cannot create \"nandsim_wear_report\" debugfs entry\n");
 		return -1;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
