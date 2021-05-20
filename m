Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF00C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 16:00:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 276F0610CC
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 16:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 276F0610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neZ1W1fr88Hsb2i0JrObbn0ORuf9AxRDW2Jj+2GXPWU=; b=ZQgLfB6XfOTyb/0HR63zy72pXn
	hO+rOaNhdDURC3yhPNC81wbQ3Bp39DusISlBvGV4t6q1QqReFNnsS6h6YpMs9A0sJ1C2voNyXHMnL
	ob/A21VQBkALH1S6/iyzLvMyEbftdTBWbRrHiyhaLEHOgZdQPOp/a6IjBmJgSiIfSR+vWWYmWFyUO
	Tbq9Uzdphlpr/GcqrHaIZ0d4Svq6UWlGO0CE6CWwUhkxbZkzqz0pp7yULi88HKD0Q0akGEIv6/WpR
	8gAKig6qHOLX/B5jbheMgES9ckDDEHRgiw/1xlF6lRmzdw80zmrp9RtCS0WcV90tKlz6sUMIKzwcA
	yLuP7UyA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljl5A-001p5z-HP; Thu, 20 May 2021 15:59:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljl4k-001oxv-05
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 15:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=oMLJWICOr1vU7e/tL3zhEjEozu06hjLJr825CZwdaJ8=; b=A2MNsiK7J3QBNgVeREghM2b6xL
 mkgmossV73NcynGmOt3BKpw/xxKIZft9ajWEfGxG1bMkv68dcUYRdYLCEI2c7idr/csBJk+XdQxYC
 mPqSfZ7uyMHEAeM9V4Hz+8gHyRlBh/rXVNA6VNAGDC9syFdlAocznoG1YcPBXALRSC+h240wAsLdj
 LzvelagpUL+VjTiKOBlnnoncZ9dtxymYPmu9B040RLQZPt0U/wubvcRURgh1+rVKBScSLFd8TzUbi
 zXGPkiu7XW3uf7iiQSbmDG+3p3xDKVgYV//H2QhcFYJd8S7r9DiHoRTcdFpC/k0JIcp+MMtIR2Pim
 uVIogBRw==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljl4h-00GUMi-B4
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 15:59:04 +0000
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7611622256;
 Thu, 20 May 2021 17:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1621526342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMLJWICOr1vU7e/tL3zhEjEozu06hjLJr825CZwdaJ8=;
 b=g3Ph7HVi06ML5O/t2WNcyqQqisxNq1JyyTcggGbh84nPwErkNajFN+mRpfxdq6485yoxQc
 ILRbGkq6ztASnAuhNnd5/i7U9eWyM+uPx+IokFms3g2sgX7La6us1DyoCcXKalj4r2efTr
 p4RwTSkhJvuinmSQiS5YwwCB3yYwYZg=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 2/3] mtd: spi-nor: otp: use more consistent wording
Date: Thu, 20 May 2021 17:58:53 +0200
Message-Id: <20210520155854.16547-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520155854.16547-1-michael@walle.cc>
References: <20210520155854.16547-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_085903_555229_47DE5F43 
X-CRM114-Status: GOOD (  12.66  )
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
---
 drivers/mtd/spi-nor/otp.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 91a4c510ed51..ec0c1b33f7cc 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -15,14 +15,16 @@
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
+ * Read a security register by using the SPINOR_OP_RSECR commands. This method
+ * is used on GigaDevice and Winbond flashes to access OTP data.
+ *
+ * Please note, the read must not span multiple registers.
  *
  * Return: number of bytes read successfully, -errno otherwise
  */
@@ -56,16 +58,16 @@ int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
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
+ * Write a security register by using the SPINOR_OP_PSECR commands. This method
+ * is used on GigaDevice and Winbond flashes to access OTP data.
  *
- * Please note, the write must not span multiple OTP regions.
+ * Please note, the write must not span multiple registers.
  *
  * Return: number of bytes written successfully, -errno otherwise
  */
@@ -88,7 +90,7 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
 
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
