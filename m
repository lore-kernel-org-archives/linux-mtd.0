Return-Path: <SRS0=ZCmB=XG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B71DECDE27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 06:54:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E8021A4C
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 06:54:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ek2qahf6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E8021A4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=omicron-lab.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e2dJz3BpjcGjTW3ak6xw3iKvxpYPzSAy2DrprzyhA5Q=; b=ek2qahf6ctLqN7
	DZUSktfEc7yrkosmVdlwusumR9azun+xYWf2sgTRp3x/L1Px9My93uxQPjYO8owoScYTJHZvBHwsD
	ZCAwijiWaJne2b9i4ZT1Lfj+kRC/AGbOzC8ScNthokjsApkN9z4+eKk9o6yb3PMORL6FoTBRQlk8H
	XEMAeh3zYLDebyi3JDCTM89NK5S5jh6sOMptIGfR/nkRsdPcFaoQAv7WcjD4x9LkrUoh6MnaDTr02
	LBAf5AtFNIEQl8tdU0fQDD3/8NjpV/v5mo38F+M3hF6+D5BFSF0ZIIe7a16NqJ2AIKZZ1ppgEAfwX
	HQyiiHloyh9c2hMYgM/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7wWW-0007IR-0q; Wed, 11 Sep 2019 06:54:40 +0000
Received: from ns.omicron.at ([212.183.10.25])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7wWS-0007Hd-2I
 for linux-mtd@lists.infradead.org; Wed, 11 Sep 2019 06:54:37 +0000
Received: from MGW02-ATKLA.omicron.at ([172.25.62.35])
 by ns.omicron.at (8.15.2/8.15.2) with ESMTPS id x8B6sPhS018413
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <linux-mtd@lists.infradead.org>; Wed, 11 Sep 2019 08:54:26 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 ns.omicron.at x8B6sPhS018413
Received: from MGW02-ATKLA.omicron.at (localhost [127.0.0.1])
 by MGW02-ATKLA.omicron.at (Postfix) with ESMTP id D3072A005E
 for <linux-mtd@lists.infradead.org>; Wed, 11 Sep 2019 08:54:25 +0200 (CEST)
Received: from MGW01-ATKLA.omicron.at (unknown [172.25.62.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by MGW02-ATKLA.omicron.at (Postfix) with ESMTPS id CDA40A0068
 for <linux-mtd@lists.infradead.org>; Wed, 11 Sep 2019 08:54:25 +0200 (CEST)
Received: from EXC03-ATKLA.omicron.at ([172.22.100.188])
 by MGW01-ATKLA.omicron.at  with ESMTP id x8B6sP3d030596-x8B6sP3f030596
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=CAFAIL);
 Wed, 11 Sep 2019 08:54:25 +0200
Received: from buiwinne01.omicron.at (172.22.97.206) by EXC03-ATKLA.omicron.at
 (172.22.100.188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Wed, 11 Sep
 2019 08:54:24 +0200
From: Christoph Fink <christoph.fink@omicron-lab.com>
To: 
Subject: [PATCH] Fix reading support of the 1-4-4-DTR read-mode from the wrong
 bit of the SFDP table which is part of the linux-imx fork located in the
 following repo:
 https://source.codeaurora.org/external/imx/linux-imx/?h=imx_4.14.98_2.1.0
Date: Wed, 11 Sep 2019 08:54:03 +0200
Message-ID: <1568184843-11300-1-git-send-email-christoph.fink@omicron-lab.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [172.22.97.206]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_235436_279616_A200920A 
X-CRM114-Status: GOOD (  16.79  )
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Christoph Fink <fink.christoph@gmail.com>,
 Huang Shijie <shijie8@gmail.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Han Xu <han.xu@nxp.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Christoph Fink <fink.christoph@gmail.com>

Signed-off-by: Christoph Fink <fink.christoph@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 8cc4b04..7fd52fa 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2089,7 +2089,7 @@ static const struct sfdp_bfpt_read sfdp_bfpt_reads[] = {
 	/* Fast Read 1-4-4-DTR */
 	{
 		SNOR_HWCAPS_READ_1_4_4_DTR,
-		BFPT_DWORD(1), BIT(21),	/* Supported bit */
+		BFPT_DWORD(1), BIT(19),	/* Supported bit */
 		BFPT_DWORD(3), 0,	/* Settings */
 		SNOR_PROTO_1_4_4_DTR,
 	},
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
