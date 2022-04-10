Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39F3C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Apr 2022 06:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YHqrEIKLfLrd5m/RxO5tK8rU/yzMnzAIz596CqnPPs0=; b=KCLdyetqzVzvAW
	FJfENeKw/MBdtnxlcDpAOLa40YBJUxzoOcX5W/m+tePJ4p6OD6JtmEALfi+4c6FnT9BfEoxvTLZ9U
	kgtsvj2QNCmKDQuZRiZSlN0KBEvZywCdN2iUzcd/4mOp/tyHSINAC7TQyZC8z5bmejtppAUlSA0HP
	lAWlRds5oU717WdJN54G+4X1x8ONlWDez2M30H/SypRpkvd8EGreOgLQPtnBlUvXJeOCnFiChHQZ3
	CbLC4h2owng2yNc+6gMuU8YO1fhETpo4B2yGkPlD/ZY7orGwDKTMJKb3DhpK2N9WbznV8BcNN3dTP
	53JYksbbg4VvmIbXgaKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndR2q-004Ip4-9P; Sun, 10 Apr 2022 06:27:32 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndR2n-004InZ-Dy; Sun, 10 Apr 2022 06:27:30 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 95E2B68AFE; Sun, 10 Apr 2022 08:27:26 +0200 (CEST)
Date: Sun, 10 Apr 2022 08:27:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Coly Li <colyli@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, dm-devel@redhat.com,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Jens Axboe <axboe@kernel.dk>,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 David Sterba <dsterba@suse.com>
Subject: Re: [PATCH 26/27] block: decouple REQ_OP_SECURE_ERASE from
 REQ_OP_DISCARD
Message-ID: <20220410062726.GB16234@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
 <20220409045043.23593-27-hch@lst.de>
 <f01ac878-9b0d-972b-70dc-6f3f61b9947b@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f01ac878-9b0d-972b-70dc-6f3f61b9947b@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_232729_684251_D7E70594 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

On Sat, Apr 09, 2022 at 10:32:52PM +0800, Coly Li wrote:
>> Acked-by: Coly Li <colyli@suse.de> [drbd]
>
> Hi Christoph,
>
> My ACK is for bcache, not drbd here.

Fixed.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
