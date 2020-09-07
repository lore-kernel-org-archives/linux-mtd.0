Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317DDC433E2
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:23:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4AA320732
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:23:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xiZUtJfd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4AA320732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdRLhwkuOEou+tggUOnujYM8ePKHqciVZ3rhQpq5v0U=; b=xiZUtJfd0gtgrwryZGLDaehXtg
	7jSEWjs4o6R/cdXnWlKjZyXddwoIQXz8+YanadDDRZqEykmqpea5whocY/744FGtUESFtvRYV1OLj
	D3R5UEHflxrz+bGYj/zwt8JHh9Pn2++VTRG05S6dz36277SoC6+V9kZW93kXcYtRNhFDobXV+nsTI
	1TaOFYyT+YQGW1kj9RF5i1Y4KsuWF/8jK0affbsqdCQE7Y6Jm1+/H3eT/8SWqsjZ+EbJk6MN/cBhh
	/PTH12fkO+ptmOxWKHbElx3t6S5qS2+0OpGgbszK2G27zt3k5mLbtj+IvTYX2ktzSi+VEMLUgteyz
	xiznGn6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBTh-0002P6-VC; Mon, 07 Sep 2020 07:22:14 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBTc-0002NW-T2; Mon, 07 Sep 2020 07:22:09 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C8B4EFF804;
 Mon,  7 Sep 2020 07:22:04 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pavel Machek <pavel@ucw.cz>, trivial@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, narmstrong@baylibre.com,
 nishkadg.linux@gmail.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: oxnas: cleanup/simplify code
Date: Mon,  7 Sep 2020 09:22:03 +0200
Message-Id: <20200907072203.3503-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724083825.GA31437@amd>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 2cc5c9965bcaae81e6b25960a134a380eb029436
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_032209_040526_FFBA02CC 
X-CRM114-Status: UNSURE (   6.23  )
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

On Fri, 2020-07-24 at 08:38:25 UTC, Pavel Machek wrote:
> Simplify oxnas_nand_probe.
> 
> Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
