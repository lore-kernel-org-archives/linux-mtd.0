Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789F7C36010
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bugCgwWxcwSUaKzCFUx/DAZ9+hx50zI13zeG/Jx8PKM=; b=cLMGmlvwOjk3Sd
	V2meZ3kVZjttInMzDyPWziKQDOrzSxwem7N7xfx3+E3VmacilF2L9hMBiTabfzz/F8/HRmjkiBp3b
	54SjxAvEyLxMmFa8YREolUDL6ISAP2rIqYOYnkaZwDtLfkooJDqtj78U5/zM9yJsUEF9B683zYU9q
	LrGhSauTMaO+dlTYB6islfdD35uX68NL9uzTcA2SU3o84FjEPbSHnfQ9GDK7hkq/wG870yeQK1G/o
	OUx6ikJ7jCN4w/uD+VkwPZP8oyeNJvc0pAQtMZMjp45TsIWngv3UXi+mE68XrSdOruCQ864M/4SET
	k+O/5Ymi1zuhsZdbhHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1o9Q-00000000tml-1D7F;
	Mon, 07 Apr 2025 15:12:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1moA-00000000aeX-3im9
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 13:46:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F269A5C10B6;
	Mon,  7 Apr 2025 13:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE201C4CEDD;
	Mon,  7 Apr 2025 13:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033597;
	bh=D9qHWp37Sg6PMvv0RCGQLV5SowNt30Q3SVhrunA7nT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L6vhLHq/4zoC8CxaNrO9qGr+CHVsf5UuWI5L4puQJULgYwy/aryQMM/qz/gtvEa+l
	 7KlnXdPkWInPwk2YM69/AY6CBTHXFNQYfOiHVB0s32hjSOGXgSwFRkAJ8vt2QkOWr4
	 r5kN72EWyITLwTkLG4UBmUijHpBN+aGp1oY8WvH7OUTLpMoUF9ChEC6/xn74PEjRjY
	 WZxQYM+2nA9OSmn/AlxHdILiaQNDV88zy7fM30K1b03B1olyOFRmmDjxFJjhGe8L4q
	 LDnM6mG1u+SRh5hVLTgcvoJCukd1S3UI6fZ0swkzASc+tHxjKrFjd0iltzwQ0DPptL
	 khZyk80wVEkgQ==
Date: Mon, 7 Apr 2025 14:46:32 +0100
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Sean Anderson <seanga2@gmail.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: bio segment constraints
Message-ID: <Z_PXONJyuv4Z8ATr@kbusch-mbp>
References: <8dfd97ac-59e7-ae69-238a-85b7a2dae4f1@gmail.com>
 <Z_N5nxLDOBb5NDAM@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z_N5nxLDOBb5NDAM@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_064638_976787_41E971EE 
X-CRM114-Status: GOOD (  16.07  )
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

On Mon, Apr 07, 2025 at 12:07:11AM -0700, Christoph Hellwig wrote:
> On Sun, Apr 06, 2025 at 03:40:04PM -0400, Sean Anderson wrote:
> > - What about bv_offset?
> 
> bv_offset is a memory offset and must only be aligned to the
> dma_alignment limit.
> 
> > - Is it possible to have a bio where the total length is a multiple of
> >   logical_sector_size, but the data is split across several segments
> >   where each segment is a multiple of SECTOR_SIZE?
> 
> Yes.
> 
> > - Is is possible to have segments not even aligned to SECTOR_SIZE?
> 
> No.

O_DIRECT only requires each user iovec be a multiple of the logical
block size with the address aligned to the dma_alignment. If the
dma_alignment is smaller than the logical block size, then this could
create bvec segments that are smaller. For nvme where we have 4-byte
dma alignment, you could have the first segment be the last 4 bytes of a
page, then the remaing 508 bytes from a different page in the next
segment.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
