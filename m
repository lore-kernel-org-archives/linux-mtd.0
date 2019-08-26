Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8FCC3A59F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 13:02:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F7AB217F5
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 13:02:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qOVhR+rb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F7AB217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jC1NJrKeNwFzOSxwQNfjB/oKciVDh6IL7ns0a03AEo=; b=qOVhR+rbgZvIrQ
	37cwN1Kl9zQxUGVh1W0zvat93crixNNRkvIWInzz5gsEfLJQwEh+V14uJcuzIpMyh/fUYdHUoMwXc
	Cra43jfPoQGg3OuqMAL+mbosFJvYoAeOoRZHJuwQ+LqGirM/C4vVqqDHg59hR4uEWssajtCPP11cG
	vyiyk+g0EuaOEckz5ToMHu1JyLNjr/aJqtHmvDRfsnZJUB6Ar/VYAU/D3nBqQBhQrxSIz7DW/nz5k
	0lryNHKeZ02jOD3+7LEHCqssZmemUeH0cwbZ3HA4XzsCJtLZF04SJFQNhniEX8PsQvLZYqIbp2JYf
	jCK47wBMmyAVURkKcpbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Edo-0005Fw-BA; Mon, 26 Aug 2019 13:02:36 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2EbZ-0001Os-AE
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 13:00:20 +0000
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5FC4910000C;
 Mon, 26 Aug 2019 13:00:04 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wenwen Wang <wenwen@cs.uga.edu>
Subject: Re: [PATCH v2] mtd: rawnand: Fix a memory leak bug
Date: Mon, 26 Aug 2019 14:59:47 +0200
Message-Id: <20190826125947.15176-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1566182765-7150-1-git-send-email-wenwen@cs.uga.edu>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 86aa04f4c2215912fcca6728f2dcf174f7e31fc4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_060018_232057_668D2EED 
X-CRM114-Status: UNSURE (   8.25  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Randy Dunlap <rdunlap@infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2019-08-19 at 02:46:04 UTC, Wenwen Wang wrote:
> In nand_scan_bbt(), a temporary buffer 'buf' is allocated through
> vmalloc(). However, if check_create() fails, 'buf' is not deallocated,
> leading to a memory leak bug. To fix this issue, free 'buf' before
> returning the error.
> 
> Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
