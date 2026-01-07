Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE619CF6BF1
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jan 2026 07:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMa4eYdYW+awlFbKKLP4oyL5ds25FDMl8cP6x5l1HgM=; b=R83WQtQDkJ1LAB
	QrWcIS1Sts8mfKKU2E5IRnU0v7H/9SKHjUdWm0+zoyiayqYP/x8GAdoEs50NfoInAGkPeMfs6Ts+v
	i0mXT8F3NiaKIxnbEkpxdVqwT/SKxXkQ/VQMsBW+524dn3JVH5U7ZnG3NPIccSu7sea0SVefLqqJe
	HgtJqnVxlbi58T1fEZ+Rif3Di9KJGzK9VOlQiFH8S1gp/QkJ2lL0/KOAzUXtRkiZ/5d4s1dK+9mJ0
	yMnz6zNO2LeciqdMY/xPRisj2lF1X2Q4LuqDmPmGRSZHQCqoDMjWk5MtoRVDOiI5fpy5llHJL95zA
	iap7NNopctgKmexlTlHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdO61-0000000EINR-00RQ;
	Wed, 07 Jan 2026 07:36:45 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdO5z-0000000EIN3-0gCo
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jan 2026 07:36:44 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 78F41227A87; Wed,  7 Jan 2026 08:36:39 +0100 (CET)
Date: Wed, 7 Jan 2026 08:36:39 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jeff Layton <jlayton@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	gfs2@lists.linux.dev, io-uring@vger.kernel.org,
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: [PATCH 05/11] fs: refactor ->update_time handling
Message-ID: <20260107073639.GC17448@lst.de>
References: <20260106075008.1610195-1-hch@lst.de> <20260106075008.1610195-6-hch@lst.de> <b208c2a6e1a3ab44e3c820af106b5be99279d986.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b208c2a6e1a3ab44e3c820af106b5be99279d986.camel@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_233643_347336_FCAD4DD7 
X-CRM114-Status: GOOD (  11.08  )
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

On Tue, Jan 06, 2026 at 07:09:04AM -0500, Jeff Layton wrote
> On Tue, 2026-01-06 at 08:49 +0100, Christoph Hellwig wrote:
> > Pass the type of update (atime vs c/mtime plus version) as an enum

[...]

I scrolled through this but only found a full quote but no actual reply
from you.

Can you please follow standard email protocol and only quote relevant
parts?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
