Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A059C4707A
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 19:42:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CC5B613D8
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 19:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CC5B613D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jfqbbC0ccrUXLX0lsx0XnuxQaWs9rMR+fNoLHdNiK+c=; b=e7/8QHo07wQGrlNfvTqYjnFKO+
	WnD6u8ed+Tm+72joKEsHkd6XQVgPs4U5J75Iw0oL3UKJJpljDdnrZlYOudUbuo19WRpoI5NjK3l7Q
	3AUR0TGfGpnjcJ2KmzR5ix0Uylamc9yBM1pHT1VLe9ooltRe/Fvq82M+8ZffPt5yhxTVJMqmYOFyJ
	YmT88xCrqMxgxI9daZ0D5r1ahELttnV6Tu/Q3+MlNu6VciYfkn9ozH/Q1Vaizf6HYGl1VY9CjCt0e
	uEKoxGyHSydtg6GT0AgWPztwrYfnRyQpaWlGVWD+U9umH6CHdWRqfFs2v6TXh/qRLry1Yyib9MpDw
	U+K8CJyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkB1R-000u4u-KM; Fri, 21 May 2021 19:41:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkB0q-000twi-PU
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 19:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Ch0oeM7u6L9lGRpSIbUwFd8++Tm676K1qFj/hRHd8Zw=; b=nWCm6AmnQcXBoswJk6G6cYpCKb
 DNrgADLSCZ01BGHpBHecEf9mHvMYcC024BCYpKLhIZDwJLPE2l4GB/Hp9h76CVCn22+UhJmgkFIJe
 9cewgMX+J3Poi6OrBh/7DOujQiCBZmck3uUOyVCuWlGXkCGIWH3WucWB6T8mkPRQfzWsaJ0hQQJIq
 z50N4JGQEhXI15cbn4ZTfygj2lVPTuVyoqvFq3IO97Mx1goNstFf5yaLfGDPNQ5BAn61Yb0AyNK+4
 oBkO569tPt3ETHny/AovVSyR3qndt3zmGNmqBivbdzKEalgyGaWy5mggzkmgu8P7Jptqi8qhJTtBZ
 dF95XDLQ==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkB0n-00HNxL-0o
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 19:40:47 +0000
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 16EEA22173;
 Fri, 21 May 2021 21:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1621626039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ch0oeM7u6L9lGRpSIbUwFd8++Tm676K1qFj/hRHd8Zw=;
 b=GdHyknkAzN+F6JjT5oN/3C4A0H85WBXUV8F9YpDJUjhU2mgAKEUrp2KUrBVcywbZbNTHO7
 WGsqmgmxrfgCZl9XP8piX9pkaT8C9Ou8JcH6mBZeceAyeoAv28uFcvR0q7oOY1V1KvlAdR
 7VzeuS+8e5Isq6r0GQ2bCX/0pT28hwg=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v4 0/4] mtd: spi-nor: otp: 4 byte mode fix and erase support
Date: Fri, 21 May 2021 21:40:30 +0200
Message-Id: <20210521194034.15249-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_124045_244563_5013F1AD 
X-CRM114-Status: GOOD (  10.14  )
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

This series is the follow up on the single patch
mtd: spi-nor: implement OTP erase for Winbond and similar flashes

Pratyush Yadav discovered a likely problem with bigger flashes, the address
to access the security registers is either 3 or 4 byte (at least for
winbond flashes).

Changes since v3:
 - new patch to check for read-only OTP regions before writing
 - clarify term "security register"
 - don't combine lock and erase functions anymore. there are now
   more difference than similarities.

Changes since v2:
 - fix 3/4 byte mode access
 - use spi_nor_erase_sector() by swapping the nor->erase_opcode
 - use more consistent wording regarding the security registers

Changes since v1:
- fixed kernel doc

Michael Walle (4):
  mtd: spi-nor: otp: fix access to security registers in 4 byte mode
  mtd: spi-nor: otp: use more consistent wording
  mtd: spi-nor: otp: return -EROFS if region is read-only
  mtd: spi-nor: otp: implement erase for Winbond and similar flashes

 drivers/mtd/spi-nor/core.c    |   2 +-
 drivers/mtd/spi-nor/core.h    |   4 +
 drivers/mtd/spi-nor/otp.c     | 147 +++++++++++++++++++++++++++++++---
 drivers/mtd/spi-nor/winbond.c |   1 +
 4 files changed, 143 insertions(+), 11 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
