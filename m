Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4E3C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 11:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOMZ0N/xPWEGOkqE7zIo4kB7ZP4p3D6UYrsijD4FM7k=; b=zkP9liBlw2jfEa
	pdl83sAcrdAy1nGhkxLmZsTz1doY5EW8PUg5dDD036w6WWsUUPGelVpU90Thf+zF7j3cy/4AqvSwK
	xbeTuQc05VP7Hh1x0Jjl8thKRYdeiks2pORZ87HXsZVeh7nV6w2n+MwYUZnKZ/rN4D+5XYmQKirme
	51B1oFAwPoEGhQUbm29iQP9Zi4vh2jFnx9dsZ6acIeVxPUTGRjK18FqEy9QoLPidOpjqcdpW0Eh2B
	giGu7JlZXY7o+fXunRQLBj/4yX/aDpYG6JrOdCVCxN4aWk7CJYmrj/3wLW9ytzgt5wcvPDL+kLCjw
	Zf1IV3xvlKYoO5ws8pVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL1aJ-00E2CY-Mh; Fri, 18 Feb 2022 11:37:59 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL1Yl-00E1N2-PX
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 11:36:25 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id CACF82241C;
 Fri, 18 Feb 2022 12:36:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645184175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3SRCZp/aNw+4bqfY8YI6R1apw3mSO1+Icgsv0JWupc=;
 b=XJiEqr1ghuqlMXCPtUAZ3v68yW1DzMIH/aDQzfNo4fvx10AHa420+AMmX22YmlM3APU/Me
 J6gdI53QAaHdUGdfoM/M4skHxHcBxu8i3TCZnganrFWmhmp4bJ6rXiWREi3J8Siuy9XhGE
 5WrwcjGFckMcUzZlcUpqZa+jXiQ0Yho=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v2 05/32] mtd: spi-nor: everspin: unify function names
Date: Fri, 18 Feb 2022 12:35:40 +0100
Message-Id: <20220218113607.1360020-6-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220218113607.1360020-1-michael@walle.cc>
References: <20220218113607.1360020-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_033624_046500_C5AC0590 
X-CRM114-Status: GOOD (  12.43  )
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
 - <flash_family>_
 - <flash_part>_

There are no functional changes.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/everspin.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspin.c
index f6c6fb36a428..84a07c2e0536 100644
--- a/drivers/mtd/spi-nor/everspin.c
+++ b/drivers/mtd/spi-nor/everspin.c
@@ -8,7 +8,7 @@
 
 #include "core.h"
 
-static const struct flash_info everspin_parts[] = {
+static const struct flash_info everspin_nor_parts[] = {
 	/* Everspin */
 	{ "mr25h128", CAT25_INFO(16 * 1024, 1, 256, 2) },
 	{ "mr25h256", CAT25_INFO(32 * 1024, 1, 256, 2) },
@@ -18,6 +18,6 @@ static const struct flash_info everspin_parts[] = {
 
 const struct spi_nor_manufacturer spi_nor_everspin = {
 	.name = "everspin",
-	.parts = everspin_parts,
-	.nparts = ARRAY_SIZE(everspin_parts),
+	.parts = everspin_nor_parts,
+	.nparts = ARRAY_SIZE(everspin_nor_parts),
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
