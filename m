Return-Path: <SRS0=SBmy=KG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182D7C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 11:09:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFC4B6134F
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 11:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFC4B6134F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsHloYUvukVTGWY3PIs167QNwYyIocizUVfLeNBKc6U=; b=AoJpGZqX+lKPbw/MBk6VIJw4ns
	RY+9iLHoOeVowXwAmc9ebnnc9+JGDcz9ZZTiY99E4C17XEOKP9Q2oExkcgnETGVBRKUm7iUF+tWz0
	aXc7bKbe70FiElXYx3tKfI9Rumwjra2bgHijzzSCdQnhWeaaZEAUVblbrRwPe8L51towzgYAwOQ0g
	2lEPMnzjYsIBbs9cHpGsl3jzKd2YFCDogeBS1JxrPA2DMTQsVyuY8QrayB6PFPv8O+hEZohe9OXDt
	/Nd0daklptdzBGyqfIF8LrQ5L3Fzn+HUjfUm2HXb5U75buVA7S/MTzuouo4VwC8MQ1+D1B3EbJE5Z
	dpfAD6ww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgQFA-00H4cJ-QX; Tue, 11 May 2021 11:08:04 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgHOd-00G3ZJ-SO
 for linux-mtd@desiato.infradead.org; Tue, 11 May 2021 01:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kdcyc97ehzsx1qGVMsxL+g/Aq4a2oX+1MyVVJC81qrM=; b=z78sint2MJeCPa3hjlvWRWJPOw
 WxlNUJPS7N974+FsLRO16CqEKkC525pU8UUiXFAsQt/6UKrGimjXQBTHhIB7JxwDGlIyXJosG7neu
 SKNSjYm2B9Yf3Y+MNrjF5NlCOqyuTxT8iPcFExNq102C1afuLDp9sKg4V9pBVzsGydW2jqIppVcpU
 QyrVjUJCjEQeaO5iWLe/nFIfwsm42XDW61jJjhuaQQGbY82M5VAZpprf+Q1t7RI+ac3qvJquBIqm2
 ncZkODEusJNXilzlLWN5eSqVUR4EbtTtrlmsF1yLfiPOvuQ06dMe6K81E6SDaBcY7IFhTidovprAs
 wCuYscUQ==;
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgHOY-009F88-4e
 for linux-mtd@lists.infradead.org; Tue, 11 May 2021 01:41:11 +0000
Received: from localhost.localdomain ([172.17.195.95])
 by TWHMLLG3.macronix.com with ESMTP id 14B1esOZ036551;
 Tue, 11 May 2021 09:40:54 +0800 (GMT-8)
 (envelope-from ycllin@mxic.com.tw)
From: YouChing Lin <ycllin@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 juliensu@mxic.com.tw, YouChing Lin <ycllin@mxic.com.tw>
Subject: [PATCH 1/2] mtd: nand: ecc-bch: Fix the double counting of ECC stat
Date: Tue, 11 May 2021 09:40:34 +0800
Message-Id: <1620697235-7829-2-git-send-email-ycllin@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1620697235-7829-1-git-send-email-ycllin@mxic.com.tw>
References: <1620697235-7829-1-git-send-email-ycllin@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com 14B1esOZ036551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_184110_446820_ED5715D3 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_184110_446820_ED5715D3 
X-CRM114-Status: UNSURE (   4.18  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If you use SPI-NAND with SW-ECC engine, the ECC related statistics
(ecc_stats.failed & ecc_stats.corrected) will be doubled, because
those numbers will be double-counted in ecc-sw-bch.c and
drivers/mtd/nand/spi/core.c.

This can be found by using nandtest/nandbiterrs validation.

Signed-off-by: YouChing Lin <ycllin@mxic.com.tw>
---
 drivers/mtd/nand/ecc-sw-bch.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-bch.c b/drivers/mtd/nand/ecc-sw-bch.c
index 405552d..aade381 100644
--- a/drivers/mtd/nand/ecc-sw-bch.c
+++ b/drivers/mtd/nand/ecc-sw-bch.c
@@ -372,11 +372,12 @@ static int nand_ecc_sw_bch_finish_io_req(struct nand_device *nand,
 						    &ecccode[i],
 						    &ecccalc[i]);
 		if (stat < 0) {
-			mtd->ecc_stats.failed++;
-		} else {
-			mtd->ecc_stats.corrected += stat;
-			max_bitflips = max_t(unsigned int, max_bitflips, stat);
+			nand_ecc_restore_req(&engine_conf->req_ctx, req);
+
+			return -EBADMSG;
 		}
+
+		max_bitflips = max_t(unsigned int, max_bitflips, stat);
 	}
 
 	nand_ecc_restore_req(&engine_conf->req_ctx, req);
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
