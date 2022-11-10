Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058DDC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 15:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXJd9PxT4kbk5CGM29XTwJx/TAMjsrXUUGeF/HjKTCk=; b=MGieCxZoiBVkd9
	mQmEeikIiODGYyWBWToANuOwCxT3cfxOoUoGTpWaJeEbopWQsYx5g4/YT2NaRCbZ0ejoqO3H/WANm
	yCGF9kOmjR/7MqutaPLDdwtCR81fv1dhZHWbiYCLsnxDBqCQ9A/Yc+m3jOvGr19nv94guZwkhbnGI
	oiAywTaLo/BFdila1tg6SXs0Cmitg/buP/yodipBWGjSNmB5CeQKS65QUcA/Uwwb1ifwYbni8PMv5
	bhZb8jmM5dfSF08bC0o2+/qX8xhvvtgHFTf8JDvZ2QSG/wW2Wcv+KilYQFhlQbMRdaz/5iIgGpb+k
	1vzf1izErbJetTmLJ8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9ud-006xVt-5a; Thu, 10 Nov 2022 15:56:19 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9tm-006wsd-6M
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 15:55:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7FC6A2000D;
	Thu, 10 Nov 2022 15:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668095724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mtp2QqHeMT7lQgmoEOVC6mJhaRHSI1UNhmzADqeXhsU=;
	b=Dn847nnpi0GxsmMVzI20vzMG8Cti2zvUO4lUety2cyWQyu/vzVJbUSwFLDKeuIupTTapyd
	qNd3HgXjv4Wc9dgZAiuSpL0iOQ2Ce9iJt5uvhw3orIfkD6Sa1Mb8batuiG0MEG9YSnR8Jy
	agzQq9jJVKj/cHoJ9knukovxOQAtDmvCtXPr6PUq3Nao/a8lhVkRwgb//cTYhCYgwxAOdy
	7afZs8KZLytJ64RxRM3DjXbIf+rTXjSX1QPoh6mIswe1UjADCh9pWbC3z7GWd9TyyZ7sWL
	WFj8Z/uaYp3G8NKvgllBb8rS+YmYtFKUguhPIkfhfbYg/tOGjulcPSjWoGsdbg==
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
Subject: [PATCH v2 6/9] mtd: spi-nor: Prepare the introduction of a new locking mechanism
Date: Thu, 10 Nov 2022 16:55:10 +0100
Message-Id: <20221110155513.819798-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110155513.819798-1-miquel.raynal@bootlin.com>
References: <20221110155513.819798-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_075526_584880_879B3068 
X-CRM114-Status: GOOD (  13.83  )
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
 drivers/mtd/spi-nor/core.c | 57 ++++++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f87e57d97692..dfda350d5056 100644
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
+	ret = spi_nor_lock_and_prep_pe(nor, addr, len);
 	if (ret)
 		return ret;
 
@@ -1520,7 +1563,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	ret = spi_nor_write_disable(nor);
 
 erase_err:
-	spi_nor_unlock_and_unprep(nor);
+	spi_nor_unlock_and_unprep_pe(nor, addr, len);
 
 	return ret;
 }
@@ -1694,7 +1737,7 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_lock_and_prep_rd(nor, from, len);
 	if (ret)
 		return ret;
 
@@ -1721,7 +1764,8 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	ret = 0;
 
 read_err:
-	spi_nor_unlock_and_unprep(nor);
+	spi_nor_unlock_and_unprep_rd(nor, from, len);
+
 	return ret;
 }
 
@@ -1740,7 +1784,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_lock_and_prep_pe(nor, to, len);
 	if (ret)
 		return ret;
 
@@ -1782,7 +1826,8 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
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
