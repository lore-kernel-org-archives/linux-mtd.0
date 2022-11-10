Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41145C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKOWjKa7gtGNyApVMOCQ+B43evCmsGpjT9IWeyFm+Dk=; b=pKHKJlPFn+f/UB
	VGFdbBxhKNfa7/ApgiY2mCkNXdYh9AJSGSFbe6Ancf8K+AiE1616D71aNXVyHRexLka66WLmuwmKg
	vZD9fLvVzK1HajyzH4pEVdVnTemE3ZMxFTSKRLQyNKD9Sa/Axt0hj2zTuUVGVKx+esgiAAU6/60Qe
	IojqbODIIZjCBMx8FYLQRZzhGNHTB9P0NGXJlavgOXO0xVbP47SdtG76mb98WWOZLVc/e2LGx+4Jj
	OWT2WFJ2qyNDC6SJl2J3dW/qeipOqLiWV2WjB+htJhGNVomR29gOoK8SUNzFDvTp6Axbgy+BJws9U
	igVfQbDZxR+hpswzRTbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9u9-006x8b-F1; Thu, 10 Nov 2022 15:55:49 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9tl-006wrK-1R
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 15:55:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7AAC120002;
	Thu, 10 Nov 2022 15:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668095723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Mu36QcOQxHwPvThTDhIfkKRt8c7p5xPmqXGb9h05vQ=;
	b=i3Fe2UNT0EvOXsacIke6NDbSwu4lzDhLXwMzL/+9c6lsTmu8UUo6sT4s6s9YLHPbgGgZ5z
	IcmXjl48oXt/uGA7OBBq++kiW8YDlyozzoT5SkX76YoF8mz3LaRNNON2gQQdRwx0T1mR99
	9QfyRBZKI0cs2b/LZo3RBDDkOZF9yXJUL9QZRVKq3F9/K/2vWNWl9iICdLOGlafbTIYEhR
	hJHLCZ+bTAleCMYUR1hMCt71WkbUeXF3MZh5Hvl3vyhneMznS+hbNByXejeE2+tV50DwG3
	NGR+rv4MLPLlFyGRW8eoOzbrQcuTbBGpbqTtiUvwUEPq2MkzZVzW33bOzbxKyg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 5/9] mtd: spi-nor: Separate preparation and locking
Date: Thu, 10 Nov 2022 16:55:09 +0100
Message-Id: <20221110155513.819798-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110155513.819798-1-miquel.raynal@bootlin.com>
References: <20221110155513.819798-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_075525_259086_EA34702D 
X-CRM114-Status: GOOD (  10.81  )
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
helper. We will soon add new flavors of the *_[un]lock_and_[un]prepare()
helper, having the preparation logic outside will save us from duplicating
code over and over again.

There is no functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index de77ca55f74d..f87e57d97692 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1070,24 +1070,40 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 	}
 }
 
-int spi_nor_lock_and_prep(struct spi_nor *nor)
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
+int spi_nor_lock_and_prep(struct spi_nor *nor)
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
