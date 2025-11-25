Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D72D0E6C7
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Nov 2025 11:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eqjz+EkxpLNqGfAVqQKuRw/UFn0bbpSYBoaphzavE4w=; b=yZqme7J4BVXg42
	cGrtsmPrXFljoNrZDmdFcTb3GKXorjtON8NIDPAE6HI/4DBg/wi38qNjRAfE3IM2ulgXjrJin02tf
	61LWiJaEGPykjWt30lgG1LYcZjWsYAoXTpljn/DNsBc4riKjZ0L7HY+USFxWJaEp9bnNqu5jVRww4
	PDO6B7b0q/VKKoI5PS12n8FiZlPVwLQmDIeOjb62t4O+47YrjhD1SVijtPTfJEckqf94L89wF/nNZ
	7/r/qqN3xUjM6EmCzxwHfRjEtVxsXZdO4K+JdW5F4GDizG7QN5CVYf1Ic+LjT+z4mQhzbvF3Ungay
	0Z3hKYXy/czbxOweMFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqzp-0000000DCDX-03s6;
	Tue, 25 Nov 2025 11:14:09 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqzn-0000000DCD9-1Dhf
	for linux-mtd@lists.infradead.org;
	Tue, 25 Nov 2025 11:14:08 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1995868C7B; Tue, 25 Nov 2025 12:14:03 +0100 (CET)
Date: Tue, 25 Nov 2025 12:14:02 +0100
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
Subject: Re: re-enable IOCB_NOWAIT writes to files v2
Message-ID: <20251125111402.GB22313@lst.de>
References: <20251120064859.2911749-1-hch@lst.de> <20251125-loten-fabuliert-c0fb6b195b53@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251125-loten-fabuliert-c0fb6b195b53@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_031407_474071_2A3BD296 
X-CRM114-Status: GOOD (  14.59  )
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

On Tue, Nov 25, 2025 at 10:18:32AM +0100, Christian Brauner wrote:
> It's a bit too close to the merge window for my taste and we have about
> 17 pull request topics for this cycle already.
> 
> So I'll take this for vfs-6.20.iomap. As usual I'll create that branch
> now so that the patches don't get lost and will rebase once v6.19-rc1 is
> out.

I can understand that.  Although it would be nice to get the nfsd
and btrfs fixes in, i.e. patch 1-4 (and 5/6 are trivial and would be
neat as well).  I'll need to resend the others anyway based on the
(minor) review feedback, which I'll do right after -rc1.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
