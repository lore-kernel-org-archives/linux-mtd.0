Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C51606A325
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 22:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r1pn6SpE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cc2f2/U/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RFOyfOzfS2ENb8e9OPQU6o3kOvk6UwspPlDVV4PZeW8=; b=r1pn6SpEMuuFK9DmOwoZiqqWr1
	ZWeUojvGgn1I6p6RUmyqotfNnCYr6UiiBxhrLpj8RUmRRDuMcRuMWTF0mHGdZDPIz3TyFbG+7BU3m
	sQca/v9oVVQLv0j6kh/MkOLJYSEAFlqeeNUniuIvfzCO1NFoDuq7pX5qEQflwG0hqcRhfuRHatiTT
	1Azlxvu89EIEL7rsJIE2kzTwMyT074UwKyT8Sd9c1E8UDrl4q15jY3OFNFxVzMziV5xXz00jv0aQb
	/3ta6buNaabjKC41bK7ZKXFTyK4YhUM2X73wShPB/P+xxw7pW5TIkWbym2HRcQXSg/+z4Wx0/lmbn
	A46/Ey7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAOd-0000000DYLP-2DG6;
	Thu, 19 Nov 2026 22:14:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAOZ-0000000DYKn-1vLZ
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 22:14:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BC5AA4E41676;
	Thu, 19 Nov 2026 22:14:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 869B76035B;
	Thu, 19 Nov 2026 22:14:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8A1D11BC0623;
	Thu, 19 Nov 2026 23:14:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795126449; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=YTBk4U3HpQNPKASTxC1phBriKEjLR0Op0tI8THMijAY=;
	b=cc2f2/U/1CEHvYmwgM9mH9kviZcEFHMwHkqq97VzABgE1V2NaIWfOY2UHJMt+4a6+LDtK1
	oTu8Ok1i6RMdlka44fvLSYwCwxKk4UV2BsZqTkMzjAjad0QMdd5DxUry75ZSARSVBG9QU+
	Y6HQykWU1XmWIoOsVRKVzzrWZLsEj2ufQsvs5mIT1f+eEI+kwDury9iG9kOBDn7wNpz8Ni
	an7Btuqtw6ZebvtcmJD/UnIgUSwzq7KMxxZWkdl9eA7jq5KwKndXIUWFfZBy9BDJZomvxQ
	y2Z1tB9sw/pI6sT2v4TCazxqACerMBTTCMt4s1Sg37imZ8dsO6onhyxhqBH4Cg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/4] mtd: spi-nor: Fix RWW locking scheme
Date: Thu, 19 Nov 2026 23:13:50 +0100
Message-Id: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-0-da72ad9c2d4e@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NMQ6DMAxA0asgz7VEUoFor1J1SIkJHnAiuxQkx
 N0bMb7l/wOMlMng2Ryg9GPjLBXu1sA4B0mEHKvBt753zj1wCaNm4R3XYl+lsLAktMIoWVG3DdM
 aNOLQ0vTx94EodlBjRWni/Rq93uf5B86N64t4AAAA
X-Change-ID: 20261119-macronix-upstreaming-spi-nor-rww-guard-80efb238eed5
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Cheng Ming Lin <linchengming884@gmail.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_141419_656514_67436227 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RWW feature allows to read while a write is in flight, but its wait
logic was built on wait_event conditions that acquire a mutex. That is
not allowed, and breaks the wait semantics. The series reworks the
locking so the wait conditions only observe the bank state and the lock
is taken afterwards.

Link: https://sashiko.dev/#/patchset/20260811083111.403453-1-runyu.xiao%40seu.edu.cn

Two small preparatory patches keep the final change readable.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (4):
      mtd: spi-nor: Return early in the non-RWW lock paths
      mtd: spi-nor: Factorize out the bank mask derivation
      mtd: spi-nor: Keep RWW wait conditions lockless
      mtd: spi-nor: Prevent KCSAN warnings in the RWW path

 drivers/mtd/spi-nor/core.c | 190 ++++++++++++++++++++++++++++++---------------
 1 file changed, 128 insertions(+), 62 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261119-macronix-upstreaming-spi-nor-rww-guard-80efb238eed5

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
