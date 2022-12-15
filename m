Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE02EC4167B
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Dec 2022 08:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JR05UA8KEMAIFoFTtBiPWji3GoSyeStINL0tZDyywE=; b=nFu7kDFojIRO5+
	rrRY3WVl7CNzyrc0hKwupzBgHBUmvWis2JE+Zq5bCcSkxuLrjvO9cnI5cK2mn6SJCAB7UDM31hiuo
	LP8mRNDw0RBqPR9FmJhqqY3x50qyWmBbArhs8rBog79GDSZ6seQuciqnBRPS6rITmITbVpMKx3y/k
	v8zYfDPHg0bOl7F519Lhc+NNDorYdc/Z7it+A+UTu4JJVtvBbmyyRvyXd0xccWNcOmt8MnN7JcG1v
	9rVMUyTolN4bBF1AIla/ZJzvRs1ikWNonRQysJgtb4DexW43GxY0KRhe6x8ER26SXRfEvtxirmVR2
	yi/v5Pxa+2RRSn01KWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5jMX-007YEj-GQ; Thu, 15 Dec 2022 08:13:05 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5jMK-007Y4e-JV
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2022 08:12:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E6E64E0017;
	Thu, 15 Dec 2022 08:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671091971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GaOvg1joB4oL+N5cXkHLmKSs/G3RBWP2pBupd+JLH38=;
	b=k91EV3P+cZkU1GeSV7LfGhAa1KTCSJZDsX7G7DWaJ7FmERzvqRU7KEk+oCOsW6FjferKZc
	UaqpbXU4LsPpDxBGE5VyuOSu2C67yJXCYYTuivRXtCQ5uarA9A4nGJ+1rGWYcLuQMgGy8l
	NjPztF9Kk5kfd1lAFJwYi+Z2dhNf6EoxyQ8WkPAiU/uobagO95GsIKvds0P/AGHB6DTuDY
	7fiNDwFeeSbB9Mhn7KaXupPPjTO2OWuPznq1JA5a/e0AV/ssDq7PFRTZbHOnDU33Cm4MVw
	4EY11eDz/HuL7HHwBMhzfeswd6OENNOUKuNRXqpz7SwZbB5ViNgOsI0PE6/u0g==
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
Subject: [PATCH v3 6/9] mtd: spi-nor: Prepare the introduction of a new locking mechanism
Date: Thu, 15 Dec 2022 09:12:38 +0100
Message-Id: <20221215081241.407098-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215081241.407098-1-miquel.raynal@bootlin.com>
References: <20221215081241.407098-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_001252_989219_6A63C516 
X-CRM114-Status: GOOD (  13.99  )
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

This commit alone just introduces two new "lock and prepare" pairs of
helpers which do the exact same thing as before. They will soon be
improved in a followup commit which actually brings the logic, but I
figured out it was more readable to do it this way.

One new pair is suffixed _pe which stands for "program and erase" and
hence is being called by spi_nor_write() and spi_nor_erase().

The other pair is suffixed _rd which stands for "read" and hence is
being called by spi_nor_read().

One note however, these extra helpers will need to know the operation
range, so they come with two new parameters to define it. Otherwise
there is no functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 59 ++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f87e57d97692..6c08114e4275 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1086,6 +1086,7 @@ static void spi_nor_unprep(struct spi_nor *nor)
 		nor->controller_ops->unprepare(nor);
 }
 
+/* Generic helpers for internal locking and serialization */
 int spi_nor_lock_and_prep(struct spi_nor *nor)
 {
 	int ret;
@@ -1106,6 +1107,48 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor)
 	spi_nor_unprep(nor);
 }
 
+/* Internal locking helpers for program and erase operations */
+static int spi_nor_lock_and_prep_pe(struct spi_nor *nor, loff_t start, size_t len)
+{
+	int ret;
+
+	ret = spi_nor_prep(nor);
+	if (ret)
+		return ret;
+
+	mutex_lock(&nor->lock);
+
+	return 0;
+}
+
+static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len)
+{
+	mutex_unlock(&nor->lock);
+
+	spi_nor_unprep(nor);
+}
+
+/* Internal locking helpers for read operations */
+static int spi_nor_lock_and_prep_rd(struct spi_nor *nor, loff_t start, size_t len)
+{
+	int ret;
+
+	ret = spi_nor_prep(nor);
+	if (ret)
+		return ret;
+
+	mutex_lock(&nor->lock);
+
+	return 0;
+}
+
+static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t start, size_t len)
+{
+	mutex_unlock(&nor->lock);
+
+	spi_nor_unprep(nor);
+}
+
 static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
 {
 	if (!nor->params->convert_addr)
@@ -1457,7 +1500,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	addr = instr->addr;
 	len = instr->len;
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_lock_and_prep_pe(nor, instr->addr, instr->len);
 	if (ret)
 		return ret;
 
@@ -1520,7 +1563,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	ret = spi_nor_write_disable(nor);
 
 erase_err:
-	spi_nor_unlock_and_unprep(nor);
+	spi_nor_unlock_and_unprep_pe(nor, instr->addr, instr->len);
 
 	return ret;
 }
@@ -1690,11 +1733,13 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	loff_t from_lock = from;
+	size_t len_lock = len;
 	ssize_t ret;
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_lock_and_prep_rd(nor, from_lock, len_lock);
 	if (ret)
 		return ret;
 
@@ -1721,7 +1766,8 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	ret = 0;
 
 read_err:
-	spi_nor_unlock_and_unprep(nor);
+	spi_nor_unlock_and_unprep_rd(nor, from_lock, len_lock);
+
 	return ret;
 }
 
@@ -1740,7 +1786,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_lock_and_prep_pe(nor, to, len);
 	if (ret)
 		return ret;
 
@@ -1782,7 +1828,8 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	}
 
 write_err:
-	spi_nor_unlock_and_unprep(nor);
+	spi_nor_unlock_and_unprep_pe(nor, to, len);
+
 	return ret;
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
