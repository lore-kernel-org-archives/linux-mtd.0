Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D7FC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:12:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7393864EE6
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7393864EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xq7fmO+MbW8IKsq8b3VMaZCDVJ8lOsAbcN6OgpViF0Y=; b=a2VY/TshcY8G6fCO3k2mt8EBO
	XZQj6Ldtg+YoX2BGR5yJRTRUkqWAP6r0EUfod5HdLwW1GNGJgNZBwHPIYvt9RRqEuTLlkBBb4GPub
	BedQRQN/zLI7A4V9O2YMl7RUhWRSwGkWtlWy0XgJA3VKdEoxrrEqUayMiE/gXBJ3fa6IvlXaCpVCQ
	kNY2Y7g0u1I8cJ6BrlH5TykgVY/E/juNf/fcvvZN51YGmRGw6tXZbpEb6zT6b/EHp1AzE882YM1/G
	ickQkQrKwkw1Yh6XAXe4/NjcjslNWrjg/EuM5kwr25tFggjkwSVNucSHR7tCrtHDlKOkhOkyW0cqp
	ekioE3viQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHVyH-005xrr-Ua; Wed, 03 Mar 2021 18:11:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSyt-005GXY-8j
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ahvgKHdsV6jJMtHtXAG23R5jhjxWP3daYzDqS+Wsq/E=; b=P3yrMl26VPh0Ju2NKwebV6aWky
 qsUTheqbKFy0XTadTsZsK2rr22xn+vXBHYsS6MC2TgirSbOaZ7ZTfzbyK7NV1rpp/0j46DmQtpMIy
 yGSZbOMmJVEkvKe8QoT3fjSAAZd+RouGLTaBcot9bU5z/9Fs3/Z3n+RikCY2VyMERCH45XfeYcGaC
 vjeDIFkP2L8Gkqrh4v4IprkCqb35Z/2A1ItBZytPqLJixbe028TBhUOZBX0e60E1yVQ82NZX1zjS6
 nMOfbofCkNeyVomzQdsFaYHf8HDbTZ6dpSPha9B1sBlZayAxWRnU3e/MBxWC55HqX2BNxhWL/I5eW
 9BT+lcFA==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8bG-00HW8f-Jm
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:14:30 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C646DFF802;
 Tue,  2 Mar 2021 17:14:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander A Sverdlin <alexander.sverdlin@nokia.com>,
 linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: char: Drop mtd_mutex usage from mtdchar_open()
Date: Tue,  2 Mar 2021 18:14:00 +0100
Message-Id: <20210302171400.1097-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210217211845.43364-1-alexander.sverdlin@nokia.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: f820b201e54508f701a99cf45beb3800ff6ef7b4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_171430_573959_43601A8C 
X-CRM114-Status: UNSURE (   7.03  )
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

On Wed, 2021-02-17 at 21:18:44 UTC, Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> It looks unnecessary in the function, remove it from the function
> having in mind to remove it completely.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
