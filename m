Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDF0C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Apr 2022 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+WiJqXySXKSuU+bYa4RUh+dL1gKbPXTQzGQmMMCNhk=; b=rcPI72XllYj2VA
	ukiiPjNjM4dHgoUuS08BYX4PaqYopYNEnQtH8+gy8ZmKHTiIpqhAOGVrWkm8FIVqF122YMfb6yOEN
	wRBakw+eUhF4OboQ9f0mLtS6iScSX0pduX1Vl/sd2qCR1i7ic/tjsGGbpHZPsLkoPYraNUl/jqPh8
	jOKATWtnpVgOwNKKqjqph4SY1U6b4ANxDoNzA/IBgveH6GTPQaSJ6XwsSZJho01+WPXWEs+S2mGCa
	gmsVax2RS6EfviMskLoa1oqYbtJvkneKEEb+KLiwa1cl+U3RcsWacS68nM8rQMnlfYLBcgk9tQkle
	slZGRObBbChgfD54t7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkqHZ-00EgDH-B0; Sat, 30 Apr 2022 16:49:21 +0000
Received: from smtp6.goneo.de ([85.220.129.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkqHV-00EgCe-QU
 for linux-mtd@lists.infradead.org; Sat, 30 Apr 2022 16:49:19 +0000
Received: from hub1.goneo.de (hub1.goneo.de [IPv6:2001:1640:5::8:52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp6.goneo.de (Postfix) with ESMTPS id 84F8810A330E;
 Sat, 30 Apr 2022 18:49:15 +0200 (CEST)
Received: from hub1.goneo.de (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by hub1.goneo.de (Postfix) with ESMTPS id DD5EB10A32FA;
 Sat, 30 Apr 2022 18:49:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=georgemail.eu;
 s=DKIM001; t=1651337353;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZPqV+i/ye7+SzXvsKm6HJp9Yf540Puaa46vMQg8gFM=;
 b=ppqZ48OnpfKDnRrHe0IoxgHiTsnLAv6fNbyKZJ5EpOCVtiTnyHdy2rJL/3Im5mTEQvB1rK
 /phN7R3cGOhXcyqycPrVZvPbYrRwZOhmarKvl+OQ667TRnzXW7aUqLlU6InUzIF1eVknrz
 5yvDH5dcuSpI4EHtt8TIIfoWrglJff7CjMHi1wJ9EFUYhSEs+zqBoezdi1Q992P7b7H3bd
 y1B94lRB43CE+PyzCsPVgS9tC7EqJ8BLKb8quvAIwPAcI9MfjlIlqyvldcv43ukVOjgi/H
 +Mbzaty0TOZJD0otuMK9JUkSck92Sn/r/Fuj9PtpOtijZucHDXy3GtyeSUKPxg==
Received: from brot.fritz.box (ip-178-201-230-219.um46.pools.vodafone-ip.de
 [178.201.230.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by hub1.goneo.de (Postfix) with ESMTPSA id A80C710A330F;
 Sat, 30 Apr 2022 18:49:13 +0200 (CEST)
From: "Leon M. George" <leon@georgemail.eu>
To: Pratyush Yadav <p.yadav@ti.com>,
	linux-mtd@lists.infradead.org
Cc: "Leon M. George" <leon@georgemail.eu>
Subject: [PATCH] mtd: spi-nor: support eon en25qh256a variant
Date: Sat, 30 Apr 2022 18:48:47 +0200
Message-Id: <20220430164847.144710-2-leon@georgemail.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220430164847.144710-1-leon@georgemail.eu>
References: <leon@georgemail.eu> <20220430164847.144710-1-leon@georgemail.eu>
MIME-Version: 1.0
X-Rspamd-UID: 33b737
X-Rspamd-UID: 3b25b3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_094918_038457_552E0498 
X-CRM114-Status: GOOD (  14.18  )
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
Reply-To: "Leon M. George" <leon@georgemail.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch allows accessing the upper 8m on the A variant (EN25QH256A) of
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
Tested-by: Leon M. George <leon@georgemail.eu>
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
