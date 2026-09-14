Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB269C88E50
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 04:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgkPoGkqkfT+3IBjOWEQUscSePlafGC643jajHZgT7g=; b=RTYWwLNr6SvfHo
	Tz9Aj3ixD4+MXH3ATebs6lIjc0pIlgfhCmpLQHAcvdumX57w5vg8Y4ZagQ9QZ2yBMnLELW+uNA5ps
	/uT1hdbbeARsartW4MQxFos94rPC0lZcVRcdJf8XAa/5NvzS3iCIgHAsksUJW6gw2WVlGVki8R1r1
	p67FcW0RsJw6USk2rmTJTsQa3SFOFi2i9u/uiBtSLdi3RpoDFZgbDWbsvhTq2sdT+EeG3vBnGG2Pw
	M0U/idUr5py4Oczm7UqL0NdrFl2AkquqmDzad4Otq1IBDBsfF/0ZrYkMF0DtFKGfVvF1ULu5HgNUD
	AGU+NoqtV3ohK74qTzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5yeb-00000002LCv-0wrX;
	Mon, 14 Sep 2026 04:50:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5yeW-00000002LCX-4Bdo
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 04:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20AB061377;
	Mon, 14 Sep 2026 04:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 927A5C2BCB8;
	Mon, 14 Sep 2026 04:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789361447;
	bh=3/dJO0bblp44/9srkukBRbil1UNNMEz8L13Frh+sKek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sRdceleuBYmxstvJOHaPttC1j68kkSnjggrmsdsQSHSIIfQ5ffZpMe8i98jTaqU7p
	 rnUMi/lNvgIflLGRYpciTegpHH36gVrqt98UbpqFZVsI1rzWBCgZv3h3gS0aiirnAK
	 QVWrIZ2uQxMbA5Iivh/22sucqcD/mHGPurcXeEf7Jrsw/41k8URY7g9xh1ol/eIk7B
	 Se+XMq6MpE0oAkyGq33La59SkMUoqvTV61DB7ly4mhiHDznFDUw3myp+7ZJF9iKsEZ
	 VUYuWmMQ8taqBBmRuip5IhLp7Y4lEI7m95nDIrhfiiJikYEOdW5SY/TV30hOY4btW+
	 etsbjE/diACvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AC6C88E50;
	Mon, 14 Sep 2026 04:50:47 +0000 (UTC)
From: Takahiro Kuwano via B4 Relay <devnull+takahiro.kuwano.infineon.com@kernel.org>
Date: Mon, 14 Sep 2026 13:50:36 +0900
Subject: [PATCH 1/2] mtd: spi-nor: spansion: Remove s25fs256s0
MIME-Version: 1.0
Message-Id: <20260914-s25fs256s-fixup-v1-1-e94019455c1e@infineon.com>
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
In-Reply-To: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alexander Sverdlin <alex@sverdlin.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789361446; l=1387;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=pC764isHWSwUhqkcJDPq348qqcspEvCp/PJEhckABAE=;
 b=xeZWmnO0p1VtbkZpMy3oreJH6iuRIcRaqHDLsyQKPUvPcNBzUDdA/ENxEB7dfhFp0S8VcoY4W
 0p11DtqFcQrAiAN4/3/YF4KOR/NhhXI73HR2JTblBZVAEF1+2lQuANq
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-Endpoint-Received: by B4 Relay for takahiro.kuwano@infineon.com/20250227
 with auth_id=566
X-Original-From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
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
Reply-To: takahiro.kuwano@infineon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Takahiro Kuwano <takahiro.kuwano@infineon.com>

The Spansion ID table lists s25fs256s0 and s25fs256s1 as variants
distinguished by id[4] (0x00 for 256 KB sectors and 0x01 for 64 KB
sectors), following an incorrect statement in the datasheet.

The sector size of s25fs256s is configurable between 256 KB and 64 KB.
The factory default is 64 KB, and id[4] is always 0x01 regardless of the
configured sector size. Remove the invalid s25fs256s0 entry from the ID
table.

Fixes: 075fd6dff24a ("mtd: spi-nor: spansion: Differentiate between s25fl256s and s25fs256s")
Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6938fe26969c..6a62ca6f6451 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -873,13 +873,6 @@ static const struct flash_info spansion_nor_parts[] = {
 		.sector_size = SZ_256K,
 		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_CLSR,
-	}, {
-		.id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x00, 0x81),
-		.name = "s25fs256s0",
-		.size = SZ_32M,
-		.sector_size = SZ_256K,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.mfr_flags = USE_CLSR,
 	}, {
 		.id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x01, 0x80),
 		.name = "s25fl256s1",

-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
