Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65F1C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Fh5oL+YET7PgvlqwjSrIia8oRSJ4KQkmi+SD+CxDC4=; b=fDIDAg3pxlTiD9
	7UVSy1Tm0fcLxu0vr+TXlDyvxee+QyCsqDKtzVqL9PXDsdq60If5sHYgWeJQFdvhaVFK8Nha5hY62
	KbHxAWRYq/uxwT/4k0uW2wFDm96wMx8SC9hEFVqUeXGUtVmRlAKbLQP7AfxKSvsKcWQXsgzpv943N
	M0o+n7hL8ZJuBKPL0h7oZgqjE56UoXoF0u5gKZa9L+sgXHgTo4pLRWABJvpzs5EIut7cTiu9+txae
	u4/DWM5oKlXulwABlFNKDHi74gg1cI34GDJo/Cv24xYCnNxPImBZLj1KH9PAEuYOmwPUkGQPNo0ct
	/crpqgVB+no1OZ+JSsNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM5KD-004gB1-58; Mon, 21 Feb 2022 09:49:45 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4RO-004Qr4-Fb
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 08:53:16 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E39E92241C;
 Mon, 21 Feb 2022 09:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645433584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ckbf6Q/jmsl515Nwvytsj5VQqppc1StpRQJYAIW3rH4=;
 b=Fh6ZpioiI5c5gfiMotj2uaPHz4ZDQJRvZZIyh53cDvssa5ZUH5lhdBplUM+Tg31nQlaVXD
 RKzLsffsGHfrN5DF7gy1iW47Wqi8+gTWscAwKplvRJk4FjmWS4SPwCWQeXZggDZ/J21Me3
 yUlN5FjqGD2NIbNvzzl2ainUga9GX8g=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v3 31/32] mtd: spi-nor: slightly change code style in
 spi_nor_sr_ready()
Date: Mon, 21 Feb 2022 09:52:35 +0100
Message-Id: <20220221085236.1452024-32-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221085236.1452024-1-michael@walle.cc>
References: <20220221085236.1452024-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_005306_735481_6802B105 
X-CRM114-Status: GOOD (  11.17  )
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

Now that there is almost no special case code left in
spi_nor_sr_ready(), the return check looks odd. Move the function call
closer to the return code checking.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f5a2f37d140e..9014008e60b3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -563,8 +563,9 @@ int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
  */
 int spi_nor_sr_ready(struct spi_nor *nor)
 {
-	int ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	int ret;
 
+	ret = spi_nor_read_sr(nor, nor->bouncebuf);
 	if (ret)
 		return ret;
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
