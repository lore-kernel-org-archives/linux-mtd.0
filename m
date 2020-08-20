Return-Path: <SRS0=ooLN=B6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A981C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2020 16:54:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 691DA2072D
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2020 16:54:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BQQwYvvI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 691DA2072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nktv8WO9P//4C4xb2Klt3jxS2yI2svU92RW4trcGLXs=; b=BQQwYvvIDIrFbfXTV9YPqC2mPs
	KnOGPdIqn166YdvYQa6OwCC4qDFyo3AlW3ScEp5dPxR5BglQmpSb6yVylOtdy2mBUDf5UlM9mK3uX
	L8ZgiueWcyI0y+6rS5PlYHgdtFgl8Vld3OvhuBlm0qkYQSqVkE5oey3aKx6U3GSgMshp+Gg7KQaEQ
	mnk63wqVqu/qOfDSxQkEJfjT/pms3qDCxyEWmQo49dulrY4mBGhZrgB8u7U0oMNRK3fCs3S2ZcIBv
	Zdr0KK5z59+J7rJ0Tu0XdgjqHFlQxqy2OI7ohHzS6mbi65akFnyZ6qOdf8xRVcQ+YN01Ojt3wFwX2
	JtvSyYMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8nof-0002ek-20; Thu, 20 Aug 2020 16:53:29 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050::465:101])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8noZ-0002cU-MK
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2020 16:53:25 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4BXW1X1L8GzKmgn;
 Thu, 20 Aug 2020 18:53:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id wvaWO5_FEjyQ; Thu, 20 Aug 2020 18:53:17 +0200 (CEST)
From: Hauke Mehrtens <hauke@hauke-m.de>
To: miquel.raynal@bootlin.com,
	richard@nod.at
Subject: [PATCH v2 0/3] mtd: spinand: gigadevice: quadIO fixes and add
 GD5F4GQ4xC
Date: Thu, 20 Aug 2020 18:51:18 +0200
Message-Id: <20200820165121.3192-1-hauke@hauke-m.de>
MIME-Version: 1.0
X-MBO-SPAM-Probability: **
X-Rspamd-Score: 2.52 / 15.00 / 15.00
X-Rspamd-Queue-Id: 1CF71389
X-Rspamd-UID: a1223f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_125323_841219_C9F3582E 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: linux-mtd@lists.infradead.org, gch981213@gmail.com, vigneshr@ti.com,
 wigyori@uid0.hu, Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series fixes some problems I found in the code when adding support 
for GD5F4GQ4xC and in the end it adds support for GD5F4GQ4xC.

Quad IO did not work for me even with all these changes, single IO works 
fine. I assume that quadIO is broken in the SPI controller driver of the 
Imagination Technologies pistachio chip found on the Creator Ci40
(Marduk).

Hauke Mehrtens (3):
  mtd: spinand: gigadevice: Only one dummy byte in QUADIO
  mtd: spinand: gigadevice: Add QE Bit
  mtd: spinand: gigadevice: Add support for GD5F4GQ4xC

 drivers/mtd/nand/spi/gigadevice.c | 63 +++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 7 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
