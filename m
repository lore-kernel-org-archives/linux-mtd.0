Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65588C2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 13:20:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82DF322245
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 13:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hz1SDgWK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82DF322245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lcFsy7NtkRYAcInvcnJ8cHIbNwv0+5tyZe61XN1BW9Y=; b=Hz1SDgWK1DcnTbXyCvkyPsTzP
	+hru9psVYnL46D+y6v9sO3nQ+1+ikdLpYJr/PttEmkQsdoZzbwDU+qw0WOKnNeN6OX/P57kIa/ySF
	GZ5fgHfeRFCxiMy4XBEisKD/FuQtGEqboBNM6wQg649qfc4ulo05/mn8ZvvEE+v3BD99t3/F4r64e
	Agd/SIxYjIQILS/0ot+n99RVubbtFAQ/d/evOVWALdttywRR4BYuuLzBub40fbwuWO37rbqOwOjYp
	9C5np2m4jj/0BpfkN6Vd7hhbDJNzrKLR6+zuyAmX/QozcA4sZUm+E0nab6TVBqGyaQ/dnVNLugnMN
	j5sEhWg7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kideU-0000wK-Pl; Fri, 27 Nov 2020 13:19:06 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kideS-0000vK-IS
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 13:19:05 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6B3BABD7;
 Fri, 27 Nov 2020 13:19:01 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 7BE0A1E1318; Fri, 27 Nov 2020 14:19:01 +0100 (CET)
Date: Fri, 27 Nov 2020 14:19:01 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 43/44] block: merge struct block_device and struct
 hd_struct
Message-ID: <20201127131901.GE27162@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-44-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126130422.92945-44-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_081904_753246_10699C16 
X-CRM114-Status: GOOD (  19.42  )
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
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
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

On Thu 26-11-20 14:04:21, Christoph Hellwig wrote:
> Instead of having two structures that represent each block device with
> different life time rules, merge them into a single one.  This also
> greatly simplifies the reference counting rules, as we can use the inode
> reference count as the main reference count for the new struct
> block_device, with the device model reference front ending it for device
> model interaction.  The percpu refcount in struct hd_struct is entirely
> gone given that struct block_device must be opened and thus valid for
> the duration of the I/O.

The percpu refcount is long gone after the series refactoring...

> @@ -939,13 +910,13 @@ void blk_request_module(dev_t devt)
>   */
>  struct block_device *bdget_disk(struct gendisk *disk, int partno)
>  {
> -	struct hd_struct *part;
>  	struct block_device *bdev = NULL;
>  
> -	part = disk_get_part(disk, partno);
> -	if (part)
> -		bdev = bdget_part(part);
> -	disk_put_part(part);
> +	rcu_read_lock();
> +	bdev = __disk_get_part(disk, partno);
> +	if (bdev)
> +		bdgrab(bdev);

Again I think you need to accommodate for bdgrab() returning NULL here when
we race with partition destruction...

> +	rcu_read_unlock();
>  
>  	return bdev;
>  }

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
