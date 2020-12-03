Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616D9C4361A
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 16:31:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE596207B0
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 16:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE596207B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yFKsc7v2Ir97WaPeGP9sbgNxU9C1NWz18E4CkN9ff+Q=; b=K2JUTSRpD1u/B9tB6BN0hiW7/
	nTj1iiFJPt0je5TOjkyprl8wtY2/t/5AgjORc6SpNScVXbhMGAV/bXUBdwOjaPVC/Frvb/+K6UTqB
	/fAKFOJMmo5NRQ54Ee2rZPs0aCzmkGGsiw6c5amuCtVzwdndX+0CKpa6RARAsvhc0bOBbJKrVme7j
	viLUHJE4q7zI4TP779YYbmmkwCVd3kox4nW1GZFKp5B0eXrF6EIDnlqAkcp0+f3b6ieN6n71SL+K1
	LmKYmyJgIYr7HV1KAK2+PvshUvbPN0jiiii0pEa6a+nn/nS0ZmUJbHj29Y9TPDAUxWyqe0fbo1EIm
	T7SnB9OhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkrUr-0006FX-DB; Thu, 03 Dec 2020 16:30:21 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkrUh-0006Bl-Li
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 16:30:13 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7242023E55;
 Thu,  3 Dec 2020 17:30:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1607013010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZeHHC6ibatiXFsSw6OgCY5dVPTbz2DRnswg8Mx3uWd0=;
 b=l33Bseuv1xqodpLKJo2Vh/tsB7wiphNkOgrI2b08d+oL4Dg0vMk2RnYlrYZ1Ucnw8I0j8y
 kftmSk7Jdu10yKgNK0XYhjUWu+DVF+VDDh38iMhVlxUNhFI3dFXg42ilxaWWLv5B5CMuE6
 DxTgpgZz1y6214X8zzYPVtN/TP86lEg=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/7] mtd: spi-nor: ignore errors in spi_nor_unlock_all()
Date: Thu,  3 Dec 2020 17:29:54 +0100
Message-Id: <20201203162959.29589-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203162959.29589-1-michael@walle.cc>
References: <20201203162959.29589-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_113011_880156_55DC6624 
X-CRM114-Status: GOOD (  16.72  )
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

Just try to unlock the whole SPI-NOR flash array. Don't abort the
probing in case of an error. Justifications:
 (1) For some boards, this just works because
     spi_nor_write_16bit_sr_and_check() is broken and just checks the
     second half of the 16bit. Once that will be fixed, SPI probe will
     fail for boards which has hardware-write protected SPI-NOR flashes.
 (2) Until now, hardware write-protection was the only viable solution
     to use the block protection bits. This is because this very
     function spi_nor_unlock_all() will be called unconditionally on
     every linux boot. Therefore, this bits only makes sense in
     combination with the hardware write-protection. If we would fail
     the SPI probe on an error in spi_nor_unlock_all() we'd break
     virtually all users of the block protection bits.
 (3) We should try hard to keep the MTD working even if the flash might
     not be writable/erasable.

Fixes: 3e0930f109e7 ("mtd: spi-nor: Rework the disabling of block write protection")
Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
changes since v7:
 - none

changes since v6:
 - new patch

 drivers/mtd/spi-nor/core.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5bee7c8da4dc..013198abe929 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3121,20 +3121,27 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_unlock_all() - Unlocks the entire flash memory array.
+ * spi_nor_try_unlock_all() - Tries to unlock the entire flash memory array.
  * @nor:	pointer to a 'struct spi_nor'.
  *
  * Some SPI NOR flashes are write protected by default after a power-on reset
  * cycle, in order to avoid inadvertent writes during power-up. Backward
  * compatibility imposes to unlock the entire flash memory array at power-up
  * by default.
+ *
+ * Unprotecting the entire flash array will fail for boards which are hardware
+ * write-protected. Thus any errors are ignored.
  */
-static int spi_nor_unlock_all(struct spi_nor *nor)
+static void spi_nor_try_unlock_all(struct spi_nor *nor)
 {
-	if (nor->flags & SNOR_F_HAS_LOCK)
-		return spi_nor_unlock(&nor->mtd, 0, nor->params->size);
+	int ret;
 
-	return 0;
+	if (!(nor->flags & SNOR_F_HAS_LOCK))
+		return;
+
+	ret = spi_nor_unlock(&nor->mtd, 0, nor->params->size);
+	if (ret)
+		dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
 }
 
 static int spi_nor_init(struct spi_nor *nor)
@@ -3153,11 +3160,7 @@ static int spi_nor_init(struct spi_nor *nor)
 		return err;
 	}
 
-	err = spi_nor_unlock_all(nor);
-	if (err) {
-		dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
-		return err;
-	}
+	spi_nor_try_unlock_all(nor);
 
 	if (nor->addr_width == 4 &&
 	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
