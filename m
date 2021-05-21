Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D766C4707A
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 19:42:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC0AA613D9
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 19:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC0AA613D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pb7HSNVzURjyCyHMWLL9jMQjwfFiqa0taI7Bwj2Gd0=; b=FfcjhEfjmQslzizsrM+gGLfJM0
	g3AD/ISg4bGeq5IjNOivllPTM62rpFV8rIk6gwDHAhsxyVdcY8H2ANzH3+wO884d6AY/8oC8AzAuF
	2nZB9cGh6xxmXm7q2A9tIKGnHTRpD99OsZ8z5T/PdnXZaXxhGPmo7rXYVaLNT1gskYn4AoarvC1bh
	FcxluMSpdZHGQ2X3yMEHle/wt/UgjJrmUVKu7xR3TqxeX0yplZZGAl0OMTLyvSlXf/uUjE5Gr8Mod
	qGiM4KlNw67xdu5GDcDAnQ9KkGUX779OxUx4hyFV9Ovb3mWByfvG/r65C0yCQVaehdPo3wy+AOCzA
	1RDwo8Tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkB1q-000uC5-Kh; Fri, 21 May 2021 19:41:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkB0q-000twn-VU
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 19:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rgC4jjVmlD+ERZFG5a1egFMRkTiC36hQ7dagkSzeiF4=; b=N58xprq89BD7tSB9yXunpQi1Ar
 LXgc8nm7bHDx3STexP9O+CDz1x8ZiUMvY3GC9pRvjlqVgtt1a/UtabtHci0zOSR9SvSLaXPDUTmnv
 ZTmAGaTBWYwdQeiXZLtaUZnNLRdGrUkum275Gy52O3RDVaDGtRVeLN+wXyil3IE0AufCOqAXHZdp7
 hermIqZ5CQ7VNwtJcYN1G5xN7m7lgbBDG/g3P+p1A7oltt+J1NBYffxeViUnhvt33EYRg1qKJ7WcT
 L8NTa5VkWRfzIKDv6I2EhgF2pdJucQfXCw/4o2BOei+FlLgmM/bCqVOI1jwiE+D0UGl4SFaEPPg6T
 Jq19nwQQ==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkB0n-00HNxP-4y
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 19:40:47 +0000
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 867D82224A;
 Fri, 21 May 2021 21:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1621626040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rgC4jjVmlD+ERZFG5a1egFMRkTiC36hQ7dagkSzeiF4=;
 b=TVhLAm5k89T0gATvqCEA4QaZewieWinkQJ19S4/SX+EkSeom0URpqt3rSH71yAK7NaJdzd
 mXqCF5R+2fiMQjB/J/QJ+hkEraub915G86hrbN/FDNiroyGpEgsOnr9PcsaGcPGf/FFTFp
 MPUG2KeupudMt2hwq1WCz2h8yo1lMhw=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v4 2/4] mtd: spi-nor: otp: use more consistent wording
Date: Fri, 21 May 2021 21:40:32 +0200
Message-Id: <20210521194034.15249-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210521194034.15249-1-michael@walle.cc>
References: <20210521194034.15249-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_124045_372001_2A695F78 
X-CRM114-Status: GOOD (  13.50  )
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

Use the wording as used in the datasheet to describe the access methods
of the security registers (aka OTP storage). This will also match the
function names.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/otp.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 91a4c510ed51..3898ed67ba1c 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -15,14 +15,21 @@
 #define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org->n_regions)
 
 /**
- * spi_nor_otp_read_secr() - read OTP data
+ * spi_nor_otp_read_secr() - read security register
  * @nor:	pointer to 'struct spi_nor'
  * @addr:       offset to read from
  * @len:        number of bytes to read
  * @buf:        pointer to dst buffer
  *
- * Read OTP data from one region by using the SPINOR_OP_RSECR commands. This
- * method is used on GigaDevice and Winbond flashes.
+ * Read a security register by using the SPINOR_OP_RSECR commands.
+ *
+ * In Winbond/GigaDevice datasheets the term "security register" stands for
+ * an one-time-programmable memory area, consisting of multiple bytes (usually
+ * 256). Thus one "security register" maps to one OTP region.
+ *
+ * This method is used on GigaDevice and Winbond flashes.
+ *
+ * Please note, the read must not span multiple registers.
  *
  * Return: number of bytes read successfully, -errno otherwise
  */
@@ -56,16 +63,20 @@ int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
 }
 
 /**
- * spi_nor_otp_write_secr() - write OTP data
+ * spi_nor_otp_write_secr() - write security register
  * @nor:        pointer to 'struct spi_nor'
  * @addr:       offset to write to
  * @len:        number of bytes to write
  * @buf:        pointer to src buffer
  *
- * Write OTP data to one region by using the SPINOR_OP_PSECR commands. This
- * method is used on GigaDevice and Winbond flashes.
+ * Write a security register by using the SPINOR_OP_PSECR commands.
+ *
+ * For more information on the term "security register", see the documentation
+ * of spi_nor_otp_read_secr().
+ *
+ * This method is used on GigaDevice and Winbond flashes.
  *
- * Please note, the write must not span multiple OTP regions.
+ * Please note, the write must not span multiple registers.
  *
  * Return: number of bytes written successfully, -errno otherwise
  */
@@ -88,7 +99,7 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
 
 	/*
 	 * We only support a write to one single page. For now all winbond
-	 * flashes only have one page per OTP region.
+	 * flashes only have one page per security register.
 	 */
 	ret = spi_nor_write_enable(nor);
 	if (ret)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
