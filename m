Return-Path: <SRS0=3akN=YV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859D5CA9EA0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 09:31:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9923E20B7C
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 09:31:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uSOvcg4N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9923E20B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vZvXMv9NkHvtsCEotGG5x+L/ywsYDLgNTfU6H0OO8dk=; b=uSOvcg4N9vPtsq5/RU4kd/x4n7
	HwUpOVx9VdQ94TupdDe+iKHum+dFJTFRqrynvhB4KHrMYOx+PFBhxDUjljFv2ce2mwGr05HMzy9kf
	+cwHf/e7K5Hcz8fcCeOQZ1MY/Xscd+pf11lz8jz2L1hrbQvyRet8QtQU86lYvbPRmPv3E8UBmjBDl
	3O/OXGUi8pO2EIhE+o9X4gu9aQnDQWCjvprwjMp0xBxyjWrdpxMu9am7ZVWTtIIpGp959WV4U3YdJ
	jXwNwaQPAdwxm+4/dRZbKDe0BXOw03qcio/UhRbNVEBRhrz3ZDeZXnmUO86S39HT/ofgO7VDxOo3l
	wXRF6ObA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP1MK-0002O7-RH; Mon, 28 Oct 2019 09:30:44 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP1Ly-00022O-Ir
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2019 09:30:25 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id x9S9TQPP013435;
 Mon, 28 Oct 2019 17:29:29 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, marek.vasut@gmail.com,
 dwmw2@infradead.org, bbrezillon@kernel.org,
 computersforpeace@gmail.com, vigneshr@ti.com
Subject: [PATCH v2 3/4] mtd: rawnand: Add support manufacturer specific
 suspend/resume operation
Date: Mon, 28 Oct 2019 17:55:26 +0800
Message-Id: <1572256527-5074-4-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>
References: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com x9S9TQPP013435
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_023022_914506_1D16B92C 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: juliensu@mxic.com.tw, masonccyang@mxic.com.tw,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Patch nand_suspend() & nand_resume() for manufacturer specific
suspend/resume operation.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/nand/raw/nand_base.c | 9 +++++++--
 include/linux/mtd/rawnand.h      | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 5e318ff..2a9c5bb 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4323,6 +4323,8 @@ static int nand_suspend(struct mtd_info *mtd)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
 	mutex_lock(&chip->lock);
+	if (chip->_suspend)
+		chip->_suspend(chip);
 	chip->suspended = 1;
 	mutex_unlock(&chip->lock);
 
@@ -4338,11 +4340,14 @@ static void nand_resume(struct mtd_info *mtd)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
 	mutex_lock(&chip->lock);
-	if (chip->suspended)
+	if (chip->suspended) {
+		if (chip->_resume)
+			chip->_resume(chip);
 		chip->suspended = 0;
-	else
+	} else {
 		pr_err("%s called for a chip which is not in suspended state\n",
 			__func__);
+	}
 	mutex_unlock(&chip->lock);
 }
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 2430ecd..6b14041 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1117,6 +1117,8 @@ struct nand_chip {
 
 	struct mutex lock;
 	unsigned int suspended : 1;
+	int (*_suspend)(struct nand_chip *chip);
+	void (*_resume)(struct nand_chip *chip);
 
 	uint8_t *oob_poi;
 	struct nand_controller *controller;
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
