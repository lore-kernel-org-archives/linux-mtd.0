Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF542C07E94
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 10:21:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEAB1613E9
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 10:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEAB1613E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=to1irc5ZL7fLb99YVKV31R5sD62RRgvKRBH9pzvbxXo=; b=rUhWbJrZuG90Xa
	EIaqX83d7iZ4reTW8CEUGuSP6IYwvdISvlZORACxbxRtag048tR5T6GHxF4FoTBk+xNm1uqDKRs5I
	HqJKGu054TMZBcJaGo4TZ0LblYOj5UMXfU/bBF7U/k0b72rq4cW2wgzTi3BSZkMypipFe72fbqjWT
	m2sW9jdt7ypmrmxSJvxgI3emN9vL2V5Cvoj7pI1k2wGrqvv92exgTrdywPZ5V5HSf+GKwcUYBTfl1
	lS0EVyB8kOjA22nt5FjThOwiaPp+LXUMEAOSuL39ABNp8e71G8So3d3P1iS2lmxNqG5rP41SLDmTi
	1jaFl/lhLfZAM7rLwAwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp6vz-00CvJq-Gx; Fri, 04 Jun 2021 10:20:11 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6fW-00Cn0z-Fd
 for linux-mtd@lists.infradead.org; Fri, 04 Jun 2021 10:03:18 +0000
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 801D422236;
 Fri,  4 Jun 2021 12:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1622800982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+grMGDMGZ79scJrCW3uqGV/ZG1Sr0b0POF0whRXi/0E=;
 b=YkoS4E3hcQgBAn5a/mktyvGPADJSTSVchzxyJZfh8bNNDFAQ7T/VMxKYUceA2/AljLeNhx
 7X5aHyiStXx/lIgWfUU101l6er09rYp3sGiqgKDgrnuol9J6/cHABiBRPQiGV2aH2FjdWV
 w5oGNR0GQDxjCx9hpRyGsgn2dP3F3Uw=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v5 0/5] mtd: spi-nor: otp: 4 byte mode fix and erase support
Date: Fri,  4 Jun 2021 12:02:47 +0200
Message-Id: <20210604100252.9975-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_030310_724589_2718E0BC 
X-CRM114-Status: GOOD (  12.42  )
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

This series is the follow up on the single patch
mtd: spi-nor: implement OTP erase for Winbond and similar flashes

Pratyush Yadav discovered a likely problem with bigger flashes, the address
to access the security registers is either 3 or 4 byte (at least for
winbond flashes).

Changes since v4:
 - add new patch to get rid taking the spi lock if length is zero. Please
   note, that I didn't squash this into the "Fixes:" patch because it is
   unrelated to the actual bug.
 - add comment which explains that we could also branch on an error in
   spi_nor_mtd_otp_range_is_locked()
 - check zero length in spi_nor_mtd_otp_erase() and return early before
   taking the lock

Changes since v3:
 - new patch to check for read-only OTP regions before writing
 - clarify term "security register"
 - don't combine lock and erase functions anymore. there are now
   more difference than similarities.

Changes since v2:
 - fix 3/4 byte mode access
 - use spi_nor_erase_sector() by swapping the nor->erase_opcode
 - use more consistent wording regarding the security registers

Changes since v1:
- fixed kernel doc


Michael Walle (5):
  mtd: spi-nor: otp: fix access to security registers in 4 byte mode
  mtd: spi-nor: otp: use more consistent wording
  mtd: spi-nor: otp: return -EROFS if region is read-only
  mtd: spi-nor: otp: simplify length check
  mtd: spi-nor: otp: implement erase for Winbond and similar flashes

 drivers/mtd/spi-nor/core.c    |   2 +-
 drivers/mtd/spi-nor/core.h    |   4 +
 drivers/mtd/spi-nor/otp.c     | 156 +++++++++++++++++++++++++++++++---
 drivers/mtd/spi-nor/winbond.c |   1 +
 4 files changed, 149 insertions(+), 14 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
