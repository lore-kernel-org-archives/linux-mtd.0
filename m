Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0BE606A886
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=36phFrCO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yM/x3CPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=M3TrKfJNWyWUUzwBNKoyUenY7OOtQ0UBjD0hOqju7x0=; b=36phFrCOOZG5jC71v7SKpUjxxM
	LXcVMFeSb/HH5cpBbaUpV0yDUPvzWA2fotSkKYEtjdR/T4/Q5Jz5bmvCimP9u3xwH6zYsH/Or0Fh/
	V0ldbT/Crlwvhlcm2REkpl3tcBKpDSTq/63AMehY7asFAgxmYLj7+QjUfXG9aJzWY/4LhTapnHimd
	OzTyjqZF94LsYDXoZ+NhxnildgnkEWiFw/KPEc3WgYQx1hL4/j6rWnyubwypVOe5D+Q8gsVjikhAU
	P1LSGcq7Vy09l548PxgtQ1bNhoYRVsxDQzOfDv4GESTmxTrSgyFd8DNmJnOZE8bjneJCV/17au/Rr
	G/bqK7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdj-000000056pt-2Xbk;
	Tue, 17 Nov 2026 09:38:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdf-000000056nW-1XqY
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 09:38:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 665614E4094F;
	Tue, 17 Nov 2026 09:38:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25FBB5FC81;
	Tue, 17 Nov 2026 09:38:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C408411BC0493;
	Tue, 17 Nov 2026 10:37:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908284; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=tlBoKmorBtcIb4QQ2wVoA2joobZWJYIm4KpVprAp2zE=;
	b=yM/x3CPsv371lnsTibypMg+dMRNFgQIbfFoDeD2qBsDdboH+kKUZyk7mY5kgvDHH8C5oTI
	n4FDAxEsuHU3so03bQpVcUf7zKewxSD8wups1A/67cAfBFJZNKXhKbeB/wHEClsHq9zDdQ
	u2rk1fhyyoKKShNeiv7FIuwi9yqdEalIqOhHs9pdZM9c57U8AYHyUEZx3Yqu/n0ybxQ/kx
	QxWqG/OiSKDJXe8izCYtt0EIIYhIIEJv5/8x1PfofgPPvv59fpGIWoca81f6dEXSWvLn0P
	BZXOizTJT1HwU3zTq9Ahau3OnzWLrXfQyoJYy7nFGHRKmxM4dDYqqKEgnPxs/g==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Stefan Agner <stefan@agner.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [PATCH v2 00/12] mtd: Remove #ifdef guards for PM functions
Date: Tue, 17 Nov 2026 10:37:38 +0100
Message-ID: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013807_554887_E26B02CF 
X-CRM114-Status: GOOD (  10.77  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This is the v2 of my patchset that updates the MTD core / NAND core as
well as several drivers to get rid of the #ifdef CONFIG_PM guards.

Instead, the code that depends on PM or runtime PM will be
garbage-collected by the compiler automatically if this config option is
not set.

The rationale behind this change is that in general conditionally
compiled code is a bad choice, as code behind a rarely-used config can
get broken without anybody noticing.

In this v2, I removed the pm_ptr() use on shutdown callbacks, as neither
platform_driver.shutdown() nor the mtd_suspend() / mtd_resume() that the
shutdown callbacks call are related to CONFIG_PM.

Changelog:

v2:
- [04/12]: Don't use pm_ptr(), and rewrite commit message
- [05/12]: Don't use pm_ptr(), and rewrite commit message

Cheers,
-Paul

Paul Cercueil (12):
  mtd: Remove #ifdef guards for PM related functions
  mtd: rawnand: vf610: Remove #ifdef guards for PM related functions
  mtd: spear_smi: Remove #ifdef guards for PM related functions
  mtd: physmap: Remove #ifdef guards around shutdown callback
  mtd: maps: pxa2xx: Remove #ifdef guards around shutdown callback
  mtd: nand: mtk: Remove #ifdef guards for PM related functions
  mtd: rawnand: fsmc: Remove #ifdef guards for PM related functions
  mtd: rawnand: hisi504: Remove #ifdef guards for PM related functions
  mtd: rawnand: mtk: Remove #ifdef guards for PM related functions
  mtd: rawnand: omap_elm: Remove #ifdef guards for PM related functions
  mtd: rawnand: r852: Remove #ifdef guards for PM related functions
  mtd: rawnand: txx9ndfmc: Remove #ifdef guards for PM related functions

 drivers/mtd/devices/spear_smi.c     |  6 ++----
 drivers/mtd/maps/physmap-core.c     |  4 ----
 drivers/mtd/maps/pxa2xx-flash.c     |  4 ----
 drivers/mtd/mtdcore.c               | 10 ++--------
 drivers/mtd/nand/ecc-mtk.c          |  8 ++------
 drivers/mtd/nand/raw/fsmc_nand.c    |  6 ++----
 drivers/mtd/nand/raw/hisi504_nand.c |  7 +++----
 drivers/mtd/nand/raw/mtk_nand.c     |  8 ++------
 drivers/mtd/nand/raw/omap_elm.c     |  6 ++----
 drivers/mtd/nand/raw/r852.c         |  6 ++----
 drivers/mtd/nand/raw/txx9ndfmc.c    |  6 +-----
 drivers/mtd/nand/raw/vf610_nfc.c    |  6 ++----
 12 files changed, 20 insertions(+), 57 deletions(-)

Cc: Stefan Agner <stefan@agner.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Maxim Levitsky <maximlevitsky@gmail.com>

-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
