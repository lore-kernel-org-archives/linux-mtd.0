Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1632C2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 16:00:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40F8E22264
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 16:00:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dc/lQw5o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dKbyJHe0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40F8E22264
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dl0fBfaaBFkgRPMh/R7+X0gRVHAQ7qgtugX2S0Q9KIw=; b=Dc/lQw5o8tBCjNRUHuDDXSLqY
	mJKPcQ4dYHFgQiUN1rbUo1qKFc9oETT7aNCbjUDX/4L33sN/Dl8hvsvEDbAslWsosgJRb7dceno+G
	76JGwV6lbG3II2yphL5NQdAHX/p5t/BHFoNPzhBhSMtDLu1BFD5riAC4KUXr1U466QhsoyIBStC9C
	C6QmiFitJ5JSvSfToJQZikxyOQQcnY5NeBAijG7gGkpl2icnfS4hA9pHWgXBaScCyWSXZr5Z+6mOb
	MrUifx3nbmU3K8OXigworo8GX23zh8cW7J90oSMWRLcOAK4H2RWNwJkkbd14d24rV8zEDVDONYs9E
	r0FUDZDeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg8pN-0004qx-8z; Fri, 20 Nov 2020 16:00:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg8pL-0004qE-5d
 for linux-mtd@merlin.infradead.org; Fri, 20 Nov 2020 15:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=K5DwT3XZlV3t3RqqSgbM35Y3HrzhNkm8y+Dk2IlqgSg=; b=dKbyJHe0CTU5aQ7qzS3y+R7HzS
 IKnP9HvhkePlkizqwksisFX9ItaAwMtV42JJBmP3ZX68rybYyhhyxN6HF+4s2kqLrzwOxCN590LXF
 ym0WaBVLMdq9rLFtADBHBTFGjcyPZEqJfC7pbYTLnera5pnBeS3gKB7QoEHsSi8lIOiJp2cbk5Dht
 3B0uQlIfZ8f/1YczBdK4QRRNeBKzTo4B1VHMay+VPY7OTUi8keSXIo2ShWdFB8ho8zwbUkIe8+1eP
 wuIgrB00p1rgPw8SIw6y1czXZtN+QrCR9MWZkdKvvhRmCPfud3TmejnBZGx0dJq2Oq4i98pjwEUY2
 dBwSlL3g==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kg8pI-0005Bl-Jz; Fri, 20 Nov 2020 15:59:56 +0000
Date: Fri, 20 Nov 2020 15:59:56 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/20] block: remove the nr_sects field in struct hd_struct
Message-ID: <20201120155956.GB4327@casper.infradead.org>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-15-hch@lst.de>
 <20201119120525.GW1981@quack2.suse.cz>
 <20201120090820.GD21715@lst.de>
 <20201120112121.GB15537@quack2.suse.cz>
 <20201120153253.GA18990@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120153253.GA18990@lst.de>
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Nov 20, 2020 at 04:32:53PM +0100, Christoph Hellwig wrote:
> On Fri, Nov 20, 2020 at 12:21:21PM +0100, Jan Kara wrote:
> > > > AFAICT bd_size_lock is pointless after these changes so we can just remove
> > > > it?
> > > 
> > > I don't think it is, as reuqiring bd_mutex for size updates leads to
> > > rather awkward lock ordering problems.
> > 
> > OK, let me ask differently: What is bd_size_lock protecting now? Ah, I see,
> > on 32-bit it is needed to prevent torn writes to i_size, right?
> 
> Exactly.  In theory we could skip it for 64-bit, but as updating the
> size isn't a fast path, and struct block_device isn't super size critical
> I'd rather keep the same code for 32 vs 64-bit builds.

Is it better to switch to i_size_write() / i_size_read()?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
