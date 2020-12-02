Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6139FC6369E
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 23:01:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D16E2221FD
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 23:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D16E2221FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=82Ld+sah/1uTanPJnD4VtOvEt7sh/dtubFTayyRQg0g=; b=NZtyg8LlcdpwAbq6ahsL3hmIyk
	VjK/v+VdUuOwVCoHrkYiTJ+zIZOFszUkMeHeEj618JTGZHHmsyv+LhH6TFh/YxhBvxXEaEEtAoh7i
	zL10qsKdFnNLxGYJSlSd4xRDp2xHHMyx51aZzvvyRJ5FWFO/bE+kA9L4IW0KIpkYGi4C3oLB4YyQQ
	fwHs3jx8oI2cwINy3lUe0BvZxfcNjF4FYB5xfa/hWZV1f0KHHzfKoKCIcLDJ5/kxqKqZEEbEykb1/
	ERAWUZ/QT5xuOTam1jUP0z81G/lM1+wMY/YueXUs4zhrI1+9oVLq8wEUNAHj7TA8k2YzBmR4T6IXs
	bJD+pfgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkb7N-0001lk-4s; Wed, 02 Dec 2020 23:01:01 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkb7K-0001ju-8D
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 23:00:59 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id ADFDD23E43;
 Thu,  3 Dec 2020 00:00:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1606950055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VbAeyqT69wmC7k3gUjKgzJ7BJQNzs3FcYwUcXu4/g+Q=;
 b=MtYEYxjbAQnQW4lxNQIqODTjShc19nOUglNpUlPhHBtbopfliXasR8y0Hq5fmXMNCJSRCe
 B1SaUAQrKdswL6HoXB1hC+LFJzbo6TxQbgg5Fb0T8oEbOmgv+P2tftsauh1PAoK0J4jkLH
 RopfBRstjNj99nthqlzEqN/kaXuIXvg=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/7] mtd: spi-nor: keep lock bits if they are non-volatile
Date: Thu,  3 Dec 2020 00:00:33 +0100
Message-Id: <20201202230040.14009-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_180058_435941_C4919268 
X-CRM114-Status: UNSURE (   9.76  )
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

There are now two more patches:
  mtd: spi-nor: sst: fix BPn bits for the SST25VF064C
  mtd: spi-nor: ignore errors in spi_nor_unlock_all()
Both are fixes and are first in this series. This will ensure that they
even have a chance to apply cleanly to the stable trees as the following
patches touches the same lines.

See invdividual patches for the version history.

Michael Walle (7):
  mtd: spi-nor: sst: fix BPn bits for the SST25VF064C
  mtd: spi-nor: ignore errors in spi_nor_unlock_all()
  mtd: spi-nor: atmel: remove global protection flag
  mtd: spi-nor: sst: remove global protection flag
  mtd: spi-nor: intel: remove global protection flag
  mtd: spi-nor: atmel: fix unlock_all() for AT25FS010/040
  mtd: spi-nor: keep lock bits if they are non-volatile

 drivers/mtd/spi-nor/Kconfig |  44 +++++++++
 drivers/mtd/spi-nor/atmel.c | 191 ++++++++++++++++++++++++++++++++----
 drivers/mtd/spi-nor/core.c  |  46 ++++++---
 drivers/mtd/spi-nor/core.h  |   9 ++
 drivers/mtd/spi-nor/esmt.c  |   2 +-
 drivers/mtd/spi-nor/intel.c |  19 ++--
 drivers/mtd/spi-nor/sst.c   |  32 +++---
 7 files changed, 279 insertions(+), 64 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
