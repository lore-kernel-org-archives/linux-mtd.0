Return-Path: <SRS0=Xvxm=DK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70033C41604
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Oct 2020 14:18:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3539206B6
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Oct 2020 14:18:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zN3ZQhIi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="m/GUfqAR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3539206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=95XfuVDK3sVDLx3hqdE0Czm4dCom1ZhrK433p8Rmo2M=; b=zN3ZQhIiDyoRDHB1sm90TBLnqZ
	gG+B4bVV+Gtr+QEFtiHAFFGO+4PAKCwdIWZ19pKqPL9Ep+8Q3eApMQJ7IpKY0/EqtONE3R9KYPVsD
	rtWgbY2GEytqNtO/tImqxHBotQAmrQAx4iIu5KYDQkOrXRduFsnZQgw8CbeHjNdhu1w88kHm7pIgQ
	kO6gBz6C6BvXXj18oSlywsOGONpQrtNJ5oWrPWZ6p6Izm/wVaRNb1cSWHzgwk2+bFVGvwwn79NaGA
	RwzTajQAbiZKSvjD6deIdI2q9Kj1vrC0lF+sW3BuisYhobJUYUh0/CwFhGgOR7HE30UXtB5W/Cjdi
	YT9AoOaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOiML-0002FX-6C; Sat, 03 Oct 2020 14:18:01 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOiMH-0002Di-Ln
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2020 14:17:59 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 37B1122F9C;
 Sat,  3 Oct 2020 16:17:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1601734669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xWjdA4s7EonCQGtN+Y60nZz9xZlyemnkm3xlXkiW6MQ=;
 b=m/GUfqARhRB5BTDCwk0jfgMY5qfLjfY9zqFglKh42sYaj73wYu39/6gpdyOtWUlxIdZ+Hn
 auBoGyXrcuyx7vYOJij4D/2kMBFziUc/mdTjEnzQjMyEKrPP0v1dHGNBN/wgP9u1iCXgkk
 CKJ48jHuUTPeZ6ka+uXQ8DK8l5lOz/o=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] mtd: spi-nor: keep lock bits if they are non-volatile
Date: Sat,  3 Oct 2020 16:17:35 +0200
Message-Id: <20201003141738.8144-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_101757_860549_C6B4D86E 
X-CRM114-Status: UNSURE (   9.06  )
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

Michael Walle (3):
  mtd: spi-nor: atmel: remove global protection flag
  mtd: spi-nor: sst: remove global protection flag
  mtd: spi-nor: keep lock bits if they are non-volatile

 drivers/mtd/spi-nor/Kconfig |  42 ++++++++++++
 drivers/mtd/spi-nor/atmel.c | 129 ++++++++++++++++++++++++++++++------
 drivers/mtd/spi-nor/core.c  |  36 +++++++---
 drivers/mtd/spi-nor/core.h  |   8 +++
 drivers/mtd/spi-nor/esmt.c  |   8 ++-
 drivers/mtd/spi-nor/intel.c |   6 +-
 drivers/mtd/spi-nor/sst.c   |  31 ++++-----
 7 files changed, 206 insertions(+), 54 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
