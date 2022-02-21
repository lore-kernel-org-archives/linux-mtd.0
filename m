Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EF0C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 12:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iiXBZcGVSiRa3obAaGQ8+3WgKC8S8dpk1rfeBNgbyUc=; b=oii1EyMOj7iOgs
	gRiKVmL+sctO5R25H8WIXWnP/1n5kDmjLfOnRgercf3Xp4wBDGkZqWLLhOXK6OC32da9Pog5n0k/4
	ZjWkuquOucyFVn3uVlON6VsFzlNf39jVpW2jl7DZHDGEgKqz3A8S1MrO9gENiesRJF2jxh+MFRh0E
	hHsa+R9pONCp570M8QERBZD+T2N0imqZyL6zh5OlsX0aver4yAYJ2bDdMbqWI8VRKYDDCPM7S/6H7
	YafyAmPEBR8Eu2xaEJB6wRY0uz2PAQ53rJuly/RBUlkv1xwgKc8lbfX1f/OPVK2tDW2PM4rKPGrnF
	pPojmq9M+GrV4/2H31mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM7YU-005a0n-O6; Mon, 21 Feb 2022 12:12:39 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7UR-005XtT-TK
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 12:08:29 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 34CA7223F6;
 Mon, 21 Feb 2022 13:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645445302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8RKR2z3SwNjygYMnVzmMuumMpqceCIEGmaYanKshDw=;
 b=DCxNsyXny8/h94WW9B55+Rr+TlvzZCloPXUTZbXMUsBq6rFbYHU4I/NitNAiC73nUyZNag
 yM89OKUCV4zUeH0EdsdAPwWPw9qDGhjXng0fTUqzhL08h005FDmARpMsstMmjeUM/UlRum
 C5C2nb1KH5rTkoz7BiIAubzzxis+ztc=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v4 05/32] mtd: spi-nor: everspin: unify function names
Date: Mon, 21 Feb 2022 13:07:42 +0100
Message-Id: <20220221120809.1531502-6-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221120809.1531502-1-michael@walle.cc>
References: <20220221120809.1531502-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_040828_150442_5F3F68CC 
X-CRM114-Status: GOOD (  12.59  )
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
