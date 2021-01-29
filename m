Return-Path: <SRS0=IJeB=HA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6D8C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 08:16:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0237964E02
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 08:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0237964E02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bTeL1Zye0CK2wMVHQ9/QYl2ITncgiIQ0BqcikggyicI=; b=KlBYU0zmoqVT22g6Ar9YId+k0a
	90bv/G4UuGLUMiU1uK2SNYbhfn2SJU8jQvuTqNPbFn9qPZV+3vjn496K1/SlaBP9J2UA8X0ULQQZo
	dNHURJ0uN83dqfcTe3mwZ+Nov8bDQqN0xrwm8greUcRyEzjozY5Q9DRWLvVn38V7U3DlIEk2V+QC8
	UoBWaS9g9NMobShK7tJwDAKes+FdLrjW6BujeaBS7URgtZIMxJNJjxgZcl9Dc92IzOk9h9hxXK6x+
	+yHavHgpOcGYUKsrEHUcznz/+wcFcx/xP4LF1j/N8AoB2zjNFOXrxHq3a7tWVARp7FkmDOu3yd1LU
	EwCazu7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5OwT-0002Bd-G0; Fri, 29 Jan 2021 08:15:45 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5OwP-000295-QM
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2021 08:15:43 +0000
Received: from localhost.localdomain ([172.17.195.94])
 by TWHMLLG4.macronix.com with ESMTP id 10T8FEbA076586;
 Fri, 29 Jan 2021 16:15:14 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
From: zhengxunli <zhengxunli@mxic.com.tw>
To: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Subject: [PATCH 0/3] Add octal DTR support for Macronix flash
Date: Fri, 29 Jan 2021 16:13:35 +0800
Message-Id: <1611908018-29937-1-git-send-email-zhengxunli@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG4.macronix.com 10T8FEbA076586
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_031542_308544_A0C83743 
X-CRM114-Status: UNSURE (   8.50  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 zhengxunli <zhengxunli@mxic.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

This series adds support for Octal DTR for Macronix flashes. The
first set of patches is add Macronix octaflash series octal dtr
mode support. The second set of patches add the Octal DTR mode
support for host driver. The last set of patches is add the
maximum speed limit of the host to prevent the device from not
working properly.

zhengxunli (3):
  mtd: spi-nor: macronix: add support for Macronix octaflash
  spi: mxic: patch for octal DTR mode support
  spi: mxic: add maximum speed of spi host

 Documentation/devicetree/bindings/spi/spi-mxic.txt |   4 +
 drivers/mtd/spi-nor/macronix.c                     | 122 +++++++++++++++++++++
 drivers/spi/spi-mxic.c                             |  40 +++++--
 3 files changed, 155 insertions(+), 11 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
