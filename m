Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE0DC636D3
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 11:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzcMneGpr6Wap59wxssZEJOTfr1ETBkIehiWwsQOs68=; b=e3vOVd6MJHno/l
	/KdDIlaDOruzVLVglZjZAlS9nXcgRq/sHktQt81Fv8DMW7KUQCehyaditiRxRcUNEEzxJUtdIVzSj
	MLmGXABo98z28eUX04eBSq2OpKyrET8wOQIJN0b2L+nXc6V3++mCO+G5rHrSIHyOJNmxW3iJMWTPg
	Zd9EFU8gyy6iTxwoCN2QZsr6CLCpHo+QV5hn3suhuAypU2IpkeFi/3VFJNxuCY1GD8kMct4fJMANE
	sC5lIHcQUYyw71MvOGY3e1YSeVn1YSgf8f3THTqkcaCsrneoUEvronoQlbzr3VxkpAV1u3qGdrfmE
	UcpMu4F1QPGZM5PuaPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBRd-00BWNB-BR; Wed, 01 Feb 2023 11:38:29 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBPU-00BVI5-Bn; Wed, 01 Feb 2023 11:36:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E5AA6240012;
	Wed,  1 Feb 2023 11:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675251374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g99mzVGgnPkJ48PPvN0TYNd02LeEINo+3J3BmCzJ+HA=;
	b=Zi6nHWPgqbPfeHfl4NbAocysgQTdTdgOU+qjfRzynC6uhYhUt4HiBnXhuhFWR52XWW1Upl
	A+rfuJO4CZCyo6RmE89ibmg9bDmjSC6guPDPv93m+yVy0QzgFa4Z+E/yJy+KsPsUcoKoML
	WEXVohGspjMQV2BvaJZjjfZ+QV5PTey9wQaoqI67QM8Fva12blIZi+r7NyUXuLzVMaCbxL
	uALT0WyNfiTu0DGWsswHC21Z1Pe201FkwoXqoVg9Cknw2e2UDGTfvrn7uQErA7by96fNfD
	rx/JmfoTg99iV+fTcTAzUt/fI96yiS5PyK2Ym9xkPQ1FA/kAxFITT3tVnsdJ/A==
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
Subject: [PATCH v4 4/8] mtd: spi-nor: Separate preparation and locking
Date: Wed,  1 Feb 2023 12:35:59 +0100
Message-Id: <20230201113603.293758-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201113603.293758-1-miquel.raynal@bootlin.com>
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_033616_595408_2DAEE370 
X-CRM114-Status: GOOD (  10.80  )
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
index 01932dbaa5b9..0ec85f5e7043 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1071,24 +1071,40 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
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
