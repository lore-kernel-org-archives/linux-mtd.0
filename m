Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A278EE57F0
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Al9jmxjG+N51GimEGE4AmaJ0FjDu0KtL/90QWutscsw=; b=4HBA5skTX1eRsN
	yQTqwy13j6vDZUddnWWJrYD5HpLeEbuyBL/5qKPxJl9M/APDdAuR/lO5/lHf8x2ww3qXVzMqQ4N2L
	uCya7SQkilotOH/0KR0vuFfToG7keBRPXYSj/V/izhh/ZAZ1okrsqKZalduyf2cW5GvIOdPz26J9z
	gvgASigzIMucQkwRaSr6ghqlz53VWdGhpwFpLkcas6TDTeUJsLlpN6rLMqs+Kt9xdy4QgUF/pECW/
	1FePLFarzFMSYY+GCg9+969gQ58ZrOsT+6+kvIyyFWD/NgQ4ONYS0qD8EDBNEeAklO72zkq/TbziL
	TjAPTLggG/iwWA4cXhrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYaR-00DVIn-0R;
	Fri, 08 Sep 2023 10:19:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYt-00DU6f-2f
	for linux-mtd@bombadil.infradead.org;
	Fri, 08 Sep 2023 10:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DqsSLDV+JmbMc3DElYBt5NXwKDDPo+czaAq4yXqBVrM=; b=pTwmN96BE2TP8Ra/lJw+ghbnY4
	3v3wGy23KMeGNVDheLeHkOfP8KJIuuVPmlF4d3fIhGxsTPBTvM8/YIFJse6lVdKLOn1Q2uQiAHaDP
	yhAH7PhCkSh/q7+Axxr1K8Ro+5x6vdsxFaeHU8wRkz2f03zILuLxFei/bSHTqBZ6nTcH2fiPlo/Ve
	2rhpr3yxZS33Vz19NHboSsGjfKtnWrMBeh06XotmG7quA29slWSHXVO8P2yVznTThBBl6rrFrA6hn
	OfG3hKBXIhh8p6M5Wqv4gs4uHhKeUgOW9iN9VJg5+Xlu0DNZ4XFnaIHo/CkR8RyVAa4Y1AWxSeRsr
	sD+TFivw==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYk-002R44-28
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:18:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 3823FCE1B84;
	Fri,  8 Sep 2023 10:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2458AC4166B;
	Fri,  8 Sep 2023 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168269;
	bh=okMtOA67tLTz4yJHrFPDvuTyPVGqwS1/Z6lXCh+PJbY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y6vIEsB877qKoLMqFMf3EIrZW4ZTufgV4mxKHBymDY0AstBFQzh/ZRupQrNroOOG0
	 38ZUKMVKli8eGeos8n2GLh3Dz0AxoVTv7Jkg9KJtkXBmvNBW6t3lwNWUJCGhtkMHje
	 XbxoqDn7+Xa0Abw4hnL54QKzTccxueHOtYer6I7+BetNpf2+rfD1+iMJ0NnuIi8sb/
	 7nnG1b9kxfYe4P9ejsImWIFk6Uz7/87qdPMpbnrf100ZaumtzgJkqfgjXQQs/Hord6
	 aTfgmWHD0epYkyJ8Q3XUqjVLiTfJ0eaVHfwPfvRYnuchPWiRmVhT3D5e2nZhZphHr2
	 vwTcP3RWmx3tA==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:56 +0200
Subject: [PATCH v3 38/41] mtd: spi-nor: sst: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-38-e60548861b10@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_111757_172849_E5223E9D 
X-CRM114-Status: GOOD (  11.27  )
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
