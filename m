Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB2EC433E6
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 17:08:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C4EF64DE8
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 17:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C4EF64DE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VxkEco19XVXnhs/jz670rYBeq9q2AjqiJOHFSnb4CuA=; b=eDkNAa8vTvw7QEOZKFPXAwZRB
	bDJ7+UPesAfPBUZvJPnnTerCmlcviQTBhQizg1YGyDtCQmumQ0gWARR3O7dVrLMHQjiFeHeK5MGOC
	4wY5qgLinK+is5I88aICeQzUakNKYV3Wk3FiOFi07KIDoLVWeyhgUUXfjPrA21EnLu5vjCEACRg3d
	7ujgM7V8VJg47RZz2lqL3BSpjlzcku9KKSaz/p21oNLqniNEP6m9sufzZKViogooEFBDEvs3rExPq
	5aaxrzG59PnLtuSaZ7EeYnv00SIv/kcmdsLkSJq6cVC+vDJENGVsUe4Bm/gXI262CHWkR4B5Ljjvl
	DC430MhbQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLqh3-00GSYg-RN; Mon, 15 Mar 2021 17:07:49 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLqgf-00GSTc-2C
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 17:07:27 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4DzjXD0mP6zQjms;
 Mon, 15 Mar 2021 18:07:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001; 
 t=1615828041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0eaSu/SYmKNsP7yOYyWinfTRZRyFZignLlbfuIu/8V8=;
 b=hF09BMz8/Ad9ATIMgag3M8SPLkVOBLTMdTJD/oX5JS8GOznwNZDoGgWYag2VkmcFyGDg1g
 X1DjgPAoZT3lZSzzTu17sxyvqsitCM+BwgjSb31EdxhiE8NkAY+TRxx70p36rwqxsh63Gt
 vmdn31XhfiE1DQPa0DjzaSZmL7bVzgLXnGbwV+batWU6ZIpGzxz268ArGr/4kN+pZoF7Bj
 YiFhJJBKLiueZhbP339nUb4GdZBeGTSXaAcWYuUZSrQKzWxHeQgEG+V4pZHgvj1q87YY8D
 4OSUoCKljQjSZ+Xd8qAAegtDQGtH3YUc2FDR75CTkyFG97lu6eKJAwcucFYkaA==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id 5QRJIC506pe1; Mon, 15 Mar 2021 18:07:20 +0100 (CET)
From: Hauke Mehrtens <hauke@hauke-m.de>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 2/2] mtd: parsers: trx: Remove dependency to BRCM architectures
Date: Mon, 15 Mar 2021 18:07:11 +0100
Message-Id: <20210315170711.567358-3-hauke@hauke-m.de>
In-Reply-To: <20210315170711.567358-1-hauke@hauke-m.de>
References: <20210315170711.567358-1-hauke@hauke-m.de>
MIME-Version: 1.0
X-MBO-SPAM-Probability: ****
X-Rspamd-Score: 4.92 / 15.00 / 15.00
X-Rspamd-Queue-Id: 48E5B179B
X-Rspamd-UID: f714d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_170725_328734_32EDED15 
X-CRM114-Status: GOOD (  10.60  )
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

Buffalo uses the TRX partition format also on Mediatek SoCs.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/parsers/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index d90c30229052..6242903d8844 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -96,7 +96,7 @@ config MTD_AFS_PARTS
 
 config MTD_PARSER_TRX
 	tristate "Parser for TRX format partitions"
-	depends on MTD && (BCM47XX || ARCH_BCM_5301X || COMPILE_TEST)
+	depends on MTD
 	help
 	  TRX is a firmware format used by Broadcom on their devices. It
 	  may contain up to 3/4 partitions (depending on the version).
-- 
2.30.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
