Return-Path: <SRS0=H+qW=CU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBC0C43461
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 16:56:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E6262074B
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 16:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2uUGMqhe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E6262074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KHMBQEEEx9ScpxTPQ3psrUuj+hEW9Lqg/Q9eTh5oQMo=; b=2uUGMqhebFtOU0hJWdUbJTPNH
	J/VUpkDX2zPo6ZVrbkxYdyzkyzMp5g8YoF43OQsCjv32Nh3T91PLb+JTrWBOLGnMC66Fl1SdPtQqu
	IzNyU/mCjOnuHUZki4MYLeuZZBjsYeKb+8kqWbCrex+fq0ME2t2Edyi+gxitPkr/cTtE03g6cOVm9
	VDSt9Ru+yGT8kO2UwFGhxxFzxossKECjrzEmwO1tf9le2uGiExU7ysxTIpyo5rbGIgLakYc01Tnih
	SyG2PoIORahtEZwhGtszb6WcZqnvY8IiAIel2fur17LYW6M/UuqmuvEvfDaSpxrR3Pa2qwPFkXvjT
	BrYx4UYQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGmKl-0003h4-H6; Fri, 11 Sep 2020 16:55:35 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGmKi-0003gG-UI
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2020 16:55:34 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D249D1BF206;
 Fri, 11 Sep 2020 16:55:28 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alex Dewar <alex.dewar90@gmail.com>
Subject: Re: [PATCH] mtd: onenand: omap2: Allow for compile-testing on !ARM
Date: Fri, 11 Sep 2020 18:55:27 +0200
Message-Id: <20200911165527.28516-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200904170954.18321-1-alex.dewar90@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 26e1a8efc63d5d7a823f2c99e0892a542742ced6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_125533_084086_69027E51 
X-CRM114-Status: UNSURE (   7.50  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-04 at 17:09:55 UTC, Alex Dewar wrote:
> There seems no particular reason for building on ARM only, so remove the
> restriction to increase test coverage.
> 
> Build-tested on x86 with allyesconfig.
> 
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
