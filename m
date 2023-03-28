Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B11DC6FD18
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 15:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpHNJ9S8cimO2HJUq3oQWf+YOyTcKQDBvMekguM8fjE=; b=AvJnFvbrzEi1Gl
	odjQMtEE8oBnH6XjpIrhmKKewUgj88nUWBxJnOqlAyiaHX/E5delGnmyfge8rJCuNL+AMUvAZPwqX
	T36F7oLIhSuVK0NldLVREf1LYrhAr2jxM7NzAWopdKKxhq/F2gmPNDCNxHSVA2LdYFD9lCrrYpVOy
	WXmr9Z+4g4tKGzKyTKM1fL9u6FACcQczKHEM3vvCpfhfW4m7tU2x2LjnmCHqytcw/yxlK2w2xGwHk
	PUVorVwr640mIyhkPw4KNqbIOAXbd0IMryMWnWy9pO3PtrTKJYQL/ZUvttCleJY9kFIkVV1imp2zQ
	pXaFXbrXzF4I8yIlPIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phBSH-00Ez1T-1I;
	Tue, 28 Mar 2023 15:41:49 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phBRl-00EyfG-1B;
	Tue, 28 Mar 2023 15:41:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4C65E6000C;
	Tue, 28 Mar 2023 15:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680018075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9olzw42GjrJ4I4m8VbHNu0ffDdliIC9s9nfHpP7fsw=;
	b=bFOW6VVc+KUz0ZdxJmGdkmFtpONFOOWwzbTXygvo4wAOFADw2leyjreiqD7F85axOOYLtx
	gwz1buCyb0Zstu10UL3ZoDxBmdy9Nyj1NgD/oTinYDoWsTUit5fM24HVDxDlhM/2QsXGpq
	1MFfwUNxZdhk1Zj1XEX83kuYM9c5ko/YsXI4Nzon70IJheKF87fTQ1wRvmhlN/1AFdQL1S
	vqt0ScqRlPjFsX2oGCxUbP7O+95mkt1L0Vn1mn3zXdBZulRZeYz2lVeoX9DC32nkafoJGy
	BMkSBRKwO4xDCJ32u19C0GBqNOWgqIZeEBvCaQn8PWJ6VGGHWFm7oQGfxPHIPg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michal Simek <monstr@monstr.eu>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 4/8] mtd: spi-nor: Separate preparation and locking
Date: Tue, 28 Mar 2023 17:41:01 +0200
Message-Id: <20230328154105.448540-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328154105.448540-1-miquel.raynal@bootlin.com>
References: <20230328154105.448540-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_084117_565762_95D4846C 
X-CRM114-Status: GOOD (  10.32  )
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

While this operation will remain a single function call in the end,
let's extract the logic of the [un]prepare calls within their own static
helper. We will soon add new flavors of the *_[un]prepare_and_[un]lock()
helpers, having the preparation logic outside will save us from duplicating
code over and over again.

There is no functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3a7a407919e7..e80677d36a8c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1070,24 +1070,40 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 	}
 }
 
-int spi_nor_prep_and_lock(struct spi_nor *nor)
+static int spi_nor_prep(struct spi_nor *nor)
 {
 	int ret = 0;
 
 	if (nor->controller_ops && nor->controller_ops->prepare)
 		ret = nor->controller_ops->prepare(nor);
 
+	return ret;
+}
+
+static void spi_nor_unprep(struct spi_nor *nor)
+{
+	if (nor->controller_ops && nor->controller_ops->unprepare)
+		nor->controller_ops->unprepare(nor);
+}
+
+int spi_nor_prep_and_lock(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = spi_nor_prep(nor);
+	if (ret)
+		return ret;
+
 	mutex_lock(&nor->lock);
 
-	return ret;
+	return 0;
 }
 
 void spi_nor_unlock_and_unprep(struct spi_nor *nor)
 {
 	mutex_unlock(&nor->lock);
 
-	if (nor->controller_ops && nor->controller_ops->unprepare)
-		nor->controller_ops->unprepare(nor);
+	spi_nor_unprep(nor);
 }
 
 static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
