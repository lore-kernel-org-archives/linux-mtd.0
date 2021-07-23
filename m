Return-Path: <SRS0=yo9c=MP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BB6C4320A
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jul 2021 11:29:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92F28608FE
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jul 2021 11:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92F28608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEEJYB5S5XgbP38m613fuRm1TEpcMTgRa7BzK/Dvtt4=; b=gyHtFrwfJ14gjX
	A4INdtwuivIJ1/apR82u28g01h7Iy/+yMNZBA7GQCwO7WpFRS8Sg2UUIE8L03OfHR69UmWzpMfpM/
	VkTcLckp40332TmV7nZ9JL2zbdTgRwF96RTCTTdgqkpuKJrztkQNZB+Tml9eo7SG3ZkaUrStAiEOV
	r8cyKGfeJKma8ARNMAeHAZSx5NjzEl287KRx628EGKhxi2DM+d4nD22GdDbtIyqOPHzFquD00u1F2
	YsbfxBgKwKLz0YB2rviv5WWOdiER6pn8RmtVl2oePgiO98ctSHcwWdT/oOfUEcXsbE0pZsHSsrkNR
	etUrDnNa5dachaUvc1/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6tLy-004VSb-4B; Fri, 23 Jul 2021 11:28:30 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6tLh-004VQG-Nk
 for linux-mtd@lists.infradead.org; Fri, 23 Jul 2021 11:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1627039693; x=1658575693;
 h=from:to:cc:subject:date:message-id;
 bh=dD4m+5jvnpLz3g9QjfJTZRKHJTBtcnmMU1A7kvKDBLY=;
 b=d3gcybgUDwc80g/ZjNG/ZOayQlWe03Mqt229CAMMxFPU5PqJRg6nW7fE
 pnQTy0FOb+ZXd4LYY2UchmntW96/WJxQDRtOJPJCE63DtmYt0z4sXXC1L
 jey4PStibIezNwz/sv9QLx6aaPwNzo2nwG6hXOdIAjGh2g3mn+1MRy4re
 nXyHV9Gc/7TR2tcQ3d3vmWrTYHwsosGifwj0rjpmydZoW3wSWgw1XpAoE
 xoQiC5fwmBgpzIdrLrHLGujQSFJmnIJS1JAsMd5uMtrvf5B2w9tCMgIhz
 +Nh5Rz3B/ObQ8g7Ec6ua/9p6NhSWeZ6aO6K+Xig39T/Ku3L2Er72GJzg4 Q==;
X-IronPort-AV: E=Sophos;i="5.84,263,1620684000"; d="scan'208";a="18612751"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 23 Jul 2021 13:28:09 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 23 Jul 2021 13:28:09 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 23 Jul 2021 13:28:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1627039689; x=1658575689;
 h=from:to:cc:subject:date:message-id;
 bh=dD4m+5jvnpLz3g9QjfJTZRKHJTBtcnmMU1A7kvKDBLY=;
 b=S05bLAhTE9aoIg4LVyrkgqzmo+gN345ba6bBlWbUDT6o6saGV8LCryL5
 1IE0ixdtbca5yUD82OR31H5uCWC9ewZf52WSIb+AucZTuJ2PzXTD0hn5m
 LfUcUZ/sHC2YzDDT0DZLEA4eE5JA/0O4PDxg1uumOQ/6Lz/zEZccusAmK
 D28yRsbcn6WQVhQEk8+N5Vr/b8BM+6PtHNKMB2d3bL+eotBax18WWxnkp
 zudYD1AZ1lpEq6/LlZH1xaLSkuxqUF36+NI1BbeWYYTikjdA55m8X+WoZ
 yRcrbR3iphe/C0a0mjv88UUIKSfii7apet9rXa3vNps0bIf7zzHVrjzAj g==;
X-IronPort-AV: E=Sophos;i="5.84,263,1620684000"; d="scan'208";a="18612750"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 23 Jul 2021 13:28:09 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.121.48.12])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 3FA2C280075;
 Fri, 23 Jul 2021 13:28:09 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 2/2] mtd: spi-nor: micron-st: add support for mt25ql01g and
 mt25qu01g
Date: Fri, 23 Jul 2021 13:27:48 +0200
Message-Id: <a979f3a66e9e4391844d1fae144a32646933c86f.1627039534.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <c7b6c666aef9a8a2195acabe9954a417f04b6582.1627039534.git.matthias.schiffer@ew.tq-group.com>
References: <c7b6c666aef9a8a2195acabe9954a417f04b6582.1627039534.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <c7b6c666aef9a8a2195acabe9954a417f04b6582.1627039534.git.matthias.schiffer@ew.tq-group.com>
References: <c7b6c666aef9a8a2195acabe9954a417f04b6582.1627039534.git.matthias.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_042814_119446_73792D17 
X-CRM114-Status: GOOD (  10.36  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Split these mt25q models from the older n25q models by matching their
extended IDs to allow adding support for 4byte opcodes.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/mtd/spi-nor/micron-st.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index d5baa8762c8d..2fca5de2504f 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -172,11 +172,17 @@ static const struct flash_info st_parts[] = {
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
 			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
+	{ "mt25ql01g",   INFO6(0x20ba21, 0x104400, 64 * 1024, 2048,
+			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
+			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
 			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6 |
 			      NO_CHIP_ERASE) },
+	{ "mt25qu01g",   INFO6(0x20bb21, 0x104400, 64 * 1024, 2048,
+			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
+			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      NO_CHIP_ERASE) },
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
