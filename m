Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F5CC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tC7LRdgDc695+ndzp99H6GbFjaVF1Ty80/j/6mzEeU=; b=NtdjRWhU6CTZKR
	4UccEg8yigP2Xf0No/GauACPrQQsrwxHqWeo3FylP6W2V8U3YGUDhSFfLcvwLV5iqLJcYSRBb+ICT
	t3QXS6xu/XTia+sUp/zYmoK9T3NQv0+F5NZb0N6lNupK/EinHb4JpADuQbyOPyUXVZPNgDsjjltdY
	LXJPfMYAxvuMDr/rxjBsOTMeGMVP/T8yiuJ/Ve2tgQYafTx9k/l4g6GHbaT8bA5IinTZ+1Kz9t31Y
	ATvzeHnfDWcClNkrtJydlX24sRDDqeDeHvFQEk+PUT2cqftgBzoVJzdPDKntA1Ozlenx3CIr3mWS9
	9L4YN6Pth31TLmJ/mroA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM83j-005ih8-DL; Mon, 21 Feb 2022 12:44:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7Ue-005Y3g-1P
 for linux-mtd@bombadil.infradead.org; Mon, 21 Feb 2022 12:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=3zsnrIhLoM0lShucyLsd9YgNoCMcFbg27IxCcc/idRc=; b=PB0YvM73c0bU3KKdnqSXak/7l2
 qW7UtGwQmWQc5V1AWlNlvFCfHcYCWZn/bwgystFl4qPSM3Qz1xIlhXjhUlPHHyTSzsLgwjD0K5RTQ
 U8agK5iISDX3+l/Wn9xNzuKdwbdZ59DaFXoHgIbNxbCIG08LG7iYfwUmPpbwpnwU7RSyPp7HT8Ruu
 6EAEW9AiWQe4TW42FVdL09haS8S6TpgoF9vT1UTq+CSukqT4H3kbeCgqRdkicyDZt+sLj4ufdgX48
 hBGdHQ6uFeeVgxvVV80ZbMFuxSL2LmgHVpioGtfqFC2DMMW0P2XYydPG9rWajQiiNNSD1L0kMvDfK
 YwzXT04w==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7Ua-00BdAy-7q
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 12:08:38 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5A9A8223F6;
 Mon, 21 Feb 2022 13:08:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645445310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3zsnrIhLoM0lShucyLsd9YgNoCMcFbg27IxCcc/idRc=;
 b=Hefqen4x6zIfPjTbqB3a1XsbApVYtZBxP9QmWGdmeOVg/jFjcS0StKeTVjclXhmJt6vyuT
 CV1/vvymuRNEVWQbiOvNARdlyGzIr8wJkKgi5xFdt9D5P8cUVTqDk9XgKFf/nO/Y7t92Fw
 LvVMvMUCP6ie21+sWcRditPsTl9o+Y4=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v4 27/32] mtd: spi-nor: spansion: slightly rework control flow
 in late_init()
Date: Mon, 21 Feb 2022 13:08:04 +0100
Message-Id: <20220221120809.1531502-28-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221120809.1531502-1-michael@walle.cc>
References: <20220221120809.1531502-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_120836_429964_5EC261A4 
X-CRM114-Status: GOOD (  13.31  )
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
index 5affa8ae43a7..1a0e7214d9e5 100644
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
