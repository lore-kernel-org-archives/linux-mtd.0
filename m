Return-Path: <SRS0=aQsM=4U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FAEC3F2CD
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 07:22:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2403520726
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 07:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gE2OiodB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2403520726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=LpvWc0HObiv3LMBGfAajvlGWsVKTu0zVs5AzGqhh/jM=; b=gE2
	OiodBO3Y33a6qhrwcxGbiOL5Q2vOxVLlxKTC+XC8HFhEkruLxAM+XmAgLLtBx2ohs0UVL+1PV5Hdq
	Ff06gtA2NY2qzV9SrkHmDKIuGysmRq93NygPrPmydiABVGLBhyP1aS6PXRA+2/4EFRUTTIWnne/V3
	8ZWMvGojccd7FuJVuJotelPq8cwhvlr3wZ59iHtlXzDZfroEJtHEqK4V4DEvhvr2z5+StrYa6LKUX
	sbgRk0UgqlIsrxHxvJ2OeAe73qgKRLLcdTRa0UXnOc2LVmRvddQ/IFIEYxoxHNDF2QOeQYLbowB3E
	NqOoOP9KHXHVfanvc7xsX5rHzgqZILQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j91sz-0008E0-RS; Tue, 03 Mar 2020 07:22:37 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j91sw-0008BJ-SY
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2020 07:22:36 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id 0237LRL9023026;
 Tue, 3 Mar 2020 15:21:27 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH v3 0/4] mtd: rawnand: Add support Macronix Block Portection &
 Deep Power Down mode 
Date: Tue,  3 Mar 2020 15:21:20 +0800
Message-Id: <1583220084-10890-1-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG3.macronix.com 0237LRL9023026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_232235_355251_1428FFBB 
X-CRM114-Status: UNSURE (   4.91  )
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
Cc: bbrezillon@kernel.org, juliensu@mxic.com.tw, s.hauer@pengutronix.de,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org, stefan@agner.ch,
 rfontana@redhat.com, linux-mtd@lists.infradead.org,
 frieder.schrempf@kontron.de, tglx@linutronix.de,
 Mason Yang <masonccyang@mxic.com.tw>, allison@lohutok.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Changelog

v3:
patch nand_lock_area/nand_unlock_area.
fixed kbuidtest robot warnings and reviewer's comments.

v2:
Patch nand_lock() & nand_unlock() for MTD->_lock/_unlock default call-back
function replacement. 
Patch nand_suspend() & nand_resume() with manufacturer specific operation.

v1:
Patch manufacturer post_init for MTD->_lock/_unlock & MTD->_suspend/_resume
replacement.

thanks for your time & review.
Mason


Mason Yang (4):
  mtd: rawnand: Add support manufacturer specific lock/unlock operation
  mtd: rawnand: Add support Macronix Block Protection function
  mtd: rawnand: Add support manufacturer specific suspend/resume
    operation
  mtd: rawnand: Add support Macronix deep power down mode

 drivers/mtd/nand/raw/nand_base.c     |  47 +++++++++--
 drivers/mtd/nand/raw/nand_macronix.c | 146 +++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h          |   9 +++
 3 files changed, 197 insertions(+), 5 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
