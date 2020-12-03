Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F123C4361A
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 16:31:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89258207B0
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 16:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89258207B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vLttai16EdKe3iVV6C18bBUa2gOJM/u/2tha7MnTJss=; b=G6ZXQPxrEysdTfvSFb5YWODqw
	9sMWurqGJP9VqfrFNTnFBVGwU+YFicQ2FGfpJ9hqS2DW358yeXNz5G9h/rNbRWx5UML9AgcG0dcpc
	4Oyo8sGwehThYN4CwXfHUuzoBLXjaJ1FCCdLxtWfUpBraXZ5Ne7kMhQIulpwfu57oDBw3simpWA4p
	OPoIQiZWgQEDbZOCYb2ZQWemyacNjvLsvGEmiu7xFutWltgxsrXNMdCXmgcSLXf8S2bt1U98MB7Pa
	N4sYj8qvm2+ANAHsDc2/mVdi2yEWKOmEAuhghTCnYvV2nv8IwNrfjllKU9YwzPNecKLJjeLwesWDP
	/DpuAaCUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkrUt-0006G2-Qx; Thu, 03 Dec 2020 16:30:23 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkrUi-0006CH-GZ
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 16:30:14 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4604023E5D;
 Thu,  3 Dec 2020 17:30:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1607013011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMIF3+rWO2apGLu9yhbnHHAuw+NkIpMjqv/0IVPCslo=;
 b=HX7Hzhv6PkPYg96PiiVamvcdxUDhdy85oDWuGjSnvTwj/GEsiTQYpPE4h0BLdfUDLx410+
 JCD0zHQ9QMSn7/SFLA1pF0NKPAE7AykLcKTG4R09ORvmVE5fPwfLWNWcA8W62n9ukMv5sE
 CUP4SAVamD10N1iwNdpxsbQCDFoJv8s=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/7] mtd: spi-nor: sst: remove global protection flag
Date: Thu,  3 Dec 2020 17:29:56 +0100
Message-Id: <20201203162959.29589-5-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203162959.29589-1-michael@walle.cc>
References: <20201203162959.29589-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_113012_789279_1665E93F 
X-CRM114-Status: GOOD (  16.51  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is considered bad for the following reasons:
 (1) We only support the block protection with BPn bits for write
     protection. Not all SST parts support this.
 (2) Newly added flash chip will automatically inherit the "has
     locking" support and thus needs to explicitly tested. Better
     be opt-in instead of opt-out.
 (3) There are already supported flashes which doesn't support
     the locking scheme. So I assume this wasn't properly tested
     before adding that chip; which enforces my previous argument
     that locking support should be an opt-in.

Remove the global flag and add individual flags to all flashes
which supports BP locking. In particular the following flashes
don't support the BP scheme:
 - SST26VF016B
 - SST26WF016B
 - SST26VF064B

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
changes since v7:
 - none

changes since v6:
 - none

changes since v5:
 - none

changes since v4:
 - none

changes since v3/v2/v1:
 - there was no such version because this patch was bundled with another
   patch

changes since RFC:
 - none

 drivers/mtd/spi-nor/sst.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 0ab07624fb73..0d9d319f61e6 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -11,27 +11,27 @@
 static const struct flash_info sst_parts[] = {
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
-			      SECT_4K | SST_WRITE) },
+			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
 	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16,
-			      SECT_4K | SST_WRITE) },
+			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
 	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32,
-			      SECT_4K | SST_WRITE) },
+			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
 	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64,
-			      SECT_4K | SST_WRITE) },
+			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
 	{ "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128,
-			      SECT_4K | SPI_NOR_4BIT_BP) },
+			      SECT_4K | SPI_NOR_4BIT_BP | SPI_NOR_HAS_LOCK) },
 	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1,
-			      SECT_4K | SST_WRITE) },
+			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
 	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2,
-			      SECT_4K | SST_WRITE) },
+			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
 	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4,
-			      SECT_4K | SST_WRITE) },
-	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K) },
-	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
+			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
+	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K | SPI_NOR_HAS_LOCK) },
 	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8,
-			      SECT_4K | SST_WRITE) },
+			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16,
-			      SECT_4K | SST_WRITE) },
+			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
 	{ "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
@@ -128,11 +128,6 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return ret;
 }
 
-static void sst_default_init(struct spi_nor *nor)
-{
-	nor->flags |= SNOR_F_HAS_LOCK;
-}
-
 static void sst_post_sfdp_fixups(struct spi_nor *nor)
 {
 	if (nor->info->flags & SST_WRITE)
@@ -140,7 +135,6 @@ static void sst_post_sfdp_fixups(struct spi_nor *nor)
 }
 
 static const struct spi_nor_fixups sst_fixups = {
-	.default_init = sst_default_init,
 	.post_sfdp = sst_post_sfdp_fixups,
 };
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
