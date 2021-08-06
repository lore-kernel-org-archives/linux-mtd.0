Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E974CC4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 20:08:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D9E061154
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 20:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D9E061154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sm/R/LornW+gcNNLyzEPz5afAlBvHZlwP2r1CTYPxZY=; b=m7cm7ZjnDxD7gS
	Nel5qtsRXhA9JJhaH5zE1ORT+/NvRKeqA1RuIBUdbogD4ZUuciIjK1g/vtyntU/iUZj4VeYAP6Vka
	sL4JgCkhGyh9C396iNZ4NjzQlF9JPWDTMaRh4DL6qsNEsEYAMmeSJXpGXHKb7yUXNvYuJYHNI8t25
	Vzs5ZhJPdasBGl1iOpzqXCdnIwuwQLMcS8X8W984kLpoKCu2vM3Az/1rH0d1oKRGQqnfst6gg3uc5
	jpTtxmhmTXJLXp0znw3slZzwWutNKNdsQgRCVjCjiC/XqvgU1eqfFDnQjQcIB43WR/NF1/ndiOvPS
	TEP7wEAujiL+oDGafFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC67s-00DRWe-6X; Fri, 06 Aug 2021 20:07:28 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC66H-00DQn2-4c
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 20:05:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 3DAE5100003;
 Fri,  6 Aug 2021 20:05:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ezequiel Garcia <ezequiel@collabora.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/3] mtdblock: Update old JFFS2 mention in Kconfig
Date: Fri,  6 Aug 2021 22:05:46 +0200
Message-Id: <20210806200546.394389-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210801234509.18774-6-ezequiel@collabora.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6bc219b7b2cdd9d45ea15926d32c5e5c1d63881e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_130549_355113_CE42EDD5 
X-CRM114-Status: UNSURE (   8.95  )
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

On Sun, 2021-08-01 at 23:45:07 UTC, Ezequiel Garcia wrote:
> JFFS2 can be mounted without 'mtdblock' since
> a really, really long time. Some git-log
> archaeology shows that in 2006 it was possible
> to use 'root=' to mount a JFFS2 rootfs:
> 
>   commit e9482b4374e2596e6f3f1ab30c4ea469f4ac6311
>   Author: Joern Engel <joern@wh.fh-wedel.de>
>   Date:   Tue May 30 14:25:46 2006 +0200
> 
>       [MTD] Allow alternate JFFS2 mount variant for root filesystem.
> 
>       With this patch, "root=mtd3" and "root=mtd:foo" work for a JFFS2 rootfs.
> 
> However, there are still plenty of tutorials that mention
> mtdblock, so users are still taking this route. Update the Kconfig
> to reflect this is no longer needed.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
