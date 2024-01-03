Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9632C47077
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jan 2024 07:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/FWqevdnojkG0HeBunU1nnNFm/UmrpFADzwcgTmw2c=; b=4lVRiQo4yg1d7G
	KBvaBkEDu8DO3vN0tti5trXxXXXhItjG0MXU9WO4zH2UFmbIIvarDtwLkBIV8AIFujG/XxLSYdRgv
	OwUE0lYY4R5dJgSrvMlXN+xuu1NSUr06pBIhW+kZOzK0dPOV5WZnijJKbm1ymCQeTxgbfnPiWNHJx
	e5jj0MLnBhHNYLsimqXPRrM6Z0TJnhZUT1KnwFO7U1/KqZ2mAOqrzsr4taJ/w8hG/z5WqbSiKunKe
	IEnEnP8UQVZOWxAzRmZiIWvZvRtsOuvBqoEmy/9zYriISxrgsM/XuYuQfolRqU500EkVIa7f106B6
	/i55qX41p5BdUXmPx1LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKw8E-00A1sd-1t;
	Wed, 03 Jan 2024 07:57:42 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKw8B-00A1rA-29;
	Wed, 03 Jan 2024 07:57:41 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id E3A7D68B05; Wed,  3 Jan 2024 08:57:29 +0100 (CET)
Date: Wed, 3 Jan 2024 08:57:29 +0100
From: Christoph Hellwig <hch@lst.de>
To: John Pittman <jpittman@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Coly Li <colyli@suse.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-um@lists.infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/9] block: default the discard granularity to sector
 size
Message-ID: <20240103075729.GA485@lst.de>
References: <20231228075545.362768-1-hch@lst.de> <20231228075545.362768-4-hch@lst.de> <CA+RJvhwg3YXAzSk81nMGw=_3OMo6P=XcXBUFUAXSBcyXH6gkDg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+RJvhwg3YXAzSk81nMGw=_3OMo6P=XcXBUFUAXSBcyXH6gkDg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_235739_850057_76A5CA1C 
X-CRM114-Status: GOOD (  10.13  )
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

On Tue, Jan 02, 2024 at 05:11:19PM -0500, John Pittman wrote:
> Hi Christoph, is there a reason you used 512 instead of SECTOR_SIZE
> from include/linux/blk_types.h?  Thanks!

To match the logical_block_size/physical_block_size/io_min
assignments just below.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
