Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2360C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 23:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Gvn5+heOTrBP73npwAWmUW6Brc/qnIAOXpQMBstqTc=; b=xirh9ML1uIiGar
	r34/x6uozg1WBtTaKLbU5wQCUogSzyThOfsdAuDTXmlGR+nBObIcv/xC4NOGqsJHnldkwULvwNh+m
	NyvSbxzQAbhYp4tpL08+Hl48p2HugYJYO863hB7A5EXn52PTMLcIZnFypWyK06AAF1nmBFpuuL2h1
	rTCt+yankkQE6TYgm09wMSkVCcK9MmhtlP6XxpFgS49DJPPCLXVd316gz1wV3BUMAjJ0tKz9+gQGF
	OTg/2tWhVYXO7yWoSlcwn/dei1vS6buX6BfS5zWVx0ZFa0IJEbpp41wAV3wL4krGEFSJIkyafyPFX
	hAACTuDmyOJ593gxMOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlfYG-0036jz-5R; Mon, 02 May 2022 23:34:00 +0000
Received: from smtp6.goneo.de ([2001:1640:5::8:31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlfYC-0036j1-Oq
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 23:33:58 +0000
Received: from hub1.goneo.de (hub1.goneo.de [85.220.129.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp6.goneo.de (Postfix) with ESMTPS id 42B4510A32FD;
 Tue,  3 May 2022 01:33:53 +0200 (CEST)
Received: from hub1.goneo.de (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by hub1.goneo.de (Postfix) with ESMTPS id 97B7B10A1E85;
 Tue,  3 May 2022 01:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=georgemail.eu;
 s=DKIM001; t=1651534431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0D319vm3xEpasyyTRdoZCMAlXyZlL9foxrgpib29jlE=;
 b=rTzr4I/FDUGjxFhx23WCq6Wn5LL9oI2NF8o+meoRoLGnwzKV7bh6pNyi4oFCngoyVx/hTs
 LvWfLkSueapERe0Qbr7byjUPhbBNTI8qTRNQ7vAWgK1uJ1wu9zB5t/bxgPlYkenEdSAh48
 CFRKndaJF0cXkOOovcAWdrHB62T2ixm+9dztsgcvGahapgw4r7XoLlxU2sltQY5swMlifW
 MzocHVM4qN35+RKVD0RA4K9J/RQDsGVu1DyYrCH/arT60IhWq+4qytDxCSKt5XwWLcFr8T
 RiV9WuofJLe7MPLhfUCFVF7XBn4rIFOfoA7HgbRyLzt0osGc/RX+bkcB8CXB6A==
Received: from brot.fritz.box (ip-178-201-230-219.um46.pools.vodafone-ip.de
 [178.201.230.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by hub1.goneo.de (Postfix) with ESMTPSA id 558FE10A32FA;
 Tue,  3 May 2022 01:33:51 +0200 (CEST)
From: "Leon M. George" <leon@georgemail.eu>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 p.yadav@ti.com
Cc: "Leon M. George" <leon@georgemail.eu>
Subject: [PATCH] mtd: spi-nor: support eon en25qh256a variant
Date: Tue,  3 May 2022 01:33:10 +0200
Message-Id: <20220502233310.791565-2-leon@georgemail.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502115227.2435850-1-michael@walle.cc>
References: <20220502115227.2435850-1-michael@walle.cc>
MIME-Version: 1.0
X-Rspamd-UID: 897f4e
X-Rspamd-UID: 2cc810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_163356_990640_363DF84A 
X-CRM114-Status: GOOD (  14.71  )
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

This patch allows accessing the upper 16m on the A variant (EN25QH256A) of
the EN25QH256 that shares same JEDEC ID.

Without this patch, addr_with is detected to be '4' but the read_opcode is
a plain READ (supporting only 3 byte addresses).
Setting PARSE_SFDP is enough to detect the read_opcode READ_4B on the A
variant. READ_4B is not available on the no-A variant.

Both variants support 4-byte address mode (spi_nor_set_4byte_addr_mode)
but that is prone to breaking on unexpected reboots if the reset pin isn't
connected (broken-flash-reset).

The no-A variant supports a 'high bank latch mode' that affects read,
program, and erase commands - similar to the extended address register
(EAR).
The HBL bit is manipulated using the ENHBL (0x67) and EXHBL (0x98)
opcodes.

Should it become necessary to distinguish the two variants in the future,
the A variant sets the SNOR_HWCAPS_READ_1_1_4 SFDP param - the no-A
variant doesn't.

Tested with and without fast read on the A variant only.

Signed-off-by: Leon M. George <leon@georgemail.eu>
---
 drivers/mtd/spi-nor/eon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/eon.c b/drivers/mtd/spi-nor/eon.c
index 8c1c57530281..50a11053711f 100644
--- a/drivers/mtd/spi-nor/eon.c
+++ b/drivers/mtd/spi-nor/eon.c
@@ -25,7 +25,8 @@ static const struct flash_info eon_nor_parts[] = {
 	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256) },
-	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512) },
+	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512)
+		PARSE_SFDP },
 	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128)
 		NO_SFDP_FLAGS(SECT_4K) },
 };
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
