Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007CCC433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 16:31:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86236207A5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 16:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86236207A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Gm8ZKS2+xwwYUR9qixjGQxjVzNNZb8qsIKPjTh/K2w=; b=vwLEFyWdhwZJuDj41j0c6eACXP
	JWOysCBRUKwJltvI+T08GtqmwHmJVlCY4An6/Lai7n6gmwupfQwzRsKzYsjGvuru6R7JVkNnrcKrI
	JKIdOemBMZMajiEQDtF+d41niZYZ+fqEYjYahXPFZboPx2javZlee0DU+Lea3/6mfW0+ulFqu1eCg
	0b+8Ee4GZCatdTW8lkwZ1Lf6Ezko1CBdbjTyV5CvUeVd4260wE500YLzk2PC/iPIfKKMKLCINuMzl
	tSIsfyj8reLAmyb/FJRz5lknJKRLhEbWAR41cl45CAH4HihMC3hOFnbBrSZGXLBtXbg9IggWI3uYe
	zuospGjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkrUo-0006F7-GR; Thu, 03 Dec 2020 16:30:18 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkrUh-0006Bg-A4
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 16:30:12 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id EDBE822EE3;
 Thu,  3 Dec 2020 17:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1607013009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2dhOrzqSLw2EbXBFqZuXSe7nedigFHcEtpRVK05lFI0=;
 b=E0iZzF0g76ACWn95Qk3K6WfWQR6AgObUqNLJDOaa21cGGRSWL7ZMsTz2lF0s7xFLigsqGT
 /QPuO1wSDAZQeUjfEBlsVpJTbBYYCVdP7WkOaVaUf/tuwhGVDq4rasDWkqaVuAcwAG57Dt
 qb+s50iADGejQfW//eRHbjB3XN+bdTw=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/7] mtd: spi-nor: keep lock bits if they are non-volatile
Date: Thu,  3 Dec 2020 17:29:52 +0100
Message-Id: <20201203162959.29589-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_113011_508361_B4AF1980 
X-CRM114-Status: UNSURE (   9.27  )
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
might be cherry-picked without conflicts as the following patches touches
the same lines.

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
