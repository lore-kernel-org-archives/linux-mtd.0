Return-Path: <SRS0=OH0o=DZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2138EC433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 21:32:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC3DE22267
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 21:32:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hM5zwrUO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC3DE22267
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eT5uDvO2R4pJ+xSkAkBbLTnbquPEwBtddolDjPzxJO4=; b=hM5zwrUO77aZHezSfi0fDc6VQ
	7NCZdKeEVJtFBadq5DsI0vE08/ZyEng5pMudKli/NsMQlTBCIBINo4o0lHT1lErxBhmI5IHB5WpfA
	aR6FVJsGWPsfrMaiBm754BYwX58ax6U43dD2ZK6jE1MBfZa5RBoKwuazMKJ67jFMevH5yKA0C/IxA
	zkPsU2g+oKfL6C+lTIbWe1HZ9mBCz+3e+qoobzrdvD68sJ6j4Ty5HIQs0SBzBa4vBRyPU8zKNcrYP
	GqXEIYWpobxpGaUiJdV7JjdDrRlw1crLVMxuFsu9VsVYI6jKOI6XHeaEXN9sOdGN/ARYDyBPL3xNW
	LLxWTxR+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUGH8-0005UL-Pb; Sun, 18 Oct 2020 21:31:34 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUGH2-0005SY-Vy
 for linux-mtd@lists.infradead.org; Sun, 18 Oct 2020 21:31:30 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 05E9D1816C718;
 Sun, 18 Oct 2020 23:31:19 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5vg5sjU_jtkM; Sun, 18 Oct 2020 23:31:18 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fEsAp7Mt5D7Y; Sun, 18 Oct 2020 23:31:18 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [RFC][PATCH 2/3] spi-nor: Add INFO_PGZ
Date: Sun, 18 Oct 2020 23:31:02 +0200
Message-Id: <20201018213103.28798-2-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201018213103.28798-1-richard@nod.at>
References: <20201018213103.28798-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_173129_171201_DF32CA8B 
X-CRM114-Status: GOOD (  10.27  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, tudor.ambarus@microchip.com,
 vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Allow much larger page sizes than just 256 bytes.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/spi-nor/core.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 621202fda5d0..76c3f8ef47e9 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -268,7 +268,7 @@ struct flash_info {
 	unsigned	sector_size;
 	u16		n_sectors;
 
-	u16		page_size;
+	u32		page_size;
 	u16		addr_width;
 
 	u32		flags;
@@ -319,7 +319,7 @@ struct flash_info {
 };
 
 /* Used when the "_ext_id" is two bytes at most */
-#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
+#define INFO_PGZ(_jedec_id, _ext_id, _sector_size, _n_sectors, _page_size, _flags)	\
 		.id = {							\
 			((_jedec_id) >> 16) & 0xff,			\
 			((_jedec_id) >> 8) & 0xff,			\
@@ -330,9 +330,12 @@ struct flash_info {
 		.id_len = (!(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))),	\
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
-		.page_size = 256,					\
+		.page_size = (_page_size),				\
 		.flags = (_flags),
 
+#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
+	INFO_PGZ(_jedec_id, _ext_id, _sector_size, _n_sectors, 256, _flags)
+
 #define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
 		.id = {							\
 			((_jedec_id) >> 16) & 0xff,			\
-- 
2.26.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
