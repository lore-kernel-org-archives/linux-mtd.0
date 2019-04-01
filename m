Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA04FC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 14:35:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880BA20856
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 14:35:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kbCs5RpK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 880BA20856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lyzIfUnc29I976Y8c7USpr4o/41Qb7qopOk0a6TT9NM=; b=kbCs5RpKOVcSUK
	Q5K9oL9EtXVMJOfdF8uaSCMvbxtDzYLKwanElvatS55wAQkMiOyIaD6BgL9epY5gwPPMEYykNMUeo
	60VJ6+GmlGPV+2OPZca592Ge1BTDZ0D3CjPQfYCHBv1OoZ0nCruGiB3oc3PaihecZ3q/Weu4ybue0
	qmcl6FPeQSEcJlOpmTNItGDvxoj+xLLQGJEVdcjaoECSXZ4/OISYVW4VvHawTTlNZSRg9RUfQoJpn
	rKKXDnoHL/qpoFXlO/rB1wIGkDzhOboaDTi2gOd2MV6dQS0Uf1ZV8IzOA9e99L6RvCsuYkGTtc+UV
	lBYO2KthLQvC/W5CElew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAy1v-0003Cs-7k; Mon, 01 Apr 2019 14:35:19 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAy1r-0003Bk-GC
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 14:35:17 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hAy1o-0001yT-0J; Mon, 01 Apr 2019 16:35:12 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hAy1n-0000lc-PP; Mon, 01 Apr 2019 16:35:11 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] mtd-utils: Add UBIFS offline signing support
Date: Mon,  1 Apr 2019 16:35:08 +0200
Message-Id: <20190401143511.309-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_073516_649688_C6E821CF 
X-CRM114-Status: GOOD (  11.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series adds offline signing support for mkfs.ubifs. This is the
userspace part for creating offline signed images. It needs the kernel
part just sent out as "ubifs: support offline signed images".

Comments welcome.

Sascha

Sascha Hauer (3):
  ubifs-media: Update to Linux-5.0
  ubifs-media: Add authentication support
  mkfs.ubifs: Add authentication support

 include/mtd/ubifs-media.h           |  68 ++++-
 ubifs-utils/Makemodule.am           |   3 +-
 ubifs-utils/mkfs.ubifs/lpt.c        |  12 +
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 169 +++++++++---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h |   1 +
 ubifs-utils/mkfs.ubifs/sign.c       | 405 ++++++++++++++++++++++++++++
 ubifs-utils/mkfs.ubifs/sign.h       |  80 ++++++
 ubifs-utils/mkfs.ubifs/ubifs.h      |  22 +-
 8 files changed, 716 insertions(+), 44 deletions(-)
 create mode 100644 ubifs-utils/mkfs.ubifs/sign.c
 create mode 100644 ubifs-utils/mkfs.ubifs/sign.h

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
