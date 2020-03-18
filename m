Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FE5C5ACD6
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 07:44:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 396A120768
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 07:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nFyZkTcR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 396A120768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0gzklepIfQpUV9fDd2xNOkAcZcL7VlB+CXF6qY+/+6Y=; b=nFy
	ZkTcRQVjbtuXdxg9J7t20OmycDoPm3zt9Iuw2+pVQM+FKfwVusYep4EJdKzuRICwlNP95XcWY8E52
	5gBuvHNNSrsRowxzzq/Xg9PHqGk4HrN/trr5F9Suf2lsq31N95RRUSWioX+g/V5P4sPNMylY9/Gjd
	o+3ZnEhZPFuG4pQmF/z5ukddqs+xOX6fx/2Z7g2YIa71xMVSyN3I79lLh6Kju4rhj/a805Br9BaEp
	j6iVen+GNLR8QsR5V47i0LqsTQw3XI0WJAQGUwXb2pjLXzA8ZRVVd+QuHRr08GLdDTtEjP5KvshJF
	Hz34EDUQS4sHk3J48ZEvTm6PrRcAe9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jETMV-0005ct-In; Wed, 18 Mar 2020 07:43:35 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jETMP-0005bp-Oz
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 07:43:31 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id 02I7gTO9041137;
 Wed, 18 Mar 2020 15:42:29 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 bbrezillon@kernel.org
Subject: [PATCH v4 0/2] mtd: rawnand: Add support for manufacturer specific
 suspend/resume operation
Date: Wed, 18 Mar 2020 15:42:26 +0800
Message-Id: <1584517348-14486-1-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG4.macronix.com 02I7gTO9041137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_004330_086497_E1ABCA90 
X-CRM114-Status: UNSURE (   4.98  )
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
Cc: juliensu@mxic.com.tw, s.hauer@pengutronix.de, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, stefan@agner.ch, linux-mtd@lists.infradead.org,
 frieder.schrempf@kontron.de, tglx@linutronix.de,
 Mason Yang <masonccyang@mxic.com.tw>, allison@lohutok.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Changelog

v4:
Patch nand_suspend() return error code to the upper layer,
removed _ prefix of suspend/resme hooks and kbuildtest robot tag.

v3:
patch nand_lock_area/nand_unlock_area.
fixed kbuidtest robot warnings and reviewer's comments as below:
- Patched the Kdoc for both lock_area/unlock_area and _suspend/_resume
- Created a helper to read default protected value (after device power on)
  for protection function detection.
- patched the prefix for Macronix deep power down command, 0xB9
- Patched the description of mxic_nand_resume() and add a small sleeping 
  delay.
- Created a helper for deep power down device part number detection.

v2:
Patch nand_lock() & nand_unlock() for MTD->_lock/_unlock default call-back
function replacement. 
Patch nand_suspend() & nand_resume() with manufacturer specific operation.

v1:
Patch manufacturer post_init for MTD->_lock/_unlock & MTD->_suspend/_resume
replacement.

thanks for your time & review.
Mason

Mason Yang (2):
  mtd: rawnand: Add support for manufacturer specific suspend/resume
    operation
  mtd: rawnand: macronix: Add support for deep power down mode

 drivers/mtd/nand/raw/nand_base.c     | 17 +++++++--
 drivers/mtd/nand/raw/nand_macronix.c | 74 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h          |  4 ++
 3 files changed, 91 insertions(+), 4 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
