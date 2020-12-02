Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAD3C71155
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 23:01:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B30BD221FD
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 23:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B30BD221FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g+shSLKnBQOxHFkdr/ejGb6GJvPtJbmN8byYSINf9gY=; b=z6jBvaju3t+uN1zA5PMAreE+V
	lPMqxkr/XrWaZQ/CCfmEYKVx3oO4v/sh3qPEeB+d0jXtvdMOMm9+BO2TMEKKmgtvBjsfa1aAIj1/8
	4kWS8Kx5uGvUE2C5N9vzB95VNzHl5tw0frR1SUOJ6R4qoDS+doDXMlb6UOPOOnNSsjGdDCcS7Hq0x
	VDjebOFsoBdwys1+DQo1j8XcbdqAAy+46JQ2MnZh3Mmx8Yy8utA0FAaVgmAJH1R5enijS/xx2EWHI
	XTLTJF7RAjT1jvPrUU06d0DPoMlbltsRxUTCOYyuX0CDjOVgnRXSw5eNVfyc//2+SvFqtJ0451fV+
	ZYMVT7dpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkb7U-0001os-SF; Wed, 02 Dec 2020 23:01:08 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkb7M-0001kZ-5F
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 23:01:01 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 76ABC23E5B;
 Thu,  3 Dec 2020 00:00:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1606950058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tA/aM6lWMfa7TmNVA8dfiG+itOvZgqH1cE8LTQP5Qes=;
 b=qTIbY8IdbkBb03JKv09ERJyQryGyyn0LDkdFpnZaMzWuFqk2t6yTeC3kokoPU2Hm2619TM
 FSxUi1G7sy50T/pe3sxBiGBaJD00g/r9bGG7LWzI+Kjo5cDk9XidfGzVCdvjWPWxQ1X9l5
 XoSWo0G4Enik+j+L/twUr2sNgVwZy5o=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/7] mtd: spi-nor: ignore errors in spi_nor_unlock_all()
Date: Thu,  3 Dec 2020 00:00:35 +0100
Message-Id: <20201202230040.14009-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201202230040.14009-1-michael@walle.cc>
References: <20201202230040.14009-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_180100_381876_E0AF5740 
X-CRM114-Status: GOOD (  16.76  )
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
---
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
