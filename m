Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0EEC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 15:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AN+V/gXK5C7KlFBk9rZkqx4CinVaMnabgVce/7dliVo=; b=nzsNj3+NHx3l1C
	Keriv+/FTVGTN72985RBPNbHPB2WNkJhtywn4XWaoviBbCBtyhUgH2PYxBuhWpaH1fYqKnGgLrBsF
	+ZbhZL7DGI18bg738VE6tsrgj8SKHVhUS3Uyfy3K4SteF8k/W8s9xF8qjTwF2By6+4VYaaluRPSDZ
	9GX8i9JjgOAMekFyMNTK5JAV/utslYKdDNj3iUcJV91jgCOST2+H8Flah1nDzk+KTsLdVDd4hokRF
	ek5eHShynEQg4TZvEnmZESTtu6MnoWWxI+84PhjYiRZDqr6RbrLS1uBhv1PBdDrr4ApfFMek3GPdG
	YCB7TO33uchrvT6eqn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFHDn-00FuET-3M; Wed, 02 Feb 2022 15:06:59 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFH6C-00FrWe-Nk
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 14:59:10 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A1C2B2244E;
 Wed,  2 Feb 2022 15:59:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643813944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5OZFdf8BUM0At6XcKxiTxaCJx1UapxDC3xB60RQ8F0=;
 b=bD/fYvpUj4FGyMs4buDfPGCIY0eAqj72xNrHBCK2/ercit0jk+ITiOj6ZInjZacrzA1Ehu
 DtMymW7NgQ7anvs42rn/xHqGH3elvDxw0Kj3J3SrZ/s2lz8pCW3MTeWKCJYDXRvEI4e5bt
 tUD3rgUhrt6QH6Lk37qo5J59Lg1zpk4=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v1 10/14] mtd: spi-nor: micron-st: rename vendor specific
 functions and defines
Date: Wed,  2 Feb 2022 15:58:49 +0100
Message-Id: <20220202145853.4187726-11-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202145853.4187726-1-michael@walle.cc>
References: <20220202145853.4187726-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_065909_000046_2F915956 
X-CRM114-Status: GOOD (  15.07  )
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

Drop the generic spi_nor prefix for all the micron-st functions.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/micron-st.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index ca368b48bcb0..988ecbffdc36 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -308,7 +308,7 @@ static int micron_st_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 }
 
 /**
- * spi_nor_read_fsr() - Read the Flag Status Register.
+ * micron_st_read_fsr() - Read the Flag Status Register.
  * @nor:	pointer to 'struct spi_nor'
  * @fsr:	pointer to a DMA-able buffer where the value of the
  *              Flag Status Register will be written. Should be at least 2
@@ -316,7 +316,7 @@ static int micron_st_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
+static int micron_st_read_fsr(struct spi_nor *nor, u8 *fsr)
 {
 	int ret;
 
@@ -352,10 +352,10 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 }
 
 /**
- * spi_nor_clear_fsr() - Clear the Flag Status Register.
+ * micron_st_clear_fsr() - Clear the Flag Status Register.
  * @nor:	pointer to 'struct spi_nor'.
  */
-static void spi_nor_clear_fsr(struct spi_nor *nor)
+static void micron_st_clear_fsr(struct spi_nor *nor)
 {
 	int ret;
 
@@ -379,13 +379,13 @@ static void spi_nor_clear_fsr(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_fsr_ready() - Query the Flag Status Register to see if the flash is
+ * micron_st_fsr_ready() - Query the Flag Status Register to see if the flash is
  * ready for new commands.
  * @nor:	pointer to 'struct spi_nor'.
  *
  * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
-static int spi_nor_fsr_ready(struct spi_nor *nor)
+static int micron_st_fsr_ready(struct spi_nor *nor)
 {
 	int sr_ready, ret;
 
@@ -393,7 +393,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
 	if (sr_ready < 0)
 		return sr_ready;
 
-	ret = spi_nor_read_fsr(nor, nor->bouncebuf);
+	ret = micron_st_read_fsr(nor, nor->bouncebuf);
 	if (ret)
 		return ret;
 
@@ -407,7 +407,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
 			dev_err(nor->dev,
 			"Attempted to modify a protected sector.\n");
 
-		spi_nor_clear_fsr(nor);
+		micron_st_clear_fsr(nor);
 
 		/*
 		 * WEL bit remains set to one when an erase or page program
@@ -433,7 +433,7 @@ static void micron_st_default_init(struct spi_nor *nor)
 	nor->params->set_4byte_addr_mode = micron_st_set_4byte_addr_mode;
 
 	if (nor->info->mfr_flags & USE_FSR)
-		nor->params->ready = spi_nor_fsr_ready;
+		nor->params->ready = micron_st_fsr_ready;
 }
 
 static const struct spi_nor_fixups micron_st_fixups = {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
