Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6F6C3E8C5
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 17:27:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCE8A22250
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 17:27:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MeQhU8M4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCE8A22250
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0rtnq6E1G1gWky3y/MV4nS+zVpo4ThjMOU5ifdCpg4w=; b=MeQhU8M40iv4p922OwsBKSnN8
	IUU88wNhCAXAhvkl/giosWRdhZpgr8JcnFtt7uMkk+2TxHe3eABCNUiW+Nai/etnnsOcLSEzFCf+d
	ZAPyno+XjZnLIQVvitb+kgtDQrfFc9XZbptOymkPOjdHG1HqeEkQfpBLHaEelUOWM9Qv4/uESwUw7
	n4Dn98ldU0eX+pilMZhCUPnXnnDA0Hiv5lgOkc0Gzei4MyBsGoCtfaqlQBefO94ekPYoaKHyevlBf
	5+KIzfhwDpIm/ca6kTk9sRv3LjJsTQ/TiQosgDbBvA+Xg+eLt56125iR/6IXpaQZc0rhR76mhrGyn
	j+Nmzuq2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kihWD-0008Tn-LI; Fri, 27 Nov 2020 17:26:49 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kihWA-0008Ru-W4
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 17:26:48 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E3BEDAE91;
 Fri, 27 Nov 2020 17:26:41 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id E315E1E1319; Fri, 27 Nov 2020 18:26:40 +0100 (CET)
Date: Fri, 27 Nov 2020 18:26:40 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 37/44] block: switch partition lookup to use struct
 block_device
Message-ID: <20201127172640.GA4276@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-38-hch@lst.de>
 <20201126182219.GC422@quack2.suse.cz>
 <20201127094842.GA15984@lst.de>
 <20201127124537.GC27162@quack2.suse.cz>
 <20201127153615.GA7524@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127153615.GA7524@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_122647_209854_8825A737 
X-CRM114-Status: GOOD (  19.76  )
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
 Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 linux-bcache@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri 27-11-20 16:36:15, Christoph Hellwig wrote:
> On Fri, Nov 27, 2020 at 01:45:37PM +0100, Jan Kara wrote:
> > > At this point the hd_struct is already allocated together with the
> > > block_device, and thus only freed after the last block_device reference
> > > goes away plus the inode freeing RCU grace period.  So the device model
> > > ref to part is indeed gone, but that simply does not matter any more.
> > 
> > Well, but once device model ref to part is gone, we're going to free the
> > bdev inode ref as well. Thus there's nothing which pins the bdev containing
> > hd_struct?
> > 
> > But now as I'm thinking about it you later switch the device model reference
> > to just pure inode reference and use igrab() which will reliably return
> > NULL if the inode is on it's way to be destroyed so probably we are safe in
> > the final state.
> 
> igrab always succeeds.  But we should switch to a tryget.

No. If the inode is I_FREEING or I_WILL_FREE, it will return NULL...

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
