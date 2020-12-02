Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCADC6369E
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 21:54:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD2BE217A0
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 21:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD2BE217A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h+jG/MdD+KDTxmxRXyP+oEBrmwxa1OoZX9gAvkBdPcU=; b=LxZ3GdEl2BkF3NE+SpvIT2/eB
	ljX0ofbBK0EmhKU/cK4RSov+bP0nbU6fOnW26POgYPaqj5paWAfsx+26X1F4Rzyn+FklGQ3nlxX1n
	CSOglOdTDWYWbo9BdarYL4pFHHi7q2PuNvyEPi/Y1NvYBXpJHCmApZRstLWFIRDaEojU9qn22+Hag
	oKMfNkjPx1kJexbNBR6Yc/Esa42FomZaM3/TW4gYjTCaQm+jXZ/YuwKkb6GQLGniSHKLqsrG/p+8G
	vw8gS2aqyZOWsn5LqU1d29oJQSn+GfFrCvP1vyvQsOS708HS9j9itJ9VZeOXaz8e6otY26QbmUgL4
	6RTNZ+p0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kka3m-0001zs-4V; Wed, 02 Dec 2020 21:53:14 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kka3j-0001yR-BU
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 21:53:12 +0000
Received: by mail-qt1-x841.google.com with SMTP id f27so2266619qtv.6
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2020 13:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xaDA1tsZ1ItmC2prDcKEEQmNvQ5Pv10Cm/ao+ODU+y4=;
 b=iAPcnaL9YKd6C5p0FcenDd90I6RD+gVpzxd/eSeZ0xQt9GcZVQdiA4aFbSTs/OntKF
 p7Y2acKBQhXDYXWo0LiuqI/KD6vQlMJO13z+pLDB2QuNybKg1m/pVWVmKu0Igw6P/jia
 /DXVPfsqMlkEQtec7ecguK4XUNFOblt/c39xOX5fpFoMtLxgr8H1KlOio7aMcMZhKk2K
 P0y21tBmx5BAH6T0bfQyGSYF9ycee7/0ZbSmpi3ECjeU3GhFpb8FbcBQeN9K3Q/JN89z
 5N5RnxqSLo8pVptxcNMrUYIZQQHWaNj5ZvRv+jvsPEmFnDurH/G5gMjlBmyWiKGkF/qC
 5eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=xaDA1tsZ1ItmC2prDcKEEQmNvQ5Pv10Cm/ao+ODU+y4=;
 b=NgY00jK19TcRz7C7f98nVM4p3Oos8YRTxC9kcLTkHHDx8jA+y5XFWAH1ii3/R1xxjp
 qzUdKr8GW5ZxvNr0a28Am5SPRIBeAhdi7lQW6aVNihr8yIInnkQwE0hAWkRZHSdbMIuU
 4wtn6hIw/p3fuMTsCDQDsB52UOS5FzP+tswdTyLskRbSjGQJldv2F0ngdWHZrgwR3Hzc
 Yy6W+jjE0E6WvCey8olp9McbWUG0QvUVmZWqqlJp+pqrFk8MeLu96XxKgR8WTOQz7Z+O
 7ig3rwdkSkVRH0vtWUIb4iTegTOYdq1QfDQ81NTedp58RgQ5EjAPqh3Dea+6ZJY3KsDc
 EWmQ==
X-Gm-Message-State: AOAM532zqFy6zI9rXtvaP59ovSW8LC72iJdUNPkbEx8aa434ILFnT9Fy
 QYl6sGGVxxY3WNSkscTdQyU=
X-Google-Smtp-Source: ABdhPJx+RZ46UqXMazYzX5t9mfQ+j0OHEii8+THVYT62PhwFjG1kvFR63pEZgW/b3qE/vRtSjzPEFg==
X-Received: by 2002:ac8:5b82:: with SMTP id a2mr245806qta.178.1606945989605;
 Wed, 02 Dec 2020 13:53:09 -0800 (PST)
Received: from localhost ([2620:10d:c091:480::1:ec0f])
 by smtp.gmail.com with ESMTPSA id n41sm223753qtb.18.2020.12.02.13.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 13:53:08 -0800 (PST)
Date: Wed, 2 Dec 2020 16:52:40 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 25/45] block: simplify bdev/disk lookup in blkdev_get
Message-ID: <X8gMqKKmG2WE2wqk@mtj.duckdns.org>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-26-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201128161510.347752-26-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_165311_423264_EEFD6A64 
X-CRM114-Status: GOOD (  19.98  )
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-fsdevel@vger.kernel.org, linux-bcache@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Nov 28, 2020 at 05:14:50PM +0100, Christoph Hellwig wrote:
> To simplify block device lookup and a few other upcoming areas, make sure
> that we always have a struct block_device available for each disk and
> each partition, and only find existing block devices in bdget.  The only
> downside of this is that each device and partition uses a little more
> memory.  The upside will be that a lot of code can be simplified.
> 
> With that all we need to look up the block device is to lookup the inode
> and do a few sanity checks on the gendisk, instead of the separate lookup
> for the gendisk.  For blk-cgroup which wants to access a gendisk without
> opening it, a new blkdev_{get,put}_no_open low-level interface is added
> to replace the previous get_gendisk use.
> 
> Note that the change to look up block device directly instead of the two
> step lookup using struct gendisk causes a subtile change in behavior:
> accessing a non-existing partition on an existing block device can now
> cause a call to request_module.  That call is harmless, and in practice
> no recent system will access these nodes as they aren't created by udev
> and static /dev/ setups are unusual.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

It's already merged but FWIW looks great to me.

Thank you.

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
