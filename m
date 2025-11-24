Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB6ACFA466
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 14:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4NtNp3IOehBBOnSB41ZXFyNs5zn4BFFel0qJIWuOr8=; b=amWkGc+A8Nlkqa
	2JkGEvqiTQqAysyJDuVmNqVBHjjRs3kRzBPpVCzoBffyI4yiQ44x1yL3V4Q0OSUFK0z3TkSvUqKAi
	fBAM49v9iq001pb6qf7nbASvHu0vHfH2LCxrNvNapHlD7KkkjcmKFWAarrl2/xD13+zHfdfisKy39
	wTKwlP76Zr8q4DlABFwhAaLi3Ad0GMpZgsFcIaH98Dnk0d6ez/YlD/SBKppiqynNNOS3HG5ZPxuDG
	hWXtpUWZqJZz9r4vP8z8WBAFeAwfw13LEaXchfhVJqqh+sf8bQhwWjFIt5FCt4lTRS2D8a9KHS5mZ
	jooE/EuX8wqtibu8r8Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXFz-0000000Boen-0pX7;
	Mon, 24 Nov 2025 14:09:31 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXFw-0000000BoeQ-2moD
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 14:09:29 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6355668B05; Mon, 24 Nov 2025 15:09:25 +0100 (CET)
Date: Mon, 24 Nov 2025 15:09:24 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev,
	io-uring@vger.kernel.org, devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 10/14] fs: factor out a sync_lazytime helper
Message-ID: <20251124140924.GB14417@lst.de>
References: <20251114062642.1524837-1-hch@lst.de> <20251114062642.1524837-11-hch@lst.de> <vkobnnw3ij2n47bhhooawbw546dgwzii32nfqcx4bduoga5d7r@vdo5ryq4mffz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <vkobnnw3ij2n47bhhooawbw546dgwzii32nfqcx4bduoga5d7r@vdo5ryq4mffz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_060928_866718_5771103E 
X-CRM114-Status: GOOD (  13.76  )
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

On Mon, Nov 24, 2025 at 02:31:02PM +0100, Jan Kara wrote:
> > +	if (wbc->sync_mode == WB_SYNC_ALL ||
> > +	    time_after(jiffies, inode->dirtied_time_when +
> > +			dirtytime_expire_interval * HZ))
> > +		sync_lazytime(inode);
> 
> The checking of inode->dirtied_time_when for inode potentially without
> I_DIRTY_TIME set (and thus with unclear value of dirtied_time_when) is kind
> of odd. It is harmless but IMO still not a good practice. Can't we keep
> this condition as is and just call sync_lazytime()?

As in keeping the I_DIRTY_TIME in the caller?  Sure, I could do that.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
