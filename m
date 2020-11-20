Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF36CC2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 20:07:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BBEA2225B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 20:07:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fEg5IaEW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BBEA2225B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SK1VsQ73NiHanGjgoZid3Qbyr9VcY+a0kaxYRB2q+wc=; b=fEg5IaEWtycCZ+J2wpP/5kS9i
	q6YjnROUnofbbjKBLLQtrHNaXa4fY79Gfh9aiiUomQ+ItVBCQyyX450/qapIFqfWhNVwhsaBRL+8J
	8TobXRS+v1GeFdATLIQ2xOOq1o7VDXbZgpKu/NR1bLKuethCdOo0cGe8gXTWlb2I30C1RUKONNL7D
	4nCNRLfPXAj9kN0j6L0lDLIfxKfwpB4lp57mcseiVf7byCrCplBUEXraxOqAe9k4oXdSZ5fgM6kBa
	4R1KHej9coLret3xeQHttz3cYxXCyy6jT6ukjA5vA8jLNJxIuIPMlzXJW4a8SgjHu+v0Yt85SacWC
	HKgHt973g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgCfL-0007sk-2q; Fri, 20 Nov 2020 20:05:55 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgCfH-0007qn-PN
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 20:05:52 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C646AE1F;
 Fri, 20 Nov 2020 20:05:49 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id C910C1E1319; Fri, 20 Nov 2020 21:05:48 +0100 (CET)
Date: Fri, 20 Nov 2020 21:05:48 +0100
From: Jan Kara <jack@suse.cz>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 14/20] block: remove the nr_sects field in struct hd_struct
Message-ID: <20201120200548.GA27360@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-15-hch@lst.de>
 <20201119120525.GW1981@quack2.suse.cz>
 <20201120090820.GD21715@lst.de>
 <20201120112121.GB15537@quack2.suse.cz>
 <20201120153253.GA18990@lst.de>
 <20201120155956.GB4327@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120155956.GB4327@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_150551_998086_835DB2D6 
X-CRM114-Status: GOOD (  21.92  )
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
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri 20-11-20 15:59:56, Matthew Wilcox wrote:
> On Fri, Nov 20, 2020 at 04:32:53PM +0100, Christoph Hellwig wrote:
> > On Fri, Nov 20, 2020 at 12:21:21PM +0100, Jan Kara wrote:
> > > > > AFAICT bd_size_lock is pointless after these changes so we can just remove
> > > > > it?
> > > > 
> > > > I don't think it is, as reuqiring bd_mutex for size updates leads to
> > > > rather awkward lock ordering problems.
> > > 
> > > OK, let me ask differently: What is bd_size_lock protecting now? Ah, I see,
> > > on 32-bit it is needed to prevent torn writes to i_size, right?
> > 
> > Exactly.  In theory we could skip it for 64-bit, but as updating the
> > size isn't a fast path, and struct block_device isn't super size critical
> > I'd rather keep the same code for 32 vs 64-bit builds.
> 
> Is it better to switch to i_size_write() / i_size_read()?

The code is already switched to it AFAICT (the lock is really only used in
the two places that write i_size). But the problem is that in theory two
i_size_write() calls can race in a way that the resulting stored i_size is a
mix of two stored sizes. Now I have hard time imagining how this could
happen for a block device and if two reconfigurations of a block device
could race like that we'd have a large problems anyway...

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
