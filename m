Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E905C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fx5c0BNgKMkCSJtDKYOaeZ2I8BfqoPqY9Vsr/H6XYkw=; b=rbBIc3tnKCf9FA
	NtYX+JOdcbznVk5zm7Ka/R20NAyzVKfWIGzKphCOGU/WlYvi9R3AoJqZxZG5MmF6XYlohq5LZnGe4
	CBuyndTfbtJtX9J7aMbOUz3ttA3Wm7JMFxr9mHWAExqwgP5k68H6I38J2c49ZhBUM3QQwVoWQp6Hs
	pZ4b6EV0i7XoI9aGLqqjC8wH/luk5SHekVrq8/EMqUL+oGD0+v5gss2czIfYhKfmlpvLwRdvioVW/
	AEU3iw3o9npVLg9rQRUTrIX8DhaNKV16p8upHvwC8o5g5NZka+k3o3onGF0pYZRgmVPlsGKbz2U0U
	+PoV9OYJ0ETjZEhSPU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8Bm-005kNC-4G; Mon, 21 Feb 2022 12:53:14 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7UY-005Y0G-8s
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 12:08:40 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4A7BF22441;
 Mon, 21 Feb 2022 13:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645445312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rgNSAc65R00dUB2WoxMX+ceITRUleNOknrJpVl6XzEI=;
 b=pur1G2b+j4XfWcrOHUJWoVBvb9odjTCijm0kQrM1eqiqqQQ865i8+8wZSK8443fgn/FKt8
 9fNMc+9eGVA+psiwIoBhvqdSWnXx/tgvyIi7bKHOGRL05RnmP0BX9+8nUcCipGUuTcVtoP
 d3TAcwI+of+6/KfO7a8kWW4dNiEnCa4=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v4 30/32] mtd: spi-nor: spansion: rename vendor specific
 functions and defines
Date: Mon, 21 Feb 2022 13:08:07 +0100
Message-Id: <20220221120809.1531502-31-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221120809.1531502-1-michael@walle.cc>
References: <20220221120809.1531502-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_040834_550570_0C8C90D8 
X-CRM114-Status: GOOD (  12.77  )
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

Drop the generic spi_nor prefix for all the spansion functions.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/spansion.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 3606291d421c..0b5cbfa57221 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -309,10 +309,10 @@ static const struct flash_info spansion_nor_parts[] = {
 };
 
 /**
- * spi_nor_clear_sr() - Clear the Status Register.
+ * spansion_nor_clear_sr() - Clear the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
  */
-static void spi_nor_clear_sr(struct spi_nor *nor)
+static void spansion_nor_clear_sr(struct spi_nor *nor)
 {
 	int ret;
 
@@ -336,13 +336,13 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_sr_ready_and_clear() - Query the Status Register to see if the flash
- * is ready for new commands and clear it.
+ * spansion_nor_sr_ready_and_clear() - Query the Status Register to see if the
+ * flash is ready for new commands and clear it.
  * @nor:	pointer to 'struct spi_nor'.
  *
  * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
-static int spi_nor_sr_ready_and_clear(struct spi_nor *nor)
+static int spansion_nor_sr_ready_and_clear(struct spi_nor *nor)
 {
 	int ret;
 
@@ -356,7 +356,7 @@ static int spi_nor_sr_ready_and_clear(struct spi_nor *nor)
 		else
 			dev_err(nor->dev, "Programming Error occurred\n");
 
-		spi_nor_clear_sr(nor);
+		spansion_nor_clear_sr(nor);
 
 		/*
 		 * WEL bit remains set to one when an erase or page program
@@ -384,7 +384,7 @@ static void spansion_nor_late_init(struct spi_nor *nor)
 	}
 
 	if (nor->info->mfr_flags & USE_CLSR)
-		nor->params->ready = spi_nor_sr_ready_and_clear;
+		nor->params->ready = spansion_nor_sr_ready_and_clear;
 }
 
 static const struct spi_nor_fixups spansion_nor_fixups = {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
