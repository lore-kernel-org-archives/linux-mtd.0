Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0726C47083
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 10:19:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B46C961406
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 10:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B46C961406
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNHe3UHD5BvaYqL6IfRPcUqMKwk870hrf7V28MJEzlI=; b=KtUCMOAdDqGeCr
	LMFwBuX7K57FET8TUOKzi3hXgtQtdC56cm3hc/lZhUUs/q7A77jIWJCa7kD7q3vuA1/85VeviOlMh
	Op2XGYCiXW2GN6P2ERlMguaEn5ohi/cxHAMN3kNDwAtbxc9ANEXm0uo8zgBsDxoiJS6sGYqDIbO5C
	immRdwgxU9yNbJox885Oso9WTe1DepgYDSoewViKdzDAH8NsiFnPJFloRLo/nzqoEitRld+S4+uIX
	D06JUFwXV+lDoG9HFmErWXZEhExS3IQtIBGn3Wlusb+tdkUJOZYrciDHes1etTmorYTzTVcnbkFoY
	cFQwFfCT69B7rVRIicZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp6u4-00Cupx-R2; Fri, 04 Jun 2021 10:18:13 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6fV-00Cmzx-46
 for linux-mtd@lists.infradead.org; Fri, 04 Jun 2021 10:03:18 +0000
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C94032224B;
 Fri,  4 Jun 2021 12:03:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1622800983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkS4sNM+ctsrAic8C8mVED//V6I0yEE4C5cW8CX1yvk=;
 b=TjerMxkzcjlY+5tlkl190n/f1EsxkfgFeN8joPJ1kKnXlxaN3/WblyOruNxUkJKC4P9tRW
 jc9yH/nv3EQmUl6x+N3ubxDTtNDTDcPclQQ0ZfZ15q+UDZ/Gc6tfKKcDpKGtpuvyNytEsQ
 2KGTK1Zi8jmIXJsEUJmOLDH37H6goJQ=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v5 1/5] mtd: spi-nor: otp: fix access to security registers in
 4 byte mode
Date: Fri,  4 Jun 2021 12:02:48 +0200
Message-Id: <20210604100252.9975-2-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604100252.9975-1-michael@walle.cc>
References: <20210604100252.9975-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_030309_380706_167379B5 
X-CRM114-Status: UNSURE (   8.54  )
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

The security registers either take a 3 byte or a 4 byte address offset,
depending on the address mode of the flash. Thus just leave the
nor->addr_width as is.

Fixes: cad3193fe9d1 ("mtd: spi-nor: implement OTP support for Winbond and similar flashes")
Signed-off-by: Michael Walle <michael@walle.cc>
Acked-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/otp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 61036c716abb..91a4c510ed51 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -40,7 +40,6 @@ int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
 	rdesc = nor->dirmap.rdesc;
 
 	nor->read_opcode = SPINOR_OP_RSECR;
-	nor->addr_width = 3;
 	nor->read_dummy = 8;
 	nor->read_proto = SNOR_PROTO_1_1_1;
 	nor->dirmap.rdesc = NULL;
@@ -84,7 +83,6 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
 	wdesc = nor->dirmap.wdesc;
 
 	nor->program_opcode = SPINOR_OP_PSECR;
-	nor->addr_width = 3;
 	nor->write_proto = SNOR_PROTO_1_1_1;
 	nor->dirmap.wdesc = NULL;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
