Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEEEC63798
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 20:28:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E561021D7F
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 20:28:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VW4C67NA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="F4OUgSEr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E561021D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YTGSFO82GngMUk7PDQ1eY3abVuU/GYSa6Naj4BNYwUc=; b=VW4C67NAv7UoVOPm+c7j+3J0CY
	n2c/xGDztgFA/Jh1eRbkldVYGhVek4q6nmlWr/R6kpdzZ6DzNhClwSf7E5p8EiFTt0oerDPLQGmxh
	/rxsydZGLFPmTeYpo8ARmL3JvnvPW+lI+Q6Sc9FfpPbITWtIAROA47BWBuJR0G62e3W533pqyLkIu
	hM5VNSrtRsAfNPtvTjlQRHteVFoYrWmwPpW98MQ+tah/WCL+FwsOD8rLAEZxcUsQSzZoIztMRv1ad
	UxaMv+6HHbHO6lUYgQjqGlHQiD6BEx1L0njhsPIrnRMy1+MtBDsPj3q9nc0OyEKsueWT0qcSgAyxf
	NmmNCDAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiNqz-0005Ks-9x; Thu, 26 Nov 2020 20:26:57 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiNqh-0005HM-OI
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 20:26:42 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B008E22FB3;
 Thu, 26 Nov 2020 21:26:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1606422395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2yzlZJGyAc8oJLWp+osP0Je8o49g4q4ZrofRXcL0G9Q=;
 b=F4OUgSErpChVU9pdHRIdX/s8TMJeuPJ5kWZPs4v5viWDwtWCbNjXXbYqcGQNOk0CT2bvyT
 a1/fzBUZSU+IojBSvDkTvkZzVCXWM2X/Z0I8qmgZ8uVcv7L9ET47DMqC0gUPK5jsMG6WdL
 uSTW5VevFxIl6wkyMBeoQeN9tXtAMQs=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/5] mtd: spi-nor: keep lock bits if they are non-volatile
Date: Thu, 26 Nov 2020 21:26:09 +0100
Message-Id: <20201126202614.5710-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_152640_028327_BD94BB33 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

I bundled this as a series, because otherwise there will be conflicts
because the "remove global protection flag" patches modify the same lines
as the main patch.

See invdividual patches for the version history.

Michael Walle (5):
  mtd: spi-nor: atmel: remove global protection flag
  mtd: spi-nor: sst: remove global protection flag
  mtd: spi-nor: intel: remove global protection flag
  mtd: spi-nor: atmel: Fix unlock_all() for AT25FS010/040
  mtd: spi-nor: keep lock bits if they are non-volatile

 drivers/mtd/spi-nor/Kconfig |  42 ++++++++
 drivers/mtd/spi-nor/atmel.c | 190 ++++++++++++++++++++++++++++++++----
 drivers/mtd/spi-nor/core.c  |  38 +++++---
 drivers/mtd/spi-nor/core.h  |   9 ++
 drivers/mtd/spi-nor/esmt.c  |   2 +-
 drivers/mtd/spi-nor/intel.c |  19 ++--
 drivers/mtd/spi-nor/sst.c   |  31 +++---
 7 files changed, 268 insertions(+), 63 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
