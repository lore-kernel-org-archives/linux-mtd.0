Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF77C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Dec 2022 16:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0EenEXbaC4W0cHw2YgVIRejx4JSaKJiwoh6htjpSNvY=; b=h0lJJcCCXKVGqM
	REFunUOE3sZpaJ8IemJkgpc8al708qY1PfJGuUbCX4lRVY0+b0vNtK4oataRlUmF/B3k8rt4gKlhu
	W9DuAHc9O4bWWH7Brh+a35n1dN96peJgnHdFPYqrSaqC0p2hTTQ87NXysQASWWGC2oDnjIVePmsDL
	j6GuZaSbxljbYWwb6UZod2fK0N5ZIUjOENXskdbLOUr8vh8Ni9SsPFeIALst+4zNRS2FEcOmCXOtG
	6CHQKSas8PzaAEwc8pGHmmU+3W4E8OEnXiPo9hkjJ/EFsK5Pc7wzEoCu1ltBmgJFyL90m0ixyYh5W
	C9RANDQP7MAB4pDGP7Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rH9-00AMFb-R3; Thu, 15 Dec 2022 16:40:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rH2-00AME7-VB
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2022 16:40:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5094D61E5C;
	Thu, 15 Dec 2022 16:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272BFC433D2;
	Thu, 15 Dec 2022 16:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671122395;
	bh=pP6atf/tM5bifszUgRPBT2KCcUTS6tZpd3asUA7oItQ=;
	h=From:To:Cc:Subject:Date:From;
	b=m9sWbQngPK1fyTuHc3qwtSaoLjAT/wbKhmLExrAaSjv9dK3hcndZIwBXuQTjKQukg
	 wS5t9ZQhKggRG5X4kl41YFzYX+2hDijJWsqFPYyb92wVKWu3KJ/ybq1oul/gFnZI1I
	 FsOpUcQ116SxQNJ5UfUTxUrrYAhcTqlwqTIk/rulUDB4nmdXwMWk9eaNY/1kVVrnRU
	 LDpHuhDgq114nlLtSC8iH5nVhtxDLPl0dnfCSlnXCF+sr/DZ5Ip86m5wNwRFQZ4J84
	 kKE2mpBKS2fYFI3GRaPKlzCc3NOxgSO878XYHHZdjahz++7qy9449AlXX4HzLCixPS
	 cayMZ8pSdiiRQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Tokunori Ikegami <ikegami.t@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Mauro Lima <mauro.lima@eclypsium.com>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: cfi: allow building spi-intel standalone
Date: Thu, 15 Dec 2022 17:39:38 +0100
Message-Id: <20221215163950.649791-1-arnd@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_083957_058984_1B8952B5 
X-CRM114-Status: GOOD (  13.55  )
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

From: Arnd Bergmann <arnd@arndb.de>

When MTD or MTD_CFI_GEOMETRY is disabled, the spi-intel driver
fails to build, as it includes the shared CFI header:

include/linux/mtd/cfi.h:62:2: error: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Werror=cpp]
   62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.

Use an #ifdef here to guard the settings so the header can be included
in all configurations.

Fixes: e23e5a05d1fd ("mtd: spi-nor: intel-spi: Convert to SPI MEM")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/mtd/cfi.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index d88bb56c18e2..0e87b6e2faad 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -15,6 +15,7 @@
 #include <linux/mtd/cfi_endian.h>
 #include <linux/mtd/xip.h>
 
+#if IS_ENABLED(CONFIG_MTD)
 #ifdef CONFIG_MTD_CFI_I1
 #define cfi_interleave(cfi) 1
 #define cfi_interleave_is_1(cfi) (cfi_interleave(cfi) == 1)
@@ -88,7 +89,7 @@ static inline int cfi_interleave_supported(int i)
 		return 0;
 	}
 }
-
+#endif
 
 /* NB: these values must represents the number of bytes needed to meet the
  *     device type (x8, x16, x32).  Eg. a 32 bit device is 4 x 8 bytes.
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
