Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B3EC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:14:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98E0364E68
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98E0364E68
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U+hSmd7jgG8lf8bwNiwJ66TgBbovl8F1c973xsjrUAA=; b=POr8+XkFKe6q+lwoYpKDRvYYJ
	fD+BLOfy47Y4yd3nkTZW0btRLSQtglS1tLW7KRljbkaNuJTL9cJL+0a93iA7F1PeMDqdGjN4u5DUa
	pZwdyhl1jSNd/HCv5b4YykxSni7/8WXCWuFZbqqp6OMJswslh3Js4ZLoXSWlczrMBf2WWY0ps+u0B
	Owq3TExGLAeXC7KT+p0NBCmjiJR4gF2B9hP0m7RmnAu1UTYVNl8wZ8MtJWYBSU8GtqQfBuwsI6Lo5
	apxRtZEWKxJWqGHxR4m7VYEoJBVbrqTmUQGZ5UfSif/LYDsilSszovsvd9oYPD9tOiZjhAKx3fOJt
	PFiZnNkEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHSG8-0055SP-Mb; Wed, 03 Mar 2021 14:13:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS5u-0052Nh-HI
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=WXc40q7Up7v3FTUjryuGUIXlVNxArGUYw9DdMCSWenw=; b=lLaee0vYEK88+JwTtMKXGCV35m
 z7X9Gqfh8Vz3rtBF84xSe/dWGWtFfEvLIxGnlEUlg4rLGXvbs7uoX1KnCtkKxOQ4/atCXTJJ6j0Q1
 guDJj7vzNunIL2HJVAbX5FRamEFJMuzdeKisXtTndK2hIiJSNzAixvsI8lT3hrcIoK9YoChv+xs45
 5bNMwebpoU6Rmt9frCtoxMrTye4U1VISzPquhhF2IwChPUmNiJtgFbWGTGyNdAyLALm14j+qoxDkH
 kXKUHQs5aPD0VxseBCxdgXmDyHjQ93NUAErtVfz7uDcH6KQoML7cwP05E3nrH+e03GnAbv7h9gvow
 tLbdS2yw==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8bp-00HWD1-Ba
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:15:10 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DC66CE0003;
 Tue,  2 Mar 2021 17:14:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dejin Zheng <zhengdejin5@gmail.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, nixiaoming@huawei.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mtd/next 3/8] mtd: inftlcore: Use module_mtd_blktrans to
 register driver
Date: Tue,  2 Mar 2021 18:14:34 +0100
Message-Id: <20210302171434.1636-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213164600.409061-4-zhengdejin5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 98f431c2cee793bd8a5952f4842c181e80e3547d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_171510_079520_A95CB58D 
X-CRM114-Status: UNSURE (   4.36  )
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

On Sat, 2021-02-13 at 16:45:55 UTC, Dejin Zheng wrote:
> Removing some boilerplate by using module_mtd_blktrans instead of calling
> register and unregister in the otherwise empty init/exit functions.
> 
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
