Return-Path: <SRS0=7qHi=45=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B492C10DCE
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2020 21:33:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A2A720724
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2020 21:33:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lqbmo135"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A2A720724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wvtn/3JnHUCnYdvEDUJ/ObNlqApegncVwqAQAd6Z8e0=; b=Lqbmo1354jxfCl
	H6XFd/RCHfAUfxdp4/VPzw8weiOvy9A57lOTI2upD4WMnVnvbjMOixzx3OHseV4W8I2QA6ZZaWtKm
	YWFMuF3te3JSWlrNUL+iQuZ5AV0q8k8uht1hRQeeqd31316/x9mYu0meWInh2ho64xvAbFvM57HJx
	glas5UR6Ah21ctVl+QQfuGPQhadrrr2m0Q7CSZYpL7zwu5TafbKFeQ7CBm0AY6GQQnWpUWT8s7RoJ
	ycdnYrtxSY6YZCcxAbUqoTymFYihdjOiMVPfL/1XpTkslJ8KZJi9YpQTJW33yJ33iJ6CuboDt80Ta
	DEhUJdhPrM/Ltxq7iYTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCVSa-00061u-I1; Thu, 12 Mar 2020 21:33:44 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCVSS-0005tZ-Rs
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2020 21:33:38 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D1305C0004;
 Thu, 12 Mar 2020 21:33:23 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: shiva.linuxworks@gmail.com, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/6] mtd: spinand: micron: Add new Micron SPI NAND
 devices
Date: Thu, 12 Mar 2020 22:33:22 +0100
Message-Id: <20200312213322.7460-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311175735.2007-4-sshivamurthy@micron.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: a15335a17f4abf48ed9739c3b119232f9392cb60
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_143337_056201_BD7E7733 
X-CRM114-Status: UNSURE (   6.04  )
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
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-03-11 at 17:57:32 UTC, shiva.linuxworks@gmail.com wrote:
> From: Shivamurthy Shastri <sshivamurthy@micron.com>
> 
> Add device table for M79A and M78A series Micron SPI NAND devices.
> 
> Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
