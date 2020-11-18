Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12972C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 09:14:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8259320B80
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 09:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w9KCtxW3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8259320B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gYRSDCVEtutyT/BbFljD1rdyP5PeBGLPHzeWNTwCYwI=; b=w9KCtxW3vdZKyf+ixD1aoS0VB
	iY2FP9c465ot+VzhyviiYVHtNMe7z8J3OgTWVk3Ba9a9NONVI7wmHMP4utlRpXoSyTzsMNtSeulH9
	fwjV2U17zJeT846BthZVmGisc9MUU/DLNfb3UzjylsRQC6xZbNtrrXxhHQid+4PoskNwM4URn2Nhb
	YGhCw7M3gKGUwHw9wDcHhIFE8Okvso4dw4WuV7kEPUAsS69pcYYBrkz0VIDyymrhaEPjcHuZ7NZGa
	f+W2CmTjeEIpwGykZpoHAfD/BeJOTrLhmpC3IxJ61tU663W9ESGDiXTtnRWBLuvXpOCJt3ON4YPTx
	yqyNyw9Jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJWr-0000sY-Bp; Wed, 18 Nov 2020 09:13:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJWo-0000qx-1o
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 09:13:27 +0000
Received: from localhost (unknown [89.205.136.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 080C124656;
 Wed, 18 Nov 2020 09:13:24 +0000 (UTC)
Date: Wed, 18 Nov 2020 10:13:21 +0100
From: Greg KH <greg@kroah.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: merge struct block_device and struct hd_struct
Message-ID: <X7TlsaY2vWQceNAI@kroah.com>
References: <20201118084800.2339180-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-1-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_041326_212827_3A6BD61F 
X-CRM114-Status: GOOD (  15.53  )
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

On Wed, Nov 18, 2020 at 09:47:40AM +0100, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series cleans up our main per-device node data structure by merging
> the block_device and hd_struct data structures that have the same scope,
> but different life times.  The main effect (besides removing lots of
> code) is that instead of having two device sizes that need complex
> synchronization there is just one now.
> 
> Note that it depends on the previous "misc cleanups" series.
> 
> A git tree is available here:
> 
>     git://git.infradead.org/users/hch/block.git bdev-lookup
> 
> Gitweb:
> 
>     http://git.infradead.org/users/hch/block.git/shortlog/refs/heads/bdev-lookup

Nice cleanups, thanks for doing this.

Series is:
	Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
