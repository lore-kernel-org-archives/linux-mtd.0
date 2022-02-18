Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD38C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfEhkKJBAhunSBkBJk3xaKJPb7ZiO8bCpfMbOigZ/oI=; b=F/neAYNwsmD2ZF
	8vlnYvwlK7sGBqXdF+T9Cu2DDmBEChMOtNl8cG9qZbBFKQ6Bswp/6gZxf4bzuKu7Z7E08RxF4vhx2
	MczbedAaQFa+mGIhJc2imXWG4+ivriSByxyyxdduotrODTjgJpQ1AOhe/I5F39WGHe+My3DQSCsiZ
	LDnsO/jDW+POqjjVXHWM/xV1p2ucdwqP/PDfCTuHyYMRUMhyOh/UG3tOCy89/gUAxncM+tYmSrl9d
	NGHiYjNTcB2rr70iVhfg6Aws6jLousjkS8TlYVDszvPStwG6D4sCKxb63J1uv9n1RivP+LsnfZ+i2
	A1wG+hvdVjITK3EGQJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL1Yl-00E1NQ-QT; Fri, 18 Feb 2022 11:36:23 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL1Yi-00E1Jg-7t
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 11:36:22 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 096EC223F0;
 Fri, 18 Feb 2022 12:36:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645184175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UD6+0Z6yibRsOdt8zn1BhQmKZUwO1fab/PtnzMpVPlk=;
 b=qlEhJUbrs65qllmKyx6mDETOJaPX+DBHXUK++Ig6cSbTKlWgbs3J4QhYou+sPHMdijHgWN
 syNvrjECpgE7frCMOR45mCrOFnYf/WqUTzjKhJMquzgFKAXhfw/Cgd2SKg9v432Qm/NWyu
 bsTBiQsawtEa3xp59T/URB4XjA0dkDg=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v2 02/32] mtd: spi-nor: catalyst: unify function names
Date: Fri, 18 Feb 2022 12:35:37 +0100
Message-Id: <20220218113607.1360020-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220218113607.1360020-1-michael@walle.cc>
References: <20220218113607.1360020-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_033620_926259_EF7815A0 
X-CRM114-Status: GOOD (  12.29  )
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
 drivers/mtd/spi-nor/catalyst.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/catalyst.c b/drivers/mtd/spi-nor/catalyst.c
index ae4d67e01bb3..6d310815fb12 100644
--- a/drivers/mtd/spi-nor/catalyst.c
+++ b/drivers/mtd/spi-nor/catalyst.c
@@ -8,7 +8,7 @@
 
 #include "core.h"
 
-static const struct flash_info catalyst_parts[] = {
+static const struct flash_info catalyst_nor_parts[] = {
 	/* Catalyst / On Semiconductor -- non-JEDEC */
 	{ "cat25c11", CAT25_INFO(16, 8, 16, 1) },
 	{ "cat25c03", CAT25_INFO(32, 8, 16, 2) },
@@ -19,6 +19,6 @@ static const struct flash_info catalyst_parts[] = {
 
 const struct spi_nor_manufacturer spi_nor_catalyst = {
 	.name = "catalyst",
-	.parts = catalyst_parts,
-	.nparts = ARRAY_SIZE(catalyst_parts),
+	.parts = catalyst_nor_parts,
+	.nparts = ARRAY_SIZE(catalyst_nor_parts),
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
