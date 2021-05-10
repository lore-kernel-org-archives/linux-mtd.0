Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F654C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:11:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E969061432
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E969061432
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kz93oDv6C/tIHyjhZS02yLApy1I7H/FVXePF6z4ZhzQ=; b=GrRFg/UqyIGPD1a3xA69ayh+T
	b3QQpHomZmVqrhrlWYgnMSWgLhiIsWr13miqd8TCZjL4eQLOLa0/AQ2FLeOtzzqtmDCHIwKzzfG4G
	umesg50g6Fw+C9tgudC5fKWI5dLB9tJtXL/5sECYqrJ4zx3r61GWLs2pnpIRzUshQGWuzEz4NIgd+
	yBr5CkG2kJrcTMhiXqj5n5srXvRypshjU8gHitVxMNBmOTUkOBQ5Vpy2Hh+/oTB+FhUg3vu1HrG9g
	0/AW8M/wu3TvyTHrRQk0rkd10cF5xNe5SzehJ3RuIBNWRtGU5skwo1pbEJraCuleKyOzQbrnQTGsI
	4T7fxNh5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg1vu-00DiW6-K2; Mon, 10 May 2021 09:10:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1un-00DiN6-Kd
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 09:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=KHzQHbu2uswMFDj5mOvvMN4dyBpZUeztutdJIRTKuUM=; b=Dyh9Vsz1f9sY6/xCxc6HqePfGJ
 QcGnjPYCX+L6jYAKIDhwDD6vbYDTypeO8dCVEE10agHsEPmzLqtrNHY7E0B3SYx0PKAFB0Yt9xKC+
 mNet+Of4I4KE8ibPywLPmKuAwKsBj6g++vHT1SU3FsKa6RyvH5mjvDsu6ZOL6uwmeoDzr83tP1q4W
 JgE1lFdHoR+SKKauPGEuYN7k+XjYSeaO6ykPGVgvMo3XnXg9ydtzcp6+ogDBADhyHsszQUXK2H1VQ
 mdq7MpQ6Mnqn7CLgo23K0YRYO+MAjc5eX/RbZNaLT6okPf7y1RlmCkfR0N0UiDsRR1nBdn/Bq0f2k
 BYSGVsSQ==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1uk-008RSZ-TT
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 09:09:24 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 36E811BF207;
 Mon, 10 May 2021 09:09:19 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH v3 5/7] mtd: rawnand: sharpsl: Fix external use of SW
 Hamming ECC helper
Date: Mon, 10 May 2021 11:09:18 +0200
Message-Id: <20210510090918.3521-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210413161840.345208-6-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'65e9c87400f17d371fae82bc60565a01a8dbe82c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_020923_103736_C481D508 
X-CRM114-Status: UNSURE (   8.76  )
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

On Tue, 2021-04-13 at 16:18:38 UTC, Miquel Raynal wrote:
> Since the Hamming software ECC engine has been updated to become a
> proper and independent ECC engine, it is now mandatory to either
> initialize the engine before using any one of his functions or use one
> of the bare helpers which only perform the calculations. As there is no
> actual need for a proper ECC initialization, let's just use the bare
> helper instead of the rawnand one.
> 
> Fixes: 90ccf0a0192f ("mtd: nand: ecc-hamming: Rename the exported functions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
