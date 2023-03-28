Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A362C76196
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 15:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxhO5DRzjcmGPvIAZx000icrKt3MqgYzmIYpAKQlQ1o=; b=2Zu5c/dNqyZXR2
	agwu2PKGx1QI2NMrXLVyGngRKdcvtx2jX7WLyAjslbui27LYLjXU1TKuJKO8GhIAHcDzAW7DzTocc
	PYdssubzV48CVk7zFKNa0OvpVEQpxInugxwFAoeCrlOhqd3t+VM8ABs8zhytT08fcAwbU+zbLL01z
	m5PPfzPXz2k0ZfPx6+jHGxHMBP+jU+z8WzRmYvhNGNSlwWDyJwVg9CW2QZ8ONE/ILvrmCGVQA53uR
	oO4imTGKHcDIb3m2iHepBvVgHDs3d0DpD96ZLNo8EYmWug8dxKnhrTAC8K4CxSZpfxVcQqaxTfaTY
	q7M2P+p0Y1PDjpiPY6Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phBST-00EzCg-24;
	Tue, 28 Mar 2023 15:42:01 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phBRn-00Eygd-27;
	Tue, 28 Mar 2023 15:41:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1F64B60007;
	Tue, 28 Mar 2023 15:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680018077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f44Jt6ki3YZzVQv+c39mwH925zrn6cTrzM5orWtRgts=;
	b=br7IKpspyyoFU0HMnU6mdnDtBhqkR6X+KdjbWHuF8KPqbPvvx+i9X1tREJn/AUHwmdFNYu
	aLjvu72jDR7CbOnF8NBTlL9cGoXDZuI6ujOCIheKJurl9sK6uiN0qVPUO50evzb6HxcpIH
	bxwf4sz7TguVoWhk8H287V9Z1ch04LeHGdRtNZjjPmNSlVyh5QDKG23wMcGAzqq4MAuxmR
	RHU+f50bAzWuoa29vNmo0520k8y9Kb/wk6pjGSktPpXR4hMNdST5CUU6VlzgpM3dzhOCEt
	irmbdH5OmT0ALU6mlcmFVixTp/U6kZBUQMEEthf2vloXkm0Ppm5DVnIIeU+cQA==
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
Subject: [PATCH v5 5/8] mtd: spi-nor: Prepare the introduction of a new locking mechanism
Date: Tue, 28 Mar 2023 17:41:02 +0200
Message-Id: <20230328154105.448540-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328154105.448540-1-miquel.raynal@bootlin.com>
References: <20230328154105.448540-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_084120_029566_EC25BCDF 
X-CRM114-Status: GOOD (  13.57  )
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

This commit alone just introduces two new "prepare and lock" pairs of
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
index e80677d36a8c..daed09950ee1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1086,6 +1086,7 @@ static void spi_nor_unprep(struct spi_nor *nor)
 		nor->controller_ops->unprepare(nor);
 }
 
+/* Generic helpers for internal locking and serialization */
 int spi_nor_prep_and_lock(struct spi_nor *nor)
 {
 	int ret;
@@ -1106,6 +1107,48 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor)
 	spi_nor_unprep(nor);
 }
 
+/* Internal locking helpers for program and erase operations */
+static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t len)
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
+static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t len)
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
@@ -1459,7 +1502,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	addr = instr->addr;
 	len = instr->len;
 
-	ret = spi_nor_prep_and_lock(nor);
+	ret = spi_nor_prep_and_lock_pe(nor, instr->addr, instr->len);
 	if (ret)
 		return ret;
 
@@ -1522,7 +1565,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	ret = spi_nor_write_disable(nor);
 
 erase_err:
-	spi_nor_unlock_and_unprep(nor);
+	spi_nor_unlock_and_unprep_pe(nor, instr->addr, instr->len);
 
 	return ret;
 }
@@ -1715,11 +1758,13 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	loff_t from_lock = from;
+	size_t len_lock = len;
 	ssize_t ret;
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 
-	ret = spi_nor_prep_and_lock(nor);
+	ret = spi_nor_prep_and_lock_rd(nor, from_lock, len_lock);
 	if (ret)
 		return ret;
 
@@ -1746,7 +1791,8 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	ret = 0;
 
 read_err:
-	spi_nor_unlock_and_unprep(nor);
+	spi_nor_unlock_and_unprep_rd(nor, from_lock, len_lock);
+
 	return ret;
 }
 
@@ -1765,7 +1811,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
-	ret = spi_nor_prep_and_lock(nor);
+	ret = spi_nor_prep_and_lock_pe(nor, to, len);
 	if (ret)
 		return ret;
 
@@ -1807,7 +1853,8 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
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
