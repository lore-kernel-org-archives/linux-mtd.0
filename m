Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBE0D26D9B
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jan 2026 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlgR3DPlVO/msVoaY7283usWVvborhEhkHMvQEgrqeI=; b=qbP97xq0wrU1HS
	4by8V08f7YWoNJ/OBMGwuuf3qhtp8FxWqCVUYaEYHQ+YqVe2Tr1VXj8MspibVWkYXpxQ+YjIU2VPP
	Ep67uAx8+YAIDhufn9HdRClsbnV/r73XPx65HRKr4/rffqt6Pi/Vra3bBa9WlmNhufpKRiPY6A5ti
	e3m/piMNyT8wbqvpUw29ib90nppNg98KcLDBYoCHkGx0jlde14C9aCdNK8jCFjRY4+ScEBXqgqC8D
	QkmhKsnklOdCZCdMWBNVoPn0c1Gf8P+cDdw9n39H2gAfwRwmPoFBOp7TSY7cD5fSdrPa31mgO7SpB
	YJCXgltN+KbMklLX+3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEoO-000000057gg-0dLl;
	Mon, 12 Jan 2026 10:06:12 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEoK-000000057gK-2Bzg
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jan 2026 10:06:10 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 09124227A8E; Mon, 12 Jan 2026 11:05:59 +0100 (CET)
Date: Mon, 12 Jan 2026 11:05:58 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
	David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	gfs2@lists.linux.dev, io-uring@vger.kernel.org,
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: re-enable IOCB_NOWAIT writes to files v4
Message-ID: <20260112100558.GA7670@lst.de>
References: <20251223003756.409543-1-hch@lst.de> <20251224-zusah-emporsteigen-764a9185a0a1@brauner> <20260106062409.GA16998@lst.de> <20260106-bequem-albatros-3c747261974f@brauner> <20260107073247.GA17448@lst.de> <20260112-adelstitel-propaganda-ef80e3d2f8ca@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260112-adelstitel-propaganda-ef80e3d2f8ca@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_020608_724699_AE9F9619 
X-CRM114-Status: GOOD (  21.70  )
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

On Mon, Jan 12, 2026 at 11:04:17AM +0100, Christian Brauner wrote:
> On Wed, Jan 07, 2026 at 08:32:47AM +0100, Christoph Hellwig wrote:
> > On Tue, Jan 06, 2026 at 10:43:49PM +0100, Christian Brauner wrote:
> > > > Umm, as in my self reply just before heading out for vacation, Julia
> > > > found issues in it using static type checking tools.  I have a new
> > > > version that fixes that and sorts out the S_* mess.  So please drop
> > > > it again for now, I'll resend the fixed version ASAP.
> > > 
> > > It has never been pushed nor applied as I saw your mail right before all
> > > of that.
> > 
> > Thanks.  But maybe you can fix up the applied messages to be more
> > specific?  We had various issues in the past with them, where they
> > were sent, but things did not end up in the tree for various reasons.
> 
> What are you thinking of exactly?

Only send out the applied message when something is actually pushed
to the public tree?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
