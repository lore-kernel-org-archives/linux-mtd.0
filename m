Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9836BC001E0
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 05:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6gsKduYC3MBpIAszsLZkXsHquvRjAczOHsIEgCevwHY=; b=anpSZaR0gCNUbg
	AUizaTqIRfsWaCvAAuMyNvjcccFXEV13Z6C6uSidnkjfk7IycsyT4EHygvoWYyf7ix3IKBnBKK0x1
	cl3KZ/ItywgUv7040C32Q5BVrzbuvihGjc1Vj8hVOA4FRRsBzSalTrEEweaJXe8yoKtNgy0/AL3ab
	wKv6ruEI+pV1aARTrNcdTIF7UslrK1x69e9XKD/hesFG3WPbId3dj2AYt+8DEuuDJ5eF0srEzy1CC
	0IOMzTK3GAgVPvAP51st3rt97iM3sNNybQyVrH43iN7uFfPSbKAu5UKznGkbUeW72NSUKPvMsuc4n
	Dv7pkuNCawvpann6Kz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qunjv-006UEj-1b;
	Mon, 23 Oct 2023 05:44:35 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qunjr-006UCt-31
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 05:44:33 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id C562868AA6; Mon, 23 Oct 2023 07:44:13 +0200 (CEST)
Date: Mon, 23 Oct 2023 07:44:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	vigneshr@ti.com, miquel.raynal@bootlin.com, joern@lazybastard.org,
	Christoph Hellwig <hch@lst.de>, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: block2mtd: Add a valid holder to blkdev_put()
Message-ID: <20231023054413.GA11272@lst.de>
References: <20231021185832.25592-1-richard@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231021185832.25592-1-richard@nod.at>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_224432_124649_66D16A0D 
X-CRM114-Status: GOOD (  10.39  )
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

On Sat, Oct 21, 2023 at 08:58:32PM +0200, Richard Weinberger wrote:
> Since commit 2736e8eeb0ccd ("block: use the holder as indication for exclusive opens")

Overly long line here.

> blkdev_put() requires a valid holder argument.
> So, do so also in block2mtd to unbreak bdev->bd_holder refcounting.


Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
