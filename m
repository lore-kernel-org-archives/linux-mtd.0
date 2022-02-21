Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6E5C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 12:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOIL8ox8+wFBr7qDncaTFEF4n6gRsBpBvirOAQdKLbw=; b=unkfbfeuAUpaFM
	tdYd6WRM/X1/L+BTduMpg88BCvkyDPc9AZwiJLKaDJMJ/Ij56waHKMazWcYN9RPDHkhu8TviYb8nS
	zaOer1B57rBX+6avQbxZjym83eMru1FXwyTx7/6tXytqrMay1l5g30UJ2tAthDRvOEkPse2yiY4cz
	TN0bljQXe6GwY5Sl6hhzfClojrzvTZ+Pw3qpvFsoY/47iPzObi24MzQR3QMFhyMsDPRP9MIoVfcyc
	nPwBdj3gJm29HCddI432eWu4p9d5z8Jkoe0+lQxU8JqxfrAdQaXxaxur7sQ45TCUeNOVwRqLqog2l
	GMZ4XlL+KS9PubZTyV4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM7Xa-005ZUJ-Sk; Mon, 21 Feb 2022 12:11:43 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7UR-005XtR-Dd
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 12:08:29 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7279E223F7;
 Mon, 21 Feb 2022 13:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645445302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rn1oW6aFXizxZtpF4apAEA9nQ0euOpxJBqkTidXgq28=;
 b=Cc+y3+Ykyw610A4mfRueB/2gFD9Zd/4h8eBFybcMTRSfsVBn16HdYkf1IVOjebrWbumgps
 eRoQcDnpOdMJ6MiLmSa3DBtusaj2KV0DYft6tV00YEuUkwBZDKL8V1mLrkx5lZTbXuKuiO
 v4awkSLvZ2LnTGO+iM5ASUZUd4Pe1Ig=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v4 06/32] mtd: spi-nor: fujitsu: unify function names
Date: Mon, 21 Feb 2022 13:07:43 +0100
Message-Id: <20220221120809.1531502-7-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221120809.1531502-1-michael@walle.cc>
References: <20220221120809.1531502-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_040827_706297_56990145 
X-CRM114-Status: GOOD (  12.85  )
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
 drivers/mtd/spi-nor/fujitsu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/fujitsu.c b/drivers/mtd/spi-nor/fujitsu.c
index 5fa8f04f2e35..69cffc5c73ef 100644
--- a/drivers/mtd/spi-nor/fujitsu.c
+++ b/drivers/mtd/spi-nor/fujitsu.c
@@ -8,7 +8,7 @@
 
 #include "core.h"
 
-static const struct flash_info fujitsu_parts[] = {
+static const struct flash_info fujitsu_nor_parts[] = {
 	/* Fujitsu */
 	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
@@ -16,6 +16,6 @@ static const struct flash_info fujitsu_parts[] = {
 
 const struct spi_nor_manufacturer spi_nor_fujitsu = {
 	.name = "fujitsu",
-	.parts = fujitsu_parts,
-	.nparts = ARRAY_SIZE(fujitsu_parts),
+	.parts = fujitsu_nor_parts,
+	.nparts = ARRAY_SIZE(fujitsu_nor_parts),
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
