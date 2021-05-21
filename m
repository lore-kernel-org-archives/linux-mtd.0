Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D18C4707D
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 19:42:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 028C0613D9
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 19:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 028C0613D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fBCj6JbAfIHo7d7sFUf9IUcW4i+YIPSqDUCHdutPEY=; b=mkMY/PsYxLDNne01JIdwrq0FYZ
	zEYG+S8mN/4Bh30RDiShPAST841N/aO27q+qN9STnuQMkXvmsxEg9LHv4O8tCwFZeAN03IN8qubFn
	LCbIF/DQKLq3RmGtYHlHBGg6a5o5SiLP6UgVldBPDm8WL0VaTqKVxhYdT/TfoO9EU/3p3XyQBUAVo
	JGJrh3lRglXHVOpJdAqyQA7AT6o1PQnXZOCKkzCRQUVeQbB9A9is5kq3oOKSMR8KygzC6hpL4mHXf
	iMSTyBDs8mS3uUoks79uNlt2PGVg1kd4OkC4xf1Or+BaMuRuPeVc2ud++xrFD/zLo3R0gMfIMIwZW
	5rK+YVrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkB1A-000u0s-LY; Fri, 21 May 2021 19:41:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkB0p-000twZ-Ro
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 19:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=r9EOgof/4lK//WY39jfP7hj+JMl3wDeko5f+nE6V++s=; b=bjTcrgXfAWoatswxcnZUYL3Iwz
 SL0/XrcwBAkVMqLmkETxtr4UbvShFNLsTKY6ZtgRZPed6pTgbMbUMYU5Ujv+wRNszMP8Z6pJyNXdI
 QbEjIKddW0SKvUxzOXeq+XD+9hfWawD5QVGtlFDMLjQLs0+bo2h7TLbMG0dUjoc1rrKq5Lub6bBA2
 Xqz248UIeEwm6K4XcYsqH1lB0OAdFGDWrTBiuVbcUH+PxojF/kYgzKjV9tK0JWaRRCEgj6kN+hwI5
 pVujIGuQ57APXEW0Slh8uCLPIckkVt/9Dc7Wc2tqwH+Ln7xwbfD8H9dPhER4taTsvAGFEeny4dGFC
 Csj5VI1Q==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkB0m-00HNxM-Tp
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 19:40:46 +0000
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DF51322235;
 Fri, 21 May 2021 21:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1621626040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r9EOgof/4lK//WY39jfP7hj+JMl3wDeko5f+nE6V++s=;
 b=YZDF0wHBnKSf8WYJ50W7Oj+8ECwVjhfEbraaBtLMP/RGdhZSkAHuJ56EFHFHDbKkWxja9f
 uqvYYcMcBPgxb2AvqOdkJ5xsSwSLD5erLj8FAEnix4AhdC+MLaG11Me86u7vSTGQ5NR0Hl
 7ZiUr5Wu2Pw/FZqs8qHmSV/9csROcDw=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v4 1/4] mtd: spi-nor: otp: fix access to security registers in
 4 byte mode
Date: Fri, 21 May 2021 21:40:31 +0200
Message-Id: <20210521194034.15249-2-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210521194034.15249-1-michael@walle.cc>
References: <20210521194034.15249-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_124045_135856_4F231F67 
X-CRM114-Status: UNSURE (   8.66  )
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
