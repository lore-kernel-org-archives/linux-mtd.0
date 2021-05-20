Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44684C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 15:59:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E98B6108D
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 15:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E98B6108D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnjxuWA0Wek0tEXtzWEKuim42FwwCkc7jFxit6Et8e8=; b=Hco4S8cA+B9zWL6RkyYuzjTrSN
	z4ZQrtrmIthtzhAcOV7B1UCJr5t5DdOOBe2F86x3FkNZ/MPbLG1vRf7w3N++cglVA5igqJEPf2sfi
	09+bs4v+RaseHzEsPLGg5DEe2454CfxLdkn+05+dVU3jSPn9uKEUcaZi/s4ZcI+1yjiS7RNNyRKpL
	Hwky4k5JypMhh1w4gqY4IRR1WuxhGSGss3Dtk+lRAMf3MyCHy1diDUEN8Nv/cWkhNzNIo8HIIVagE
	mQZJoMq0kq3du/KKeD7cuhl/Lm+ST8VcWwUozzY0qlXPU6RekAtgypnqudJAp1Jb98Sq2KayCf04h
	ja+2ZHbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljl4x-001p2t-Pj; Thu, 20 May 2021 15:59:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljl4j-001oxm-9o
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 15:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=VSoxx0fZRtwWjLTLvBnNKfAQkHrgpbnSlIV/T+6852k=; b=iZiJqB1dZyCfRcUc52NRwQL0/E
 milXMRYBFozaVlqudlkJrg0qsFzNqo86YaBgEEbUk/rSPPwTrTPpHExelQBolUOQgOpOwtOlgDnFJ
 phhTqUGO/ssvDfiD7PX4bAFFCNfqjs8otpWOENCpsHV33xRsoahDT5Vp2BkKqdmI9opo4iAzlgS7P
 L27Jc2ovwpX3izmP1KVWkFr/ENuDL2yWHvXcTn+ej47Oj5uLN9gKF07RQCrmP0nLwhEFkBbE89r0E
 dhwsuePhu2zkB5MEujAupiAFHaNqe+XWbaeN7ctKfQlugi96UQd6qH/+3X9xG4EPd46SKodJVqteW
 accoFi4g==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljl4g-00GUMC-Ph
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 15:59:04 +0000
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0A37822255;
 Thu, 20 May 2021 17:59:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1621526340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VSoxx0fZRtwWjLTLvBnNKfAQkHrgpbnSlIV/T+6852k=;
 b=ganlyJfokNlYa/75Fl9kX+2scYPuh0HOub7+X92y8fdkTJgHyt7B2bT8BmhjjG0nX7pPp2
 lK4dD9XG9JYqtd1gWgwqOJpLmqXZiGc6EVHNQZkxPb+eoule9vJBLS4FDTmoqEVs8ke7d4
 Mc1Ozv4WBgvuM53ovo2zr4zEO7wukNQ=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 1/3] mtd: spi-nor: otp: fix access to security registers in
 4 byte mode
Date: Thu, 20 May 2021 17:58:52 +0200
Message-Id: <20210520155854.16547-2-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520155854.16547-1-michael@walle.cc>
References: <20210520155854.16547-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_085903_009417_DA7EAE47 
X-CRM114-Status: UNSURE (   9.05  )
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
