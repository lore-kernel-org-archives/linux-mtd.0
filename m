Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6B5C07E94
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 10:16:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5065A613C9
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 10:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5065A613C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9c6eA06ULJAFwEztLlSQJqi8AIcZq4j3/3f7GAl/0w=; b=tqLhKVGrpr6OHE
	tqobgsbwGco/ud6KLEzMSAjfkqBVrdjaTjvyOBoOEOMZhn+ZZxigPTf6VvYHaPGb4fyD+axmmJMZb
	h/BRQ6xDTCKMgTs5WTboIOI38VMRcQAxiHm4QtbYnhzEj3CGVOu/LZZnU+nb+P4S5Ugwf8PK5Er6p
	b85RaD9wTGC6gc8OenPmFXnO8uXsBp5IS+Oas3tY1QFJlXGFf/Ou0hk+88xJuHdqWxkSRpHD76L9x
	uqy42//RsZbGifSO73vwTnIjP+YQCoUK27F0mRa1PmYZgEtTkQEz5ughxS72OzEhompEEGbSt91Pw
	VP9SJHhFkDPRL9W1cLjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp6sA-00CtiD-Pv; Fri, 04 Jun 2021 10:16:15 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6fU-00Cn0K-Vu
 for linux-mtd@lists.infradead.org; Fri, 04 Jun 2021 10:03:18 +0000
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3F79C22253;
 Fri,  4 Jun 2021 12:03:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1622800984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=24M02QFwLfv0Ndp7lFLCOjioGUUvuEqyzsacb1UNRDI=;
 b=JjCYyTPt9e/rdqKAgaqxvDFbyeGulWL32jQaCBU/cv5oN9Diry2gmMP7/Q3Ai7Fsf6fjoS
 FFklOepw0pEoiXbkwEYEiM9oR5QF5434m4H4kWuudz2UhTTQtwxMYLZSGPc3Zdcs0eWcUz
 HMtSowWh0XT7L/u80lGBB/u2Zk759Wc=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v5 4/5] mtd: spi-nor: otp: simplify length check
Date: Fri,  4 Jun 2021 12:02:51 +0200
Message-Id: <20210604100252.9975-5-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604100252.9975-1-michael@walle.cc>
References: <20210604100252.9975-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_030309_271439_9DF16504 
X-CRM114-Status: GOOD (  16.34  )
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

By moving the code around a bit, we can just check the length before
calling spi_nor_mtd_otp_range_is_locked() and drop the length check
there. This way we don't need to take the lock. This will also skip the
"*retlen = 0" assignment if the length is zero. But mtdcore already does
that for us. Thus we can drop that, too.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/otp.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 063f8fb68649..89fe52e3851a 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -256,9 +256,6 @@ static int spi_nor_mtd_otp_range_is_locked(struct spi_nor *nor, loff_t ofs,
 	unsigned int region;
 	int locked;
 
-	if (!len)
-		return 0;
-
 	/*
 	 * If any of the affected OTP regions are locked the entire range is
 	 * considered locked.
@@ -290,13 +287,16 @@ static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
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
-
 	if (is_write) {
 		ret = spi_nor_mtd_otp_range_is_locked(nor, ofs, total_len);
 		if (ret < 0) {
@@ -307,7 +307,6 @@ static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
 		}
 	}
 
-	*retlen = 0;
 	while (total_len) {
 		/*
 		 * The OTP regions are mapped into a contiguous area starting
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
