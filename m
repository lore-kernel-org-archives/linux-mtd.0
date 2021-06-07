Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B615C47094
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 11:29:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D706610A8
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 11:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D706610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLUtokwGitfJEiIIrdk9o+tNnvCFZqvf3xKRlgasTVs=; b=FOpoUFL6CelnHZ
	OO3yGsUNjJsquRqccD+nn8ZZPePk71JfKiZm1QlJ88YWbOUJoeYzi0N/AIdG6fmWuQfzhSmOSqUfa
	Eo5v3hWWdiWpiI+gqXIT2uqISck0POa8JBTDGi7if+RPGfVx2twnFSFQnfNLviBt/u0j6qRmNosdH
	ABiCbuZH4MgPub7c6q/Ibo5TsKf2wbvphKrOvbsfOn4NA7xjAmGjGi8BPqVfp5ZQrHyJUqzM7Ft19
	h/ZcjaU/Lzss1hU3jbhtj5+DISpaDxSj2W0uELJ5CFepw2m3jKz8eW0HuRYdHv0dcTan/kAAAieTO
	3TWg9h0n2+iFDLSoeLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqDRT-003M20-Pu; Mon, 07 Jun 2021 11:29:15 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqDQ8-003LVl-NT
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 11:27:58 +0000
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 152B72224D;
 Mon,  7 Jun 2021 13:27:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1623065271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aPLr0bC6c5jU5r1OPXE3alwU7oqwB2zXRdHsI9UOrv8=;
 b=AboVC3dj7CIGi8nFLXtsf/q32kzUPsv48V3gRuSSqv2/RF1+2Gr+8+vdtMDW0r9Axiikcs
 0rNmV2UjZtxk9lj/Z1jlz846NR2Q13LzcOno9fPAhmJz/J2fHlAjsftnB2ySQpVNlT7HsL
 R9U+kL3TvhncKlq9qi1Uk2dSYDtLAAo=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v6 3/4] mtd: spi-nor: otp: return -EROFS if region is read-only
Date: Mon,  7 Jun 2021 13:27:43 +0200
Message-Id: <20210607112744.21587-4-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607112744.21587-1-michael@walle.cc>
References: <20210607112744.21587-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_042752_959547_FEC4447F 
X-CRM114-Status: GOOD (  23.81  )
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

SPI NOR flashes will just ignore program commands if the OTP region is
locked. Thus, a user might not notice that the intended write didn't end
up in the flash. Return -EROFS to the user in this case. From what I can
tell, chips/cfi_cmdset_0001.c also return this error code.

One could optimize spi_nor_mtd_otp_range_is_locked() to read the status
register only once and not for every OTP region, but for that we would
need some more invasive changes. Given that this is
one-time-programmable memory and the normal access mode is reading, we
just live with the small overhead.

By moving the code around a bit, we can just check the length before
calling spi_nor_mtd_otp_range_is_locked() and avoid an underflow there
if a len is 0. This way we don't need to take the lock either. We also
skip the "*retlen = 0" assignment, mtdcore already takes care of that
for us.

Fixes: 069089acf88b ("mtd: spi-nor: add OTP support")
Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/otp.c | 41 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 3898ed67ba1c..89fe52e3851a 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -249,6 +249,29 @@ static int spi_nor_mtd_otp_info(struct mtd_info *mtd, size_t len,
 	return ret;
 }
 
+static int spi_nor_mtd_otp_range_is_locked(struct spi_nor *nor, loff_t ofs,
+					   size_t len)
+{
+	const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
+	unsigned int region;
+	int locked;
+
+	/*
+	 * If any of the affected OTP regions are locked the entire range is
+	 * considered locked.
+	 */
+	for (region = spi_nor_otp_offset_to_region(nor, ofs);
+	     region <= spi_nor_otp_offset_to_region(nor, ofs + len - 1);
+	     region++) {
+		locked = ops->is_locked(nor, region);
+		/* take the branch it is locked or in case of an error */
+		if (locked)
+			return locked;
+	}
+
+	return 0;
+}
+
 static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
 				      size_t total_len, size_t *retlen,
 				      const u8 *buf, bool is_write)
@@ -264,14 +287,26 @@ static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
 	if (ofs < 0 || ofs >= spi_nor_otp_size(nor))
 		return 0;
 
+	/* don't access beyond the end */
+	total_len = min_t(size_t, total_len, spi_nor_otp_size(nor) - ofs);
+
+	if (!total_len)
+		return 0;
+
 	ret = spi_nor_lock_and_prep(nor);
 	if (ret)
 		return ret;
 
-	/* don't access beyond the end */
-	total_len = min_t(size_t, total_len, spi_nor_otp_size(nor) - ofs);
+	if (is_write) {
+		ret = spi_nor_mtd_otp_range_is_locked(nor, ofs, total_len);
+		if (ret < 0) {
+			goto out;
+		} else if (ret) {
+			ret = -EROFS;
+			goto out;
+		}
+	}
 
-	*retlen = 0;
 	while (total_len) {
 		/*
 		 * The OTP regions are mapped into a contiguous area starting
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
