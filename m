Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3DCC44520
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2026 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nDo6WTGS00NV1EyewFvJG4PcPARMuMYPhkhysK76NI=; b=iS1CF7W2EFcige
	VMe5t0eWsyGf5Hqzkexg5z24MXq1vn+WaODfAi4+F2mlVv6SF5BdsjV/J1gVSMSStKZUq6XZz71su
	76HbkRKNiz25eUBmtOcjDbAOzMn5aRm+pvwjIJc79NkURLa/c7bXCDG+N/9ki+/5257yAjRYBviZ+
	OzOEEcMZB8vk2JnPGblar9fc+YHCr+uMM8EPygLsKzzdwFP3m4CVlHo6jiCnPAb3CoTau712IDzTd
	qa5mWb5PNblFl+S8R9LToAc67EvrM4MDTt9QPolbB3KaCcxWuAsOSqvjqaBPAPGTjf01Qm8AQcnX5
	9BTHKOsERGeO799FhAFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpgi-000000078qV-2UFf;
	Mon, 20 Jul 2026 15:13:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpgf-000000078oj-07zY
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jul 2026 15:13:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8537543CF8;
	Mon, 20 Jul 2026 15:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CEFBC2BCFB;
	Mon, 20 Jul 2026 15:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784560424;
	bh=habTF8okM0Zg3QpK/5bI+/p5G+6G/orapw6aQ+0Ip2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vxj7z1bK+QWGEiTuQ0p3VvO3iG9BCW2rNPRccS46q8S+bw5PJK9FG5aPZzXq+1yy+
	 ltnHf5Ilsq9fbon3KrE1Q+cvX9595r0B8ahmLD0mtr3N8AH/PhzXQSTMb2rLIiVrtm
	 zBt28eGKX+6HwS8hQoApzSX3SJnzkIlt5FUNDqFdWIxauTb9Uul5M/7Vlxj097BEM+
	 +QKUDwoRh4pjOKWzxAjDhNJbgqHvcuMp1NOwF0q05RZEGr2hwGTIgqsWBf2nQG7DUZ
	 m3pDNZ3W8qa4g82TnF2CxRB9Zby/thkofHjrkYt0mJzMtyBAvoBEauyJhEYCRde+hi
	 P6QfOJbMG91IA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C87C44515;
	Mon, 20 Jul 2026 15:13:44 +0000 (UTC)
From: Mateusz Litwin via B4 Relay <devnull+mateusz.litwin.nokia.com@kernel.org>
Date: Mon, 20 Jul 2026 17:12:40 +0200
Subject: [PATCH RFC 3/3] mtd: spi-nor: skip erase type search in uniform
 bulk erase
MIME-Version: 1.0
Message-Id: <20260720-spi_nor_multisize_erase-v1-3-38d719bfe77b@nokia.com>
References: <20260720-spi_nor_multisize_erase-v1-0-38d719bfe77b@nokia.com>
In-Reply-To: <20260720-spi_nor_multisize_erase-v1-0-38d719bfe77b@nokia.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mateusz Litwin <mateusz.litwin@nokia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784560422; l=2899;
 i=mateusz.litwin@nokia.com; s=20251217; h=from:subject:message-id;
 bh=JccJSJOGyqps8s+o8d+1DpyuMp97oOREt9SAuUTfY14=;
 b=lbQ4Fmof4KLiT5h9lWgbbmm1rJJWMIM8tx9ke27GMzCKVFiY+AqQey+s0Lf2iCgYuCg2nhF5u
 d0ntNlWgMC2BDwYUNuZg0qrbs2FqQRLPCqJ7yQmGOWJKm3s6Dzwwt6g
X-Developer-Key: i=mateusz.litwin@nokia.com; a=ed25519;
 pk=9NV76cwWrtwYUektOrK/ht9GTzmhtkqSvghr3Td4hM4=
X-Endpoint-Received: by B4 Relay for mateusz.litwin@nokia.com/20251217 with
 auth_id=579
X-Original-From: Mateusz Litwin <mateusz.litwin@nokia.com>
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
Reply-To: mateusz.litwin@nokia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Mateusz Litwin <mateusz.litwin@nokia.com>

spi_nor_erase_uniform() calls spi_nor_find_best_erase_type() on every
erase step when CONFIG_MTD_SPI_NOR_MULTI_ERASE_SIZE is enabled.  For
large requests whose middle is aligned to the largest supported erase
size, that lookup always returns the same type.

Find the largest supported uniform erase type once at the start of the
request, then use it directly while the remaining length is still large
enough and the current address stays aligned.  Fall back to
spi_nor_find_best_erase_type() only at the head or tail of the range,
where a smaller erase type may be required.

This has no effect on erase behavior; it only avoids redundant type
selection work in the bulk-aligned case.

Signed-off-by: Mateusz Litwin <mateusz.litwin@nokia.com>
---
 drivers/mtd/spi-nor/core.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4e13919d238a..31839dc2705d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1689,8 +1689,8 @@ static int spi_nor_erase_uniform(struct spi_nor *nor, u64 addr, u32 len)
 {
 	const struct spi_nor_erase_map *map = &nor->params->erase_map;
 	const struct spi_nor_erase_region *region = &map->uniform_region;
-	const struct spi_nor_erase_type *erase;
-	int ret;
+	const struct spi_nor_erase_type *erase, *largest = NULL;
+	int i, ret;
 	/*
 	 * When CONFIG_MTD_SPI_NOR_MULTI_ERASE_SIZE is disabled, erase_size is
 	 * mtd->erasesize and nor->erase_opcode was set once at init by
@@ -1698,10 +1698,39 @@ static int spi_nor_erase_uniform(struct spi_nor *nor, u64 addr, u32 len)
 	 */
 	u32 erase_size = nor->mtd.erasesize;
 
+	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_MULTI_ERASE_SIZE)) {
+		u8 erase_mask = map->uniform_region.erase_mask;
+
+		for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
+			if (!(erase_mask & BIT(i)))
+				continue;
+			if (!map->erase_type[i].size)
+				continue;
+
+			largest = &map->erase_type[i];
+			break;
+		}
+
+		if (unlikely(!largest))
+			return -EINVAL;
+	}
+
 	while (len) {
 		if (IS_ENABLED(CONFIG_MTD_SPI_NOR_MULTI_ERASE_SIZE)) {
-			erase = spi_nor_find_best_erase_type(map, region, addr,
-							     len);
+			/*
+			 * For large aligned ranges, every step in the middle
+			 * picks the same largest erase type. Skip
+			 * spi_nor_find_best_erase_type() there and use
+			 * @largest directly when @addr is aligned to it and
+			 * @len is still large enough. Fall back to the full
+			 * search only at the head or tail, where a smaller
+			 * erase type may be required.
+			 */
+			if (len >= largest->size && !(addr & largest->size_mask))
+				erase = largest;
+			else
+				erase = spi_nor_find_best_erase_type(map, region,
+								     addr, len);
 			if (unlikely(!erase))
 				return -EINVAL;
 

-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
