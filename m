Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8561EC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 12:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QC7fULSBC8CyAgcTTBc+2Ld1UyeNz5Hp/FbZvkCn1Ag=; b=FtENfdHsln03Df
	PCyCep55wbYuNF9JG5JjaCMQzqKb6ldD5BAjZL2+V7UA0bjQTZORfVdn7u77hWw6oyR65cBllF1WB
	Z5nexQHiElrcggL+osF6K85yrGNzSdwyEIQ37DjryvYKVFBJqx1qOzJ7ap9mFvUx8NWizgFlqauHF
	kqnqeYi8U9cR52mnL7+5QuUmaHDFA4/Eq6ViDLhGXA7bzV/JjdyTsvQ8arUj/INE6HCml9MmiD4NA
	ThbMt3CLjXKs/6bPT7wShOvj9RC3vGl/lcO8rDDMIE1Jb6k+6cteu5K5MRf00yzqIRJ+oxK+welLg
	txP+IgZAdnJGP0BWEN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL21g-00E8Ye-5Q; Fri, 18 Feb 2022 12:06:16 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL1Yr-00E1Rn-1e
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 11:36:33 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id EE55622239;
 Fri, 18 Feb 2022 12:36:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645184183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qL5CIZLAHLRpiDax8OyYMNlETCy029ApvOQa4Db/FjE=;
 b=l4OVKWXjsEUdtM6dEv6mpQVeAEKoLjHvW4gL4me7Sbma6kr479g7i9wfxD1VFJW3VdYnLG
 nUDgiLYBcigIbJX1MJmjjFB9L/dkWsZSCtYDecV45lDJQP1ysH/hKoAfxbm3BEGgp7FGJP
 Vcx0VhgtyP988s2inFNnDuw7CTfCaeU=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v2 27/32] mtd: spi-nor: spansion: slightly rework control flow
 in late_init()
Date: Fri, 18 Feb 2022 12:36:02 +0100
Message-Id: <20220218113607.1360020-28-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220218113607.1360020-1-michael@walle.cc>
References: <20220218113607.1360020-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_033629_267244_96E79AFD 
X-CRM114-Status: GOOD (  13.11  )
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

Don't return early when the flash is smaller than or equal to 16MiB. We
need to be able to register hooks for all sizes of flashes. This also has
the benefit that it increases the readability of the code because the
action, i.e. registering the fixups, is connected to the condition, i.e.
flashes larger than 16MiB.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/spansion.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index c57ee085e1ba..86665e55970d 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -296,13 +296,12 @@ static const struct flash_info spansion_nor_parts[] = {
 
 static void spansion_nor_late_init(struct spi_nor *nor)
 {
-	if (nor->params->size <= SZ_16M)
-		return;
-
-	nor->flags |= SNOR_F_4B_OPCODES;
-	/* No small sector erase for 4-byte command set */
-	nor->erase_opcode = SPINOR_OP_SE;
-	nor->mtd.erasesize = nor->info->sector_size;
+	if (nor->params->size > SZ_16M) {
+		nor->flags |= SNOR_F_4B_OPCODES;
+		/* No small sector erase for 4-byte command set */
+		nor->erase_opcode = SPINOR_OP_SE;
+		nor->mtd.erasesize = nor->info->sector_size;
+	}
 }
 
 static const struct spi_nor_fixups spansion_nor_fixups = {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
