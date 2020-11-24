Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFD6C63777
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 21:20:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6227D206E0
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 21:20:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="molJhAqY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzhyL5qO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6227D206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SRae1TWZ+PaRkKqK/GJg+4ZFXPOg7qau1dbxLNHD32Q=; b=molJhAqYl9/77zh0Ps1+4lCNB
	G2i6QN14bULqzO2SflueV6V0pCgVe446H9SRQUn/GdSc6hf98DVQnC/ctWOx3lvDuc9J3p7RjOBqz
	YNs489rcVk1T0pCatAE0bLOnRG/YWAktYgCzJRUymknNDCrWrom9lWVZaDp/ZbmjS/uP5Ifq9j0kt
	UfSF2nDQC8kuwCne/sKpOy/4vvRwyhsckKDgOGR7tif7C4j5wPOAkIzw9aXGCCoD5o60/qCx3cRif
	2E+LqtxB44kmw5gnw1oSZB65bHvB+1ZY0IiBEfYBtmGEs92PB/KAe9Lp7O71g412ZiRp1hmE7S+El
	Ecsopyy6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khfiY-0000gH-9H; Tue, 24 Nov 2020 21:19:18 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khfiV-0000fD-PC
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 21:19:17 +0000
Received: by mail-qv1-xf42.google.com with SMTP id u23so11372904qvf.1
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 13:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sg9SO3UStMfqHkCvNI1YBGGkjTmKJ7UaheqYby9uxnM=;
 b=OzhyL5qOUmNMCmaqmA0AJ7YTZnOa5s8lOvdGSd5gsRFwIjVjcK9RMkEdmOZVvPKHkC
 HEfwzTPFGhRpcwv4Zdi1eKZAQCSJDqL9242nm6t+004qxnjr2Wo1RG+dvaQzjYpDTlFJ
 y4MEeMckfEdVhdL9TeWxoL3uJseLhfNpPNLJKI+4lWddjQrQSYtmPS6DbLtZKSCyuI0M
 VPOnBALIPZDz9HaljCXz/QtzQMoFkORQ/oSOcQG0yJ5cuTGS83XWqbo7FaIck74bBkz3
 zSrrMusanZp5T2dH6BfcuYD799YU+BVDp+VbnKu/pAzjL4fvbG44Apq0OxYfntbUtAy3
 IgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=sg9SO3UStMfqHkCvNI1YBGGkjTmKJ7UaheqYby9uxnM=;
 b=tztbpDfK0IBvs+QJL8dHZUaKAV/9K4KTBC8exPDpqv72jAObV6WS6ylVB30w67Ye7c
 eXET1KJWg/waLSkoOmDex27dwkAaJIw67+e88G0iWowQW5VplQDIWGmP6nfiAXx3XE8V
 uWW6a7hupTkAy+HZXtVbHZAFvSNRsIu5wFviIBq4rotDRsalsZzS5b8TeZlQidZ9eRMg
 cnZPOCElNAFjUxLiTbI48InjdJR+Hgwjtl4WjwSingKd5vRFY/+8BCWUhw3sbcIKV2r4
 obnmeNLSo7YV6Zx2OKhkAV3i8/i5qzOBTp320TvYROEe6dgrokOKLEo/0sbOSwFY/Rbl
 jX5A==
X-Gm-Message-State: AOAM533n8+Jm9dYzj00mlolKlABkYqCH/WwTdZYI3Lb2J272AWO7vU/M
 tZk7b7dxYOgKJs3vzMePRrw=
X-Google-Smtp-Source: ABdhPJymsM7t3QC8HGlAx0p+5Wt4X/uLuUZsX3zmVjKyK1/8swtwKOE7/+uzSFJWv6qwdRjGjoCR5w==
X-Received: by 2002:a0c:fa08:: with SMTP id q8mr548456qvn.25.1606252753574;
 Tue, 24 Nov 2020 13:19:13 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id c27sm387614qkk.57.2020.11.24.13.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 13:19:12 -0800 (PST)
Date: Tue, 24 Nov 2020 16:18:49 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 25/45] block: reference struct block_device from struct
 hd_struct
Message-ID: <X714udEyPuGarVYp@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-26-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-26-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_161915_851278_07F6A93F 
X-CRM114-Status: GOOD (  22.22  )
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

Please see lkml.kernel.org/r/X708BTJ5njtbC2z1@mtj.duckdns.org for a few nits
on the previous version.

On Tue, Nov 24, 2020 at 02:27:31PM +0100, Christoph Hellwig wrote:
> To simplify block device lookup and a few other upcoming areas, make sure
> that we always have a struct block_device available for each disk and
> each partition.  The only downside of this is that each device and
> partition uses a little more memory.  The upside will be that a lot of
> code can be simplified.
> 
> With that all we need to look up the block device is to lookup the inode
> and do a few sanity checks on the gendisk, instead of the separate lookup
> for the gendisk.  These checks are in a new RCU critical section and
> the disk is now freed using kfree_rcu().

I might be confused but am wondering whether RCU is needed. It's currently
used to ensure that gendisk is accessible in the blkdev_get path but
wouldn't it be possible to simply pin gendisk from block_devices? The
gendisk and hd_structs hold the base refs of the block_devices and in turn
the block_devices pin the gendisk. When the gendisk gets deleted, it puts
the base refs of the block devices but stays around while the block devices
are being accessed.

Also, would it make sense to separate out lookup_sem removal? I *think* it's
there to ensure that the same bdev doesn't get associated with old and new
gendisks at the same time but can't wrap my head around how it works
exactly. I can see that this may not be needed once the lifetimes of gendisk
and block_devices are tied together but that may warrant a bit more
explanation.

Thanks.

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
