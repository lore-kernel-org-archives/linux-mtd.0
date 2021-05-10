Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFC6C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:20:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 498F66142D
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 498F66142D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LTbCOwk9X53+tcAvMZl6Y8J8wmxYuufO4k7JYq0hQmM=; b=XFRn2ZbicL63pXYXtp2N1id5y
	TtPfXG9CdNvKPFvO557BlHrmi1iUKte9UZJckbFAZnH8ZRcghEa08RlXJ6/YyQ49liWW6G1u/UqQk
	hgznSGF7AaXyCPiDMGBKaFfzj+xzUnsbXvrR0ytiR72OyUM3AAju15YiS5l++CcTHJt4vqnz094fh
	2KAzmHMXk4R/8Lob8NZRLBZ7GssJs+Nm0c8oFc13RMx+/6aTgJor6PhttHUGBSsJc25gI2aHPvv4+
	PZQRFP1dh+6EDShGbDetqBu10NRLNgeOJDQsqB2B/WJIL8KK2uJyostSH0c+t9xyQAMuy2DLUFnEs
	N8vwMzWCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg247-00Dk2Q-Bw; Mon, 10 May 2021 09:19:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1vV-00DiR0-Ag
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 09:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=dQuH5vu4CD5nycIwq/KQmkpe1s02xSlJ4RzHIkGJUWg=; b=oaLyPYesLsqHKArzry4NyMd71E
 Bs9WnholMgPlOyr4PRCJfnPqXbLvVgQ/uW1dMzTgMklOBiyasaVmqcLWhbLEVMh03HOVFVB6xFKDH
 X1j9gbKkT/k043L24mb6SljiBLcNt03/tTZlV24faTuyK0oKNDpYVS5jXrv74mUroOjnEgrnGgpQ/
 ldql4ruZOH7mYoXlB2FrpbWfZgeevWrpqOZkZgCGCjj1YDoxImiBZupDLWaTnisiBqblugcyUtkEa
 619JSbLygdne/hklgsSUT9fXBO6ZZ4kM3Gpd/ke5Gv9INBbvh/OPapbvGHFp5vSTNY0eywBT/WBOS
 OrOdDV5A==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1vP-008RXG-HG
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 09:10:05 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0D4A32001A;
 Mon, 10 May 2021 09:10:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yu Kuai <yukuai3@huawei.com>, joern@lazybastard.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 yi.zhang@huawei.com
Subject: Re: [PATCH V2] mtd: phram: Fix error return code in phram_setup()
Date: Mon, 10 May 2021 11:10:00 +0200
Message-Id: <20210510091000.4036-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210408133812.1209798-1-yukuai3@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'da1e6fe563e62801fa033255f68c0bb9bf8c2c69'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_021003_724080_CB1F9E27 
X-CRM114-Status: UNSURE (   6.20  )
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

On Thu, 2021-04-08 at 13:38:12 UTC, Yu Kuai wrote:
> Return a negative error code from the error handling case instead
> of 0, as done elsewhere in this function.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
