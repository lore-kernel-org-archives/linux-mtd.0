Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94C5C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 14:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NwlSjT3RP085UBDwALUt+0gjSSrVchiDhZy/wBwHfyg=; b=x3EgwjN+aBvpXf
	Ci5vkkw7fjG0dioH09JSCXtwk1CWnDsSn9P5T3sQxAiVF4YEx+jy2fj7gUez7MdIWeogqd2gljPIR
	bovjdWPtrUiEN7+uUhZmtsKvEtgbnNtMV6IWPGR9G1TOMHdZ8kbaRKYQEM0Koq0sQQPsTKavzSmws
	UgkkhC4wrGN9fAXb6iW7NjOpcnPNMenkr7Bu6bzz40PWszzPp4rdCg3tv2Kc0sFPlWP2GbfI3TuH6
	npUuc3SikhtGFggWCgroPvGcDPXAnwg/15umiuTjzwFK0Hl46qjm+6GCRIQTzSuPaZXLY2RqKqjhT
	RN7Nl1J/TILgGVXcSAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMsXg-00EiiB-BR; Wed, 23 Feb 2022 14:22:56 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwJ-00EZWe-3e
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 13:44:25 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id CC3C0223F6;
 Wed, 23 Feb 2022 14:44:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645623855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35/TrCmEc5UMzhIA1WiLFawNYfLWm/HAT5pOPDWhA7g=;
 b=oGhvUGdgRR6POL7pFSOWL899Vqs1yn00SDOSXcW5ESSlWSeYArrNCo/BKV29iGWF8Zi03i
 nQNiUvM4bO97oSswQQc7xnQw2XY+NS78D7banYY01NyLWQ3k+IT90wS5SiURY11revl1iP
 Mw6fCfWGsKqUqEvxE35LGOoYxfYCUCs=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 26/32] mtd: spi-nor: micron-st: rename vendor specific
 functions and defines
Date: Wed, 23 Feb 2022 14:43:52 +0100
Message-Id: <20220223134358.1914798-27-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223134358.1914798-1-michael@walle.cc>
References: <20220223134358.1914798-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_054419_337731_4A833850 
X-CRM114-Status: GOOD (  14.60  )
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
Tested-by: Pratyush Yadav <p.yadav@ti.com> # on mt35xu512aba, s28hs512t
---
 drivers/mtd/spi-nor/micron-st.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 1a7227594bf0..8a20475ce77a 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -309,7 +309,7 @@ static int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 }
 
 /**
- * spi_nor_read_fsr() - Read the Flag Status Register.
+ * micron_st_nor_read_fsr() - Read the Flag Status Register.
  * @nor:	pointer to 'struct spi_nor'
  * @fsr:	pointer to a DMA-able buffer where the value of the
  *              Flag Status Register will be written. Should be at least 2
@@ -317,7 +317,7 @@ static int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
+static int micron_st_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 {
 	int ret;
 
@@ -353,10 +353,10 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 }
 
 /**
- * spi_nor_clear_fsr() - Clear the Flag Status Register.
+ * micron_st_nor_clear_fsr() - Clear the Flag Status Register.
  * @nor:	pointer to 'struct spi_nor'.
  */
-static void spi_nor_clear_fsr(struct spi_nor *nor)
+static void micron_st_nor_clear_fsr(struct spi_nor *nor)
 {
 	int ret;
 
@@ -380,14 +380,14 @@ static void spi_nor_clear_fsr(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_fsr_ready() - Query the Status Register as well as the Flag Status
+ * micron_st_nor_ready() - Query the Status Register as well as the Flag Status
  * Register to see if the flash is ready for new commands. If there are any
  * errors in the FSR clear them.
  * @nor:	pointer to 'struct spi_nor'.
  *
  * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
-static int spi_nor_fsr_ready(struct spi_nor *nor)
+static int micron_st_nor_ready(struct spi_nor *nor)
 {
 	int sr_ready, ret;
 
@@ -395,7 +395,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
 	if (sr_ready < 0)
 		return sr_ready;
 
-	ret = spi_nor_read_fsr(nor, nor->bouncebuf);
+	ret = micron_st_nor_read_fsr(nor, nor->bouncebuf);
 	if (ret)
 		return ret;
 
@@ -409,7 +409,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
 			dev_err(nor->dev,
 				"Attempted to modify a protected sector.\n");
 
-		spi_nor_clear_fsr(nor);
+		micron_st_nor_clear_fsr(nor);
 
 		/*
 		 * WEL bit remains set to one when an erase or page program
@@ -438,7 +438,7 @@ static void micron_st_nor_default_init(struct spi_nor *nor)
 static void micron_st_nor_late_init(struct spi_nor *nor)
 {
 	if (nor->info->mfr_flags & USE_FSR)
-		nor->params->ready = spi_nor_fsr_ready;
+		nor->params->ready = micron_st_nor_ready;
 }
 
 static const struct spi_nor_fixups micron_st_nor_fixups = {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
