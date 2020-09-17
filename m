Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9BBC433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:49:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF6EE21973
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:49:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EivRWJOm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xAhE3C+c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF6EE21973
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JmKEFmhEelNQEnGomGhGv6R2A1NEPgvEv+vfcL9zpac=; b=EivRWJOmK5P9QcNsDngYFgV3Ec
	6q2DT28gbXy4uV4ZjZ35OGIdnfLP9IhGZoxJnSp1/AzBfz/4kZh6rou3c0RvfmdIgSWaYMNA48z2e
	iF/lnaLm/y+UizwyEknxyxe7bq3NrSeGAOCJAhMpcNXQQA+7RPmE8QqZzfq5pfDZxcenGQHthh2R5
	AYSPkOsurnO2SM6dw0vVMlSLcyqWfn2nfC4Qv+JBuq+EK87OPR2s81nQJRZyDvdmXLQUHUIM7SlYm
	d+BG1+smZ+Han9MYJmjyKkTq/gWDt5POHU7372RQ3pSt60a/DnCenKdtP6tDjaSRd4MPKD/2HSSVF
	IHU9N5Tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIoeX-0000Wj-F2; Thu, 17 Sep 2020 07:48:25 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoeU-0000VG-9R
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 07:48:23 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08H7mHqx109021;
 Thu, 17 Sep 2020 02:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600328897;
 bh=T4zQBPS1F2SXKrCt4rPxzEiQtYHMKcHNXfFU9SacdUY=;
 h=From:To:CC:Subject:Date;
 b=xAhE3C+cAQHtac4YoDsMwtQcNt8M0LKxmtd++no3kmyKBNCfsVUZ8OHvkv9sXz+N7
 bP5C2A91APcljU33gsoFqt5vD43d8/OLXUHvhmfVSPp0o5vkr56t0DgPL2uvsLFofU
 vex5WDtgW+ivAuwzpF+wBZt+FqnJ3BNlDknK+/J0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08H7mHGK106397;
 Thu, 17 Sep 2020 02:48:17 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Sep 2020 02:48:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Sep 2020 02:48:16 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08H7mEdr100359;
 Thu, 17 Sep 2020 02:48:14 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 0/4] mtd: hyperbus: hbmc-am654: Add DMA support
Date: Thu, 17 Sep 2020 13:17:45 +0530
Message-ID: <20200917074749.8957-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_034822_427252_E8B8B046 
X-CRM114-Status: UNSURE (   8.99  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series add DMA support for reading data from HyperBus memory
devices for TI's AM654/J721e SoCs

With DMA there is ~5x improvement in read througput.

Vignesh Raghavendra (4):
  mtd: hyperbus: Provide per device private pointer
  mtd: hyperbus: hbmc-am654: Fix direct mapping setup flash access
  mtd: hyperbus: hbmc-am654: Drop pm_runtime* calls from probe
  mtd: hyperbus: hbmc-am654: Add DMA support for reads

 drivers/mtd/hyperbus/hbmc-am654.c | 148 ++++++++++++++++++++++++++----
 include/linux/mtd/hyperbus.h      |   2 +
 2 files changed, 134 insertions(+), 16 deletions(-)

-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
