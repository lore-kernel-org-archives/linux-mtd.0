Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B042BC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Dec 2022 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKOWjKa7gtGNyApVMOCQ+B43evCmsGpjT9IWeyFm+Dk=; b=v1/du1IZ3APLvu
	6zCudTd9/UwWqDd7WO6yuRodZ7Nw3B8o7549KlfyfTJ1PuJdQZyridNOnZwoV9lx/xa9P9f/bYVT/
	LiP4SIRiLIVBZunNBJE9kpAoMv6HOVKxn+4Xyvez+Lpe2ULt8rWUw06kPcY8XYMo9ATQBjnj/FPc0
	Z5VKl+LFPXPWmcZZwcq+mGNSFesZcEB+20PgPt/r79oRWl/gnFNpCKb2CSTSNyXtJl8qUHVcHbXaw
	WtZtAmIlTIMUgjKFldwmtlA331I77VagKRRli09SvKddONF9TefeVwDXySAi0sq+AN5o3S6Tf0AYw
	IKxCHynVD24izPFWt46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5jMV-007YDx-P8; Thu, 15 Dec 2022 08:13:03 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5jMJ-007Y3h-4h
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2022 08:12:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B7A69E0015;
	Thu, 15 Dec 2022 08:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671091969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Mu36QcOQxHwPvThTDhIfkKRt8c7p5xPmqXGb9h05vQ=;
	b=U68oT8Hveg3R/pv+MDp1tDElH+SyKKEqgLmxC+XsJ4cv/gwTSDA71nbWWFi4vtvuZ2pw3a
	p14JC9opeHbt8oC1jQAgBcaauBLbwzudQ947lJqTw9vSZl71WFIODuV1kRuBENCiSkPeyY
	R55UUlsTyh2IF32jgmd5VSftxMAbGQQfBKsTJNWK6bPQRn1EGn2Nvum6a9ReuOpU/q6MOD
	BUsHkvbN+PzuPZW1ZrBFywKooTXzD0YkjYF613gbWZ4v8cyqWqgGjS8XV9tb50O5T6krRr
	rfpD8vTkEqKc42m+3bZqyqfa1dgH2jcVcw9COHT7lKJOW4upgVKtjzPwmYDHdw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 5/9] mtd: spi-nor: Separate preparation and locking
Date: Thu, 15 Dec 2022 09:12:37 +0100
Message-Id: <20221215081241.407098-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215081241.407098-1-miquel.raynal@bootlin.com>
References: <20221215081241.407098-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_001251_333185_F5B763FD 
X-CRM114-Status: GOOD (  10.73  )
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
