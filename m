Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A479C4345F
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2024 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9BYCrtFDqhpyhiX6WX6vb8TWpxDRL1aDodF1KpOegM=; b=KB9GOZwZBaX9BK
	SvqtER+u0CVxv+TcOCtYEQ9RUOwJjttfAxA886sU7jKEhlTrqMkmL4aztk9X5YhlZQN8Z9LFMjrTv
	QGqG6iAXvJGySkheKWcUUp0xq7iwl3EnOnFLwOg17URBKRllSq9O7/2A2hV+QxQar48ofI9PkMp6D
	GJOoYMcRgGAHF9D/ZqmfXtMvR7S1wcbLKEAq5OLvW2MQrBeU+q0nYvdgWPrIxPyIA/W0MQRcK2Wgn
	pHJaoyc3/iX5r+nvG3bCxLAcLMyzF3mTDvYT0jjC4phxR182GW6QwThl8FGzea7GirAKehGEqgwDK
	xbnosEY7x0OPyl+2ICog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw27U-00000005mhT-1SmR;
	Sun, 14 Apr 2024 15:50:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw27M-00000005mgK-2Dl1
	for linux-mtd@lists.infradead.org;
	Sun, 14 Apr 2024 15:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFB3B60B87;
	Sun, 14 Apr 2024 15:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2BBC32781;
	Sun, 14 Apr 2024 15:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713109807;
	bh=F/dkFtRddbz2rD/46WKCGJKyqSMQqrDqq6p70dPALoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oqP0/h7eEJrEgYeb8NzQBvwLwECJ7r0h/HXjOtMfK1LzqGbjm4ofY4LCtkKOFFA66
	 5EnLYrlgyJd4hdhMB3ecGGJ06ij5Pdo+WbVIAZ2WHVSggRvGwEhmyrELoVO+eVfDtz
	 RUmuMaDk09pemnJOdeSbvR05o8ehVIcZKIXNquoU7pgLiYdARra5YF9umqzKjzZsPr
	 0/qfwZD6WlwiHsqyjPO0JWrcRHOCOL4Cm8bl/fRqXV+PesJP3kHWTuyDu2qKdGwYej
	 ZXQguBJkXdj4WSZq9EU6yWEown5ZBcO2gUEKPTgSZDvgxo/HgMJs6tdsP9OE4Cuzc6
	 1gKaOIKxx3U3w==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] mtd: mchp23k256: drop unneeded MODULE_ALIAS
Date: Sun, 14 Apr 2024 17:49:56 +0200
Message-Id: <20240414154957.127113-2-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240414154957.127113-1-krzk@kernel.org>
References: <20240414154957.127113-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_085008_633244_322D2312 
X-CRM114-Status: UNSURE (   8.67  )
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
