Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F5DC2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 15:48:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A35FC21D7A
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 15:48:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Nli6qq0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A35FC21D7A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mWWjlImr+lLgeJ4pOdOP0UqEbuTF95VHOo3Q9jWrJLU=; b=0Nli6qq0xBBttLsDqOV4SsNgO
	Or9r5gu+8KPACpzxovjWzp32syjZv+VnjhM0ZhgB5LK1ipBPXCChZJuDfHl+obCkPwiruedBnngYu
	byR5DqD/bfkYVV+P6JkuNoIMNUDQeTaY0iq6vDjaiiB5INNhTtN9HlmnadhTSN75cyOTCIc+yjcyX
	NAuEnKRJYL4LZWWcfQLlVvpJ8cSNWi675JCk/cePWr4/P/KyrlpEiBfYbnAck7pxVmOT6M9+zb8aJ
	l45h6JKvUgu5TK9MzR+VBpCJtZb6Odf3HxMgHUT72Q18hpyKqpOpnTQS6YArPDsR5u+WcqQKY+oJo
	Wr2zNjTFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kifxr-0006eb-6d; Fri, 27 Nov 2020 15:47:15 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kifxo-0006Ov-KM
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 15:47:13 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id C6DB768B05; Fri, 27 Nov 2020 16:47:09 +0100 (CET)
Date: Fri, 27 Nov 2020 16:47:09 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 43/44] block: merge struct block_device and struct
 hd_struct
Message-ID: <20201127154709.GA8881@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-44-hch@lst.de> <20201127131901.GE27162@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127131901.GE27162@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_104712_820699_983CF375 
X-CRM114-Status: GOOD (  13.07  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Tejun Heo <tj@kernel.org>, linux-bcache@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Nov 27, 2020 at 02:19:01PM +0100, Jan Kara wrote:
> The percpu refcount is long gone after the series refactoring...

True.

> > @@ -939,13 +910,13 @@ void blk_request_module(dev_t devt)
> >   */
> >  struct block_device *bdget_disk(struct gendisk *disk, int partno)
> >  {
> > -	struct hd_struct *part;
> >  	struct block_device *bdev = NULL;
> >  
> > -	part = disk_get_part(disk, partno);
> > -	if (part)
> > -		bdev = bdget_part(part);
> > -	disk_put_part(part);
> > +	rcu_read_lock();
> > +	bdev = __disk_get_part(disk, partno);
> > +	if (bdev)
> > +		bdgrab(bdev);
> 
> Again I think you need to accommodate for bdgrab() returning NULL here when
> we race with partition destruction...

For that we need to allow bdgrab to return NULL first, but otherwise
this seems like the right way.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
