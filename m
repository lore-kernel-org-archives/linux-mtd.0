Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B24C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 22:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3nc5taTbAcCGIsvNEFQHlwiCdwzxmO26zQP5lFjQ8ik=; b=D12Om0LOrpPmtu
	mA/L3tetooUp+lxuAwaH7ue4AGyBK5QUPa/9r11sXyzf9uSeMk4NV5D1wc8eP6kLn2r0xgNhebPOG
	hvhMojRU9Nf3yeO5oZ+DxOoD/j88z1aQ5wBLuDn6UXdmy7+tq6R2bSQdZaWommm+FQtjtO2dMthFi
	fFulc2DXpZofYhFHQqmNn7KzlhJ2DcJx2IXZlNFfGeel9TjXTcgMRwig6iQlERtwXjdeks/5OYN6q
	Wbl1WxTs5wSbXNzHc3GvvTaAySyeyzmRpo1SN5x3sMeWrey0YXkY6w4lnAtUhSdAwp23bm4yF4ZZG
	VYmg9T1vioM/XQUZER+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkYm5-00Crlv-Mo; Fri, 29 Apr 2022 22:07:41 +0000
Received: from smtp5.goneo.de ([85.220.129.30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkYm2-00Crkb-15
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 22:07:40 +0000
Received: from hub2.goneo.de (hub2.goneo.de [IPv6:2001:1640:5::8:53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp5.goneo.de (Postfix) with ESMTPS id 46EA610A1EAC;
 Sat, 30 Apr 2022 00:07:31 +0200 (CEST)
Received: from hub2.goneo.de (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by hub2.goneo.de (Postfix) with ESMTPS id A13F310A3308;
 Sat, 30 Apr 2022 00:07:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=georgemail.eu;
 s=DKIM001; t=1651270049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1q+z6VpgMW5CfLYFfaxK2CKjHdBC5T/I0iZwU2I+q4M=;
 b=miGncHUWQkWEToVinxoGbYs7woN+EMNgCygzC4lZuM7Law5PK59kF7wiK0kDFKj3yYDplE
 O8lqi7BAv+hYloSs5MuBLxQLnN+6ej3wEJ5wmk1flRGywS2G4G+935QF/pPvksjXrmrpCe
 hilQPqHKBdBU2F7I/c4hTdFDviyRzk52K3QpWJBGNoX/embP6/bK/Gw1K5GphPQhj85Fqc
 YaHZ1J62+ffAeRIK5s8rSWCrmtI2EHUH11mCothcx5z3aImi4KeebuS5qsCnVjrVeSp6k+
 97gAXTfWlAHUrip7tMbzrCdmIo5NDlOM84b/iSP26KWZarTGvYpDC5LKdbnY/Q==
Received: from brot.fritz.box (ip-178-201-230-219.um46.pools.vodafone-ip.de
 [178.201.230.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by hub2.goneo.de (Postfix) with ESMTPSA id A1C1D10A3306;
 Sat, 30 Apr 2022 00:07:28 +0200 (CEST)
From: "Leon M. George" <leon@georgemail.eu>
To: Pratyush Yadav <p.yadav@ti.com>,
	linux-mtd@lists.infradead.org
Cc: "Leon M. George" <leon@georgemail.eu>
Subject: [PATCH] mtd: spi-nor: support eon en25qh256a variant
Date: Sat, 30 Apr 2022 00:07:16 +0200
Message-Id: <20220429220716.118584-1-leon@georgemail.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Rspamd-UID: 191759
X-Rspamd-UID: 3b6e8c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_150738_827326_CC24005B 
X-CRM114-Status: GOOD (  13.68  )
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

This patch allows accessing the uppoer 8m on the A variant (EN25QH256A) of
the EN25QH256 that shares same JEDEC ID.

Without this patch, addr_with is detected to be '4' but the read_opcode is
a plain READ (supporting only 3 byte addresses).
Setting PARSE_SFDP is enough to detect the read_opcode to READ_4B.
READ_4B is only supported on the A variant.

Both support 4-byte address mode (spi_nor_set_4byte_addr_mode) but that is
prone to breaking on unexpected reboots if the reset pin isn't connected
(broken-flash-reset).

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
