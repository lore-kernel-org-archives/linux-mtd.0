Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197F2C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 25 May 2022 16:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7sGaEo1W7QxN5Yfz3WE+ycI5oau+uYaTP1JHl2ARWvE=; b=m1Hfzp9nA2RUSg
	KbstsWgnd5pBYZWuEgiqtbVYRueQ/FTLEtxIpEUApZoXHXTCwkOXnNvtjMlDl8WvcA8+B7GI6qlPH
	Nqhzwzn17Ptc8/PqCrmFYFYdPfDYg9bTFP4PZcJnKLSfU9aMcX6kgxNiibMPZU1fB6BvlpZvojvgO
	HrZ/NDcEKt/XdoaQM2Fif45k0lI4E6+w5YWz0BWXANVB3YbY7doMkJqFUHBS8BPOUD0fxXahPlEYt
	Xv1T1o3EpCA3X/Ds5wItIjrCpzIbEQ4EgE+naLVqMH1jrlWpIf6hVhQPw7kMi3756enZAcTwLuyod
	G89RqVtogZywukPUSGwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttv8-00Bpmf-95; Wed, 25 May 2022 16:31:38 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttup-00Bper-1C
	for linux-mtd@lists.infradead.org; Wed, 25 May 2022 16:31:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E2604E0006;
	Wed, 25 May 2022 16:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653496277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5KKaXgLMjZFo9NlDhpFA9nL9a1wpAXtboG7n9DelRI=;
	b=PbWHK1dspsBHBkZCIgd/ijhC7F++/ICVQe8ZBu0opE9mlEgceT62JMTCqyZZPronPHABiv
	lajKZ6MbqmNGRJm+yelecFxtFjbZ09LZlCIsKkM93iutylp2XQuM6Wiu7akz8u3//hMUAq
	p+hzHfeSKQ+gsutR8shlzNExryXxKpxq8XepOzvIF/uO3fxR59bzLFQdTUOepD4Dyu05Wo
	8j/lZH8wKyGr+gG0nntaK+gOEpjrl9OOTb4k9ol4Ay2DC1Ag7/Y/Gyx4xJ7qgUkQIDepQc
	Y48pA9T8evKr7qHFe2L0gYWs6jDaZ7ysH2btnLulxYpCokD5X5f5LE75Kxx4vw==
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
Subject: [RFC PATCH 5/8] mtd: spi-nor: Separate preparation and locking
Date: Wed, 25 May 2022 18:31:05 +0200
Message-Id: <20220525163108.266705-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220525163108.266705-1-miquel.raynal@bootlin.com>
References: <20220525163108.266705-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_093119_299179_D7672F3F 
X-CRM114-Status: GOOD (  11.48  )
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
index cea023f2d169..048665252a80 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1065,24 +1065,40 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
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
