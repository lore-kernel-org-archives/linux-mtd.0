Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D632C433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 20:01:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7DC3610A7
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 20:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7DC3610A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b644BIML/YopAbSeUF/PbgS2waWKTzhlhudjlFnB5/I=; b=Vbdzr+RttjGJ2b1Xavm3/mIxYs
	t3JUdPkt8cwZTcu4fwMJUuUj8dPnhSmbZw9neCwtRBB3YuHD2Z67zkpbBtfGYkutQEq/cJxoWAu7J
	t8p0AV8Tw6WJ0pX9ogBREGiHKbhpfyFI/MXl9FbKDzAF5JoDP1G2zDJlZOmu++WMzwUTim8wKgaee
	LGRXbJ7vnIK4z50Z4l2ZyvE0IkzxxP6VFcTxMNYUuWlYUgryoC0y4ephpWxYdcpNcUHPbWhB/eCho
	aF3EpqhrG6k1cqdkJGkBMWotKxJnMq7E/5qizdX/cpb9K1zFvOgvLxUIyDnTSlieH4tKNfRtlKLIY
	+B9D5ymQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leNhA-002D1q-SL; Wed, 05 May 2021 20:00:32 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leNh6-002D0r-K5
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 20:00:31 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BDC6D22236;
 Wed,  5 May 2021 22:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1620244824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N1BSknxA49h5IS27l3mw2cxZXI+1xejX5tUeLmyRBs4=;
 b=MMKqB9G7wt+dEJwdsG7rn8p6K3A2pTfkXhGwX1EF2JuhI79hNKUjx1Z35M/LwVkEuZh3Tl
 fJYCFNDY8iD4VSZKuyUruuKvePYEs+mi+fxR0w3nc/bAVsXQVVZsZeqwnkYFSoyM0GgZzV
 0uNCTb+pNXT2Ty3geqox40QKNpqVh3w=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH] mtd: spi-nor: otp: fix kerneldoc typos
Date: Wed,  5 May 2021 22:00:17 +0200
Message-Id: <20210505200017.17499-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_210028_886193_7B2DF47B 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

Use the correct argument names in the kerneldoc.

Reported-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/otp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index fcf38d260345..61036c716abb 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -17,7 +17,7 @@
 /**
  * spi_nor_otp_read_secr() - read OTP data
  * @nor:	pointer to 'struct spi_nor'
- * @from:       offset to read from
+ * @addr:       offset to read from
  * @len:        number of bytes to read
  * @buf:        pointer to dst buffer
  *
@@ -59,7 +59,7 @@ int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
 /**
  * spi_nor_otp_write_secr() - write OTP data
  * @nor:        pointer to 'struct spi_nor'
- * @to:         offset to write to
+ * @addr:       offset to write to
  * @len:        number of bytes to write
  * @buf:        pointer to src buffer
  *
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
