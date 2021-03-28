Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD69C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:50:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46D8161981
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46D8161981
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yrx+EWdZ4tns4nUikPCjvgq7IYnnKRbSyiTi0Z9WVgQ=; b=qrqjAEhmHPSFOGo4/KnkIX4Fx
	UIV5P18PgldQ32tG0W8dSKfwi5ARQrLub3cD1ROPLLiQenu9aLazn/01eTNozoEyD9VWRYDUkt6wI
	WEmWOgyk0l9LhYtoAdMl9fxjZ3gLD9Q1O3m3MSSFzWq5n+DBu/n5S5ccWwiYnFd90GszZDGQ/bQSS
	5AZ80+6yDV0dOpO12p1bSxcF19zZ8wj+uDXh5W0nKSftq4xT44BYPt+YDp0829+emYcZ0xQzryFXT
	svu670SOKEq9sNkzEZI0Omjci9szvPwXjc6BM33CT8GLiOKJPLMRChVIOXJ3TCmkKrZn1Xqsy2a9K
	fES3Sw0XQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQw0G-000w5l-3T; Mon, 29 Mar 2021 17:48:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQowQ-000Zbt-LR
 for linux-mtd@desiato.infradead.org; Mon, 29 Mar 2021 10:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=iJ3zWQsgO88raqO0uxkDnvv7sAqa4mQM11BedNLQoW0=; b=ZtVv1CUg36rVG9LQJFld6TTzFz
 92o2vx+lD9lyIZMPqDjyr0FkLy8aS1TSbrlWsK2SFCsb6BW1cnk4+GOhcFwlQMK8zJyBFFMFIzs9t
 Z2dEaUHYtP6cPCZzp+0H9pjqgzyqbJUnbPKPwn2PzpIRZmL0rLoMwyaB+caFkuw40tOuiW9YJ7o+U
 p366Aj7n9YYtg+NIYmt5RtQIgfOQaH4yWg6iwsKeC8zqKCXAPdfh1jF1vIpm7wNdljqRcMLywhVJA
 xdSGp1tDtBlJuOLWUZTYg0ewXf/HsDyQeQubkkNhBhPYAj2VwLdNpECOQhtdKxCJNqagG2RK0I9VD
 ECTpOhJA==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQZJp-000LHo-TT
 for linux-mtd@lists.infradead.org; Sun, 28 Mar 2021 17:35:29 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 74AA71BF203;
 Sun, 28 Mar 2021 17:35:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Riedmueller <s.riedmueller@phytec.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: nand_bbt: Skip bad blocks when searching
 for the BBT in NAND
Date: Sun, 28 Mar 2021 19:35:00 +0200
Message-Id: <20210328173500.10571-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210325102337.481172-1-s.riedmueller@phytec.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bd9c9fe2ad04546940f4a9979d679e62cae6aa51'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_183523_026560_D445D1D6 
X-CRM114-Status: UNSURE (   8.73  )
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

On Thu, 2021-03-25 at 10:23:37 UTC, Stefan Riedmueller wrote:
> The blocks containing the bad block table can become bad as well. So
> make sure to skip any blocks that are marked bad when searching for the
> bad block table.
> 
> Otherwise in very rare cases where two BBT blocks wear out it might
> happen that an obsolete BBT is used instead of a newer available
> version.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
