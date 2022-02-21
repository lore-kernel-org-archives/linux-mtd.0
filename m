Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDDFC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 09:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Q2ApaYoRRntBHjoaevvRPymr93AWW0jpNBno/Bd/v0=; b=RU19Age5Sry+04
	EsM0STCtXkvzy9l1P5BWDMHh9X6LEO0J0abSKcSbOeYBHgrDJ6GO03i1MdEhxSIg0O7Q9X8C0Ui4S
	DwYOQaDDDrezz1fLJNaAa6GG8KOA100Kla9zlN19lEJ746rDZiqV+EDHnl4ZzMhpMdJvzBjXPejoU
	eIuR32RSgIkJ0p+9x4MiD8WW2PZ+IYwLccU/RgFuzWiKWa3rWtHtH2l/X/6VXfUAo7SDulrvAAVFj
	LAZlfr4pVTkWQ9ZDy1/7jCX9yCeH5QiHiI+9MgbKHLa0PfHZ4/FQRGsw+FfALwEngFfFe+kPjvFRB
	VK8mSim+l3yla44vN0sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM4l6-004Xf2-1s; Mon, 21 Feb 2022 09:13:28 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4RF-004QjE-Bj
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 08:52:59 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 76FFC223EF;
 Mon, 21 Feb 2022 09:52:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645433575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4TFVPiTLlGkWwn1EsOaghV7Oi+R3fkCvcWUJOwT6tkU=;
 b=VjmYOKWhLpoy2wjoXDyRtSbUiXIrRePnkYOHLqzoCxmLdsb6S0VB8/aUk3ibE+Gr85ueuY
 DnV51s9DIi8p8N4DrsQvfaKdMioEEi22b0DK24MoyeHJe2a09ZZYMcjA3qm2LZpRgafe0k
 SLchXvRFroOdn7m6uEIPrFEcIA7fDXE=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v3 14/32] mtd: spi-nor: winbond: unify function names
Date: Mon, 21 Feb 2022 09:52:18 +0100
Message-Id: <20220221085236.1452024-15-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221085236.1452024-1-michael@walle.cc>
References: <20220221085236.1452024-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_005257_719557_DBFCFD98 
X-CRM114-Status: GOOD (  12.98  )
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

To avoid name clashes unify all the function and static object names and
use one of the following prefixes which should be sufficiently unique:
 - <vendor>_nor_
 - <flash_family>_nor_
 - <flash_part>_

There are no functional changes.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/winbond.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 3d91888882e4..1e8fb571680b 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -32,7 +32,7 @@ static const struct spi_nor_fixups w25q256_fixups = {
 	.post_bfpt = w25q256_post_bfpt_fixups,
 };
 
-static const struct flash_info winbond_parts[] = {
+static const struct flash_info winbond_nor_parts[] = {
 	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
 	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1)
 		NO_SFDP_FLAGS(SECT_4K) },
@@ -131,14 +131,15 @@ static const struct flash_info winbond_parts[] = {
 };
 
 /**
- * winbond_set_4byte_addr_mode() - Set 4-byte address mode for Winbond flashes.
+ * winbond_nor_set_4byte_addr_mode() - Set 4-byte address mode for Winbond
+ * flashes.
  * @nor:	pointer to 'struct spi_nor'.
  * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
  *		address mode.
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int winbond_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+static int winbond_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
@@ -162,7 +163,7 @@ static int winbond_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 	return spi_nor_write_disable(nor);
 }
 
-static const struct spi_nor_otp_ops winbond_otp_ops = {
+static const struct spi_nor_otp_ops winbond_nor_otp_ops = {
 	.read = spi_nor_otp_read_secr,
 	.write = spi_nor_otp_write_secr,
 	.erase = spi_nor_otp_erase_secr,
@@ -170,25 +171,25 @@ static const struct spi_nor_otp_ops winbond_otp_ops = {
 	.is_locked = spi_nor_otp_is_locked_sr2,
 };
 
-static void winbond_default_init(struct spi_nor *nor)
+static void winbond_nor_default_init(struct spi_nor *nor)
 {
-	nor->params->set_4byte_addr_mode = winbond_set_4byte_addr_mode;
+	nor->params->set_4byte_addr_mode = winbond_nor_set_4byte_addr_mode;
 }
 
-static void winbond_late_init(struct spi_nor *nor)
+static void winbond_nor_late_init(struct spi_nor *nor)
 {
 	if (nor->params->otp.org->n_regions)
-		nor->params->otp.ops = &winbond_otp_ops;
+		nor->params->otp.ops = &winbond_nor_otp_ops;
 }
 
-static const struct spi_nor_fixups winbond_fixups = {
-	.default_init = winbond_default_init,
-	.late_init = winbond_late_init,
+static const struct spi_nor_fixups winbond_nor_fixups = {
+	.default_init = winbond_nor_default_init,
+	.late_init = winbond_nor_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_winbond = {
 	.name = "winbond",
-	.parts = winbond_parts,
-	.nparts = ARRAY_SIZE(winbond_parts),
-	.fixups = &winbond_fixups,
+	.parts = winbond_nor_parts,
+	.nparts = ARRAY_SIZE(winbond_nor_parts),
+	.fixups = &winbond_nor_fixups,
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
