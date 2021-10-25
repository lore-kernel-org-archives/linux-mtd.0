Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAABC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 09:29:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 097F560EDF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 09:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 097F560EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSH2KAb3jqsSAIHmY6QzcihX6AzGY0oU+ucwzcFHQuI=; b=kLDC6sNA3Frhch
	POv5mRBiK4jtM24W0m0+mqTF6kE6VEjsWChd6OOQiXQJL4zOlJw2YGedAcRiOkRPXsO8VP8jC5oPk
	Uz9LDxVfKPhUi/1z3MLyVInfLwL8uuyhi+h09Ih3zpJ+gIqK6SlSEPdp1BhzTZ97boJ44i35qly+d
	EjM/7lNRymY6WD7IXW7k+Fxt8QfaRpD24P5NREpGiZqud7RFlJS0IhVMVxxbpvXCVImMYx7bJsp9h
	blAtELleNTOnk21DQax81y4WDknz/NanxGhdvCXCZb+cyYhg7gaxWXTDbLRDwyB/zTCaM0vWKcX14
	XmLJf0u7Lq5eqXvhN7cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mewHT-00FvYo-D7; Mon, 25 Oct 2021 09:28:35 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mewH1-00FvUQ-PZ
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 09:28:10 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id CD15ED6811;
 Mon, 25 Oct 2021 09:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1635154079; bh=gGr8jzmjUcZKYNrVgYoe5GuAvsXat5tgwVgjB7wXR6o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Q709du2aze/uTVPXnsMvZM7LWjRZuG7YfwXT8JsG7eLrnBxuRGlFYJYu513TVVzbP
 EyRdy0axPPRUHISfVdqD5yNbK0DG65Wasvn+xOYFgnGGoNeM/BSlmRilRz76vz/b5j
 TKiIfVG7+sbC2FgsiFhEPz+LtA4ywQJFkFbovIu1oP489L6DYlrbzgnRdFCNZQ15do
 1l0GujEnmHlZw35uGfKxqwFn0AF/D6S5iF8+zLVzHhc5ukVJc3XblKLnHAVF1R7xZ6
 lJplD+5xKISE0usxn4uJ/8GXQuCEFrL7TBiPbRspMoRI15PAABmvzzNxitP5IwMQIz
 7CXBNCVW4v8iA==
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] mtd: mtdconcat: add suspend lock handling
Date: Mon, 25 Oct 2021 11:27:50 +0200
Message-Id: <20211025092752.2824678-3-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211025092752.2824678-1-sean@geanix.com>
References: <20211025092752.2824678-1-sean@geanix.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_022808_061011_F471553A 
X-CRM114-Status: GOOD (  16.25  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use MTD hooks to control suspend/resume of MTD devices.
concat_{suspend,resume} will be called from mtd_{suspend,resume},
which already have taken the suspend/resume lock.
It's safe to proceed with calling MTD device hooks directly from here.

Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 drivers/mtd/mtdconcat.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index f685a581df48..37532f529820 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -566,9 +566,15 @@ static int concat_suspend(struct mtd_info *mtd)
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
-		if ((rc = mtd_suspend(subdev)) < 0)
+		/*
+		 * Call MTD hook directly from here,
+		 * mtd_suspend() have the suspend/resume lock.
+		 */
+		rc = subdev->_suspend ? subdev->_suspend(subdev) : 0;
+		if (rc < 0)
 			return rc;
 	}
+
 	return rc;
 }
 
@@ -579,7 +585,12 @@ static void concat_resume(struct mtd_info *mtd)
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
-		mtd_resume(subdev);
+		/*
+		 * Call MTD hook directly from here,
+		 * mtd_resume() have the suspend/resume lock.
+		 */
+		if (subdev->_resume)
+			subdev->_resume(subdev);
 	}
 }
 
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
