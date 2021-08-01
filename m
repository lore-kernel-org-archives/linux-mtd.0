Return-Path: <SRS0=6coP=MY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4658DC4338F
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Aug 2021 23:46:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E71EF60560
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Aug 2021 23:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E71EF60560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tGFX1YNRuRymgWepWLGq26Z9NRwRSdCumMclHR8lXxU=; b=Lyilxfbl9E4bvT
	7BkfApFEwt6VBt2B8F2cBe3vuYQgiaGWWsYwrlCFNF/6GezHZ6qzmnR7X/tyRE6d2iGm3ht4ZrOAX
	2KDpX30aEZXeRWpCywCTPKyvAr+wUUWCzrIkzBQtmA2XcFWjUgcxyIpnRTRoMpp4ceGugyO19EOyK
	gl4shAyyt+bQ2YO5u16SlQ0SsKWdXLNE2EP9StRD3TrXzzbZzxzt02lzyiUcViSxQA6sVSzMwF8R+
	LC69j+mocbIz8MssPuSJF/ad4kJC+jLyQffsTdZhIH+VfHWexONNRISVlu6rtisnOPm7NP6Np3vtC
	cPImOEOYmTzlCFctZSrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAL94-00EOfF-Bs; Sun, 01 Aug 2021 23:45:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAL91-00EOeW-4V
 for linux-mtd@lists.infradead.org; Sun, 01 Aug 2021 23:45:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 917BD1F41069
From: Ezequiel Garcia <ezequiel@collabora.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 0/3] mtdblock: Advertise about UBI and UBI block
Date: Sun,  1 Aug 2021 20:45:02 -0300
Message-Id: <20210801234509.18774-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_164523_347950_5768DC52 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

Hi Richard, and everyone else:

Browsing the internet for "JFFS2 mtd" results in tutorials, articles
and github.gists0 that point to mtdblock.

In fact, even the MTD wiki mentions that JFFS2
needs mtdblock to mount a rootfs:

  http://www.linux-mtd.infradead.org/faq/jffs2.html

Moreover, I suspect there may be lots of users
that still believe mtdblock is somehow needed to
mount SquashFS.

I've taken a verbose route and added a pr_warn
warning if the devices are NAND. I don't think using
NAND without UBI is too wise, and given the amount
of outdated tutorials I believe some advertising
will help.

These patches are compile-tested only, as I don't
have devices ready to test, but I can undust some
boards and do some experiments if you think it's needed.

Oh, and PS: We also need to update the wiki.

Ezequiel Garcia (3):
  mtdblock: Update old JFFS2 mention in Kconfig
  mtdblock: Add comment about UBI block devices
  mtdblock: Warn if the added for a NAND device

 drivers/mtd/Kconfig       | 10 ++++++----
 drivers/mtd/mtdblock.c    |  4 ++++
 drivers/mtd/mtdblock_ro.c |  4 ++++
 3 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
