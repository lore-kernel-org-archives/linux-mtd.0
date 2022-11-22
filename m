Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6FCC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Nov 2022 19:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=01/029gIgmOMGsqjB3dcvxF5XgTv1cGXJLWe3enrqTI=; b=mtwZLBEowUGNUg
	/dgaUcwIwi4hdL6hXGRNA2Yi/hG1wQjxf3QjBmP6Z2arkD+wRbwDeXsy4zp7UQ3A9xc2SBquFImuD
	2rt2vk9CxwDb6JEla+6gwXN0p1JCVFDJjfF1+12NjMZJ5GYJA4ucTQhur5jAA08pFAZW8ve/4OCai
	zzjLxdxH6h6kN2kR9foVL4sEVDFc6etbW9jB1xOZg47k47JvB8xa6S8UmnTCU61bFuvCgHAPfNEcD
	niv0h61bVJdTet9fSWOaiTr5DbfroVe9HjGOzHkbNDmTbz+G1CTVj0ZDBi2R+IPaYTAyxAiYRVjGG
	0t/T8GTlBy8rMdOi0iJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxYy5-00Bap8-58; Tue, 22 Nov 2022 19:30:05 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxYy2-00Banx-Nj
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2022 19:30:04 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A99D31F45E;
	Tue, 22 Nov 2022 19:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1669145398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BQQ6SkeM32iHC028rz7Wm1yS+iisemztI32hP0ps9jU=;
	b=FCjayIvwliwfmk0GVGX10IFFKAhL1ltEp2Bjy+yrUQT+cRbCdtuP8adisHT1oJjo1rSPGY
	8Dfnx3isapFk5bP+5i/XiAh4gc6uN+Jkf+XdPn4A+FYG4FZ6CDllzzXBfkA0ueyLonONS7
	6SvVLnTb7ve4O1qok9lnsobLI+E4xCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1669145398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BQQ6SkeM32iHC028rz7Wm1yS+iisemztI32hP0ps9jU=;
	b=gc2svArjaTCcGNMKjNu7nlycDMQl4ozJKWl8dw4l944ZKTmHLMLgQxavirjnSVAz/arNG/
	Asyq3qZukCuiJfCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 68FBD13B01;
	Tue, 22 Nov 2022 19:29:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id j0DlFzYjfWNcEgAAMHmgww
	(envelope-from <jdelvare@suse.de>); Tue, 22 Nov 2022 19:29:58 +0000
Date: Tue, 22 Nov 2022 20:29:57 +0100
From: Jean Delvare <jdelvare@suse.de>
To: linux-mtd@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Kyungmin Park
 <kyungmin.park@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: onenand: omap2: Drop obsolete dependency on
 COMPILE_TEST
Message-ID: <20221122202957.5748c6ce@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_113002_968944_F191BF77 
X-CRM114-Status: GOOD (  13.98  )
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

Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
is possible to test-build any driver which depends on OF on any
architecture by explicitly selecting OF. Therefore depending on
COMPILE_TEST as an alternative is no longer needed.

It is actually better to always build such drivers with OF enabled,
so that the test builds are closer to how each driver will actually be
built on its intended target. Building them without OF may not test
much as the compiler will optimize out potentially large parts of the
code. In the worst case, this could even pop false positive warnings.
Dropping COMPILE_TEST here improves the quality of our testing and
avoids wasting time on non-existent issues.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/nand/onenand/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-6.0.orig/drivers/mtd/nand/onenand/Kconfig
+++ linux-6.0/drivers/mtd/nand/onenand/Kconfig
@@ -25,7 +25,7 @@ config MTD_ONENAND_GENERIC
 config MTD_ONENAND_OMAP2
 	tristate "OneNAND on OMAP2/OMAP3 support"
 	depends on ARCH_OMAP2 || ARCH_OMAP3 || (COMPILE_TEST && ARM)
-	depends on OF || COMPILE_TEST
+	depends on OF
 	help
 	  Support for a OneNAND flash device connected to an OMAP2/OMAP3 SoC
 	  via the GPMC memory controller.


-- 
Jean Delvare
SUSE L3 Support

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
