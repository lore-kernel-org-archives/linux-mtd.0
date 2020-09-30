Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1636DC4363D
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 23:58:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A2F2071E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 23:58:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r6ixnV2c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66A2F2071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=biot.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T24qHA3CDTNi3Hmix+3g7B5JauHzUZ5mm8CNFIovWg0=; b=r6ixnV2c4SL8XlzHySCHL/KpO9
	oEi4Hg+OfLpktE7lNE0ctEPN3CZIopTO3HQEBFTIv32oPbj0IzAglf5C7wU9sfsnfp7piT0WnrZ37
	wBnc88XFaKE4qhYDtQJx8nuTvsd9W0m8Z4QBzh9i3ZNxoJ/GLFKtnCl3GoCoTdRf2K/v2n13hv2xT
	X9zlEmh772+AlSeDfjTeaHz4zlmOyCqzCThzUhUPi78+ygP/2Bk5gHdGLpdvRTi1g757bjWQ63bkW
	R+xu04XROx4UkRfzk5HJAU6HpdxXJxodFizVEbLzZayf4objmlTgeYpVqAQodQJvi3d09wY5ZBsB3
	PvMc/txA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNly7-0002sQ-Kk; Wed, 30 Sep 2020 23:57:07 +0000
Received: from yawp.biot.com ([2a01:4f8:10a:8e::fce2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNly4-0002s2-3P
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 23:57:05 +0000
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
 (envelope-from <bert@biot.com>) id 1kNlxx-00Dh7n-TG
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 01:56:58 +0200
Received: from [2a02:578:460c:1:1e1b:dff:fe91:1af5] (helo=sumner.biot.com)
 by yawp.biot.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <bert@biot.com>)
 id 1kNlxj-00Dh79-6T; Thu, 01 Oct 2020 01:56:43 +0200
Received: from bert by sumner.biot.com with local (Exim 4.90_1)
 (envelope-from <bert@biot.com>)
 id 1kNlxi-0001fX-U8; Thu, 01 Oct 2020 01:56:42 +0200
From: Bert Vermeulen <bert@biot.com>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: Fix 3-or-4 address byte mode logic
Date: Thu,  1 Oct 2020 01:56:11 +0200
Message-Id: <20200930235611.6355-1-bert@biot.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_195704_158079_8C19AC26 
X-CRM114-Status: GOOD (  14.39  )
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
Cc: Bert Vermeulen <bert@biot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Flash chips that announce BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 capability
get an addr_width of 3. This breaks when the flash chip is actually
larger than 16MB, since that requires a 4-byte address. The MX25L25635F
does exactly this, breaking anything over 16MB.

spi-nor only enables 4-byte opcodes or 4-byte address mode if addr_width
is 4, so no 4-byte mode is ever enabled. The > 16MB check in
spi_nor_set_addr_width() only works if addr_width wasn't already set
by the SFDP, which it was.

It could be fixed in a post_bfpt fixup for the MX25L25635F, but setting
addr_width to 4 when BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 is found fixes the
problem for all such cases.

Signed-off-by: Bert Vermeulen <bert@biot.com>
---
 drivers/mtd/spi-nor/sfdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index e2a43d39eb5f..6fedc425bcf7 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -456,10 +456,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	/* Number of address bytes. */
 	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
 	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
-	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
 		nor->addr_width = 3;
 		break;
 
+	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
 	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
 		nor->addr_width = 4;
 		break;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
