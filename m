Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF909C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:53:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C3D521D7F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:53:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rt6pHGAv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="VAHF5msV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C3D521D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yf0U9ts7VzqweH9UTpZpIuv8iwVKtTT1GZjti/5trxg=; b=rt6pHGAvNBYyQFyvSFeRO9owr
	GWT5F4N1IpTUuq2qf//fFS0gFnODkLERIABNJ9k4eGhbp+SPX3e1BNNLTomrrG+4/jZzgRbGpa1sn
	1OIuu74qh1WQnz4nkpQRLV/gGxuLd5HqQdpOFwKe5pvnZIHIX4wZtrON7p6bciNEbKsuL+kdD+VZV
	DOn7vzT/lDfYPHcLDV/5cPIAJACIfg8W33Q2Bmdf4X0QXt87F1p+icXdT2myd7DnOUvfRmDrgVXpi
	vkHJLME0NkMV+iK+9RcTBh056y713mYfePl94ENya9VQZFIMhoh9EOZrcJELwxCxyTou0KPpK5ePD
	fFzUwZ+7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIois-0002VD-Uv; Thu, 17 Sep 2020 07:52:55 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoij-0002P2-Qu
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 07:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1600329165; x=1631865165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P6t+pG4dglpm9JvmjPVpqed32m8+PoVUqaet8PC6ubM=;
 b=VAHF5msVVAiuRaMHp6A7YcsI/YnfqZUjLB+rWYztPRG7st7mDyffqWw5
 72vD4f1mYaDytoWwBOKNj4Ie/Wmn/znsj1zjr3n0Fm3dXXfDp8xfJJV0f
 D46+Dh9qnIEJGUWEk/c1bIyTHILEAaZR1MOpZw3WmGMFvXjjlxaK9r11z
 ujasPBqr9VwGrukMoWHPPEcR88t1/VucvhmrUUP11bVMyojGBwojXblte
 ySjOxxidf7z4pemU9MsDxySnFxLD/KkbK+6L6/3j2h6pP5hlgTS1/CwQi
 4R3va6DKez4jFmRQow62wo9TUBM/F88Fh8fTr9YB0/DGJidIu+HgvhcN3 w==;
IronPort-SDR: qL55LPN9evo6YItJeF9yRLZyAP7JMYPpbeBGKe76xr7+dbidUcGOl+ageMwjAVEIpUD/qVlc7G
 m6zFpQua2tBu1NknaOun4XL0C5jBhnH2RoXD/Um0bQAxwMP9wwZ9w79T++pDE+aoNFk7YKhK/l
 /BTxXYosCxV5qW59sHnTOr5+Uz4ijOYmUJdqF9+qHGPwjWQwth62m8J/qN3b91HOqzpQbLYTO3
 NLLMVoDpDV1bMpItWw/X6vOD64ihzFZ1t3xekZX/etqZy2xVvw7ZvgXsB/XWkKqz0mzHBhHIn8
 Vns=
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="92140723"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Sep 2020 00:52:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 17 Sep 2020 00:52:08 -0700
Received: from atudor-ThinkPad-T470p.local (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 17 Sep 2020 00:52:06 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: [PATCH 1/3] mtd: rawnand: Fix wrongful fallthrough NAND_ECC_SOFT
Date: Thu, 17 Sep 2020 10:52:11 +0300
Message-ID: <20200917075213.532161-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200917075213.532161-1-tudor.ambarus@microchip.com>
References: <20200917075213.532161-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_035246_115502_5A82FF6A 
X-CRM114-Status: GOOD (  12.52  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Santiago Esteban <santiago.esteban@microchip.com>, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In case of valid HW ECC, where the fallback to SW ECC is not needed,
the mentioned commit breaks the "switch (ecc->placement)" statement,
but then wrongly falls through the "case NAND_ECC_SOFT" of the
parent "switch (ecc->mode)". This causes an -EINVAL in
nand_set_ecc_soft_ops(), because for the valid HW ECC cases
ecc->mode is set to NAND_ECC_HW, but the nand_set_ecc_soft_ops()
expects a NAND_ECC_SOFT mode, thus -EINVAL.

Move the fallback to SW ECC after the setting of the ECC on host ops.
With this, when a valid HW ECC is available, we break the
"switch (ecc->mode)" statement, and when a fallback to SW ECC is
needed, we fallthrough "case NAND_ECC_SOFT".

Fixes: d3f8ec8e979b ("mtd: rawnand: Separate the ECC engine type and the ECC byte placement")
Reported-by: Santiago Esteban <santiago.esteban@microchip.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/nand_base.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d42832bedff5..bd30f6632fe2 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5665,19 +5665,6 @@ static int nand_scan_tail(struct nand_chip *chip)
 				ecc->read_oob = nand_read_oob_syndrome;
 			if (!ecc->write_oob)
 				ecc->write_oob = nand_write_oob_syndrome;
-
-			if (mtd->writesize >= ecc->size) {
-				if (!ecc->strength) {
-					WARN(1, "Driver must set ecc.strength when using hardware ECC\n");
-					ret = -EINVAL;
-					goto err_nand_manuf_cleanup;
-				}
-				break;
-			}
-			pr_warn("%d byte HW ECC not possible on %d byte page size, fallback to SW ECC\n",
-				ecc->size, mtd->writesize);
-			ecc->engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
-			ecc->algo = NAND_ECC_ALGO_HAMMING;
 			break;
 
 		default:
@@ -5686,6 +5673,19 @@ static int nand_scan_tail(struct nand_chip *chip)
 			ret = -EINVAL;
 			goto err_nand_manuf_cleanup;
 		}
+
+		if (mtd->writesize >= ecc->size) {
+			if (!ecc->strength) {
+				WARN(1, "Driver must set ecc.strength when using hardware ECC\n");
+				ret = -EINVAL;
+				goto err_nand_manuf_cleanup;
+			}
+			break;
+		}
+		pr_warn("%d byte HW ECC not possible on %d byte page size, fallback to SW ECC\n",
+			ecc->size, mtd->writesize);
+		ecc->engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+		ecc->algo = NAND_ECC_ALGO_HAMMING;
 		fallthrough;
 
 	case NAND_ECC_ENGINE_TYPE_SOFT:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
