Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10916C636D3
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 11:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jy7sNxA/dN1iUFFZFJILEg/29TDfqIb/YCqyL96ZDdg=; b=pdX/RlObLN73ii
	YuQLfz+dWQe35yIhRknKTUs36PYeIPMWMsLtNvziDrAemx0fDolDjlvYZkw5l8RkRt4gSOIbSydDg
	uAYMFdLZkNR/al93dOuMRAma5/qhAr6i/6D/kYYoK6er0h3mc4PgWjg5mi8WsNUc1UrOOkR/kyWO2
	6kYlDZG7KK4JXTfMee3uIPXfDn6bunaZQGcoYrU3zucio+AQ8d5I0M28btHYznJaccHsJJBYKAg6t
	NKsA0mzjh0EN6miRHL71CgOxuJ3jJ3XJPc8aNL9O2aTTi+CPLChgaUJFPTpxrxpTHsOoapwvBV4kn
	q7HjsdgP6K6TL2PEeAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBSj-00BX2R-4S; Wed, 01 Feb 2023 11:39:37 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBPV-00BVH8-3S; Wed, 01 Feb 2023 11:36:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0C9F9240013;
	Wed,  1 Feb 2023 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675251372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4hJ3DkdkPBwxmWhMM/vg7WwaOcdWJrUkxOtroKpVX3E=;
	b=Erdbq7iGnVAUqY7OI1DWiXR9V9xsVS2ZS42YxSyxYY2F4/8nuOj4yKxGCdX+sOgVQFJifB
	4F6BPN5wPXDMdHQOI50FivluBUgGzkEjUdsY4Z9owjW0FQTRYj9DAlVLlFNxtT4Y/80Tt/
	xWe0S4RGoQKXJvQ6VfwBAwrhVY071eQIOApdkKbWuKnXgfWjku4uVS+b8saS8SruLt1uNC
	i3sx0FOkWhU1jpqRsMcXRhNFfFnB/t9Gi2KJATRVHiY+9wLuXVcHPR1+dqT3lfY9OiD3OC
	HlaIIL5GKsb3W3N+gKv6Ytw3CbCgvHxvX/nqAMNZq6uW7apoR7FHq056o/gikw==
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
Subject: [PATCH v4 3/8] mtd: spi-nor: Reorder the preparation vs locking steps
Date: Wed,  1 Feb 2023 12:35:58 +0100
Message-Id: <20230201113603.293758-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201113603.293758-1-miquel.raynal@bootlin.com>
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_033617_524190_163ADF96 
X-CRM114-Status: GOOD (  13.24  )
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

The ->prepare()/->unprepare() hooks are now legacy, we no longer accept
new drivers supporting them. The only remaining controllers using them
acquires a per-chip mutex, which should not interfere with the rest of
the operation done in the core. As a result, we should be safe to
reorganize these helpers to first perform the preparation, before
acquiring the core locks. This is necessary in order to be able to
improve the locking mechanism in the core (coming next). No side effects
are expected.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3845de9c874c..01932dbaa5b9 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1071,27 +1071,24 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 	}
 }
 
-int spi_nor_lock_and_prep(struct spi_nor *nor)
+int spi_nor_prep_and_lock(struct spi_nor *nor)
 {
 	int ret = 0;
 
-	mutex_lock(&nor->lock);
-
-	if (nor->controller_ops &&  nor->controller_ops->prepare) {
+	if (nor->controller_ops && nor->controller_ops->prepare)
 		ret = nor->controller_ops->prepare(nor);
-		if (ret) {
-			mutex_unlock(&nor->lock);
-			return ret;
-		}
-	}
+
+	mutex_lock(&nor->lock);
+
 	return ret;
 }
 
 void spi_nor_unlock_and_unprep(struct spi_nor *nor)
 {
+	mutex_unlock(&nor->lock);
+
 	if (nor->controller_ops && nor->controller_ops->unprepare)
 		nor->controller_ops->unprepare(nor);
-	mutex_unlock(&nor->lock);
 }
 
 static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
@@ -1447,7 +1444,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	addr = instr->addr;
 	len = instr->len;
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_prep_and_lock(nor);
 	if (ret)
 		return ret;
 
@@ -1707,7 +1704,7 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_prep_and_lock(nor);
 	if (ret)
 		return ret;
 
@@ -1753,7 +1750,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_prep_and_lock(nor);
 	if (ret)
 		return ret;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
