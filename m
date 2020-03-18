Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8058EC10DCE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 07:43:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F5BC20768
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 07:43:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F4xl9ErJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F5BC20768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bOFY5FQvw5DpR3S40Rjkdr1XPJSqHtInuOgghQwZLKw=; b=F4xl9ErJyvqS4tkJE6/D+ZumC7
	KgftVgDFnvUisC1fsZzx0wdK0d8xXV2ACzwejvnXHkpLZoiecnlkZbiS1yXWwgkF1/SxLniCH2KEP
	DgKndRke2F1A86NuJU/YvzPL84AiJhccCuUBVVmL2DyySTErDwInQMqAmwZ+TPn57yyi5EBd8vu5X
	OqKAkfchGbGCPJBzzqNJgueObr9sJ0eI8sL+cVlzjAb5Cncwlq0e/vb6TKi6DkxxaQwUwDLJiWsVu
	NhQzXHiFjBZ+QiTye+facIKkaOzWNKx6hAobdOKPy9lCnFAz4FSvIQxXqc+7deBp8nmw1SHNtDtf3
	ysBJjDgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jETMc-0005kx-6E; Wed, 18 Mar 2020 07:43:42 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jETMP-0005bq-Ou
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 07:43:31 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id 02I7gTOA041137;
 Wed, 18 Mar 2020 15:42:30 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 bbrezillon@kernel.org
Subject: [PATCH v4 1/2] mtd: rawnand: Add support for manufacturer specific
 suspend/resume operation
Date: Wed, 18 Mar 2020 15:42:27 +0800
Message-Id: <1584517348-14486-2-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1584517348-14486-1-git-send-email-masonccyang@mxic.com.tw>
References: <1584517348-14486-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com 02I7gTOA041137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_004330_085291_ACE6DFA9 
X-CRM114-Status: GOOD (  13.33  )
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
Cc: juliensu@mxic.com.tw, s.hauer@pengutronix.de, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, stefan@agner.ch, linux-mtd@lists.infradead.org,
 frieder.schrempf@kontron.de, tglx@linutronix.de,
 Mason Yang <masonccyang@mxic.com.tw>, allison@lohutok.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Patch nand_suspend() & nand_resume() to let manufacturers overwrite
suspend/resume operations.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 17 +++++++++++++----
 include/linux/mtd/rawnand.h      |  4 ++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index f64e3b6..bde17a3 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4321,16 +4321,22 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 /**
  * nand_suspend - [MTD Interface] Suspend the NAND flash
  * @mtd: MTD device structure
+ *
+ * Returns 0 for success or negative error code otherwise.
  */
 static int nand_suspend(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
+	int ret = 0;
 
 	mutex_lock(&chip->lock);
-	chip->suspended = 1;
+	if (chip->suspend)
+		ret = chip->suspend(chip);
+	if (!ret)
+		chip->suspended = 1;
 	mutex_unlock(&chip->lock);
 
-	return 0;
+	return ret;
 }
 
 /**
@@ -4342,11 +4348,14 @@ static void nand_resume(struct mtd_info *mtd)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
 	mutex_lock(&chip->lock);
-	if (chip->suspended)
+	if (chip->suspended) {
+		if (chip->resume)
+			chip->resume(chip);
 		chip->suspended = 0;
-	else
+	} else {
 		pr_err("%s called for a chip which is not in suspended state\n",
 			__func__);
+	}
 	mutex_unlock(&chip->lock);
 }
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 4ab9bcc..b3dccb9 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1064,6 +1064,8 @@ struct nand_legacy {
  * @lock:		lock protecting the suspended field. Also used to
  *			serialize accesses to the NAND device.
  * @suspended:		set to 1 when the device is suspended, 0 when it's not.
+ * @suspend:		[REPLACEABLE] specific NAND device suspend operation
+ * @resume:		[REPLACEABLE] specific NAND device resume operation
  * @bbt:		[INTERN] bad block table pointer
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
  *			lookup.
@@ -1117,6 +1119,8 @@ struct nand_chip {
 
 	struct mutex lock;
 	unsigned int suspended : 1;
+	int (*suspend)(struct nand_chip *chip);
+	void (*resume)(struct nand_chip *chip);
 
 	uint8_t *oob_poi;
 	struct nand_controller *controller;
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
