Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAD2C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 12:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9yDy7xYIu5gFpzzp5FQ0C4lqOzlmP6WCEiEh5ZVAp0=; b=JwT/UQATqL2HXZ
	ZCv2yPnSk5v4cp3ZjFIzHCMrBaqXZpnkboOR13Q9GRs8Umawrgbno+0c3jXk5pgay/vyooO/H8bBD
	uAXUG96Z9CnHxeA2jPz0OqV6AA2DCXOqkr4ePQImYbJbYWL53xnv+faFA6UYByx5wlrh/J2UmXQEJ
	2lpyK4p3CnBdXe9UUpNbQ5uKdLS6mUJR4ouFkPbsgOxK0KAZlOSjfrtlPiXeQ9K24vH2m6oBkWeZj
	linGsv0tPShYAWkYaNC2jJsFunW6BUUEAZe615jN1tl9U0dJom2llz2FlUqkHnuXmuqdyJJoH52hl
	jpXxlE5aHG8qOvKGNOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM7Wr-005Z6m-IU; Mon, 21 Feb 2022 12:10:57 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7UR-005XtS-Dj
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 12:08:29 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B78462241C;
 Mon, 21 Feb 2022 13:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645445302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lNrji++2h4wwqRBGkUOCg0MJwhNDbhP7VF1zV51yR6k=;
 b=ZJrEmLjBgvUmLBB7syOVrdvK08MXTyRrb4cdmRkPwLlCNbj6VNvD3O6LARZaKGVzTK84q3
 siYBqHAfSWLHLhpppnizb3FROKBn6eXCewjTEGBinaapeE4+H6lgK5q4vzPqCfQdKQk6pj
 XmkBOyO5ONSkRlE2Uun+YTA1G0WQ2Sk=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v4 07/32] mtd: spi-nor: gigadevice: unify function names
Date: Mon, 21 Feb 2022 13:07:44 +0100
Message-Id: <20220221120809.1531502-8-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221120809.1531502-1-michael@walle.cc>
References: <20220221120809.1531502-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_040827_712026_B194DFDA 
X-CRM114-Status: GOOD (  12.50  )
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

To avoid name clashes unify all the function and static object names and
use one of the following prefixes which should be sufficiently unique:
 - <vendor>_nor_
 - <flash_family>_nor_
 - <flash_part>_

There are no functional changes.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/gigadevice.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 0807d0263808..119b38e6fc2a 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -23,7 +23,7 @@ static const struct spi_nor_fixups gd25q256_fixups = {
 	.default_init = gd25q256_default_init,
 };
 
-static const struct flash_info gigadevice_parts[] = {
+static const struct flash_info gigadevice_nor_parts[] = {
 	{ "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
@@ -61,6 +61,6 @@ static const struct flash_info gigadevice_parts[] = {
 
 const struct spi_nor_manufacturer spi_nor_gigadevice = {
 	.name = "gigadevice",
-	.parts = gigadevice_parts,
-	.nparts = ARRAY_SIZE(gigadevice_parts),
+	.parts = gigadevice_nor_parts,
+	.nparts = ARRAY_SIZE(gigadevice_nor_parts),
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
