Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A3EC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 12:47:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF1E207B0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 12:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BF1E207B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIQXS1gtpwod/oZwcpwr9Si8SfaLS94mm13qIicaCH4=; b=OAjHNUkSU29QiOFf621N09ineB
	fVwZE+3EgXXsEi0YKWiYFxez4kX0aTNdnQ5N2NyTFTtwN6qjCZjCAkyMjtCLWh3iQyudZxtbzcD7g
	frNAuUZOMLwz8vhf/YMCwory43opEbUaJrOTnaO7ulQpUnsB30TX/n1fq1CJ5Z4HQ2klp6DrjKwsD
	qZIhu2TEtFQPyUaPGD2h/1m6Kz5zn1hx/LwxIHJBbecqrx3eHBRJZKoyOmmXbhj19J68iSjA2HSBj
	WnHezwTqdQyYk+/TkCMeymKhNtXDQz2lUAkYxoGmy3SOEjylDRxtOQuFK5cJv+EKBwk7iSXudjt6v
	oCHQ72Pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4kDb-0001lU-LN; Wed, 27 Jan 2021 12:46:43 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4kDZ-0001kl-2T
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 12:46:42 +0000
X-Originating-IP: 86.210.203.150
Received: from localhost.localdomain
 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr [86.210.203.150])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4D0DEE0003;
 Wed, 27 Jan 2021 12:46:35 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: yangerkun <yangerkun@huawei.com>, zhongguohua1@huawei.com,
 joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
 patrick@baymotion.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH V2] mtd: phram: use div_u64_rem to stop overwrite len in
 phram_setup
Date: Wed, 27 Jan 2021 13:46:34 +0100
Message-Id: <20210127124634.13583-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210125124936.651812-1-yangerkun@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: dc2b3e5cbc8087224fcd8698b0dc56131e0bf37d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_074641_265945_19772255 
X-CRM114-Status: UNSURE (   8.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2021-01-25 at 12:49:36 UTC, yangerkun wrote:
> We now support user to set erase page size, and use do_div between len
> and erase size to determine the reasonableness for the erase size.
> However, do_div is a macro and will overwrite the value of len. Which
> results a mtd device with unexcepted size. Fix it by use div_u64_rem.
> 
> Fixes: ffad560394de ("mtd: phram: Allow the user to set the erase page size.")
> Signed-off-by: yangerkun <yangerkun@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
