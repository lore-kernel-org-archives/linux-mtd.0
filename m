Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052ACD26D7A
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XoygH/awmNKIQvNhEideh+PZTcS1q6Fhe96NkZsc0WM=; b=hjCEuogMk7/GSz
	/9QqNkDu/zP7pwUdEGEvIBmCDzHjLPLM1cmDytPO0BODKliq+8AfqewtKkeOXzWLHX+QVGzkMboS4
	DQ8GEZluJhEWX+QjCJvNBQnHzAYjSn6o6Ks7mhx3XN188VCLlGIirt3WXT9LAy7B6Szqm0afk5KTX
	J3/PiN+vWhZcDFxz26oIE+D6YSFy72Bktjiah4gdQ7592DJVjnjz9Sv3oYppjutLbWRfiDxUW5bxD
	R+KdlWmjetOGHuTmqSX3dUkCNaQTGjWGvtoonaBiOS6X+RIILWDPsILzYD2U16uxJLliyOYPiBcct
	HvG5IZm0vSYbTwcIWNWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8V-00000002mVl-3hKg;
	Fri, 09 Jan 2026 17:18:55 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8M-00000002mEk-19nN
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 411CFC1F6E4;
	Fri,  9 Jan 2026 17:18:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 89E25606C6;
	Fri,  9 Jan 2026 17:18:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1BBA103C89BD;
	Fri,  9 Jan 2026 18:18:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979123; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=71VfqlwpnO88b/BySfbu5HhBv3rjVPZdc4UiUGls3+g=;
	b=2GWdC6RFF/oN61uiGb0U2Bfk6QtlTupk4CCJ0UftEV2hk0MCSwA5glgEp3PMl2sI6bZVai
	cFI8myiIMfCBF7H4m8iJKjTEz4zmN7Se4ua7TEr4wsGgN/pUIFmQxrONiS4U7WVk8Wbfjw
	nI3WgT2zIjTkpGfQ/id93LVlU8/4ywafoyphM20J7wYcARplx+fMsOOCM5vF/EwySwAwqK
	x4Nj4vIdOCf/QVJ8POdb5FGYGXKC1GjR7qxlXFI5U94zmx1nfYRgywARbIXYEvXHX3E84w
	QPBWJPGZrbNmvv+5vCXb6C+77YSToZOC2XCCwSGt3QUUc7HvSUo0wBG7kpkW4Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:19 +0100
Subject: [PATCH v2 21/27] mtd: spinand: Gather all the bus interface steps
 in one single function
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-21-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_091846_743556_802C0127 
X-CRM114-Status: GOOD (  14.10  )
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

Writing the quad enable bit in one helper and doing the chip
configuration in another does not make much sense from a bus interface
setup point of view.

Instead, let's create a broader helper which is going to be in charge of
all the bus configuration steps at once. This will specifically allow to
transition to octal DDR mode, and even fallback to quad (if suppoorted)
or single mode otherwise.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 62 +++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 88d87a96ddb0..54a32cea3755 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -261,18 +261,9 @@ static int spinand_init_cfg_cache(struct spinand_device *spinand)
 	return 0;
 }
 
-static int spinand_init_quad_enable(struct spinand_device *spinand)
+static int spinand_init_quad_enable(struct spinand_device *spinand,
+				    bool enable)
 {
-	bool enable = false;
-
-	if (!(spinand->flags & SPINAND_HAS_QE_BIT))
-		return 0;
-
-	if (spinand->op_templates->read_cache->data.buswidth == 4 ||
-	    spinand->op_templates->write_cache->data.buswidth == 4 ||
-	    spinand->op_templates->update_cache->data.buswidth == 4)
-		enable = true;
-
 	return spinand_upd_cfg(spinand, CFG_QUAD_ENABLE,
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
@@ -1391,12 +1382,6 @@ static int spinand_manufacturer_init(struct spinand_device *spinand)
 			return ret;
 	}
 
-	if (spinand->configure_chip) {
-		ret = spinand->configure_chip(spinand);
-		if (ret)
-			return ret;
-	}
-
 	return 0;
 }
 
@@ -1602,6 +1587,31 @@ static int spinand_detect(struct spinand_device *spinand)
 	return 0;
 }
 
+static int spinand_configure_chip(struct spinand_device *spinand)
+{
+	bool quad_enable = false;
+	int ret;
+
+	if (spinand->flags & SPINAND_HAS_QE_BIT) {
+		if (spinand->ssdr_op_templates.read_cache->data.buswidth == 4 ||
+		    spinand->ssdr_op_templates.write_cache->data.buswidth == 4 ||
+		    spinand->ssdr_op_templates.update_cache->data.buswidth == 4)
+			quad_enable = true;
+	}
+
+	ret = spinand_init_quad_enable(spinand, quad_enable);
+	if (ret)
+		return ret;
+
+	if (spinand->configure_chip) {
+		ret = spinand->configure_chip(spinand);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
 static int spinand_init_flash(struct spinand_device *spinand)
 {
 	struct device *dev = &spinand->spimem->spi->dev;
@@ -1612,10 +1622,6 @@ static int spinand_init_flash(struct spinand_device *spinand)
 	if (ret)
 		return ret;
 
-	ret = spinand_init_quad_enable(spinand);
-	if (ret)
-		return ret;
-
 	ret = spinand_upd_cfg(spinand, CFG_OTP_ENABLE, 0);
 	if (ret)
 		return ret;
@@ -1628,19 +1634,25 @@ static int spinand_init_flash(struct spinand_device *spinand)
 		return ret;
 	}
 
+	ret = spinand_configure_chip(spinand);
+	if (ret)
+		goto manuf_cleanup;
+
 	/* After power up, all blocks are locked, so unlock them here. */
 	for (i = 0; i < nand->memorg.ntargets; i++) {
 		ret = spinand_select_target(spinand, i);
 		if (ret)
-			break;
+			goto manuf_cleanup;
 
 		ret = spinand_lock_block(spinand, BL_ALL_UNLOCKED);
 		if (ret)
-			break;
+			goto manuf_cleanup;
 	}
 
-	if (ret)
-		spinand_manufacturer_cleanup(spinand);
+	return 0;
+
+manuf_cleanup:
+	spinand_manufacturer_cleanup(spinand);
 
 	return ret;
 }

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
