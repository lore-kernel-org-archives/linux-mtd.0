Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FFAEE49A5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9vHr0YUlvckr0JFjz+0tFS0+x2a39qVOz3+6lJjHS8=; b=rs46OESrxdVRqm
	IlMW9eYV7ztZ3cHeA766c+OYFE0maQ6oyTGfF75ryoEaTfoa+nyG2b559bZeX6G1fvTyXuzNdNPu6
	IT7YNfOAUMkDC6zyaYvfeNWPLF/i8i8ZNxEKiNHBAb7iB73yHz/4C2PscrkfqAIRfmjsr34KogxQ7
	T+zt/TuYra1GFaMBYWp1xLUsNVgjHvCxK9f4ZRWZf9Y6P5G1OIaVn49rVN+1DmVZr7NOYhPrikz1+
	AmhQHxc8+J9lSyMw6Zb4lsr+TnTiGaIa76AjPoqFx+QGv+E0yyo3/3/NCcSTiR+3AVr/VYWlwdA3d
	g1Z17tGas5IU+VXpGHTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLYD-00FJba-1L;
	Tue, 22 Aug 2023 07:11:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXd-00FIzO-20
	for linux-mtd@bombadil.infradead.org;
	Tue, 22 Aug 2023 07:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=IE4eauRJF29U+rDli/OXa2o/HvwBfmYdm6rpvh7Dsi4=; b=dvebyK5AdZN3s36bz6RKd2h3TL
	yqMfPrUgyfZ2mfw+DiXOA+HUnkAjrY31AqPTvSmVsbHjVUhNuB4zMdU5clq8C1wMGrrd81CjQcj0E
	4grBRhty3kqiH+ffxOMmgjOdSNOtpmHpQ5UfTNEMBmPoq73wzLJBzZ8ZpGprARxs4mlKBFodNdP40
	tKiufSbwur7kewccWXIOKqK615s2RYWZciELBd+TyM43w77E1EntgJnYvZ9R3I1xCECLoBaKdQGy9
	Pt341ydIQhzlgfPpb7nw645FF+SigAIpOvEXrHnNeXRI/uMnF2HQ6Q+yAFb93tvHWweCu8LMzhTcB
	qG8bl8lA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qYLXQ-00Ex4q-TP
	for linux-mtd@lists.infradead.org; Tue, 22 Aug 2023 07:11:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4E7763B64;
	Tue, 22 Aug 2023 07:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDAAC433C7;
	Tue, 22 Aug 2023 07:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688240;
	bh=yf+i4Rv/o/8TXBlVhYljTJbV/eUqv5ZZTBjDmCQ4PA0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qKh+Z+JW9aXiTrSnLy2qAMQrDPCSHzFhlHX1NUPDko1ydcEAPeUS/yZX/EhpSrYXH
	 bETWdtNFj2yPM6MJcT2D0/+PL2wbmq91go6N/dNgrHU77JLCGYbX46aiLust2nG48c
	 x3E5v7jAVyz5p6MAQE9vgPhVnHKnTV1WRkH9MkPIBsSjxSOYCa0gZuPa/7QxAcctTA
	 YKej/C6tEeo0V5dqnALnFlYCvSCbE8nc7d9zyOKTPgwb/GsH/Q4rHw6LrBelr7lq18
	 aLFwRvtrcShCpLiTJuwMkaVU8t7vKoeaiWsXdlM795xwS2hnjthQVkrJHdFV9JxO1P
	 w28370b99WuNA==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:48 +0200
Subject: [PATCH v2 32/41] mtd: spi-nor: eon: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-32-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_081053_117338_B1686DA5 
X-CRM114-Status: GOOD (  10.95  )
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
 drivers/mtd/spi-nor/eon.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/eon.c b/drivers/mtd/spi-nor/eon.c
index ba09cb6c2abd..c1ddf662f782 100644
--- a/drivers/mtd/spi-nor/eon.c
+++ b/drivers/mtd/spi-nor/eon.c
@@ -10,32 +10,37 @@
 
 static const struct flash_info eon_nor_parts[] = {
 	{
-		.id = SNOR_ID(0x1c, 0x31, 0x16),
-		.name = "en25f32",
-		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K,
-	}, {
 		.id = SNOR_ID(0x1c, 0x20, 0x16),
 		.name = "en25p32",
 		.size = SZ_4M,
-	}, {
-		.id = SNOR_ID(0x1c, 0x30, 0x16),
-		.name = "en25q32b",
-		.size = SZ_4M,
 	}, {
 		.id = SNOR_ID(0x1c, 0x20, 0x17),
 		.name = "en25p64",
 		.size = SZ_8M,
+	}, {
+		.id = SNOR_ID(0x1c, 0x30, 0x14),
+		.name = "en25q80a",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+	}, {
+		.id = SNOR_ID(0x1c, 0x30, 0x16),
+		.name = "en25q32b",
+		.size = SZ_4M,
 	}, {
 		.id = SNOR_ID(0x1c, 0x30, 0x17),
 		.name = "en25q64",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
-		.id = SNOR_ID(0x1c, 0x30, 0x14),
-		.name = "en25q80a",
-		.size = SZ_1M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+		.id = SNOR_ID(0x1c, 0x31, 0x16),
+		.name = "en25f32",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.name = "en25s64",
+		.id = SNOR_ID(0x1c, 0x38, 0x17),
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0x1c, 0x70, 0x15),
 		.name = "en25qh16",
@@ -57,11 +62,6 @@ static const struct flash_info eon_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0x1c, 0x70, 0x19),
 		.name = "en25qh256",
-	}, {
-		.name = "en25s64",
-		.id = SNOR_ID(0x1c, 0x38, 0x17),
-		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K,
 	},
 };
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
