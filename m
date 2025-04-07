Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A097EC36010
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 14:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2aCLNE+3J8JH3+xqlduVzVtsfGJDj97LfEiDFkzUHY=; b=dVYVoqFj6aQ0RD
	tjFb4Y0bW5c0FgaxqxR5yBx7SyeYskXHhMOW03HHl9YRnxDfvbVzMj1bqAsN0is589FOmIX+1D7WP
	5wiyvg8xFtCWa78pChYxJZNQkLZuYIYZPzI3wDoDQVGKPVI13y7Wyw1OuQCAMp5eCvAkCQjhbDOiM
	KizM32doNBCoFmDz3dnKQLA7KrOvCMKSf5LbsZ4dJq4DM7qz4v/sk5yJ9o96N46vi8VGkgPH0YapJ
	3PRiM+45l1uMDP7p0wjPTqT7UTTDM5N1rJmnxFnTHzAjRKNdFdDGyiY23tDfQ7yYlyTtuzcpXu6Ls
	RS0MnBa9TIoeNqq9RoNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n2v-00000000dnS-3ImH;
	Mon, 07 Apr 2025 14:01:53 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n11-00000000dNi-4BVx;
	Mon, 07 Apr 2025 13:59:55 +0000
Date: Mon, 7 Apr 2025 06:59:55 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Sean Anderson <seanga2@gmail.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: bio segment constraints
Message-ID: <Z_PaW2QS3OXTXHSO@infradead.org>
References: <8dfd97ac-59e7-ae69-238a-85b7a2dae4f1@gmail.com>
 <Z_N5nxLDOBb5NDAM@infradead.org>
 <Z_PXONJyuv4Z8ATr@kbusch-mbp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z_PXONJyuv4Z8ATr@kbusch-mbp>
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

On Mon, Apr 07, 2025 at 02:46:32PM +0100, Keith Busch wrote:
> > > - Is is possible to have segments not even aligned to SECTOR_SIZE?
> > 
> > No.
> 
> O_DIRECT only requires each user iovec be a multiple of the logical
> block size with the address aligned to the dma_alignment. If the
> dma_alignment is smaller than the logical block size, then this could
> create bvec segments that are smaller. For nvme where we have 4-byte
> dma alignment, you could have the first segment be the last 4 bytes of a
> page, then the remaing 508 bytes from a different page in the next
> segment.

Oh, right - with a smaller dma alignment this can actually happen.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
