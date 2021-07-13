Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F14EC07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 09:45:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C4A66101D
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 09:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C4A66101D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X8HDVLaOrCSq5TEU80p8UNAi963ZmzcIIyrwzShpNGA=; b=RAMGefwS4sC2e3
	I290ROv6nOJcAtlln0E/uawnl5O4+F1pLFyk3EgpPljrwZGe4WKGy/aAp1yoDPFwECoNmzUJIITPu
	5G5ZCWWJFsOZw6Q+c/ZbuCMGwoEEORVUR9Ri/oKACS/01oNBkWLJaAYaql9e2tb16/STfVHO3qb/3
	zADLEbkfCX9+F3lTUKW1hrw4G09h3WYnF8ZpXbzXaYkEASrRjarwsW15luuVFk0e1fFIkCUoFrDP4
	4V8fKdSI2z+8KithUCvrw6SbZV3J553NhZNi/kwU0M+v4t9ve4mhBPb6MGZyXdjoaFdLf1hpAILpK
	LWAnamU7vL1bV/d1kVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ExX-009h42-87; Tue, 13 Jul 2021 09:44:11 +0000
Received: from gofer.mess.org ([88.97.38.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ExQ-009h1n-VS
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 09:44:06 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 69276C6373; Tue, 13 Jul 2021 10:44:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1626169443; bh=z8et4RRzcNz4ArBhGZzo3ny0xLdG4Rxkq99nSg7rIi4=;
 h=From:To:Subject:Date:From;
 b=sg8m/upneJTgI7Ya9kyW1l5dF45WNZqK8i0RiPmCKopaHeHg0JV2cD4cG/xN5N0PC
 xHw9yTdS4tA66sB12hVMUFfOgn284S2cdmFtrq5vwJkzBXDkFUNW29dlw5wCxMdsB/
 egRLw/0/weV7WUCTYdB8wdYYySBmIZYsEd65jcylEMTuF8sEJWN4pO7V9QDKsh1cyY
 4bwgR5HUF8C1Th++gdCXNHZnyjvWcBdAZp79d4ioqk0Et3I24pd74D3OoyO4uUnizX
 LM4szY0FBEK/Vect2mK4/siUJsQvSjIbj7lqndtTvbvieI6CPbwzUFQ5/uMbtb9gwv
 eqxd5MkdEWW7A==
From: Sean Young <sean@mess.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/4] Fix various issues with RFD and FTLs
Date: Tue, 13 Jul 2021 10:43:59 +0100
Message-Id: <cover.1626169090.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_024405_218415_37F3770C 
X-CRM114-Status: UNSURE (   6.24  )
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

Sean Young (4):
  mtd: rfd_ftl: allow use of MTD_RAM for testing purposes
  mtd: rfd_ftl: add discard support
  mtd: blk_devs: make discard work on FTLs
  mtd: rfd_ftl: fix use-after-free

 drivers/mtd/mtd_blkdevs.c |  1 +
 drivers/mtd/rfd_ftl.c     | 44 ++++++++++++++++++++++++++++++++-------
 2 files changed, 38 insertions(+), 7 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
