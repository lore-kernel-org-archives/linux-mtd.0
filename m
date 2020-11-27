Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4CAC64E75
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 09:49:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E44F221FF
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 09:49:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="icJc0C3n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E44F221FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5PrVPN6dvsvKCOwPdXh0Dcac9Vb8Blt3iMFExJTRTPk=; b=icJc0C3nE01uvRi0F/YQZ0/8V
	ktWwkfJcV6Wr+d3DUEi4XAs/hraYO+wSBB9vbbLFkJpaja64qso4a+NUGVtf1W1Ri11uZPZUWwTiJ
	lmQV4duo+v9NUuM/39jJX3d81kYqk2l0Qg4VYYSi/Dy9BZcHD+q6Zu3vZaVo14/Z6yAyZUhycsL2f
	hUi9VT4NpUGz7v9u8/TiRX3aBUDU4FjZCkTAGKIdN4tJ3AIC1+RoyYyhgx6JLwUdqfyhvCUayQCfq
	bUyGAp/oH9o4s+zinlrgK0/azvXEcYvwf6r7CkiD8d3NYjoiVMdkHOTExlOK9iVWWNBXS9WO2UnDD
	JEmbvXrDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiaN0-0000qt-8J; Fri, 27 Nov 2020 09:48:50 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiaMx-0000pl-7I
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 09:48:48 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9707D68B05; Fri, 27 Nov 2020 10:48:42 +0100 (CET)
Date: Fri, 27 Nov 2020 10:48:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 37/44] block: switch partition lookup to use struct
 block_device
Message-ID: <20201127094842.GA15984@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-38-hch@lst.de> <20201126182219.GC422@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126182219.GC422@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_044847_390272_1F1CDED9 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Chao Yu <yuchao0@huawei.com>,
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 26, 2020 at 07:22:19PM +0100, Jan Kara wrote:
> On Thu 26-11-20 14:04:15, Christoph Hellwig wrote:
> >  struct hd_struct *disk_get_part(struct gendisk *disk, int partno)
> >  {
> > -	struct hd_struct *part;
> > +	struct block_device *part;
> >  
> >  	rcu_read_lock();
> >  	part = __disk_get_part(disk, partno);
> > -	if (part)
> > -		get_device(part_to_dev(part));
> > -	rcu_read_unlock();
> > +	if (!part) {
> > +		rcu_read_unlock();
> > +		return NULL;
> > +	}
> >  
> > -	return part;
> > +	get_device(part_to_dev(part->bd_part));
> > +	rcu_read_unlock();
> > +	return part->bd_part;
> >  }
> 
> This is not directly related to this particular patch but I'm wondering:
> What prevents say del_gendisk() from racing with disk_get_part(), so that
> delete_partition() is called just after we fetched 'part' pointer and the
> last 'part' kobject ref is dropped before disk_get_part() calls
> get_device()? I don't see anything preventing that and so we'd hand out
> 'part' that is soon to be freed (after RCU grace period expires).

At this point the hd_struct is already allocated together with the
block_device, and thus only freed after the last block_device reference
goes away plus the inode freeing RCU grace period.  So the device model
ref to part is indeed gone, but that simply does not matter any more.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
