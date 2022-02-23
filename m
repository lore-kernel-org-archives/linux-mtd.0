Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A7BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptGu5B5dT6xTuaKj+XoM+IXK+rGjM5zvhUHpGhoYju0=; b=3y5p2Mx8/k3BtG
	RSJgzrZF/GiP64DJVnKWMfecf43U9/1C+dJPbkgpYsl6kiWgQLBJuVtY4aGn0oFQUKPwAlm9decI9
	1yuqGJO4ZLVmVZQnmtCFpyhfFdHDf339xCq11goCcUJVwHXort5V1/BkzUpi09uqzyGVqJp6GJskk
	oJQgT+juY8fKTPvH1p3eitYplbw8Ts8bciKcYBnUTDn/6ghyY61lKBBPkPzC6H3eWqGqBFD0CrJHN
	YmeUbscv8e7pQWy/1uR8gk6zTjRQNvJnQ0pYKBU+1s1KNrHL4wKURJ+ynp0WZvJ34Up/BbTQChJIx
	Tz2dgDP2/0kl75sTBttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMsDv-00Eebe-1p; Wed, 23 Feb 2022 14:02:31 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwH-00EZUo-8U
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 13:44:21 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 355182245C;
 Wed, 23 Feb 2022 14:44:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645623852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXOPL5cPITB5pX8C9uT9seIIQT64+6BMqwNdfPuDNQU=;
 b=DbjKo8dsPWkQtCCu8eWB0m8tXqheMabXvmk9yM+ZiobdO+1SZnfq6BqoZZOSBLFCYgaSjY
 gNz6EVsTw/6KpAiqjyBG1ic4PbZLpahUxPQ/8iZwXUTOuNOVKNR4diOQXGnOX/UUczbp6n
 3sBevsMWo+gLNLamEUChQQruhMUfYuU=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 18/32] mtd: spi-nor: allow a flash to define its own
 ready() function
Date: Wed, 23 Feb 2022 14:43:44 +0100
Message-Id: <20220223134358.1914798-19-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223134358.1914798-1-michael@walle.cc>
References: <20220223134358.1914798-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_054417_511892_9ADAF982 
X-CRM114-Status: GOOD (  13.27  )
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

Xilinx and Micron flashes have their own implementation of the
spi_nor_ready() function. At the moment, the core will figure out
which one to call according to some flags. Lay the foundation to
make it possible that a flash can register its own ready()
function.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c | 4 ++++
 drivers/mtd/spi-nor/core.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4d2036cdce42..390a9ab413b7 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -794,6 +794,10 @@ static int spi_nor_ready(struct spi_nor *nor)
 {
 	int sr, fsr;
 
+	/* Flashes might override the standard routine. */
+	if (nor->params->ready)
+		return nor->params->ready(nor);
+
 	if (nor->flags & SNOR_F_READY_XSR_RDY)
 		sr = spi_nor_xsr_ready(nor);
 	else
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 4fe16b5aa3f5..fdc8c0f31f5c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -261,6 +261,9 @@ struct spi_nor_otp {
  *			SPI NOR flashes that have peculiarities to the SPI NOR
  *			standard e.g. different opcodes, specific address
  *			calculation, page size, etc.
+ * @ready:		(optional) flashes might use a different mechanism
+ *			than reading the status register to indicate they
+ *			are ready for a new command
  * @locking_ops:	SPI NOR locking methods.
  */
 struct spi_nor_flash_parameter {
@@ -282,6 +285,7 @@ struct spi_nor_flash_parameter {
 	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
 	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
 	int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
+	int (*ready)(struct spi_nor *nor);
 
 	const struct spi_nor_locking_ops *locking_ops;
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
