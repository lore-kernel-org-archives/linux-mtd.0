Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF5CC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 18:05:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57D2120725
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 18:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YQBDDGqh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Dm0phudP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57D2120725
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sp2h4GcikKFmxbEqiUFcZvKdWatCDGNdUtRTunyF6P4=; b=YQBDDGqh85PhmpqtABvAO7UxA
	MpT2PkjHmK0oXRsIr6DMDiclwuF3hn4cN9p8cxQ/n0T8UQ8Zy/VXSYRd5OXtcj4ZN+Qmd4uuswzUN
	R6gYcpfNzvPXcl9rWKNQrLIW2vQPwqoNId6gJwczb1bh3D5yAyTvG8DlT7e18FNyYtleYLjX2csh1
	rC/uidLJtkhHS5sldod2Pay6fI6AxFFy5iC1IsoIJmGYJZGm5wy3k0rkEbLsz/SIiovJQhJfPI7eE
	cTpAqdDdJTocsxsGIcsKw7TeSyZsX8Pvfo+F2LZNfJdy0EtiUZHuduw3BkpEno7E+EcU67UfjNpze
	tTGmB5kFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kS2BN-0001Gh-Do; Mon, 12 Oct 2020 18:04:25 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS2BG-0001F2-VA
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 18:04:20 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09CI4GT9105224;
 Mon, 12 Oct 2020 13:04:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602525856;
 bh=r84SiCjn9/W8+yMMq2kABKjatvatKw7U1heQ5CvxrDw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Dm0phudPO6FQnOqjbyJx63xszBFxQEilozMcVOmMUroNDKzhDmdnkS1rajqTWZjah
 ly9skhQzyiSDbZkIgVSBdzEkDyLhh+GDCGvvOAEbsYi+WCINFBleHWOi1+ibbDtXSB
 4/CslMbkleMjFzDGC+tdNvzlbuXjcmC2qiYYyRIg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09CI4GPQ099553
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Oct 2020 13:04:16 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 12
 Oct 2020 13:04:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 12 Oct 2020 13:04:15 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09CI45j5021531;
 Mon, 12 Oct 2020 13:04:13 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] mtd: spi-nor: core: Introduce SPI_NOR_NO_MULTI_PASS_PP
Date: Mon, 12 Oct 2020 23:34:04 +0530
Message-ID: <20201012180404.6476-4-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012180404.6476-1-p.yadav@ti.com>
References: <20201012180404.6476-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_140419_148481_8DBEEE83 
X-CRM114-Status: GOOD (  17.01  )
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
Cc: Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Cypress Semper S28 flash family uses 2-bit ECC by default. Under
this ECC scheme, multi-pass page programs result in a program error.
This means that unlike many other SPI NOR flashes, bit-walking cannot be
done. In other words, once a page is programmed, its bits cannot then be
flipped to 0 without an erase in between.

This causes problems with UBIFS because it uses bit-walking to clear EC
and VID magic numbers from a PEB before issuing an erase to preserve the
file system correctness in case of power cuts.

Use SPI_NOR_NO_MULTI_PASS_PP to set MTD_NO_MULTI_PASS_WRITE, telling
upper layers to avoid multi-pass page programming. In addition, update
mtd->writesize to match the page size to make sure upper layers make the
changes they need in one single go.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c     | 5 +++++
 drivers/mtd/spi-nor/core.h     | 6 ++++++
 drivers/mtd/spi-nor/spansion.c | 2 +-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ff592468cc15..16d4bcfe7b10 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3469,6 +3469,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	nor->page_size = nor->params->page_size;
 	mtd->writebufsize = nor->page_size;
 
+	if (info->flags & SPI_NOR_NO_MULTI_PASS_PP) {
+		mtd->flags |= MTD_NO_MULTI_PASS_WRITE;
+		mtd->writesize = nor->page_size;
+	}
+
 	if (of_property_read_bool(np, "broken-flash-reset"))
 		nor->flags |= SNOR_F_BROKEN_RESET;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 0a775a7b5606..3394b7474c08 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -329,6 +329,12 @@ struct flash_info {
 						 * available I/O mode via a
 						 * volatile bit.
 						 */
+#define SPI_NOR_NO_MULTI_PASS_PP	BIT(22) /*
+						 * Once a page is programmed it
+						 * cannot be programmed again
+						 * without an erase operation in
+						 * between.
+						 */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 2c5c0f69dc5c..72430cd4e6af 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -275,7 +275,7 @@ static const struct flash_info spansion_parts[] = {
 			      SPI_NOR_NO_ERASE) },
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
 			     SECT_4K | SPI_NOR_OCTAL_DTR_READ |
-			      SPI_NOR_OCTAL_DTR_PP)
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_NO_MULTI_PASS_PP)
 	  .fixups = &s28hs512t_fixups,
 	},
 };
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
