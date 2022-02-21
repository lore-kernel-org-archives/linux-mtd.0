Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467BAC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 09:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOIL8ox8+wFBr7qDncaTFEF4n6gRsBpBvirOAQdKLbw=; b=Bgnf7dnqSsFXog
	EDMgXXMwVpd595I/bRRWElu4FzsmNtiiaBUoAsZWiAT4aY1/9mbKQR04UNwwBuzwVhfJgBX1EM0Np
	CcubGTc4VjeGngb/hHIJ2Ieody6o5U96eV0VbkAeWL24i3AizXwmV3ncHmwFjIspO3AcBGsMXJGmz
	IOGD0pifDzXpeRYVSrx4QJaoG1UhSAYbp6T1jLB+KUxlhdp8t70PdFZkdJ6KRenYr+fCjrEMmmjBW
	ed89sktyhI8z0jEjEau9i4HuyFvwBtPvWujfh3y2+Ts5AssW1s5QkQ8OLcTkJx4oJXsGCSScSAYA4
	BGJii9ThY2qOo0WHK+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM4Yc-004UJG-G6; Mon, 21 Feb 2022 09:00:34 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4RB-004QgK-Ka
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 08:52:55 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D255B223F7;
 Mon, 21 Feb 2022 09:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645433569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rn1oW6aFXizxZtpF4apAEA9nQ0euOpxJBqkTidXgq28=;
 b=uq62Qq/VneKwFgfUkU1yD6pqdEORrV1Wysny2H5Cp8L1rWgfW56FRh/2eBhsG41AXmvExP
 4aHLqHYqcV/DsTBNK8z0UAqektt+rAdC0jQoNd3i5rb2PaDHEufbxKvUrTpuTprlNKdjTe
 bwga6usGUwUDaEEnHEabknoX0YXf680=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v3 06/32] mtd: spi-nor: fujitsu: unify function names
Date: Mon, 21 Feb 2022 09:52:10 +0100
Message-Id: <20220221085236.1452024-7-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221085236.1452024-1-michael@walle.cc>
References: <20220221085236.1452024-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_005253_883810_15A36C3A 
X-CRM114-Status: GOOD (  12.96  )
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
