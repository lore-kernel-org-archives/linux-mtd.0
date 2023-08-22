Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82F1EE49A3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Al9jmxjG+N51GimEGE4AmaJ0FjDu0KtL/90QWutscsw=; b=4rheNgBfQoMUvf
	QTCXKOl2bo+dNIxhchi4yijfkbNz33cRt7ZvS0ZA0SsRAeFcASUOU/UwayH2jnszwo2+U1sakv/ts
	IcnSv1+JZDghQHMZmIJLXHrVAn2FbdqgJs6eqP1wU2vvp+OvV+o4DhJ/pH9wQ4gLa+/4ZpHCP4d8n
	ofxx0jrn1/6UK6J793ii3WZ4SSn3RGoILzf1qpE050xFcExBD8zEah5EI+GQIlqlAp/FpD+wiXtKg
	sRdo7veYNv79BGE62azBEsmr6oiRNOktua9y81hUZrwDOrmYlsCZK4/osEzhT/UWBMedDTS7+MftR
	H4e2aC6s7TgRhPKE+V5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLYN-00FJmz-38;
	Tue, 22 Aug 2023 07:11:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXR-00FIof-0I
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:11:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F41662F40;
	Tue, 22 Aug 2023 07:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA06C433C9;
	Tue, 22 Aug 2023 07:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688251;
	bh=okMtOA67tLTz4yJHrFPDvuTyPVGqwS1/Z6lXCh+PJbY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VKoLIhnJPhlGeq7O5f8UPN8I0wAFfIpdQPLkSDMXYuLnihDDpfmzZRbpnWBog24z3
	 KQXav1i/FKv44yFJLWF8T7RLhuvuUK0vDJs7MzT/EkcCVfpqI473+Paw/6cHE4boyx
	 KOHhguVfHpXG9cLQIaSIgG94bVsZ8ldP4zYVIEKt0CITkL0I0SVGsUOAcbAM8toYhr
	 DAz2ug+dcaCU6v2VHWITwtXlgCgEyUWipBQ2XrlFQPzXWikl5qX7gELhbLP1HKIKKl
	 OGSL/l+kRSmG83Cm1FuGm5NEVr2OMyYdNtnrkIz4SuAAyvhVJWIR7BJG19GntIElHA
	 JX91GsFL058bw==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:54 +0200
Subject: [PATCH v2 38/41] mtd: spi-nor: sst: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-38-291a0f39f8d8@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_001053_234071_0FD68851 
X-CRM114-Status: GOOD (  11.56  )
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

The flash ID is the new primary key into our database. Sort the entry by
it. Keep the most specific ones first, because there might be ID
collisions between shorter and longer ones.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/sst.c | 90 +++++++++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 77b271abd342..44d2a546bf17 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -62,38 +62,16 @@ static const struct spi_nor_fixups sst26vf_nor_fixups = {
 
 static const struct flash_info sst_nor_parts[] = {
 	{
-		.id = SNOR_ID(0xbf, 0x25, 0x8d),
-		.name = "sst25vf040b",
-		.size = SZ_512K,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
-		.no_sfdp_flags = SECT_4K,
-		.mfr_flags = SST_WRITE,
-	}, {
-		.id = SNOR_ID(0xbf, 0x25, 0x8e),
-		.name = "sst25vf080b",
-		.size = SZ_1M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
-		.no_sfdp_flags = SECT_4K,
-		.mfr_flags = SST_WRITE,
-	}, {
-		.id = SNOR_ID(0xbf, 0x25, 0x41),
-		.name = "sst25vf016b",
-		.size = SZ_2M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
-		.no_sfdp_flags = SECT_4K,
-		.mfr_flags = SST_WRITE,
-	}, {
-		.id = SNOR_ID(0xbf, 0x25, 0x4a),
-		.name = "sst25vf032b",
-		.size = SZ_4M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.id = SNOR_ID(0x62, 0x16, 0x12),
+		.name = "sst25wf020a",
+		.size = SZ_256K,
+		.flags = SPI_NOR_HAS_LOCK,
 		.no_sfdp_flags = SECT_4K,
-		.mfr_flags = SST_WRITE,
 	}, {
-		.id = SNOR_ID(0xbf, 0x25, 0x4b),
-		.name = "sst25vf064c",
-		.size = SZ_8M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP | SPI_NOR_SWP_IS_VOLATILE,
+		.id = SNOR_ID(0x62, 0x16, 0x13),
+		.name = "sst25wf040b",
+		.size = SZ_512K,
+		.flags = SPI_NOR_HAS_LOCK,
 		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0xbf, 0x25, 0x01),
@@ -116,18 +94,6 @@ static const struct flash_info sst_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.mfr_flags = SST_WRITE,
-	}, {
-		.id = SNOR_ID(0x62, 0x16, 0x12),
-		.name = "sst25wf020a",
-		.size = SZ_256K,
-		.flags = SPI_NOR_HAS_LOCK,
-		.no_sfdp_flags = SECT_4K,
-	}, {
-		.id = SNOR_ID(0x62, 0x16, 0x13),
-		.name = "sst25wf040b",
-		.size = SZ_512K,
-		.flags = SPI_NOR_HAS_LOCK,
-		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0xbf, 0x25, 0x04),
 		.name = "sst25wf040",
@@ -143,10 +109,39 @@ static const struct flash_info sst_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K,
 		.mfr_flags = SST_WRITE,
 	}, {
-		.id = SNOR_ID(0xbf, 0x26, 0x51),
-		.name = "sst26wf016b",
+		.id = SNOR_ID(0xbf, 0x25, 0x41),
+		.name = "sst25vf016b",
 		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.mfr_flags = SST_WRITE,
+	}, {
+		.id = SNOR_ID(0xbf, 0x25, 0x4a),
+		.name = "sst25vf032b",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.mfr_flags = SST_WRITE,
+	}, {
+		.id = SNOR_ID(0xbf, 0x25, 0x4b),
+		.name = "sst25vf064c",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xbf, 0x25, 0x8d),
+		.name = "sst25vf040b",
+		.size = SZ_512K,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.mfr_flags = SST_WRITE,
+	}, {
+		.id = SNOR_ID(0xbf, 0x25, 0x8e),
+		.name = "sst25vf080b",
+		.size = SZ_1M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+		.no_sfdp_flags = SECT_4K,
+		.mfr_flags = SST_WRITE,
 	}, {
 		.id = SNOR_ID(0xbf, 0x26, 0x41),
 		.name = "sst26vf016b",
@@ -164,6 +159,11 @@ static const struct flash_info sst_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &sst26vf_nor_fixups,
+	}, {
+		.id = SNOR_ID(0xbf, 0x26, 0x51),
+		.name = "sst26wf016b",
+		.size = SZ_2M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}
 };
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
