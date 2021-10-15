Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C18EC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 11:20:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5EB3611C2
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 11:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5EB3611C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=64RGBrxZmcgPcMkP/b15GjJ1Aw7RbxLgIjmHZx+srz0=; b=moctBRDmdD++t2
	fOSE6fzIcB/r5SzHM1GCD0t7nfXtahAFMjzi69oxhmmsjF4RQ9YYExj5FUkCEEnWH6pZsLykEHtiJ
	+2DheXmA5voiFsTumdCbZPbDEQ5+yvcAnnBXarn/mu+91b9ZL1XNAOd5yoP7k8vTUrFSC04gYxF5+
	fistNAflofO0Xczai1mgqFF9rOeel3PsRe1UDeL9pGV6tb7Ob25FiwYhpK/gdE9uWMAZ9IEslzEgI
	U0olreXSsHC5j6BQUQQlsHQt1Ty1vOz0EwXtZ0yNB1q8SpcLJV8ZpzJGDZKzcmWU1XEWikVqe+gfK
	2/pq5xLoiYvIoReFXHEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbLFV-006gFF-1E; Fri, 15 Oct 2021 11:19:41 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbKWg-006VEQ-4p; Fri, 15 Oct 2021 10:33:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 473811C0005;
 Fri, 15 Oct 2021 10:33:19 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/8] mtd: rawnand: fsmc: Fix use of SM ORDER
Date: Fri, 15 Oct 2021 12:33:18 +0200
Message-Id: <20211015103318.950418-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210928221507.199198-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9be1446ece291a1f08164bd056bed3d698681f8b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_033322_383057_EB955CB5 
X-CRM114-Status: GOOD (  10.29  )
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

On Tue, 2021-09-28 at 22:15:00 UTC, Miquel Raynal wrote:
> The introduction of the generic ECC engine API lead to a number of
> changes in various drivers which broke some of them. Here is a typical
> example: I expected the SM_ORDER option to be handled by the Hamming ECC
> engine internals. Problem: the fsmc driver does not instantiate (yet) a
> real ECC engine object so we had to use a 'bare' ECC helper instead of
> the shiny rawnand functions. However, when not intializing this engine
> properly and using the bare helpers, we do not get the SM ORDER feature
> handled automatically. It looks like this was lost in the process so
> let's ensure we use the right SM ORDER now.
> 
> Fixes: ad9ffdce4539 ("mtd: rawnand: fsmc: Fix external use of SW Hamming ECC helper")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
