Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF707EE49AE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0gMoGfPxaFvfSO9ZT8vVw2A74atkgxZ0V3RP4TDj7Q=; b=uvxFyzbooA8saL
	K0e9zT0pM9FcNl2X9mvHBNcDFdHsQDl71FR3E9IU1DefvaLUZ7XUmLu9ndD0cJ7po/Tv9ZqH9Okmi
	qoX/dDhE2QVkpRXj0NAEn0TXKH4BPeNo8NcV70qRCEybbJyubbBtBYyCnXTINHBILFaoKGf02r6RO
	WpqfzKSSTvNiapqwOM3LosJFQOwgug6relnnHtAtbqSKRdQXxTQzY0mt214AjKEVbTnTTlN6jTcc9
	9XjTeq6zyW/JZ4Wmkamejh+6H2NIPRDS0agDQOcwgrRVSBQicvV6sqlxCY92Slodxkc7LTTf1XbAI
	N5u39/r3ne3t8TC2KURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLY3-00FJRm-1x;
	Tue, 22 Aug 2023 07:11:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXd-00FIzs-20
	for linux-mtd@bombadil.infradead.org;
	Tue, 22 Aug 2023 07:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=/tF8Fty4DXUTP3hrtL50pzuh7nHGopCh7k3bPWD0dlk=; b=R1xuiKao1uOyLOIqFjsGYer0aL
	r22FfXY/pvfz1HUhm+EGNAqdp6lowCbbJCVbGMOM2dgI7feAvrrCCiOkdM7gHNsuow9lcuYIgpQC7
	ESeASujkenWWPKaWnUw5N1YrmUTpgd2YhFWG+OkddowkLfFsJbHGo/BoINYdCNxkDIHVCYEuj+fZF
	zaR0Qsll1OY3kgCc4mi6+Kxymg8ngwW2G66LmbYJMkldNvAx6HNGBs06wKc9yGwAUWlFi6PruZSsd
	4Avxn7+LLG6WxawA/oJuIFXnGRKt7SN7SIb7UA021JXMJbewx6S2dUHDq8iQakM5vbargfWQDfwfE
	gETk4bng==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qYLXQ-00Ex4o-Sm
	for linux-mtd@lists.infradead.org; Tue, 22 Aug 2023 07:11:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D3DAE64198;
	Tue, 22 Aug 2023 07:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B30C433C9;
	Tue, 22 Aug 2023 07:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688242;
	bh=yWhME5tjoVL5WamO6J63OUfuy5+Vof54SIVht26T9gk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jcuET5YGZlkrCXp9SkG33dnx9EHIxIiv1AF1A/H1VODEY9xWwCwXr2SK5ChhS6Vbp
	 /ohtIwOMarUjBINU+1vw6vgAslhdsdPuTUrlAuNxdf7ad9k9Uf2npFt+MzzFMpsyh+
	 SbjxnzKWuM84FM3ubMwkhfIA7vqXj2CCeVyFDfPKD6XHIXO2ZkAR2go2LkZqqTnoUx
	 adoUVM5rAMR1Hso3cuFIzBHuTDQyuI6GoWoeuOSIWhu8wjFmzYLRaTg4CpwkM8Wt5h
	 yL+RqdY1aRRLqtLZDkOADM0RTj54mpEAWjoroYFacUqmoDao1cGHNcUh6ccApD9J+O
	 PCuraR2Zyoa6w==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:49 +0200
Subject: [PATCH v2 33/41] mtd: spi-nor: gigadevice: sort flash_info
 database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-33-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_081053_288412_F960ED8F 
X-CRM114-Status: GOOD (  10.62  )
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
 drivers/mtd/spi-nor/gigadevice.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 0d22cd99715b..ef1edd0add70 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -46,30 +46,12 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0xc8, 0x60, 0x16),
-		.name = "gd25lq32",
-		.size = SZ_4M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xc8, 0x40, 0x17),
 		.name = "gd25q64",
 		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0xc8, 0x60, 0x17),
-		.name = "gd25lq64c",
-		.size = SZ_8M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0xc8, 0x60, 0x18),
-		.name = "gd25lq128d",
-		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xc8, 0x40, 0x18),
 		.name = "gd25q128",
@@ -82,6 +64,24 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
 		.fixups = &gd25q256_fixups,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x16),
+		.name = "gd25lq32",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x17),
+		.name = "gd25lq64c",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x18),
+		.name = "gd25lq128d",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	},
 };
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
