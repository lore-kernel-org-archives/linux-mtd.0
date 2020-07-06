Return-Path: <SRS0=bVXU=AR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5303C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2020 09:26:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 823B42075B
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2020 09:26:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AF21F9HC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 823B42075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gowxo7WLSrJB8kNKLSKjG/OYzU8YHB34rmT7ECATOY8=; b=AF21F9HCPA7QFIrEmP1kExXtIM
	ItHXFSVA1BA3+TqXnt+4+iJaAfm6XbEJieT0IRYxAC5XAxB7dpJYaaOC26lU0rRs7qC0SzhGzo1lc
	rdn1X6kz3braMN1OXEwGt2LPtabQYXMG2i59j4k7KMZ9+Ua60SIPR450xrO5Qa4NVWx0Uduk4BBcG
	BPh+rC8iPVxXdUpyHFdC2NrY+/CQNilnYavq0orX5LvkKJgVyTF7oCiKw1TdtfN7oYqxTPp3foQHd
	vnfgs9N9IPPuMydNf0Z0WV0H49fGiuzECh4JTLTOigCY3RGHeWLM/zxBy5zWy0RbuQqC84rJyLekT
	Hx2ef28Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsNLW-0003OW-5V; Mon, 06 Jul 2020 09:23:30 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsNLS-0003NS-4s
 for linux-mtd@lists.infradead.org; Mon, 06 Jul 2020 09:23:27 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B8AE328F8FAD86ABA004;
 Mon,  6 Jul 2020 17:23:20 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Mon, 6 Jul 2020 17:23:10 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <tudor.ambarus@microchip.com>, <p.yadav@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 0/2] Add support to Disable the flash quad mode
Date: Mon, 6 Jul 2020 17:22:34 +0800
Message-ID: <1594027356-19088-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_052326_464547_983B3BE4 
X-CRM114-Status: UNSURE (   6.32  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com, richard@nod.at,
 john.garry@huawei.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 alexander.sverdlin@nokia.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Previously we didn't disable the flash's quad mode when it's removed
Then comes the problem that if we next time load the flash
in Standard/Dual SPI mode, the quad enable bits is not cleared,
and the function of flash's WP# and RESET#/HOLD# pin will not
be restored.

This series adds the capability to disable the flash's quad mode. And
restore the flash when it's removed in spi_nor_restore().

Change since v1:
- Address the comments by Tudor
- Reword the commit message in Patch 2/2. 

Yicong Yang (2):
  mtd: spi-nor: Add capability to disable flash quad mode
  mtd: spi-nor: Disable the flash quad mode in spi_nor_restore()

 drivers/mtd/spi-nor/core.c | 57 ++++++++++++++++++++++++++++++----------------
 drivers/mtd/spi-nor/core.h | 10 ++++----
 2 files changed, 43 insertions(+), 24 deletions(-)

-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
