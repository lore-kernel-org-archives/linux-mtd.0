Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1E4C432BE
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:35:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7809661262
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7809661262
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xCD3AXGx49iIjNh6XehIpbly86Fgb42mz3G1QuzvF9E=; b=B24u4k8bAmlY8E
	pKffdApGBqVuuL0Oyny2xn2k/gyzBxC3CqSUwV72Keo2xQSBZHYYcvzwrAXEiO5z7WxZjGE6wTeDr
	d25DHpTCB1MLcXutY2qK9Q1+FZXzJ8CZ7ie+/KlWliL93a8FdC2hAKap1x57rTtU0wE02IL8rdcNU
	LD45yUHkF1o2P1kMDClAvkYogybPmPUJjKiYa9sz9umGtcQfelvxB6flBH0BBWzMTX/AFyPmPlRCL
	AzMIcbltFcVKZZ+nL8aolL3s+zE20j4BAVD4UMuSuBT6cGmYWliuRtV5zKF/ptwjMKeiXIgbrvTh9
	Kcpk8oGA9r77/k8v1Akw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI4Te-00FkOa-VW; Mon, 23 Aug 2021 07:34:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4Td-00FkOL-L5
 for linux-mtd@bombadil.infradead.org; Mon, 23 Aug 2021 07:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=/MixnaBiHW7rJVPf+nLbtDkY18TbIxAzAippTcEbAf8=; b=IQKVCMbSWZvs2Y/43u5VtZBsTp
 fbrkYrR1c6fC2sLoOG4uQtUhJqYaC0q34LZSp2VhBO2dFv/GkAEyDN1WoX5XhJdswPP22Pwqmugo+
 ytqBNUYG3z47iSieh6f3pJakiesTg4OnEiWqmBQ5c1W2SLURruk+TS2KgCwFfSdhM+b98VoAwKOaY
 lloNegVCUBPQ6fdvPYMr5bwXuhM9a19/fIK4bSNpoXG9U1zeaI4FDU3HCHIKr/MosWlZovl7E1gVv
 2dOaMSkyenRYahI1d0Eb3Xva4uuyg3iGnPOWCs66tXNxwol4Ap9dtwZ050oQZTw6YOZ+XJqGmicSC
 7HSfBzEQ==;
Received: from [2001:4bb8:193:fd10:c6e8:3c08:6f8b:cbf0] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4T2-009Qfk-HS; Mon, 23 Aug 2021 07:34:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-mtd@lists.infradead.org
Subject: mtd locking fix and cleanups
Date: Mon, 23 Aug 2021 09:33:51 +0200
Message-Id: <20210823073359.705281-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

Hi mtd maintainers,

the first series in this patch fixes a lock order reversal reported by
Guenter based on a recent commit, although from code inspection it should
have been around for much longer.

The rest is drive-by cleanups in the area that I noticed while trying to
understand the locking changes.  These are untested and need to be handled
with care!

Diffstat:
 ftl.c         |    2 -
 mtd_blkdevs.c |   60 ++++++----------------------------------------------------
 rfd_ftl.c     |    2 -
 3 files changed, 9 insertions(+), 55 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
