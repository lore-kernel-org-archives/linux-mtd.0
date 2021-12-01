Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D356CC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Dec 2021 07:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEpMSDeNeta5v2WRkoJW+vOlkgir9YkoS4x11GPoN2Q=; b=yQVAXKalG6QXm7
	86FNdcQFuzzESqy32D7B3s4F6TD+PikNYVvLfqHK3ntMfb9Pt7S7RTN50Enrr8YRJx1pYMv/J6CII
	K4O9jYcgNbQY23VnjgIHaspCvpbuZNt4Fb3FC4rDOodBaKKAyiLZiqjJ7E3IEuCRLICEPBUxzK+wg
	pqpMX65xUmU0tOzRWvQDUX8tPGNFE39SAslSOKHzDlOCeVbrFTR9vbq0o2Xge03o+Scr0rIFGHLzP
	o7UX1Mq3CyP0vAeJUF8or7ZGOP7bKptiRbVq4P+/guhjadIbJxSB0wKCRNYwUfYkRb0lGm3jlgXXs
	a03uJSWWR6jlwsG3eeXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msJxt-007dV9-LV; Wed, 01 Dec 2021 07:23:41 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msJxq-007dTZ-HR
 for linux-mtd@lists.infradead.org; Wed, 01 Dec 2021 07:23:40 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 373BF68B05; Wed,  1 Dec 2021 08:23:29 +0100 (CET)
Date: Wed, 1 Dec 2021 08:23:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-mtd@lists.infradead.org, linux-block@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC -nxt] mtd_blkdevs: Set GENHD_FL_NO_PART
Message-ID: <20211201072328.GA31765@lst.de>
References: <c26dfdf9ce56e92d23530a09db386b283e62845d.1638289204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c26dfdf9ce56e92d23530a09db386b283e62845d.1638289204.git.geert+renesas@glider.be>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_232338_771545_D9D4CC37 
X-CRM114-Status: GOOD (  20.03  )
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

On Tue, Nov 30, 2021 at 05:23:46PM +0100, Geert Uytterhoeven wrote:
> When DT declares the partitions of an spi-nor device using
> "fixed-partitions", the individual mtdblockN partitions are now scanned
> for partitition tables, which should not happen.
> 
> Fix this by setting the GENHD_FL_NO_PART flag in the MTD block layer
> interface.
> 
> Fixes: 1ebe2e5f9d68e94c ("block: remove GENHD_FL_EXT_DEVT")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Seen with e.g. arch/arm/boot/dts/r8a7791-koelsch.dts.
> I only noticed because I have debug code to measure QSPI performance,
> which informed me about 8 x 512 bytes being read from each partition
> detected.
> 
> RFC as I'm not sure this is correct in all cases.
> I did verify that in the absence of "fixed-partitions", the spi-nor
> device is not scanned for partitions before and after commit
> 1ebe2e5f9d68e94c.

As far as I can tell mtd fixed partitions have nothing to do with
the block layer concept of partitions.  What kind of behavior change
did you see?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
