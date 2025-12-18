Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712EAD68BDD
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Dec 2025 06:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N2NU7DU6BUr8xqgSxC20YK7Ur6LArJ6/ElMBvkcy3rE=; b=BkfSQrkH5mmjmy
	YdG5IZ3whjhO4GbKNaMsS5wLnGa/2XUIamhXklgl0N7oDX29OUVzEqUxKx+3w8iRE8asRgNBYviLv
	HEJeRumomNpA4poihSJ42Tjn27fOpTZTcLMQgPchb7aAfrhwytxOtNeziheas7NJZmg/VDb3Gg9ex
	+t7BPpWCrO15pqAMF+0JAK4snG6YWNbhNQb/HRgP95naAkBvmUayD6azugLKq6OaHvSbiQk9IgwFc
	uBfTElZWshnBXOEJ2WLxY4jReq9jugnF6KD2p/rs95Z/S04e0sgHrM6t3KLhYT0fJr2XUUYbT+Gr5
	rFbAg5k+lwFFI0SX4KeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW7Lw-00000007syE-1Rpw;
	Thu, 18 Dec 2025 06:19:08 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW7Lu-00000007sxT-1lzk
	for linux-mtd@lists.infradead.org;
	Thu, 18 Dec 2025 06:19:07 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 742AF227A88; Thu, 18 Dec 2025 07:19:01 +0100 (CET)
Date: Thu, 18 Dec 2025 07:19:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	gfs2@lists.linux.dev, io-uring@vger.kernel.org,
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: [PATCH 08/10] fs: add support for non-blocking timestamp
 updates
Message-ID: <20251218061900.GB2775@lst.de>
References: <20251217061015.923954-1-hch@lst.de> <20251217061015.923954-9-hch@lst.de> <2hnq54zc4x2fpxkpuprnrutrwfp3yi5ojntu3e3xfcpeh6ztei@2fwwsemx4y5z>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2hnq54zc4x2fpxkpuprnrutrwfp3yi5ojntu3e3xfcpeh6ztei@2fwwsemx4y5z>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_221906_606416_07DA3145 
X-CRM114-Status: GOOD (  20.72  )
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

On Wed, Dec 17, 2025 at 01:42:20PM +0100, Jan Kara wrote:
> > @@ -2110,12 +2110,26 @@ int inode_update_timestamps(struct inode *inode, int *flags)
> >  		now = inode_set_ctime_current(inode);
> >  		if (!timespec64_equal(&now, &ctime))
> >  			updated |= S_CTIME;
> > -		if (!timespec64_equal(&now, &mtime)) {
> > -			inode_set_mtime_to_ts(inode, now);
> > +		if (!timespec64_equal(&now, &mtime))
> >  			updated |= S_MTIME;
> > +
> > +		if (IS_I_VERSION(inode)) {
> > +			if (*flags & S_NOWAIT) {
> > +				/*
> > +				 * Error out if we'd need timestamp updates, as
> > +				 * the generally requires blocking to dirty the
> > +				 * inode in one form or another.
> > +				 */
> > +				if (updated && inode_iversion_need_inc(inode))
> > +					goto bail;
> 
> I'm confused here. What the code does is that if S_NOWAIT is set and
> i_version needs increment we bail. However the comment as well as the
> changelog speaks about timestamps needing update and not about i_version.
> And intuitively I agree that if any timestamp is updated, inode needs
> dirtying and thus we should bail regardless of whether i_version is updated
> as well or not. What am I missing?

With lazytime timestamp updates that don't require i_version updates
are performed in-memory only, and we'll only reach this with S_NOWAIT
set for those (later in the series, it can't be reached at all as
of this patch).

But yes, this needs to be documented much better.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
