Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D47C33C9E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 21:49:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 233172072B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 21:49:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YrJI5kqb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 233172072B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRh+tOWZzwWKyUwuXaTk97l4nQU2SLYDLwtD8VJwLnI=; b=YrJI5kqbcns0wZ
	CPMkl1tF29Wxfzi8n8dTm/+fRhfomcTdNiLB316xScLi4joOSaKlVMGEDfpuwmiL1jc4xK60VHndc
	eDeAV/Czg/RHJCKTIFhNXdeE4DMLeqUwUbzpFByLCLmVuky7vUtSRy2g0xN0ZF8YVZ1/6jVV72F4v
	micPjkNT5pYyXE2hKITsfH9nf72t4qYBBxaCikgrm4dW7FdtKLWH6G38Z9O04WbMJt7pRRuXuG68G
	JEnr3uK3o+SHRvS4XMQJFBU0W89YxoB2pSNVrh6rj4KCwwyOmhRWmGZbxy53rESnY3O6bY7T5jqxZ
	DQAMzcSwj0rYBMhqx+lQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isZU5-0007ik-LS; Fri, 17 Jan 2020 21:48:53 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isZT4-0006i9-3B
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2020 21:47:51 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 38CC7C0006;
 Fri, 17 Jan 2020 21:47:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Fix quad enable for Spansion like flashes
Date: Fri, 17 Jan 2020 22:47:44 +0100
Message-Id: <20200117214744.21608-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116093700.28308-1-michael@walle.cc>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: da2ef8124f20b4ce18d1d3d24fc7b88e687e10bb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_134750_299462_FBAC6AC6 
X-CRM114-Status: UNSURE (   6.15  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-01-16 at 09:37:00 UTC, Michael Walle wrote:
> The commit 7b678c69c0ca ("mtd: spi-nor: Merge spansion Quad Enable
> methods") forgot to actually set the QE bit in some cases. Thus this
> breaks quad mode accesses to flashes which support readback of the
> status register-2. Fix it.
> 
> Fixes: 7b678c69c0ca ("mtd: spi-nor: Merge spansion Quad Enable methods")
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
