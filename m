Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1759BC4345F
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2024 15:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k9BYCrtFDqhpyhiX6WX6vb8TWpxDRL1aDodF1KpOegM=; b=mdGR5pjQn2sKda
	s63SIducFRg+C/sGudTXbfQT0wiPhzm3St/YkP2tl3cGn9LBkZDpzhaLgjfes63RwNbm2B+jl5Dre
	QLtmY7ztGRQ4fRDtJJKrNat6DFpO23trGGjW5BtuhBlXCY2vitzr0aIFtK17N7n2yw3lc6O9sw5J7
	kO1PlAS6NJlhPq3l8e6wN19M7Agfmlx+kyErup1mK3Hpg9K5NPs5vLIqDy6adyQ9Jw6Ah6QUVOwBB
	oTvSKxCOUauMkKWhl6+f7lHlEJEb8HqH3XXsW0shPlBWN3C6fohuh80Hqr1eT2+R3D1j7Q39e82JP
	4FNinZUlTQ2qW/8JGg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw279-00000005mcP-2Ws8;
	Sun, 14 Apr 2024 15:49:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw276-00000005mbM-25CS
	for linux-mtd@lists.infradead.org;
	Sun, 14 Apr 2024 15:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8FFBA601E2;
	Sun, 14 Apr 2024 15:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3C1C072AA;
	Sun, 14 Apr 2024 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713109791;
	bh=F/dkFtRddbz2rD/46WKCGJKyqSMQqrDqq6p70dPALoU=;
	h=From:To:Cc:Subject:Date:From;
	b=XZVWOTpbFrQZAB85iDt61M2Qm9xqLW8Cf3CviBbVimbvg497DZ07PI8GKunHo6K8m
	 7oAYuTi5Wnz4aAnQ+pT7TADMbegRgTeCtFUIKR60QEkLMfHlAkssyZ7z3IICLZJdgF
	 cE51ExVCxUZT3LIRyN+81c1OxXwLbvQaTJtJGa29O1CQMfR2LIYS/iWAXvKYOzUc/P
	 yKK7ieyPeAFlotHYAK2Nq5vKcIdQzUrWJEvh680PTGSE9uZBBKEFNwnSOl1aHMW53S
	 yO5cPpjJdTq8Ok7Q65NK0UvdGeGqdaReE+8W6a0b4I62uYL7rRMBnQ4Zar/FG2qJQY
	 e/0qgYELZSSCw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] mtd: mchp23k256: drop unneeded MODULE_ALIAS
Date: Sun, 14 Apr 2024 17:49:43 +0200
Message-Id: <20240414154943.127079-1-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_084952_604693_A6631D8D 
X-CRM114-Status: UNSURE (   7.50  )
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

The ID table already has respective entry and MODULE_DEVICE_TABLE and
creates proper alias for SPI driver.  Having another MODULE_ALIAS causes
the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mtd/devices/mchp23k256.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index d533475fda15..cef5f9677d39 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -257,4 +257,3 @@ module_spi_driver(mchp23k256_driver);
 MODULE_DESCRIPTION("MTD SPI driver for MCHP23K256 RAM chips");
 MODULE_AUTHOR("Andrew Lunn <andre@lunn.ch>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("spi:mchp23k256");
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
