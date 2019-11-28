Return-Path: <SRS0=Piv4=ZU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718DAC432C0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Nov 2019 15:45:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42E86217BA
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Nov 2019 15:45:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gwuJSXGH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42E86217BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5l1sZGQDlTWqFA+LrC/VPK2GKZvESkG+B/AQue9WNk=; b=gwuJSXGHqajiR4
	4eho/P452YC9fIbpAt5OTgmR6Nl2ywO5wkbBIDNsLzC7XDbyjPEqFtXX6WSTaM65MHddMw6BwvQqL
	gJGb1mDbllA3UBtJW66K5MJWNiyodqe2i3x7033DJT9UmDGqhIG67ziHNQLSMKG3rowlhlZJLaFSD
	zEfyD1ChEAgyTGQwLHPeBeSiwvjljQZxfc8Y0uMr1To16p/mwFMD+XysKTslPiO4x/ltbEHEGiHmv
	MA2i6eMYIy5ZrdOTmhLlU1qZVoM2Mphma1acbfG8zjiMiEn85WzAwSDe/8Pk6L9ZtGzCWVZjpPDhv
	fGPalsmsMlOvgDoWY6nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iaLys-0005wA-3c; Thu, 28 Nov 2019 15:45:22 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iaLym-0005vg-OI; Thu, 28 Nov 2019 15:45:16 +0000
Date: Thu, 28 Nov 2019 07:45:16 -0800
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH] fs: Fix page_mkwrite off-by-one errors
Message-ID: <20191128154516.GA17166@infradead.org>
References: <20191127151811.9229-1-agruenba@redhat.com>
 <20191127154954.GT6219@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191127154954.GT6219@magnolia>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-xfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Theodore Ts'o <tytso@mit.edu>, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, Christoph Hellwig <hch@infradead.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 27, 2019 at 07:49:54AM -0800, Darrick J. Wong wrote:
> On Wed, Nov 27, 2019 at 04:18:11PM +0100, Andreas Gruenbacher wrote:
> > Fix a check in block_page_mkwrite meant to determine whether an offset
> > is within the inode size.  This error has spread to several filesystems
> > and to iomap_page_mkwrite, so fix those instances as well.
> 
> Seeing how this has gotten screwed up at least six times in the kernel,
> maybe we need a static inline helper to do this for us?

Yes.  I think we really want a little helper that checks the mapping
and the offset.  That also gives us the opportunity to document the
semantics.

> 
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> 
> The iomap part looks ok,
> Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> 
> (I might just extract the iomap part and put it in the iomap tree if
> someone doesn't merge this one before I get to it...)

I think we should just pull in the helper and conversions through
some tree after all iomap bits are merged.  It might as well be
the iomap tree as that seems to the place for file system read/write
infrastructure these days.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
