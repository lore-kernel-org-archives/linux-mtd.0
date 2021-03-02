Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24F7C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:40:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC3FE64EDF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC3FE64EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HIcNQ1fU/giMu/NQDWMZIUji68p4I1J2yO3gxfXYr0s=; b=RkMn1NX7Nwm0jXX363O68hcKl
	LQh5XbZEJJ8133MiOs64IYMYzAHTc4yzIyrzMCTbfx1vRbB/E/8BHPGYFuZ5NkWyQWyJhROxfWB2L
	e9Y1a/daaGvzkIolBZ7zcNBtBGJT0dMTdQzjg2WSJNuAj/ELUTeEPChPrrC7hH3cWjRJrOR50ppkD
	ZVRz1g8IKzRt2zujx3XoDkrCFiI/zRoe9VXwQadRGL9Im/nBXWBM287HnlrrxUfQb26mz6vyB297T
	dlBExb3CynCbYPazYLSkm+/66N9THbj0Ma6TRG2N7wLPdq5k7S1JR3C5w48hIN0ooISp159Dlxztn
	Blp3eqSWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHXLg-006Fw4-3e; Wed, 03 Mar 2021 19:39:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT3e-005I9X-Mi
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=KYTUWKidAlpJnE/vNPaGabfrwJXdjMe2nSbdcXJ8F4I=; b=ndwqT6fQlVCCzxjwXn/my9fqxQ
 VLUL+tLJ+mDiiGErd+7/tjGNrX+CJyrwNUL65XTfLCFmtXKCAIsQ29TdfKG4zu/qFNOz9XGm/fBo3
 EQtHNLkfG2l1UqYUzTyF1jxv2keTEdCHiFLsnspI72kdEMoljIAGibWYfuov2aBnn0lLpXIw0gIwi
 nykDQTf36P5L2BfmIrdSYQ9cBSZjK3fzCMXuWpF9/4lVgdLoNU472YflZ6U67wSrz73zoIeId+O1f
 ah/TvkXNSxu1sx62/YVAaUDETRB3F5iI5004CUtqz6E5lkzGDnTx5xvnUKo0kdstBBbsvxpdkfV+i
 VXaeQrfA==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7ww-00HSBy-Vx
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:32:44 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id AFD691BF209;
 Tue,  2 Mar 2021 16:32:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>, miquel.raynal@bootlin.com,
 mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org
Subject: Re: [PATCH 4/5] mtd: rawnand: qcom: Add helper to configure location
 register
Date: Tue,  2 Mar 2021 17:32:20 +0100
Message-Id: <20210302163220.23133-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1614109141-7531-4-git-send-email-mdalam@codeaurora.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: f41e2468e9020cc79fae3e6ccae44fd9c515dcb9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163244_939277_F8741F1F 
X-CRM114-Status: UNSURE (   7.23  )
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

On Tue, 2021-02-23 at 19:39:00 UTC, Md Sadre Alam wrote:
> Create a nandc_set_read_loc() helper to abstract the
> configuration of the location register.
> 
> QPIC v2 onwards features a separate location register
> for the last codeword, so introducing this extra helper
> which will simplify the addition of QPIC v2 support.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
