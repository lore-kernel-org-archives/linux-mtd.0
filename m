Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C3610A88ED
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Mar 2026 16:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxEWgv0R1bbrhdZqSG2U69qH/kd3Hpa58Pm+wKOC2dU=; b=mEwcy/2SBk+9Yt
	7TIRUkfp88e+dO8Cx6a07Zx8TL/a0NzoaveuBi7hOMzHUnaTOjWmsbU8CQ9bii7seRIPimbUOofWb
	c4vPlwctPGAbuzMTQPlS9DcxDcbosTolmkQcLRJWIEwHCdhjnXqPZeLr3qznC9sBpkuqhxSaYfzl7
	ySi2Z3FA7fJBt99PQFAwITp4+FmdG2tJe33fNlSLiV+ZFFPVAPX1C7MCqHpDC8ZhSscGElQ2x2wW0
	+Oc5NZmlRHR7qlTx8YbpqBkXe+1NQUQGLGYm5iI2ptX8EjyFZqcJFvaOn9k93ZUr6EHLVpkqfQyBF
	E1CHXL97ENp31LH0eE+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nXM-00000005qg0-1wW7;
	Thu, 26 Mar 2026 16:26:24 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nXI-00000005qbu-3YL7
	for linux-mtd@lists.infradead.org;
	Thu, 26 Mar 2026 16:26:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 680524E4280D;
	Thu, 26 Mar 2026 16:26:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DC75601FA;
	Thu, 26 Mar 2026 16:26:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D8C610450A93;
	Thu, 26 Mar 2026 17:26:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774542378; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TkcWUC0TtSzdMpvi2JDSmyuOip9Q86RjX9UadZNkZZw=;
	b=etKO1z83O24QvsAEPlHabgdI9VwxmeiZBfLLuPWSRVyIj2setEbXdQoLPOf6zIY+Ca96yM
	weGeBCIcwnyhaxeuV0/zSiliLu74YIACRZNvhw3Nc7HQojJOp4QrIbQHIVu2G1hZ+rPHod
	RQYraShXfrtjNCzrN6CCR5tGA7eMGbflcyY5SrACfaJkjWpWK/dV6GqLZ67YKEKZTUxGaD
	jAY7HXDNu1kl7ERMH4SwuXenemK0+SjJo+3o6hlPqf/ZG35ONbMxJo9YICwEE3IhH4iB4D
	SeFSmb1qhw+3vdtyJzsd/5xfCPFVY3S3L4DrFI7XOfJJrV/r1uJkXWWm89+CVQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Mar 2026 17:25:56 +0100
Subject: [PATCH v2 09/11] mtd: spinand: winbond: Create a helper to write
 the HS bit
MIME-Version: 1.0
Message-Id: <20260326-winbond-v6-18-rc1-cont-read-v2-9-643de97a68a3@bootlin.com>
References: <20260326-winbond-v6-18-rc1-cont-read-v2-0-643de97a68a3@bootlin.com>
In-Reply-To: <20260326-winbond-v6-18-rc1-cont-read-v2-0-643de97a68a3@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_092621_027084_1A1947F3 
X-CRM114-Status: GOOD (  10.24  )
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

Updating the HS bit is not complex but implies reading, setting/clearing
a bit and writing. Clean a bit this section by moving this logic in its
own helper.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 6c11f59a9f8d..b30a343a6672 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -404,13 +404,28 @@ static int w25w35nxxjw_ecc_get_status(struct spinand_device *spinand, u8 status)
 	return -EINVAL;
 }
 
+static int w25n0xjw_set_sr4_hs(struct spinand_device *spinand, bool enable)
+{
+	int ret;
+	u8 sr4;
+
+	ret = spinand_read_reg_op(spinand, W25N0XJW_SR4, &sr4);
+	if (ret)
+		return ret;
+
+	if (enable)
+		sr4 |= W25N0XJW_SR4_HS;
+	else
+		sr4 &= ~W25N0XJW_SR4_HS;
+
+	return spinand_write_reg_op(spinand, W25N0XJW_SR4, sr4);
+}
+
 static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
 			   enum spinand_bus_interface iface)
 {
 	const struct spi_mem_op *op;
 	bool hs;
-	u8 sr4;
-	int ret;
 
 	if (iface != SSDR)
 		return -EOPNOTSUPP;
@@ -429,20 +444,7 @@ static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
 	else
 		hs = true;
 
-	ret = spinand_read_reg_op(spinand, W25N0XJW_SR4, &sr4);
-	if (ret)
-		return ret;
-
-	if (hs)
-		sr4 |= W25N0XJW_SR4_HS;
-	else
-		sr4 &= ~W25N0XJW_SR4_HS;
-
-	ret = spinand_write_reg_op(spinand, W25N0XJW_SR4, sr4);
-	if (ret)
-		return ret;
-
-	return 0;
+	return w25n0xjw_set_sr4_hs(spinand, hs);
 }
 
 static int w35n0xjw_write_vcr(struct spinand_device *spinand, u8 reg, u8 val)

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
