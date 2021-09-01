Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4393CC4320E
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 21:03:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 104606069E
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 21:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 104606069E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8dHO3yvz1ydLMfca0k8gitDtR8zlH9j03VnIt1jU02Y=; b=pbdhfDPjXIxm5w
	EFTVUfy0GIxZb8cPkymYHz6to0i0zY0EdXfxMA/NJxH+6xaLxz7E9Up1sw1NtmFFoQIj6HvOiMPDM
	CyKZgAdEvVEqitSWpGVgZr9w66/pw9MOAjNdX4Tj77d+mZfTs3+YLMked0FaBTHny/XKLMQ3H3ymD
	lCly1RhncHnjooM3F7NWUfXAMItmpRMIBiXZcmQuPmJ7hDy/wzYDJb4oKQz8GGXAWmGqTfa12DjD/
	6cZCgMLPISSEENDqRtUUU/OSvHkuyYsG3qMV/J/AXrOfifJuumnU+a3mvbeiCkrP4Ypqop15I8aIF
	CNprY4Yb+5RLBljkBObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLXNi-007MSO-EE; Wed, 01 Sep 2021 21:02:50 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mLXLR-007LW1-53; Wed, 01 Sep 2021 21:00:29 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, bhelgaas@google.com, liushixin2@huawei.com,
 thunder.leizhen@huawei.com, lee.jones@linaro.org, geoff@infradead.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 jim@jtan.com, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 josh.h.morris@us.ibm.com, pjk1939@linux.ibm.com, tim@cyberelk.net,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 00/10] block: fourth batch of add_disk() error handling
 conversions 
Date: Wed,  1 Sep 2021 14:00:18 -0700
Message-Id: <20210901210028.1750956-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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

The full set of changes can be found on my branch titled
20210901-for-axboe-add-disk-error-handling [0] which is
now based on axboe/master.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20210901-for-axboe-add-disk-error-handling

Luis Chamberlain (10):
  mtip32xx: add error handling support for add_disk()
  pktcdvd: add error handling support for add_disk()
  ps3disk: add error handling support for add_disk()
  ps3vram: add error handling support for add_disk()
  rnbd: add error handling support for add_disk()
  block/rsxx: add error handling support for add_disk()
  block/sunvdc: add error handling support for add_disk()
  block/sx8: add error handling support for add_disk()
  pf: add error handling support for add_disk()
  mtd/ubi/block: add error handling support for add_disk()

 drivers/block/mtip32xx/mtip32xx.c |  4 +++-
 drivers/block/paride/pf.c         |  4 +++-
 drivers/block/pktcdvd.c           |  4 +++-
 drivers/block/ps3disk.c           |  8 ++++++--
 drivers/block/ps3vram.c           |  7 ++++++-
 drivers/block/rnbd/rnbd-clt.c     | 13 +++++++++----
 drivers/block/rsxx/core.c         |  4 +++-
 drivers/block/rsxx/dev.c          | 12 +++++++++---
 drivers/block/sunvdc.c            | 14 +++++++++++---
 drivers/block/sx8.c               | 13 +++++++++----
 drivers/mtd/ubi/block.c           |  8 +++++++-
 11 files changed, 69 insertions(+), 22 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
