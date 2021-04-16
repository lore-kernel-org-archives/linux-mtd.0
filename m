Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092D7C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 16:30:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C308E613A9
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 16:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C308E613A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YP9pOGNDFefYlHUOkCARypmeXy82VMbasTHG2tjcVTE=; b=agyEqAPE7hM9ZD
	x0SE0PJ7eZzoTpQS/fy1IEuqgtuDGD2DJvq6VD2XpXK+I4y0KYeu9O5mTAjgfTDW+IZV7xHY1cV+7
	xk5rpV5DFxAoDmONHa8RtExIZ+S1qe6Zlp0E4HkXASYsERKd8SFtYjVlfhf0zgUUFN2WKiTdRJ2NV
	bvSsWL3CqLab1EqqFxGndnBXjJdbPesifMTkLgoVM82WXYhgyFytRX8nxknc9T1kFL/AZMJzPNlNJ
	oMARpJcyVqyTaDp4V/ItdbhHqHE9n15YbF34R0Pe9iNTzB3HH/cHeKSXZ0cUMkWr8c9CfsKCvV689
	BZgsGVKpCQT9maq21Gug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXRLd-002may-2H; Fri, 16 Apr 2021 16:29:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRLW-002ma5-Ih
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 16:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=la45i3/YyEtP5FWzh3/3SrZnrEyxQWZwR64yqj+r+fw=; b=dFPavOY3CrDlU0uuVnpD9pw7fq
 /DnzYKoGdjbEGVN++sMvo/wqyjN3G2x6BtCycbIKQlM8k/JS/x7Ex2IExmwKVZXLdEz9VWiWOuwQS
 3frWgG8Okm/SQAC+leUtJuC5uNakw5CIs/bXEfy3I0i/lvmiCHDuUUzboof1sZEIBZnmUu8o+V66U
 dC4fPjbXBzzMmALovr/titUHbPWrSvlgUcjVWfO6VYRoEohQutvfMwjaS2G8yS2pMOaw6o2VdFe27
 cS65Rz9fcrq8IVzqX64s4gsVPMGgvEendgYd/29Uu6lcXw3pmlo6j6cZbxGoUgotbB2QnDox5/glb
 yFlZaMdA==;
Received: from perseus.uberspace.de ([95.143.172.134])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRLS-009YSM-R7
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 16:29:29 +0000
Received: (qmail 10137 invoked from network); 16 Apr 2021 16:29:15 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
 by perseus.uberspace.de with SMTP; 16 Apr 2021 16:29:15 -0000
From: David Bauer <mail@david-bauer.net>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: use 4 bit locking for MX25L12805D
Date: Fri, 16 Apr 2021 18:28:59 +0200
Message-Id: <20210416162859.94305-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_092927_184753_0D042100 
X-CRM114-Status: UNSURE (   9.94  )
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

Macronix MX25L12805D supports locking with 4 block
protection bits in its status register. Add the corresponding
flag in order to clear these bits when unloking the flash.

Otherwise, the flash might not be writable depending on the state
left by the bootloader.

Tested-on: Ubiquiti UniFi AC Lite (ath79)

Fixes commit 62593cf40b23 ("mtd: spi-nor: refactor block protection functions")

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/mtd/spi-nor/macronix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 2d39dd32a64e..ed8b56a0102f 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -50,7 +50,8 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
+	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
