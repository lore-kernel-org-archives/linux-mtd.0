Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B658FC4361A
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 16:32:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EB1F207A5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 16:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EB1F207A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EHozzzI/FCoJMroKD4t52ue+0Twryv8rNRG9yNULd1o=; b=LF37q3VI3892GsfULHUuaBfu4
	oU/8mrsqXiaOh4BEv4EzZ/a/B8bBuxpF3/8Do1Jnl4swAB0RvQyGJ+0BEprTj0mTu2c1kvufhhWdm
	F6d989JaxHysQoofZcV4DWPQ2jSGhXvtQBdXVTxHfkYOn6MomJfR/AjKiblrnvkKFthdGrSE6EmLN
	1yDnKVg36Eq9FFkLoAZSDE3J+6G3tcrZliECM8rUP97/g/+dsBvKu7BHolJqh4nMYmyAxUXiOdH59
	iDJYw7cjYQZZAabKxanceQ/Op9nzKG6wI5yPqa/d3sgVyiltV85la76piQy3HWfZ6x7UEMhuAMQol
	TYawBmZHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkrV1-0006He-3t; Thu, 03 Dec 2020 16:30:31 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkrUj-0006Ck-Cp
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 16:30:17 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1A4D723E60;
 Thu,  3 Dec 2020 17:30:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1607013012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JEeKThJHzDQWzFEVBd1CQQkGxdCF7tfLPvQ53SXAiU8=;
 b=lMng0CmlyqLS75I7v1FktDig5Yi9Tle9Y5jLtWiRKnGrPSTkYfJvYnaz8z7Pp0lqVcTcN0
 sox7BBcwRwO9iJ5gwFR6XUREPcko0+U5fRSCP2vvMRKiyE7sSDiuwFAIv740cUGerRPpzv
 1sHFVYbEWhFCM8Negze4yhPEdT6KrE8=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/7] mtd: spi-nor: atmel: fix unlock_all() for AT25FS010/040
Date: Thu,  3 Dec 2020 17:29:58 +0100
Message-Id: <20201203162959.29589-7-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203162959.29589-1-michael@walle.cc>
References: <20201203162959.29589-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_113013_716195_2CBF991A 
X-CRM114-Status: GOOD (  18.67  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

These flashes have some weird BP bits mapping which aren't supported in
the current locking code. Just add a simple unlock op to unprotect the
entire flash array which is needed for legacy behavior.

Fixes: 3e0930f109e7 ("mtd: spi-nor: Rework the disabling of block write protection")
Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
changes since v7:
 - added fixes tag

changes since v6:
 - use spi_nor_write_sr_and_check() and log a debug message if writing
   fails

changes since v5:
 - new patch

 drivers/mtd/spi-nor/atmel.c | 53 +++++++++++++++++++++++++++++++++++--
 drivers/mtd/spi-nor/core.c  |  2 +-
 drivers/mtd/spi-nor/core.h  |  1 +
 3 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 49d392c6c8bc..deacf87a68a0 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -8,10 +8,59 @@
 
 #include "core.h"
 
+/*
+ * The Atmel AT25FS010/AT25FS040 parts have some weird configuration for the
+ * block protection bits. We don't support them. But legacy behavior in linux
+ * is to unlock the whole flash array on startup. Therefore, we have to support
+ * exactly this operation.
+ */
+static int atmel_at25fs_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	return -EOPNOTSUPP;
+}
+
+static int atmel_at25fs_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	int ret;
+
+	/* We only support unlocking the whole flash array */
+	if (ofs || len != nor->params->size)
+		return -EINVAL;
+
+	/* Write 0x00 to the status register to disable write protection */
+	ret = spi_nor_write_sr_and_check(nor, 0);
+	if (ret)
+		dev_dbg(nor->dev, "unable to clear BP bits, WP# asserted?\n");
+
+	return ret;
+}
+
+static int atmel_at25fs_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	return -EOPNOTSUPP;
+}
+
+static const struct spi_nor_locking_ops atmel_at25fs_locking_ops = {
+	.lock = atmel_at25fs_lock,
+	.unlock = atmel_at25fs_unlock,
+	.is_locked = atmel_at25fs_is_locked,
+};
+
+static void atmel_at25fs_default_init(struct spi_nor *nor)
+{
+	nor->params->locking_ops = &atmel_at25fs_locking_ops;
+}
+
+static const struct spi_nor_fixups atmel_at25fs_fixups = {
+	.default_init = atmel_at25fs_default_init,
+};
+
 static const struct flash_info atmel_parts[] = {
 	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
-	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K | SPI_NOR_HAS_LOCK) },
-	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K | SPI_NOR_HAS_LOCK)
+		.fixups = &atmel_at25fs_fixups },
+	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK)
+		.fixups = &atmel_at25fs_fixups },
 
 	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK) },
 	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_HAS_LOCK) },
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 013198abe929..6afcb99e9741 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1049,7 +1049,7 @@ static int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
+int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
 {
 	if (nor->flags & SNOR_F_HAS_16BIT_SR)
 		return spi_nor_write_16bit_sr_and_check(nor, sr1);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 0a775a7b5606..7780169d485b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -430,6 +430,7 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor);
 int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
+int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
 
 int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
 ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
