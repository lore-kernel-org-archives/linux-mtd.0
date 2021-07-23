Return-Path: <SRS0=yo9c=MP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA2CC4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jul 2021 11:29:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5845E60E75
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jul 2021 11:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5845E60E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zsHnU1GBagPJVonFwHBJijzAh6UHE0odBUC0bK56HcE=; b=oWfMgwUV7mNZHb
	9UMOQKpmmO/DgUXHceVphXK0rCfstoQp8fcLgOv6ufsdL4jYIDD/W+k0v3Do2BWRIH48s1TK+LIjd
	Hk8TVyBslksJB9gy21DYWq2/Znhzz56C/n4UEZF3kDG0YdHUvLwHTihwvZw8r2u0MTHYmCEgxYU3a
	CCQVX0q9oBkT52TYvkDahzgDl6hM2YsXnoXflkquL8yRWy1lNlKT8rXG+kxag6x9cCE1w3ZChbRDP
	7MSQWwBXr3S21Rg//jNCc0rwNWQVzL7RVd7qqUka0MHj5WnOB2Xa06herGbtpKqJBt70KleMO/nDc
	w6zn6lnjHCyGPJJtrNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6tLk-004VQw-Rg; Fri, 23 Jul 2021 11:28:16 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6tLf-004VQG-Hb
 for linux-mtd@lists.infradead.org; Fri, 23 Jul 2021 11:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1627039691; x=1658575691;
 h=from:to:cc:subject:date:message-id;
 bh=aAPkXdl9E/1o3H8cpUC5g2ADIsYXfWAWx1RrAJRr6nI=;
 b=PFw48VTmvzs3oVeoLE+CYDojbZ5EorIU+MBK8OOcz38MUXMLtEwPCrCo
 0zAgfrZQr3rB/eQjIigySWow2uZ1WQ6bnjlgyceLa5siLBfuf3g5KyDBS
 OC8KUegs0irtt00CP8OZs/UePH/CvBITjWQZlqfKZkDiwNM9ex4DKwkgJ
 uhjq4EpNZyJm0GlMEX3uSvZtP8GTvxsa8pHpiPqLZCSJeWLQK4eXNyjnx
 ciuk4eCjYq730tIwk6Ej/xL0Na9fHunsR9mkBH7gwalgv6Rb+1qTOjZGI
 Mh+c92jGjjwdDgYCjOJdcFU/jAK7+9fpcLUZwgRXDeeIAXJhcwQ2aqIrZ w==;
X-IronPort-AV: E=Sophos;i="5.84,263,1620684000"; d="scan'208";a="18612749"
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
 bh=aAPkXdl9E/1o3H8cpUC5g2ADIsYXfWAWx1RrAJRr6nI=;
 b=h4KSTu0h3PRuS4TF+4Lr4py4OjWHemgSnDmoSAktY+VA75Tyupz9m+sw
 dDPs9kSFTFWHulQTBTr/nkxsJ3GJNv5ZmvRlW6mHq/YUqCTLdRowc2XVa
 fd3mnICkP47GEK7UzpJW85XHquUH8uoMbenmyvd9cQDarXBcvLddJlCKW
 84XEWtJ2aNIpZesuMjbB0qWEiTBaNftJlAZpYVnITs1L04G56f8Ew/DKK
 koM6YH+JOLNgq7nWaFMCCMqqe1jlh0mk4epFGE9Tpezljh/U1WrnQLZ64
 g4N21Hlz+pFuv0v1Xm1AHW+5K75kSO5ogxW4CFwZ5AlAApp5YrdaFQEmi Q==;
X-IronPort-AV: E=Sophos;i="5.84,263,1620684000"; d="scan'208";a="18612748"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 23 Jul 2021 13:28:09 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.121.48.12])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 0EEA4280070;
 Fri, 23 Jul 2021 13:28:09 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 1/2] mtd: spi-nor: micron-st: sync flags of mt25ql02g and
 mt25qu02g with other mt25q
Date: Fri, 23 Jul 2021 13:27:47 +0200
Message-Id: <c7b6c666aef9a8a2195acabe9954a417f04b6582.1627039534.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_042811_974462_57A7BE8F 
X-CRM114-Status: GOOD (  11.44  )
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

All mt25q variants have the same features.

Unlike the smaller variants, no n25q with 2G exists, so we don't need to
match on the extended ID to distinguish n25q and mt25q series for these
models.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/mtd/spi-nor/micron-st.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index c224e59820a1..d5baa8762c8d 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -181,11 +181,11 @@ static const struct flash_info st_parts[] = {
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      NO_CHIP_ERASE) },
 	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
-			      NO_CHIP_ERASE) },
+			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096,
 			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 
 	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
 	{ "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
