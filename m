Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9290AC001CC
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2024 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NQRhBxDQZvGKTdUDJqqS+u3GelIcsE+a1npsaKsAzFg=; b=Bf29AoYgrflDlt
	Xhycs+b0KwqsLRW5glDgwTeEqJAe2fruL3ieAXaUitHIv2YGGaGzPSZq5WdUlQ4GFq4VjsF2SY8om
	+POnoxPsswquj0bAcgVKPxoPkwqatI4TvSVF9cVyyCqa+tATg7vO7K/3gyLf58nOAHBnJfjNduTkM
	qCPmWLQSA2Iz4VzKl/aSh1UTYhyeehmMnnDNgIBgnMno+IfyRSKHiWtaICJe8u10RpHFNkVwNHbd/
	4Gb60uPdZAsnfxMu4W7UxG+ApX0v1i80nVMqgtOzUo1hxmrP0KLLki4S4SUb/ESEs1R4fO6Ki1Tiy
	LeQUtBnaNS87qsp3p7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw27L-00000005mgA-3Dp2;
	Sun, 14 Apr 2024 15:50:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw27J-00000005mfe-12IW
	for linux-mtd@lists.infradead.org;
	Sun, 14 Apr 2024 15:50:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B8CB960B7A;
	Sun, 14 Apr 2024 15:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60193C072AA;
	Sun, 14 Apr 2024 15:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713109804;
	bh=OdvuLRFOyPbK9M1u502x2SaqLqdv5YEh3Og0kbbothY=;
	h=From:To:Cc:Subject:Date:From;
	b=OpARtQbTUsjfG/5pAejSz+e2ikl1HFSrtRp+fqeLMtqz/fvbm3o/p5BeA5P3pmtwL
	 BG7ffpuii6HLP+zHKH7C6tMbZV9I4FCTt8NAUCUVX9NMzQeDHMthI4cPEnzC1QLIgC
	 C0HUpgugz8pS0p8hBiBgq4i2GONU+bE18/STHJ2hFNfIFQS/mD25Lu4Ztk7Rs7KaNa
	 HFVD26XlWz7ZaeGhhQDmJIO0UA5o5/riI0Zu74CiJVTh6GzEu3EXzllY9cpg40W2AX
	 8KsaMucB8StkNMwTek4XHYSutGALlqtHN76V/U/D4dv+mC/1yv2zz8/gaE0nfWkfkv
	 GeWQCT+tw/HoQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] eeprom: at25: drop unneeded MODULE_ALIAS
Date: Sun, 14 Apr 2024 17:49:55 +0200
Message-Id: <20240414154957.127113-1-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_085005_355395_82CF7E73 
X-CRM114-Status: UNSURE (   7.81  )
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
 drivers/misc/eeprom/at25.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index 65d49a6de1a7..595ceb9a7126 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -529,4 +529,3 @@ module_spi_driver(at25_driver);
 MODULE_DESCRIPTION("Driver for most SPI EEPROMs");
 MODULE_AUTHOR("David Brownell");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("spi:at25");
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
