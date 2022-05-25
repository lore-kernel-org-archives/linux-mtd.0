Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C89C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 25 May 2022 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RaSj9sqBppfXumvCjMDjiftaFvOQBwO2tRhwo9yW2uM=; b=Quq4u7Tu8BP6Mf
	rDok1P3C/lk70KGIzcBNJcsltQMUlkY4hxNt/vfY8QWS7f6kBYhWpGfJDsgc5Vj9KizhQSvjo8zWj
	00dYa9GZmOocsjJNcytOOorSCSrZpT01Kf0MV8v20/30m8533hP5GwIO6bheEBnt1G6HAVYp9fv2m
	rQMVmja4cxDaqxa1ZIxoEOXLT0eKDzNm0ObLiTSv0NDNpfDCgbDp+ItLjWM5J5P76tUVTmayjP7c0
	n1PIp159kbJhNcBCg6+FUNgZ4QKoSlxKHaokK8IgPaqHAC8PuLstdFsLAr/XxbVtEkws5RVRm+I3b
	EjS/WVOLWrltFxo82wAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttvE-00BpqI-Mu; Wed, 25 May 2022 16:31:44 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttuq-00BpfN-0K
	for linux-mtd@lists.infradead.org; Wed, 25 May 2022 16:31:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5705FE000F;
	Wed, 25 May 2022 16:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653496278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YCygeTjJw82Eg5zy75WssN2xrBVvslNqdxm+9gwMM1k=;
	b=eoaPHLsxaCRxYqvuhki3d35VsCv4N/ZlMNMgi6fvMuuIqdzpkWadcY6T8lwsapkfk6Ut5s
	6/D1rNF40CFta/gu0X4Y5Ijc47TWfo/NffQfrJS21YDRgk6oKBWZAPmHFZd68TnElKmvp+
	vrCBX6HncxVDbqzV930SEtmVgMqTRDC2wDkwSwi0P34EV6yu3Wpabu3g8L6MjnJZvClZoC
	fZAXmrYkijGYm8cnoi8l/ZdcV606agXBbGzNRH+IUhy3Y4fn60ovKcKyqdWxGa8A5zLaAR
	EM5YDXrAQaaZTMs/Sc4Wtwv7vxz8I1R0f6hEcyCGdC37bm2Ep8134B6DojnLmg==
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
Subject: [RFC PATCH 6/8] mtd: spi-nor: Prepare the introduction of a new locking mechanism
Date: Wed, 25 May 2022 18:31:06 +0200
Message-Id: <20220525163108.266705-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220525163108.266705-1-miquel.raynal@bootlin.com>
References: <20220525163108.266705-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_093120_434070_E01F20BF 
X-CRM114-Status: GOOD (  14.44  )
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
index 048665252a80..3d8e5f9961b9 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1081,6 +1081,7 @@ static void spi_nor_unprep(struct spi_nor *nor)
 		nor->controller_ops->unprepare(nor);
 }
 
+/* Generic helpers for internal locking and serialization */
 int spi_nor_lock_and_prep(struct spi_nor *nor)
 {
 	int ret;
@@ -1101,6 +1102,48 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor)
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
@@ -1454,7 +1497,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	addr = instr->addr;
 	len = instr->len;
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_lock_and_prep_pe(nor, addr, len);
 	if (ret)
 		return ret;
 
@@ -1517,7 +1560,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	ret = spi_nor_write_disable(nor);
 
 erase_err:
-	spi_nor_unlock_and_unprep(nor);
+	spi_nor_unlock_and_unprep_pe(nor, addr, len);
 
 	return ret;
 }
@@ -1704,7 +1747,7 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_lock_and_prep_rd(nor, from, len);
 	if (ret)
 		return ret;
 
@@ -1731,7 +1774,8 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	ret = 0;
 
 read_err:
-	spi_nor_unlock_and_unprep(nor);
+	spi_nor_unlock_and_unprep_rd(nor, from, len);
+
 	return ret;
 }
 
@@ -1750,7 +1794,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
-	ret = spi_nor_lock_and_prep(nor);
+	ret = spi_nor_lock_and_prep_pe(nor, to, len);
 	if (ret)
 		return ret;
 
@@ -1792,7 +1836,8 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
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
