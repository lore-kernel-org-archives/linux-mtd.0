Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D90C4346E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 08:13:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 561FA212CC
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 08:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VyBVPaWn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="L3xPH5/q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 561FA212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aD+no3lPe5e70x4ChrUBj81aaQQ9yssvjS7xQJ6tzFo=; b=VyBVPaWnEbr8r/qOC1Kl0bWKoC
	5XGMFf6tCpi7/WlP0HQ+2UesxYK/ppjI1dkabQbowKCEfb7hx1Kvjjn8d0RnAIIpdxtFQS4NvcLU/
	wnqEWwX6a/+itRM1imxOQEPWOww7UT4LBSH+sdSCwZdEVxt/490TKOXgXACz6P10qJAmy1F80y47g
	m8myt07AimdVRPhIwD5PfVLnu2tFPkg8yphXDJwb2YPFhfQj8tVFjQLMZNr4JN/9utKYOrVcvnteD
	qM4ZHWmJ38nU++xjiCUhUWpb7d/RgZurgit/W2IQmPK4lFdJhCzOio/4eOAqZZpiwRadUvRFo3LYY
	wDNeTF8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLMMb-00015H-HJ; Thu, 24 Sep 2020 08:12:25 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLMMY-00014a-Qd
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 08:12:23 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08O8CIxW072402;
 Thu, 24 Sep 2020 03:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600935138;
 bh=xwH13LSwykyhSdyda27TbW05It0IDeIuKgx2/iPSsnU=;
 h=From:To:CC:Subject:Date;
 b=L3xPH5/qyQOf/iQ1HWeKCoaovvtdRpXA+eW8cK/VrK335wn3ZQgsQTpz7rN4ZLk1P
 R46oNsnkBfYtDyQHZGpjdC0/XtWZyCFXKaO6Jz3qZ3izkuHRfpsoh1uN5ME6JktBe6
 SaBypAhrQJKzijQ1Iy0wZSAw3T8qiIcOi/7mmo1E=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08O8CIAh089362
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 03:12:18 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 24
 Sep 2020 03:12:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 24 Sep 2020 03:12:18 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08O8CFFH002000;
 Thu, 24 Sep 2020 03:12:16 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2 0/4] mtd: hyperbus: hbmc-am654: Add DMA support
Date: Thu, 24 Sep 2020 13:42:10 +0530
Message-ID: <20200924081214.16934-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_041223_034444_966F0612 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series add DMA support for reading data from HyperBus memory
devices for TI's AM654/J721e SoCs

With DMA there is ~5x improvement in read througput.

v2:
Fix DMAengine APIs usage issues pointed out by Peter.

Vignesh Raghavendra (4):
  mtd: hyperbus: Provide per device private pointer
  mtd: hyperbus: hbmc-am654: Fix direct mapping setup flash access
  mtd: hyperbus: hbmc-am654: Drop pm_runtime* calls from probe
  mtd: hyperbus: hbmc-am654: Add DMA support for reads

 drivers/mtd/hyperbus/hbmc-am654.c | 144 ++++++++++++++++++++++++++----
 include/linux/mtd/hyperbus.h      |   2 +
 2 files changed, 130 insertions(+), 16 deletions(-)

-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
