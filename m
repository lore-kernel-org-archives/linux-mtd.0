Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0828C9831E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 01:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=92sKnuy9mIbIb8+TjPpCTYDk0aqWQQRGzGhJ2IQ6wkg=; b=QesUXHU3/bvmkg
	9Zlt/P3ZkLCBNNZkYJRaL0kAA+fObaQOwx2yAYj0DSDQPtq5Yws++MDiqv+KyySFvz3gHyVfmfYAp
	55Uxz9MaiusgqOZt/HGOX+qOadjkNk4728LQDiM/pj5rJWrKyieOWmx98Y5UfvZb9YWDQ0iqOETuh
	hZSxBxpElhlCS3T6iQGoPvUEr96fXj0SsDS70+zGBV0IsXBODfnlx1RtPRZ9bdSHCUI44ubKx9bpb
	NWlbFugNDASyEo8OHus3ce2Ct2WpV/wGwaljcmhsxN9A24lNui0z0H9rulQWRMP5gjUauw9/qZeqR
	xZpyRhGoJXKDaHdtquog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9v0M-0000000CVIa-1DAU;
	Fri, 25 Sep 2026 01:45:38 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9v0I-0000000CVHs-36Dh
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 01:45:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAEE610495D;
	Fri, 25 Sep 2026 03:45:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790300725; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=BD/AF9Sm+bwlBW9JU/mCnYE3T0vi2WViCuvybTGiHTY=;
	b=EvbmGIWPnJ/g0bWpdBsb2eubwJm5wckNIUXSuvSA2efM8C4Q33xLIQ4QCpJd4BjdeZ+43B
	PHUPEP7ydvZnVRUzRgl50JYvmBiSbZjKX43k7FdpNJB8Wl0feXj7AU/i1a7bjXfleoIdeH
	21J+TVYJ1FUZrQbKpasjfvhBEDbCfCbHMqmmQo3IKHl2CrMgqJ/UUh6x1PAeE1ulMeiPJn
	A4mMgCYBiT9f7kd2oZZN43I5Q//qYlTbL9KDkH8I1e5CYB4401o+fBogG9Sr+M01ydxLJq
	xTL9CN3S+IBrF/WJAsqyx3ergdyNczqOnxBDZTwVvx8wiSsFIAA0FCxpa3kR8g==
From: Marek Vasut <marex@nabladev.com>
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: Describe locking support for MX25L51245G
Date: Fri, 25 Sep 2026 03:44:44 +0200
Message-ID: <20260925014517.174496-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_184534_994956_C458B2E6 
X-CRM114-Status: UNSURE (   9.00  )
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

The MX25L51245G part has the same 4-BP locking mechanism as MX25L12805D.
Describe the locking support.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Cheng Ming Lin <chengminglin@mxic.com.tw>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/spi-nor/macronix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b3fdb4b2fa1ca..4de1b490b16b6 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -165,6 +165,7 @@ static const struct flash_info macronix_nor_parts[] = {
 	}, {
 		/* MX25L51245G, MX25L51273G, MX66L51235F */
 		.id = SNOR_ID(0xc2, 0x20, 0x1a),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
 	}, {
 		/* MX66L1G45G */
 		.id = SNOR_ID(0xc2, 0x20, 0x1b),
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
