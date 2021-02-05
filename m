Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05C4C433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 09:41:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 807B664FB2
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 09:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 807B664FB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GI3c/77Cwwp0xqFDQfMWfQrYosEhlOBJI9r3vJm1PHU=; b=qcAjvpkO9iXdymYCvvp2StZGEt
	tUn45RIxWckigAhlGLV3x0RrUvf/7cmRNJL04slQM91TMkyLQs/oNIIW2BwC16L/2Pq/DVsBs1Skp
	cysB7FZjTYHxBP/szvK+He2oqIHBGYIaM+IrKxlI1FAVNefSMWDzTQuXzU0r1SBwbgxB0TOlmFxqI
	qOQLHP5xTbndygRKROg0fMAPm2XuumCJK4MKqWZ2CLDGpMp0u/dfeff7oXzeJmrQ8F2SHdSFwV0sM
	g7RYapV5lr6S61PiBVT5NlrhPCDTQJZNhsXWpBRCfD/NPtNa7XzF5yDcnqUplMmcd+IcqRjpZikQr
	R2YR7NYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7xb4-0003It-J9; Fri, 05 Feb 2021 09:40:14 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7xax-0003Hj-Hl
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 09:40:08 +0000
Received: from localhost.localdomain ([172.17.195.94])
 by TWHMLLG3.macronix.com with ESMTP id 1159cf8E014367;
 Fri, 5 Feb 2021 17:38:41 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
From: zhengxunli <zhengxunli@mxic.com.tw>
To: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 miquel.raynal@bootlin.com, broonie@kernel.org, vigneshr@ti.com
Subject: [PATCH v2 0/2] Add octal DTR support for Macronix flash
Date: Fri,  5 Feb 2021 17:36:46 +0800
Message-Id: <1612517808-10010-1-git-send-email-zhengxunli@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG3.macronix.com 1159cf8E014367
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_044008_035276_D1D0D996 
X-CRM114-Status: UNSURE (   8.53  )
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
support for host driver.

Changes in v2:
- Define with a generic name to describe the maximum dummy cycles.

- Compare the ID directly in the loop, no longer copy and execute
  memcmp().

- Add spi_mem_dtr_supports_op() to support dtr operation.

zhengxunli (2):
  mtd: spi-nor: macronix: add support for Macronix octaflash
  spi: mxic: patch for octal DTR mode support

 drivers/mtd/spi-nor/macronix.c | 121 +++++++++++++++++++++++++++++++++++++++++
 drivers/spi/spi-mxic.c         |  41 ++++++++++----
 2 files changed, 151 insertions(+), 11 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
