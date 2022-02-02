Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94490C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 15:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVx7Enbw+mLOVYhBKfoYw1owayMB8f+G9gu0FOgY0Bg=; b=k+PbVkqq2r8Tjs
	KuyHLTtsQ656EODM3OZsJ0J/4Qpzf7ypGaWOgsKmZh0dteDi9C9uCsMMMMsbSm8AnmERxAhW313gf
	+7cuCs4t8JRdKR07QNcOTl2hwv3kwPeEN8nbkjIfIPCZlKcVejnIOfNtZ4bATo0zS1nXAlGrD+aEJ
	I0QhvDSPNVbgdFDe+p0LIEPADbdn/hXTx55wkFSjZNheAXEqgZwz76VmazLPp77/hpzD5Tx16SHg/
	cM32Zbh6DVVRWo9jPlaHU1oiRPqeyY60oF9T8QSHVjhKmP2OrQV+QPj730queno6sgo5/GID1WDfn
	MD2VIvpC3iHyFrOu/1sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFHKs-00FwAE-5h; Wed, 02 Feb 2022 15:14:18 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFH6E-00FrY5-JQ
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 14:59:12 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DB1E32244F;
 Wed,  2 Feb 2022 15:59:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643813945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uy8MwJsz+qTIsy4fz0a7GwIE/hOctTmlERX+mFQWMZ8=;
 b=rk+b2bZ11j2dDHz+3FbBmD+NEjU4l66dF5CswP8UNsA3OZ1gAfj8yoNr3H7GmoaWBrwhI9
 z+eJ0/ZC36yzHYQ6otE5BZu0nnOisv4QLhvFrVhwhw0+pFse7EYVJPMKhMUPNL6H/KvE2g
 ZZShwP9C/WGPib///YAos+mwFxH5kPc=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v1 11/14] mtd: spi-nor: spansion: slightly rework control flow
 in late_init()
Date: Wed,  2 Feb 2022 15:58:50 +0100
Message-Id: <20220202145853.4187726-12-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202145853.4187726-1-michael@walle.cc>
References: <20220202145853.4187726-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_065910_848185_873E3CA0 
X-CRM114-Status: GOOD (  12.44  )
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

Increase readability of the code. Instead of returning early if the
flash size is smaller or equal than 16MiB and then do the fixups for
larger flashes, do it within the condition.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/spansion.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 534196b1d3e7..dedc2de90cb8 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -296,13 +296,12 @@ static const struct flash_info spansion_parts[] = {
 
 static void spansion_late_init(struct spi_nor *nor)
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
 
 static const struct spi_nor_fixups spansion_fixups = {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
