Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D1AC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:54:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FF8861972
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FF8861972
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4rejsFkoTAFLdNavKl5rRWYsJYjaev4gWUH2BZvr6jQ=; b=ooq9eI/olCLQ/ZBqCIEm1kAHF
	QzJEAD6vA5GuvYihE+XQafA3rOqUGOrrcCPcdKIWXTLSF/XvaLKyfz3AcgxT7qViQuWbmbyxysrha
	dD8yJHAnOlr8Nb4JrdV3HYnwwEL1D8KubOFj0Dz1Djbfv6/FNfTxvaPkaYO38a3iXSPbjjWrcHFS/
	+6BPQ/6PpQrZ/v7Y6gRP7SG+AK9ZRU6rlEWdHj1sw59FXBNISmgLKZRLv2ffBF9kY04Tjbs2kuAxI
	nmXbpLH2dwQ+kJi82FHxEj7qOWDSDK0suOfI/ShV10koS3JyUCkKyACSvIJY4RBAxLKZcgcvDslZy
	fHll+o5yw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3Y7-00E0oz-F1; Mon, 10 May 2021 10:54:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3O7-00Dyz8-BB
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=VeMpANmWWRnhL2Lgqd05qyXwusnYMX8DUaAVhQNSe2k=; b=mbWBHt+Rd1KYBD7ALj6nT5puG0
 dChkSlgHyTaMCR+sNq7JhV+N9kOLpz6QtTaBnq36tKoYrz1UPcwshNkHz1Lgz9jwEdFsZib7GQ3rs
 9JQWOmyVBvMdTVq8FteYz42LHHkNBVySD35wtzfL2Bq0lHMTMyOG2sHjl3Rf1cy+Cy5yVdR8JPo3b
 P8b6thbNH3BO3QVNj1rYwMNANZi/5cexYGwpdD9CniyppQHTZXz4hK7s5PUiNOFKcyoXjkuO7kmBJ
 VogCwgccof+KO63W6ZIz7pHYmmWYHkWpiaFwWwtR6NmEuARrcoEg/HKv7q6K/1bXbse/ET1wUddbU
 SKvfeYVg==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3O4-008YrM-Jf
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:43:45 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 40D6E240008;
 Mon, 10 May 2021 10:43:40 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Li <yang.lee@linux.alibaba.com>,
	miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, nathan@kernel.org,
 ndesaulniers@google.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] mtd: tests: Remove redundant assignment to err
Date: Mon, 10 May 2021 12:43:40 +0200
Message-Id: <20210510104340.10883-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1619604142-119891-1-git-send-email-yang.lee@linux.alibaba.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c9118b2b5dace4e6966b0d15c5990a0720cf2e3d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034344_798749_EE1105C0 
X-CRM114-Status: UNSURE (   8.77  )
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

On Wed, 2021-04-28 at 10:02:22 UTC, Yang Li wrote:
> Variable 'err' is set to 0 but this value is never read as it is
> overwritten with a new value later on, hence it is a redundant
> assignment and can be removed.
> 
> Cleans up the following clang-analyzer warning:
> 
> drivers/mtd/tests/torturetest.c:233:2: warning: Value stored to 'err' is
> never read [clang-analyzer-deadcode.DeadStores]
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
