Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95567C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 21:09:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 811A764EBB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 21:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 811A764EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GvzsgBJ7tAS58o1HfElxcdOE1h1VksHvcwVtQoRAwGQ=; b=E3cZgRcAz6UkAkP8dROQNPFiA
	w1nhr4N2oQi2KEM2gu0dy3NLbBqIWZfXWWpBzhcx5EIxvKfDbq6ySkiL+TwIXaUKW0FCSfRTX84Wn
	upWwnPrHvJMnJS940dNi9OcPh3Tcjg2qBSrN1MefA4mXPTXr/KjYWIH7Q/0Oa1P0QSxQgjZsi9hus
	4qiKIXjMn+FP+7MVpB/QmDk8I4pJxcW/u9RkTgO8wD1FCIMNfIUoiS14a6LH4vE/vRdqL8uhK/ncx
	31wSDFL1GDJwhxghgPfGgTK3kkvnmRvP/e95zG5q/rFZXEB7NGzGfvY9VK7Ivc6kDqSOlkAh4acG1
	0lWfhDFpA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHYip-006Xj8-HS; Wed, 03 Mar 2021 21:07:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT7q-005JZR-Oq
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=WT9k6ObW59/Ec8UF50tCgptB8aX0smWBu78dQU8EwJM=; b=Vje6qHSuai2VDfGhTcOU1UbUXp
 IlHk3bXTEzA6NQBgupDhgZcXrorSljMe2rtUeadpER4OjafdXMbXKJ8LT94JX8rvv7hst/RewL0G6
 2C//rCo0zAPZgQTZ3saE6VdFLtu7lRQz/mjglt4uYyg9M8NeBBDWDoDDP4ow2G/uD66NDpQVXr2UM
 jGKWYW1YlQnoo5mFu4Llg14+X0CYaiWkktbc4PKnnnJClYSrdlic7Z1QldLXHHwoRmAx+AkZdN7Kg
 lAi3x9NM5DbRT0oPvmj/oOoRMZZNT6OVAy34C0oMo55FbBpLNGX4XanZo/dosbND6aS3iuliUdBpo
 W3g2u0yQ==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8bW-00HW9m-AF
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:14:50 +0000
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 72BCC200002;
 Tue,  2 Mar 2021 17:14:15 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dejin Zheng <zhengdejin5@gmail.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, nixiaoming@huawei.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mtd/next 7/8] mtd: nftlcore: Use module_mtd_blktrans to
 register driver
Date: Tue,  2 Mar 2021 18:14:15 +0100
Message-Id: <20210302171415.1349-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213164600.409061-8-zhengdejin5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: e476b2ef618addb25faac8e544ce97162ef24c30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_171450_927636_5C0D2F21 
X-CRM114-Status: UNSURE (   4.05  )
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

On Sat, 2021-02-13 at 16:45:59 UTC, Dejin Zheng wrote:
> Removing some boilerplate by using module_mtd_blktrans instead of calling
> register and unregister in the otherwise empty init/exit functions.
> 
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
