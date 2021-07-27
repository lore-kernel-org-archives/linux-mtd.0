Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCA0C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:32:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12353610D2
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12353610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWz6ATL7vrrcRGzLSSN0jr4iYlXNBnmnjFLFqGhO9+g=; b=Zlu6xAVL3gnw4o
	5zbH0314thWCBsfdM/SDi/nNsYxRl1jGb733bg2qP+JJNlvooJ4IJJTWI6iOxD8kjz6+edSlwb7S6
	Alhj2w8pw1OCzhc32smmY3dLyQUOfZwfkKWGDRXuYjcI90O28BZiLzGDm5bRJ9srsvDpY8O78ZPeG
	hznwK3rhXDdE3hAdwEdGog/XuQKQ2RpYOQvR4dQ5EFdK/eTxPz9kGGdkVc73vMo6EO+CPGjN4bMFX
	7xShRz/09iKPk2oHA4d09OCcitu2U2PRMyOw/ZUtO3p9PCp3o43DpwIDligQebT8VC7ddcL3Zckc+
	rCb25D3AdCygi+Jus+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Fgu-00DQym-Q4; Tue, 27 Jul 2021 05:31:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F66-00DHez-Mt; Tue, 27 Jul 2021 04:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361622; x=1658897622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iN51XLl+urMrTqqdcj0HnYMBux/5PYfkWnkj91upvkI=;
 b=fSRGhuwMsyKGZAGwQat5X+78HMcoiZDxnUeo9+VkaBwyav7o/MFejV7Y
 wNhZiKwo0PaeUOP4JN5ehVz/rDXlHvDrZpDDqk3rsN+o7xFeiirLVGisa
 schh7pVKWRX13vBfksZR1fexQPTWmOGmtgS47wytjOQtnfwPyO9QtwFo4
 5SfgXjdW1e02ep/YguPWT2Yz8hidbzkdle/QY3weYjoVmbEunx0bksoM5
 WFVlid0uFTNLRefsETgknPZdJNQhjecVVT8kjHuIqliCxgglnlwm7B8Gw
 7EFVtjWhHGqXtohCwdbySsH11AriDXhqHgMFO0K0J3Pb+96tpWms4Sfcj w==;
IronPort-SDR: veBFMWgJqK4cB5BD0+IdcJC7q0ls8tTMZ8buF7SGCbDwVQO+/GkjIhuGg6RjrgvS+K2xDF9MNM
 sqnW7l99dK4pFaqjgKPwvFRX/we9QoGnSpt+2TS8pIhvln3CBZ3uA4BR6GFhkQaEldgbePh1QK
 XoHdqGPbJ27RKavyEA5rYsC5eOUewDRVLbn2sbnNgtbBXoRRXvKFrPrmn1x2MYlpzHfwakGdT7
 rp25unXikGU+9cIEFs9S1NnnBliPKtSM/EmPzICherqm88WJKxMwr9he/eb4xtZb6ybOAFvS3a
 +ZgpEXhzkYA1EupEW9D/uqHg
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="63689471"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:53:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:53:40 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:53:36 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 14/35] mtd: spi-nor: spansion: Use manufacturer late_init()
Date: Tue, 27 Jul 2021 07:52:01 +0300
Message-ID: <20210727045222.905056-15-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215342_916353_EE71244E 
X-CRM114-Status: GOOD (  11.47  )
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

spansion_post_sfdp_fixups() was called regardless if the flash defined
SFDP tables or not. A better place for this kind of parameters init is
in manufacturer's late_init() hook. post_sfdp() should be called only
when SFDP is defined. No functional change in this patch.

Instead of doing the 4b opcodes settings at manufacturer level, thus
also for every flash that will be introduced, this should be done
just where it is needed, per flash. I'll let this for other patch.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spansion.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index ee82dcd75310..aad7170768b4 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -276,7 +276,7 @@ static const struct flash_info spansion_parts[] = {
 	},
 };
 
-static void spansion_post_sfdp_fixups(struct spi_nor *nor)
+static void spansion_late_init(struct spi_nor *nor)
 {
 	if (nor->params->size <= SZ_16M)
 		return;
@@ -287,13 +287,9 @@ static void spansion_post_sfdp_fixups(struct spi_nor *nor)
 	nor->mtd.erasesize = nor->info->sector_size;
 }
 
-static const struct spi_nor_fixups spansion_fixups = {
-	.post_sfdp = spansion_post_sfdp_fixups,
-};
-
 const struct spi_nor_manufacturer spi_nor_spansion = {
 	.name = "spansion",
 	.parts = spansion_parts,
 	.nparts = ARRAY_SIZE(spansion_parts),
-	.fixups = &spansion_fixups,
+	.late_init = spansion_late_init,
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
