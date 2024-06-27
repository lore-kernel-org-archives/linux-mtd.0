Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77734C3064D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 04:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxJbRFTN9WIod2EwEcL0rJdVY43QlJsDvtD/yG0nMus=; b=BFjyrLaJGfyZ5T
	kSPBqlHf3GAZxPUO4U4lEW2b9/Kh/A2zyDC4D6OsE4ugF/6ekSYb0B+pTHi0477n9juMBVb2XjpqY
	UVhk6y9Hwg+aJeee6VzKexeaT47dmEVcjhDavgtigvN8jxcNUvD3zu/lri5+4PQnehyvUjRlpEpFg
	tDsYFF0f16u5Wt5aKb+ahNNev9/gwsjRL14ghEl/M/04L1UixzLXwOttr9aKAbw/rAldyVY7r+sco
	s3GldAZIt0pehafpvN81HqlZsoKPGMG1vwIDVzl8cmBM0CNg9zwS67sGOkEfetzgb7i0NBB0gipuL
	O1gj6+W1KfSI0JIT27CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMh9A-00000009D9M-3Ji8;
	Thu, 27 Jun 2024 04:54:12 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMh93-00000009D8d-4Br2;
	Thu, 27 Jun 2024 04:54:06 +0000
Date: Wed, 26 Jun 2024 21:54:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Jens Axboe <axboe@kernel.dk>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	linux-block@vger.kernel.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, ying.huang@intel.com,
	feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [axboe-block:for-next] [block]  1122c0c1cc:  aim7.jobs-per-min
 22.6% improvement
Message-ID: <ZnzwbYSaIlT0SIEy@infradead.org>
References: <202406250948.e0044f1d-oliver.sang@intel.com>
 <ZnqGf49cvy6W-xWf@infradead.org>
 <Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
 <ZnuNhkH26nZi8fz6@infradead.org>
 <ZnzP+nUrk8+9bANK@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZnzP+nUrk8+9bANK@xsang-OptiPlex-9020>
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

On Thu, Jun 27, 2024 at 10:35:38AM +0800, Oliver Sang wrote:
> 
> I failed to apply patch in your previous reply to 1122c0c1cc or current tip
> of axboe-block/for-next:
> c1440ed442a58 (axboe-block/for-next) Merge branch 'for-6.11/block' into for-next

That already includes it.

> 
> but it's ok to apply upon next:
> * 0fc4bfab2cd45 (tag: next-20240625) Add linux-next specific files for 20240625
> 
> I've already started the test based on this applyment.
> is the expectation that patch should not introduce performance change comparing
> to 0fc4bfab2cd45?
> 
> or if this applyment is not ok, please just give me guidance. Thanks!

The expectation is that the latest block branch (and thus linux-next)
doesn't see this performance change.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
