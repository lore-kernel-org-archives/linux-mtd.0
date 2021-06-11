Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DD0C48BE0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 19:25:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78A20613CC
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 19:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78A20613CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2Z+6Y3QRIcwrQiyqYHhLg1avdNrG/Wc3XcYP1pv+sg=; b=KzotzuC8DG7SsU
	YPjgtGjC+E9t1E72kg6PF7bxcz2IQxF/89CLWBjOEGSduvFACWqYd9n6/FeEmy3GJoiGdEUiQVuQt
	69Ud9L/vEu83aGrkiXgektkVG1E363Yg5eBZ6kUXMAS/eSxyA0O5m9tfK3U8wt8EIcW1d0vnap/Bv
	YnlM/rRYU6KgvnUgqKZ6YKRr5FsAzQn0Zlo+8+J77jUJTbVwI///LM8sAhWiXvouqn8qtzQB+DtPl
	gZJBmbKK3w1SSEGTKdTubypMPKbZdAqvF3SYmcu2NG4oOQ1QGfDTsP2MUmLtmLhk3K2hokXKQQKd4
	p7WIfKCBug7aB0KjwNJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrmmM-006e0c-J9; Fri, 11 Jun 2021 19:25:18 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrmPA-006YL9-19
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 19:01:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 13B2AC0008;
 Fri, 11 Jun 2021 19:01:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ryan.barnett@collins.com
Subject: Re: [PATCH 5/5] mtd: rawnand: omap: Add larger page NAND chips support
Date: Fri, 11 Jun 2021 21:01:16 +0200
Message-Id: <20210611190116.225731-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610134906.3503303-6-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c9723c7da546702cb6af2979db4203c9a012d08a'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_120120_249450_A3218C0A 
X-CRM114-Status: UNSURE (   8.84  )
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

On Thu, 2021-06-10 at 13:49:06 UTC, Miquel Raynal wrote:
> There is no reason to be limited to 4kiB page NAND chips just because
> this is the maximum length the ELM is able to handle in one go. Just
> call the ELM several times and it will process as many data as needed.
> 
> Here we introduce the concept of ECC page (which is at most 4kiB). The
> ELM will be sought as many times as there are ECC pages.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Ryan Barnett <ryan.barnett@collins.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
