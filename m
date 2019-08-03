Return-Path: <SRS0=wBIi=V7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151FCC0650F
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Aug 2019 00:15:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB9412086A
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Aug 2019 00:15:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="evVKbLJg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB9412086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bFQqR73Y3A8wrV0j2aR6yxXMZekbyDV2w4IaeBt4Es=; b=evVKbLJgs4DK57
	JZQZx5nVz/WkOb/2Fcmxz7F3UW4Q3gYmZXLW1+2Dj1aTyscPfRriFhwwdxk1vPpYpuFp7ZQ/BtrP7
	waorusQiY0U9jlAX2v8gIYqQBahSuvaXEJ5+98YjljlEqr3BG2i2wfxRED4K51DYS0uDan7re1zjC
	nxFKgNjYx/fsoDza44SSGcR6StjpAqcLYmwx7sUv7VdcI2MoPormjLzlPtvQyMG/DZ4D8jaoijA1d
	PWZ48PZej95xCVJjrh1/ABKndRvNCMkiFc78ratF9mF+B+0gW0izG0wamVyfESZ1DfYxvJXUd/28u
	lS2k1u0m7s5DnKUj09nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hthhC-0007k1-U8; Sat, 03 Aug 2019 00:14:50 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hthh7-0007jh-Qd
 for linux-mtd@lists.infradead.org; Sat, 03 Aug 2019 00:14:47 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1F1021BF204;
 Sat,  3 Aug 2019 00:14:30 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>, richard.weinberger@gmail.com,
 boris.brezillon@collabora.com, miquel.raynal@bootlin.com
Subject: Re: [PATCH v3] mtd: rawnand: micron: handle on-die "ECC-off" devices
 correctly
Date: Sat,  3 Aug 2019 02:14:24 +0200
Message-Id: <20190803001424.5733-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190730134407.30212-1-m.felsch@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 8493b2a06fc5b77ef5c579dc32b12761f7b7a84c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190802_171446_023753_95E55033 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2019-07-30 at 13:44:07 UTC, Marco Felsch wrote:
> Some devices are not supposed to support on-die ECC but experience
> shows that internal ECC machinery can actually be enabled through the
> "SET FEATURE (EFh)" command, even if a read of the "READ ID Parameter
> Tables" returns that it is not.
> 
> Currently, the driver checks the "READ ID Parameter" field directly
> after having enabled the feature. If the check fails it returns
> immediately but leaves the ECC on. When using buggy chips like
> MT29F2G08ABAGA and MT29F2G08ABBGA, all future read/program cycles will
> go through the on-die ECC, confusing the host controller which is
> supposed to be the one handling correction.
> 
> To address this in a common way we need to turn off the on-die ECC
> directly after reading the "READ ID Parameter" and before checking the
> "ECC status".
> 
> Cc: stable@vger.kernel.org
> Fixes: dbc44edbf833 ("mtd: rawnand: micron: Fix on-die ECC detection logic")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
