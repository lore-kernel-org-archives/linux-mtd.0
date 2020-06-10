Return-Path: <SRS0=TxBo=7X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABF7C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jun 2020 09:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C642206F4
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jun 2020 09:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DOXeOG6v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="J7/1uOlt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C642206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ECQjG7m15lPJYVaiWemi+R3eEPBVb6SSDdkhqMSVNFI=; b=DOX
	eOG6vxvqQrG0+U6SlIjszKYkuHbuWMxDcLQVdbltvOSRQOL2sNtRa6sgqarX678y/ygT0NQ/5sQGK
	/XpQ0cPdxHsJMWMeeac/huURODj3OdQJYdstOTnHqRwg6Gg9cPTw9HCvEtHWmWI98DXpxAXX6AQUw
	2FjJZXtSiYGo1gJYtWO0WHL/t6HS4eJMA6m1yPD0X13DnpQFbW/s9bWWxZVlrY5u52XHWI03LNOst
	/B0FCXJkWjxfFMX+bR9sCM73HOPbrz8pxqgTOT9R77xL4z4XEXniwhXAR1DX96qqP9uV7N3N+v62i
	OaH/ieG8d+HGXHSmlno5vYCCUoMaXXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiwqt-0000pn-3a; Wed, 10 Jun 2020 09:16:55 +0000
Received: from mx1.tq-group.com ([62.157.118.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiwqo-0000p4-5R
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2020 09:16:51 +0000
IronPort-SDR: QPwtd4PcZPyNZ7xjw5yFjJ4Y1Z8et1VF/uhqk0znRb+k7N/trw6xfkPltpRtHBKJf9kVll1Ct4
 cLANCzUhoyl7LUlMK6XpB7inYHhHVK09f5Uv27yn0IJJYgI9oo49QtVnEfjtQqUxcQXILqj/1h
 ZeIuq0daIKXHoA4mYfIxadWs80tVyY6fpFu9/nJ4WN+0hQOJf9Uu+OZUTLlO9HKGcBBO0gZ/Ph
 OqJvmC8Iju+rPYrS2VQSBPE//r32WPr5miET4lVykTu/BCSCYUhR/AfblD7XbBKCLZlOxiZi8A
 yHQ=
X-IronPort-AV: E=Sophos;i="5.73,495,1583190000"; d="scan'208";a="12632101"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 10 Jun 2020 11:16:42 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 10 Jun 2020 11:16:42 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 10 Jun 2020 11:16:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1591780602; x=1623316602;
 h=from:to:cc:subject:date:message-id;
 bh=SX7bKwUUzHRTqxNVLzwW4z+x2qXT4twsmECkG5lWMXw=;
 b=J7/1uOltcQpINyPJbQQgp6qUSG9QCxtSsrBreI40RN7h5AvFB1aAAGc4
 MxSkcDJ2izp0362df8qY7GCRdnYjztRSkVlJFAMxqD9Bf9KC0vD7oFRAt
 CU3sria1ZtTBYEv5lRhIL6gHpNY7Vtt6Vcx0kOFpZ4JvnhwZLlWorqpni
 ruxYd7xpTWoRKCWzxdCuVaIcR9o1l7qel/pkZ832+Wh1wGOdW0TB67H86
 oC25fauxtdeQ98/j/ITWGW0nS7abZYrmHCT9gofCGbAvTsEZhc2kkC6w0
 woNk5ZwV40jJyEC1tXx/6rzFpSU/GG1QA2f6QlrRK2kI40gJpvMrBua4N A==;
IronPort-SDR: mBT2aiLqUhCJswTXYJscs4zNFhgiuH9x90QvWp81VGM3M9sbZnOfSoFS1StLCP+O8QtzP6VvWC
 vssH08/zYlyLCOvxBENWBEUSvtzWnvF1yGxMOIh72JRcTumEAzxzo2gIFl4wjwJQp7tdkop3CQ
 O3NNuJp3jsCNW2iXaUxOC4EGyUDKyuNhnzkhd5edCUnlNkJQwMRKOov5Zd1KyVMVcdVr/ifJr3
 wwLnuYcxzlxO/59jgcKveDp0aJVBaIKmkVKYusAmD0r0PvkiNteg9xbJ5h8jp4nS822BHOb/wy
 9qg=
X-IronPort-AV: E=Sophos;i="5.73,495,1583190000"; d="scan'208";a="12632099"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Jun 2020 11:16:42 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id C8AB3280065;
 Wed, 10 Jun 2020 11:16:49 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: spi-nor: micron-st: enable 4-byte opcodes for n25q512a
Date: Wed, 10 Jun 2020 11:16:16 +0200
Message-Id: <20200610091616.29555-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_021650_526109_6C9FDC4A 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Michael Krummsdorf <michael.krummsdorf@tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Michael Krummsdorf <michael.krummsdorf@tq-group.com>

Set SPI_NOR_4B_OPCODES, as the flash supports 4-byte opcodes.

Signed-off-by: Michael Krummsdorf <michael.krummsdorf@tq-group.com>
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/mtd/spi-nor/micron-st.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 3dca5b9af3b6..8edfde053f31 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -58,7 +58,8 @@ static const struct flash_info st_parts[] = {
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
-			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
+			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6 |
+			      SPI_NOR_4B_OPCODES) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
