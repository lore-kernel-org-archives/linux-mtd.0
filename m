Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D54EC4363D
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 12:26:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A59B206A5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 12:26:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3ZkL0ZSg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A59B206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HJzlBmFuVheUQioiNA2e7/Cks2/yx6MhVhWl6s8Me0A=; b=3ZkL0ZSg0alnJe8T4u/fsi3sB4
	hfS9HI2a3HQ3NtZqcbJiSGub4coHxTcgNFrfv2+Zi93UVtVkY4WQu4hoDInWFPgMKrycxYHxAYKmV
	xJ1fH9HCApcaON/3r7FdmAkjqXHylYTD5ViU3/JN1Jlo8+Vb1GYP1tS4qpbIGaLtx3CyGrHHGpLzw
	nzWTVcgEyxjtVRGL+8WKWVUx49l2NfO35vayzZihiE/weLocF1zzSywZ1Ix31PDEFwzIj7dPZ+OMq
	ESqILKzoIfYCSFhh9vpXPcgWNGPX7DrrxGQlpYBIWkvUGEq2ENSuHEPTwAJLT1ZyCUGD+NCfenbCj
	3PzZGzew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLQK9-0007Qy-5V; Thu, 24 Sep 2020 12:26:09 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLQK1-0007OX-2n
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 12:26:03 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3AED619671D9BAFB79F9;
 Thu, 24 Sep 2020 20:25:53 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 24 Sep 2020 20:25:45 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <john.garry@huawei.com>, <broonie@kernel.org>
Subject: [PATCH 0/4] Add IRQ mode support for hisi-sfc-v3xx driver and some
 cleanups
Date: Thu, 24 Sep 2020 20:24:26 +0800
Message-ID: <1600950270-52536-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_082601_391184_D6A75689 
X-CRM114-Status: UNSURE (   7.86  )
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
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 yangyicong@hisilicon.com, tudor.ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series mainly add the IRQ mode support for hisi-sfc-v3xx driver, and some
cleanups for the preparation of the IRQ mode.
After this patch, the device can work in IRQ mode, or if firmware doesn't
declare irq support it will fall back to Poll mode.

Patch 1-2 refactor the .exec_op() path to make it simpler and clearer.
Patch 3 factor the definition of the interrupt bits.
Patch 4 add the IRQ support of the driver.


Yicong Yang (4):
  spi: hisi-sfc-v3xx: factor out IO modes configuration
  spi: hisi-sfc-v3xx: factor out bus config and transfer functions
  spi: hisi-sfc-v3xx: factor out the bit definition of interrupt
    register
  spi: hisi-sfc-v3xx: add support for IRQ mode

 drivers/spi/spi-hisi-sfc-v3xx.c | 261 +++++++++++++++++++++++++++++-----------
 1 file changed, 190 insertions(+), 71 deletions(-)

-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
